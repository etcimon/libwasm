/** Contains common definitions and logic to collect input dependencies.

	This module is typically only used by generator implementations.
*/
module diet.input;

import diet.traits : DietTraitsAttribute;
import diet.internal.string;
import memutils.vector;
import memutils.scoped;

	pragma(msg, "diet.input");
@safe:
nothrow:

/** Converts a `Group` with alternating file names and contents to an array of
	`InputFile`s.
*/
@property Array!InputFile filesFromGroup(alias FILES_GROUP)()
{
	static assert(FILES_GROUP.expand.length % 2 == 0);
	auto ret = Array!InputFile(FILES_GROUP.expand.length / 2);
	foreach (i, F; FILES_GROUP.expand) {
		static if (i % 2 == 0) {
			ret[i / 2].name = Array!char(FILES_GROUP.expand[i+1]);
			ret[i / 2].contents = Array!char(FILES_GROUP.expand[i]);
		}
	}
	return ret;
}

bool canFindFile(T, U)(T baseFiles, U file) {
	foreach(baseFile; baseFiles) {
		if (baseFile.name == file) {
			return true;
		}
	}
	return false;
}
/** Using the file name of a string import Diet file, returns a list of all
	required files.

	These files recursively include all imports or extension templates that
	are used. The type of the list is `InputFile[]`.
*/
template collectFiles(string root_file)
{
	import diet.internal.string : stripUTF8BOM;
	private static immutable contents = stripUTF8BOM(import(root_file));
	enum collectFiles = collectFiles!(root_file, contents);
}
/// ditto
template collectFiles(string root_file, alias root_contents)
{
	enum baseFiles = collectReferencedFiles!(root_file, root_contents);
	static if (baseFiles.canFindFile(root_file))
		enum collectFiles = baseFiles;
	else enum collectFiles = (Vector!InputFile(baseFiles)~InputFile(root_file, root_contents)).move();
}

/// Encapsulates a single input file.
struct InputFile {
	Array!char name;
	Array!char contents;
}

/** Helper template to aggregate a list of compile time values.

	This is similar to `AliasSeq`, but does not auto-expand.
*/
template Group(A...) {
	import std.typetuple;
	alias expand = TypeTuple!A;
}

/** Returns a mixin string that makes all passed symbols available in the
	mixin's scope.
*/
template localAliasesMixin(int i, ALIASES...)
{
	pragma(msg, "localAliasesMixin");
	import std.traits : hasUDA;
	static if (i < ALIASES.length) {
		import std.conv : to;
		static if (hasUDA!(ALIASES[i], DietTraitsAttribute)) enum string localAliasesMixin = localAliasesMixin!(i+1);
		else enum string localAliasesMixin = "alias ALIASES["~i.to!string~"] "~__traits(identifier, ALIASES[i])~";\n"
			~localAliasesMixin!(i+1, ALIASES);
	} else {
		enum string localAliasesMixin = "";
	}
}

string ctExtension(string file_name) {
	Vector!char ext;
	bool is_ext;
	foreach(c; file_name) {
		if (c == '.') {
			is_ext = true;
			ext.clear();
		}
		if (is_ext) {			
			ext ~= c;
		}
	}
	return ext[].copy();
}

private template collectReferencedFiles(string file_name, alias file_contents)
{

	enum references = collectReferences(file_contents);
	template impl(size_t i) {
		static if (i < references.length) {
			enum rfiles = impl!(i+1);
			static if (__traits(compiles, import(references[i]))) {
				enum ifiles = collectFiles!(references[i]);
				enum impl = merge(ifiles, rfiles);
			} else static if (__traits(compiles, import(references[i] ~ ctExtension(file_name)))) {
				enum ifiles = collectFiles!(references[i] ~ ctExtension(file_name));
				enum impl = merge(ifiles, rfiles);
			} else enum impl = rfiles;
		} else enum Array!InputFile impl = Array!InputFile();
	}
	alias collectReferencedFiles = impl!0;
}

private string[] collectReferences(string content)
{
	pragma(msg, "collectReferences");
	Vector!string ret;
	// content.stripLeft().splitLines()
	Vector!char stripped_content;
	stripped_content[] = ctstripLeft(content);
	Vector!string line_broken_content = ctsplit(stripped_content[], '\n');

	foreach (k, ln; line_broken_content[]) {
		// FIXME: this produces false-positives when a text paragraph is used:
		// p.
		//     This is some text.
		//     import oops, this is also just text.
		ln = ln.ctstripLeft();
		if (k == 0 && ln.ctstartsWith("extends "))
			ret ~= ln[8 .. $].ctstrip();
		else if (ln.ctstartsWith("include "))
			ret ~= ln[8 .. $].ctstrip();
	}
	return ret[].copy();
}

private Array!InputFile merge(T, U)(ref T a, ref U b)
{
	pragma(msg, "merge");
	auto ret = Array!InputFile(a);
	foreach (f; b[]) {
		bool found;
		foreach (f2; a[]) {
			if (f2.name == f.name) {
				found = true;
				break;
			}
		}
		if (!found)
			ret ~= f;

	}
	return ret;
}

version(DietUseLive)
{
	/**
	Runtime equivalent of collectFiles. This version uses std.file to read files
	from the appropriate directory. Note that for collectFiles, the directory to
	use is passed on the command line, whereas in this case, we must receive the
	directory containing the files from the caller.

	Params:
			file = The root file that will be used to find all referenced files.
			source_directories = Optional base directory list from which all files will be searched.

	Returns:
			An array of InputFile structs containing the list of files that are
			referenced from the root file, and their contents.
	*/
	InputFile[] rtGetInputs(string file, string[] source_directories...)
	{
		pragma(msg, "rtGetInputs");
		// for each of the files, import the file, get all the references, and
		// continually import files until we have them all.
		import std.range;
		import std.file : readText, exists;
		import diet.internal.string : stripUTF8BOM;
		import std.algorithm : canFind;
		import std.path : buildPath, extension;

		if (!source_directories.length)
			source_directories = [""];

		auto ext = extension(file);
		string[] filesToProcess = [file];
		Vector!InputFile result;

		void addFile(string fname) {
			if (!filesToProcess.canFind(fname) && !result.canFind!(g => g.name == fname))
				filesToProcess ~= fname;
		}

		next_file:
		while (filesToProcess.length) {
			auto nextFile = filesToProcess.front;
			filesToProcess.popFront();
			foreach (dir; source_directories) {
				if (exists(buildPath(dir, nextFile))) {
					auto newInput = InputFile(nextFile, stripUTF8BOM(readText(buildPath(dir, nextFile))));
					result ~= newInput;
					foreach (f; collectReferences(newInput.contents))
						addFile(f);
					continue next_file;
				}

				if (exists(buildPath(dir, nextFile ~ ext))) {
					addFile(nextFile ~ ext);
					continue next_file;
				}
			}
			throw new Exception("Cannot find necessary file " ~ nextFile ~ " to parse strings for " ~ file);
		}

		assert(result.length > 0);
		return result[].copy();
	}
}