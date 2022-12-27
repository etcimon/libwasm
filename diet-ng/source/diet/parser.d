/**
	Generic Diet format parser.

	Performs generic parsing of a Diet template file. The resulting AST is
	agnostic to the output format context in which it is used. Format
	specific constructs, such as inline code or special tags, are parsed
	as-is without any preprocessing.

	The supported features of the are:
	$(UL
		$(LI string interpolations)
		$(LI assignment expressions)
		$(LI blocks/extensions)
		$(LI includes)
		$(LI text paragraphs)
		$(LI translation annotations)
		$(LI class and ID attribute shortcuts)
	)
*/
module diet.parser;

import diet.dom;
import diet.defs;
import diet.input;
import diet.internal.string;

import memutils.vector;
import memutils.scoped;
pragma(msg, "diet.parser");
nothrow:

version(unittest)
{
	// this is needed to make unittests safe for comparison. Due to
	// Object.opCmp being @system, we cannot fix this here.
	bool nodeEq(Node[] arr1, Node[] arr2) @trusted { return arr1 == arr2; }
}


/** Parses a Diet template document and outputs the resulting DOM tree.

	The overload that takes a list of files will automatically resolve
	includes and extensions.

	Params:
		TR = An optional translation function that takes and returns a string.
			This function will be invoked whenever node text contents need
			to be translated at compile tile (for the `&` node suffix).
		text = For the single-file overload, specifies the contents of the Diet
			template.
		filename = For the single-file overload, specifies the file name that
			is displayed in error messages and stored in the DOM `Location`s.
		files = A full set of Diet template files. All files referenced in
			includes or extension directives must be present.

	Returns:
		The list of parsed root nodes is returned.
*/
Document parseDiet(alias TR = identity)(string text, string filename = "string")
	if (is(typeof(TR(string.init)) == string) || is(typeof(TR(string.init, string.init)) == string))
{
	pragma(msg, "parseDiet");
	Array!InputFile f_arr;
	InputFile f;
	f.name[] = filename;
	f.contents[] = text;
	f_arr ~= f;
	return parseDiet!TR(f_arr);
}

/// Ditto
Document parseDiet(alias TR = identity)(Array!InputFile files)
	if (is(typeof(TR(string.init)) == string) || is(typeof(TR(string.init, string.init)) == string))
{
	pragma(msg, "parseDiet");
	import diet.traits;
	import std.algorithm.iteration : map;

	assert(files.length > 0, "Empty set of input files");

	pragma(msg, "parseDiet");
	Vector!FileInfo parsed_files;
	foreach (f; files[]){
		parsed_files ~= FileInfo(Array!char(f.name[]), Array!Node(parseDietRaw!TR(f)));
	}
	Vector!BlockInfo blocks;
	auto nodes = parseDietWithExtensions(parsed_files[], 0, blocks, null);
	return Document(nodes[]);
}

@safe unittest { // test basic functionality
	Location ln(int l) @safe { return Location("string", l); }

	// simple node
	assert(parseDiet("test").nodes.nodeEq([
		new Node(ln(0), "test")
	]));

	// nested nodes
	assert(parseDiet("foo\n  bar").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.tag(new Node(ln(1), "bar"))
		])
	]));

	// node with id and classes
	assert(parseDiet("test#id.cls1.cls2").nodes.nodeEq([
		new Node(ln(0), "test", [
			Attribute(ln(0), "id", [AttributeContent.text("id")]),
			Attribute(ln(0), "class", [AttributeContent.text("cls1")]),
			Attribute(ln(0), "class", [AttributeContent.text("cls2")])
		])
	]));
	assert(parseDiet("test.cls1#id.cls2").nodes.nodeEq([ // issue #9
		new Node(ln(0), "test", [
			Attribute(ln(0), "class", [AttributeContent.text("cls1")]),
			Attribute(ln(0), "id", [AttributeContent.text("id")]),
			Attribute(ln(0), "class", [AttributeContent.text("cls2")])
		])
	]));

	// empty tag name (only class)
	assert(parseDiet(".foo").nodes.nodeEq([
		new Node(ln(0), "", [
			Attribute(ln(0), "class", [AttributeContent.text("foo")])
		])
	]));
	assert(parseDiet("a.download-button\n\t.bs-hbtn.right.black").nodes.nodeEq([
		new Node(ln(0), "a", [
			Attribute(ln(0), "class", [AttributeContent.text("download-button")]),
		], [
			NodeContent.tag(new Node(ln(1), "", [
				Attribute(ln(1), "class", [AttributeContent.text("bs-hbtn")]),
				Attribute(ln(1), "class", [AttributeContent.text("right")]),
				Attribute(ln(1), "class", [AttributeContent.text("black")])
			]))
		])
	]));

	// empty tag name (only id)
	assert(parseDiet("#foo").nodes.nodeEq([
		new Node(ln(0), "", [
			Attribute(ln(0), "id", [AttributeContent.text("foo")])
		])
	]));

	// node with attributes
	assert(parseDiet("test(foo1=\"bar\", foo2=2+3)").nodes.nodeEq([
		new Node(ln(0), "test", [
			Attribute(ln(0), "foo1", [AttributeContent.text("bar")]),
			Attribute(ln(0), "foo2", [AttributeContent.interpolation("2+3")])
		])
	]));

	// node with pure text contents
	assert(parseDiet("foo.\n\thello\n\t   world").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.text("hello", ln(1)),
			NodeContent.text("\n   world", ln(2))
		], NodeAttribs.textNode)
	]));
	assert(parseDiet("foo.\n\thello\n\n\t   world").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.text("hello", ln(1)),
			NodeContent.text("\n", ln(2)),
			NodeContent.text("\n   world", ln(3))
		], NodeAttribs.textNode)
	]));

	// translated text
	assert(parseDiet("foo& test").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.text("test", ln(0))
		], NodeAttribs.translated, "test")
	]));

	// interpolated text
	assert(parseDiet("foo hello #{\"world\"} #bar \\#{baz}").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.text("hello ", ln(0)),
			NodeContent.interpolation(`"world"`, ln(0)),
			NodeContent.text(" #bar #{baz}", ln(0))
		])
	]));

	// expression
	assert(parseDiet("foo= 1+2").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.interpolation(`1+2`, ln(0)),
		])
	]));

	// expression with empty tag name
	assert(parseDiet("= 1+2").nodes.nodeEq([
		new Node(ln(0), "", null, [
			NodeContent.interpolation(`1+2`, ln(0)),
		])
	]));

	// raw expression
	assert(parseDiet("foo!= 1+2").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.rawInterpolation(`1+2`, ln(0)),
		])
	]));

	// interpolated attribute text
	assert(parseDiet("foo(att='hello #{\"world\"} #bar')").nodes.nodeEq([
		new Node(ln(0), "foo", [
			Attribute(ln(0), "att", [
				AttributeContent.text("hello "),
				AttributeContent.interpolation(`"world"`),
				AttributeContent.text(" #bar")
			])
		])
	]));

	// attribute expression
	assert(parseDiet("foo(att=1+2)").nodes.nodeEq([
		new Node(ln(0), "foo", [
			Attribute(ln(0), "att", [
				AttributeContent.interpolation(`1+2`),
			])
		])
	]));

	// multiline attribute expression
	assert(parseDiet("foo(\n\tatt=1+2,\n\tfoo=bar\n)").nodes.nodeEq([
		new Node(ln(0), "foo", [
			Attribute(ln(0), "att", [
				AttributeContent.interpolation(`1+2`),
			]),
			Attribute(ln(0), "foo", [
				AttributeContent.interpolation(`bar`),
			])
		])
	]));

	// special nodes
	assert(parseDiet("//comment").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.comment, null, [NodeContent.text("comment", ln(0))], NodeAttribs.rawTextNode)
	]));
	assert(parseDiet("//-hide").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.hidden, null, [NodeContent.text("hide", ln(0))], NodeAttribs.rawTextNode)
	]));
	assert(parseDiet("!!! 5").nodes.nodeEq([
		new Node(ln(0), "doctype", null, [NodeContent.text("5", ln(0))])
	]));
	assert(parseDiet("<inline>").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.text, null, [NodeContent.text("<inline>", ln(0))])
	]));
	assert(parseDiet("|text").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.text, null, [NodeContent.text("text", ln(0))])
	]));
	assert(parseDiet("|text\n").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.text, null, [NodeContent.text("text", ln(0))])
	]));
	assert(parseDiet("| text\n").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.text, null, [NodeContent.text("text", ln(0))])
	]));
	assert(parseDiet("|.").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.text, null, [NodeContent.text(".", ln(0))])
	]));
	assert(parseDiet("|:").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.text, null, [NodeContent.text(":", ln(0))])
	]));
	assert(parseDiet("|&x").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.text, null, [NodeContent.text("x", ln(0))], NodeAttribs.translated, "x")
	]));
	assert(parseDiet("-if(x)").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.code, null, [NodeContent.text("if(x)", ln(0))])
	]));
	assert(parseDiet("-if(x)\n\t|bar").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.code, null, [
			NodeContent.text("if(x)", ln(0)),
			NodeContent.tag(new Node(ln(1), Node.SpecialName.text, null, [
				NodeContent.text("bar", ln(1))
			]))
		])
	]));
	assert(parseDiet(":foo\n\tbar").nodes.nodeEq([
		new Node(ln(0), ":", [Attribute(ln(0), "filterChain", [AttributeContent.text("foo")])], [
			NodeContent.text("bar", ln(1))
		], NodeAttribs.textNode)
	]));
	assert(parseDiet(":foo :bar baz").nodes.nodeEq([
		new Node(ln(0), ":", [Attribute(ln(0), "filterChain", [AttributeContent.text("foo bar")])], [
			NodeContent.text("baz", ln(0))
		], NodeAttribs.textNode)
	]));
	assert(parseDiet(":foo\n\t:bar baz").nodes.nodeEq([
		new Node(ln(0), ":", [Attribute(ln(0), "filterChain", [AttributeContent.text("foo")])], [
			NodeContent.text(":bar baz", ln(1))
		], NodeAttribs.textNode)
	]));
	assert(parseDiet(":foo\n\tbar\n\t\t:baz").nodes.nodeEq([
		new Node(ln(0), ":", [Attribute(ln(0), "filterChain", [AttributeContent.text("foo")])], [
			NodeContent.text("bar", ln(1)),
			NodeContent.text("\n\t:baz", ln(2))
		], NodeAttribs.textNode)
	]));

	// nested nodes
	assert(parseDiet("a: b").nodes.nodeEq([
		new Node(ln(0), "a", null, [
			NodeContent.tag(new Node(ln(0), "b"))
		])
	]));

	assert(parseDiet("a: b\n\tc\nd").nodes.nodeEq([
		new Node(ln(0), "a", null, [
			NodeContent.tag(new Node(ln(0), "b", null, [
				NodeContent.tag(new Node(ln(1), "c"))
			]))
		]),
		new Node(ln(2), "d")
	]));

	// inline nodes
	assert(parseDiet("a #[b]").nodes.nodeEq([
		new Node(ln(0), "a", null, [
			NodeContent.tag(new Node(ln(0), "b"))
		])
	]));
	assert(parseDiet("a #[b #[c d]]").nodes.nodeEq([
		new Node(ln(0), "a", null, [
			NodeContent.tag(new Node(ln(0), "b", null, [
				NodeContent.tag(new Node(ln(0), "c", null, [
					NodeContent.text("d", ln(0))
				]))
			]))
		])
	]));

	// whitespace fitting
	assert(parseDiet("a<>").nodes.nodeEq([
		new Node(ln(0), "a", null, [], NodeAttribs.fitInside|NodeAttribs.fitOutside)
	]));
	assert(parseDiet("a><").nodes.nodeEq([
		new Node(ln(0), "a", null, [], NodeAttribs.fitInside|NodeAttribs.fitOutside)
	]));
	assert(parseDiet("a<").nodes.nodeEq([
		new Node(ln(0), "a", null, [], NodeAttribs.fitInside)
	]));
	assert(parseDiet("a>").nodes.nodeEq([
		new Node(ln(0), "a", null, [], NodeAttribs.fitOutside)
	]));
}

@safe unittest {
	Location ln(int l) { return Location("string", l); }

	// angular2 html attributes tests
	assert(parseDiet("div([value]=\"firstName\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "[value]", [
				AttributeContent.text("firstName"),
			])
		])
	]));

	assert(parseDiet("div([attr.role]=\"myRole\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "[attr.role]", [
				AttributeContent.text("myRole"),
			])
		])
	]));

	assert(parseDiet("div([attr.role]=\"{foo:myRole}\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "[attr.role]", [
				AttributeContent.text("{foo:myRole}"),
			])
		])
	]));

	assert(parseDiet("div([attr.role]=\"{foo:myRole, bar:MyRole}\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "[attr.role]", [
				AttributeContent.text("{foo:myRole, bar:MyRole}")
			])
		])
	]));

	assert(parseDiet("div((attr.role)=\"{foo:myRole, bar:MyRole}\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "(attr.role)", [
				AttributeContent.text("{foo:myRole, bar:MyRole}")
			])
		])
	]));

	assert(parseDiet("div([class.extra-sparkle]=\"isDelightful\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "[class.extra-sparkle]", [
				AttributeContent.text("isDelightful")
			])
		])
	]));

	auto t = parseDiet("div((click)=\"readRainbow($event)\")");
	assert(t.nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "(click)", [
				AttributeContent.text("readRainbow($event)")
			])
		])
	]));

	assert(parseDiet("div([(title)]=\"name\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "[(title)]", [
				AttributeContent.text("name")
			])
		])
	]));

	assert(parseDiet("div(*myUnless=\"myExpression\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "*myUnless", [
				AttributeContent.text("myExpression")
			])
		])
	]));

	assert(parseDiet("div([ngClass]=\"{active: isActive, disabled: isDisabled}\")").nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "[ngClass]", [
				AttributeContent.text("{active: isActive, disabled: isDisabled}")
			])
		])
	]));

	t = parseDiet("div(*ngFor=\"\\#item of list\")");
	assert(t.nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "*ngFor", [
				AttributeContent.text("#"),
				AttributeContent.text("item of list")
			])
		])
	]));

	t = parseDiet("div(({*ngFor})=\"{args:\\#item of list}\")");
	assert(t.nodes.nodeEq([
		new Node(ln(0), "div", [
			Attribute(ln(0), "({*ngFor})", [
				AttributeContent.text("{args:"),
				AttributeContent.text("#"),
				AttributeContent.text("item of list}")
			])
		])
	]));
}

@safe unittest { // translation
	import std.string : toUpper;

	static Location ln(int l) { return Location("string", l); }

	static string tr(string str) { return "("~toUpper(str)~")"; }

	assert(parseDiet!tr("foo& test").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.text("(TEST)", ln(0))
		], NodeAttribs.translated, "test")
	]));

	assert(parseDiet!tr("foo& test #{x} it").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.text("(TEST ", ln(0)),
			NodeContent.interpolation("X", ln(0)),
			NodeContent.text(" IT)", ln(0)),
		], NodeAttribs.translated, "test #{x} it")
	]));

	assert(parseDiet!tr("|&x").nodes.nodeEq([
		new Node(ln(0), Node.SpecialName.text, null, [NodeContent.text("(X)", ln(0))], NodeAttribs.translated, "x")
	]));

	assert(parseDiet!tr("foo&.\n\tbar\n\tbaz").nodes.nodeEq([
		new Node(ln(0), "foo", null, [
			NodeContent.text("(BAR)", ln(1)),
			NodeContent.text("\n(BAZ)", ln(2))
		], NodeAttribs.translated|NodeAttribs.textNode, "bar\nbaz")
	]));
}

@safe unittest { // test expected errors
	void testFail(string diet, string msg)
	{
		try {
			parseDiet(diet);
			assert(false, "Expected exception was not thrown.");
		} catch (DietParserException ex) assert(ex.msg == msg, "Unexpected error message: "~ex.msg);
	}

	testFail("+test", "Expected node text separated by a space character or end of line, but got '+test'.");
	testFail("  test", "First node must not be indented.");
	testFail("test\n  test\n\ttest", "Mismatched indentation style.");
	testFail("test\n\ttest\n\t\t\ttest", "Line is indented too deeply.");
	testFail("test#", "Expected identifier but got nothing.");
	testFail("test.()", "Expected identifier but got '('.");
	testFail("a #[b.]", "Multi-line text nodes are not permitted for inline-tags.");
	testFail("a #[b: c]", "Nested inline-tags not allowed.");
	testFail("a#foo#bar", "Only one \"id\" definition using '#' is allowed.");
}

@safe unittest { // includes
	Node[] parse(string diet) {
		auto files = [
			InputFile("main.dt", diet),
			InputFile("inc.dt", "p")
		];
		return parseDiet(files).nodes;
	}

	void testFail(string diet, string msg)
	{
		try {
			parse(diet);
			assert(false, "Expected exception was not thrown");
		} catch (DietParserException ex) {
			assert(ex.msg == msg, "Unexpected error message: "~ex.msg);
		}
	}

	assert(parse("include inc").nodeEq([
		new Node(Location("inc.dt", 0), "p", null, null)
	]));
	testFail("include main", "Dependency cycle detected for this module.");
	testFail("include inc2", "Missing include input file: inc2 for main.dt");
	testFail("include #{p}", "Dynamic includes are not supported.");
	testFail("include inc\n\tp", "Only 'block' allowed as children of includes.");
	testFail("p\ninclude inc\n\tp", "Only 'block' allowed as children of includes.");
}

@safe unittest { // extensions
	Node[] parse(string diet) {
		auto files = [
			InputFile("main.dt", diet),
			InputFile("root.dt", "html\n\tblock a\n\tblock b"),
			InputFile("intermediate.dt", "extends root\nblock a\n\tp"),
			InputFile("direct.dt", "block a")
		];
		return parseDiet(files).nodes;
	}

	void testFail(string diet, string msg)
	{
		try {
			parse(diet);
			assert(false, "Expected exception was not thrown");
		} catch (DietParserException ex) {
			assert(ex.msg == msg, "Unexpected error message: "~ex.msg);
		}
	}

	assert(parse("extends root").nodeEq([
		new Node(Location("root.dt", 0), "html", null, null)
	]));
	assert(parse("extends root\nblock a\n\tdiv\nblock b\n\tpre").nodeEq([
		new Node(Location("root.dt", 0), "html", null, [
			NodeContent.tag(new Node(Location("main.dt", 2), "div", null, null)),
			NodeContent.tag(new Node(Location("main.dt", 4), "pre", null, null))
		])
	]));
	assert(parse("extends intermediate\nblock b\n\tpre").nodeEq([
		new Node(Location("root.dt", 0), "html", null, [
			NodeContent.tag(new Node(Location("intermediate.dt", 2), "p", null, null)),
			NodeContent.tag(new Node(Location("main.dt", 2), "pre", null, null))
		])
	]));
	assert(parse("extends intermediate\nblock a\n\tpre").nodeEq([
		new Node(Location("root.dt", 0), "html", null, [
			NodeContent.tag(new Node(Location("main.dt", 2), "pre", null, null))
		])
	]));
	assert(parse("extends intermediate\nappend a\n\tpre").nodeEq([
		new Node(Location("root.dt", 0), "html", null, [
			NodeContent.tag(new Node(Location("intermediate.dt", 2), "p", null, null)),
			NodeContent.tag(new Node(Location("main.dt", 2), "pre", null, null))
		])
	]));
	assert(parse("extends intermediate\nprepend a\n\tpre").nodeEq([
		new Node(Location("root.dt", 0), "html", null, [
			NodeContent.tag(new Node(Location("main.dt", 2), "pre", null, null)),
			NodeContent.tag(new Node(Location("intermediate.dt", 2), "p", null, null))
		])
	]));
	assert(parse("extends intermediate\nprepend a\n\tfoo\nappend a\n\tbar").nodeEq([ // issue #13
		new Node(Location("root.dt", 0), "html", null, [
			NodeContent.tag(new Node(Location("main.dt", 2), "foo", null, null)),
			NodeContent.tag(new Node(Location("intermediate.dt", 2), "p", null, null)),
			NodeContent.tag(new Node(Location("main.dt", 4), "bar", null, null))
		])
	]));
	assert(parse("extends intermediate\nprepend a\n\tfoo\nprepend a\n\tbar\nappend a\n\tbaz\nappend a\n\tbam").nodeEq([
		new Node(Location("root.dt", 0), "html", null, [
			NodeContent.tag(new Node(Location("main.dt", 2), "foo", null, null)),
			NodeContent.tag(new Node(Location("main.dt", 4), "bar", null, null)),
			NodeContent.tag(new Node(Location("intermediate.dt", 2), "p", null, null)),
			NodeContent.tag(new Node(Location("main.dt", 6), "baz", null, null)),
			NodeContent.tag(new Node(Location("main.dt", 8), "bam", null, null))
		])
	]));
	assert(parse("extends direct").nodeEq([]));
	assert(parse("extends direct\nblock a\n\tp").nodeEq([
		new Node(Location("main.dt", 2), "p", null, null)
	]));
}

@safe unittest { // include extensions
	Node[] parse(string diet) {
		auto files = [
			InputFile("main.dt", diet),
			InputFile("root.dt", "p\n\tblock a"),
		];
		return parseDiet(files).nodes;
	}

	assert(parse("body\n\tinclude root\n\t\tblock a\n\t\t\tem").nodeEq([
		new Node(Location("main.dt", 0), "body", null, [
			NodeContent.tag(new Node(Location("root.dt", 0), "p", null, [
				NodeContent.tag(new Node(Location("main.dt", 3), "em", null, null))
			]))
		])
	]));

	assert(parse("body\n\tinclude root\n\t\tblock a\n\t\t\tem\n\tinclude root\n\t\tblock a\n\t\t\tstrong").nodeEq([
		new Node(Location("main.dt", 0), "body", null, [
			NodeContent.tag(new Node(Location("root.dt", 0), "p", null, [
				NodeContent.tag(new Node(Location("main.dt", 3), "em", null, null))
			])),
			NodeContent.tag(new Node(Location("root.dt", 0), "p", null, [
				NodeContent.tag(new Node(Location("main.dt", 6), "strong", null, null))
			]))
		])
	]));
}


@safe unittest { // test CTFE-ability
	static const result = parseDiet("foo#id.cls(att=\"val\", att2=1+3, att3='test#{4}it')\n\tbar");
	static assert(result.nodes.length == 1);
}

@safe unittest { // regression tests
	Location ln(int l) { return Location("string", l); }

	// last line contains only whitespace
	assert(parseDiet("test\n\t").nodes.nodeEq([
		new Node(ln(0), "test")
	]));
}

@safe unittest { // issue #14 - blocks in includes
	auto files = [
		InputFile("main.dt", "extends layout\nblock nav\n\tbaz"),
		InputFile("layout.dt", "foo\ninclude inc"),
		InputFile("inc.dt", "bar\nblock nav"),
	];
	assert(parseDiet(files).nodes.nodeEq([
		new Node(Location("layout.dt", 0), "foo", null, null),
		new Node(Location("inc.dt", 0), "bar", null, null),
		new Node(Location("main.dt", 2), "baz", null, null)
	]));
}

@safe unittest { // issue #32 - numeric id/class
	Location ln(int l) { return Location("string", l); }
	assert(parseDiet("foo.01#02").nodes.nodeEq([
		new Node(ln(0), "foo", [
			Attribute(ln(0), "class", [AttributeContent.text("01")]),
			Attribute(ln(0), "id", [AttributeContent.text("02")])
		])
	]));
}


/** Dummy translation function that returns the input unmodified.
*/
string identity(string str, string context = null) nothrow @safe @nogc { return str; }


private string parseIdent(in string str, ref size_t start,
	   	string breakChars, in Location loc)
@safe {
	pragma(msg, "parseIdent");
	import std.array : back;
	/* The stack is used to keep track of opening and
	closing character pairs, so that when we hit a break char of
	breakChars we know if we can actually break parseIdent.
	*/
	Vector!char stack;
	size_t i = start;
	outer: while(i < str.length) {
		if(stack.length == 0) {
			foreach(char it; breakChars) {
				if(str[i] == it) {
					break outer;
				}
			}
		}

		if(stack.length && stack.back == str[i]) {
			stack[] = stack[0 .. $ - 1];
		} else if(str[i] == '"') {
			stack ~= '"';
		} else if(str[i] == '(') {
			stack ~= ')';
		} else if(str[i] == '[') {
			stack ~= ']';
		} else if(str[i] == '{') {
			stack ~= '}';
		}
		++i;
	}

	/* We could have consumed the complete string and still have elements
	on the stack or have ended non breakChars character.
	*/
	if(i < str.length && stack.length == 0) {
		foreach(char it; breakChars) {
			if(str[i] == it) {
				size_t startC = start;
				start = i;
				return str[startC .. i];
			}
		}
	}
	enforcep(false, format!"Identifier was not ended by any of these characters: %s"(breakChars), loc);
	assert(false);
}

@safe unittest { // issue #75
	string foo = "(failure";
	Location loc;
	size_t pos = 1;
	import std.exception : assertThrown;
	assertThrown!(DietParserException)(parseIdent(foo, pos, ")", loc));
}

private Array!Node parseDietWithExtensions(FileInfo[] files, size_t file_index, ref Vector!BlockInfo blocks, size_t[] import_stack)
@safe {
	pragma(msg, "parseDietWithExtensions");

	auto floc = Location(Array!char(files[file_index].name[]), 0);
	enforcep(!import_stack.ctcanFind(file_index), "Dependency cycle detected for this module.", floc);

	Array!Node nodes = Array!Node(files[file_index].nodes[]);
	if (nodes.length == 0) return Array!Node();

	if (nodes[0].name[] == "extends") {
		// extract base template name/index
		enforcep(nodes[0].isTextNode, "'extends' cannot contain children or interpolations.", nodes[0].loc);
		enforcep(nodes[0].attributes.length == 0, "'extends' cannot have attributes.", nodes[0].loc);

		string base_template = nodes[0].contents[0].value[].ctstrip;
		size_t base_idx;
		foreach(i, ref f; files) {
			if (matchesName(f.name[], base_template, files[file_index].name[]))
			{
				base_idx = i;
				break;
			}
		}

		assert(base_idx >= 0, format!"Missing base template: %s"(base_template));

		// collect all blocks
		foreach (n; nodes[1 .. $]) {
			BlockInfo.Mode mode;
			switch (n.name[]) {
				default:
					enforcep(false, "Extension templates may only contain blocks definitions at the root level.", n.loc);
					break;
				case Node.SpecialName.comment, Node.SpecialName.hidden: continue; // also allow comments at the root level
				case "block": mode = BlockInfo.Mode.replace; break;
				case "prepend": mode = BlockInfo.Mode.prepend; break;
				case "append": mode = BlockInfo.Mode.append; break;
			}
			enforcep(n.contents.length > 0 && n.contents[0].kind == NodeContent.Kind.text,
				"'block' must have a name.", n.loc);
			auto name = n.contents[0].value[].ctstrip;
			Array!Node contents;
			foreach (c; n.contents[]) {
				if (c.kind == NodeContent.Kind.node)
					contents ~= c.node;
			}
			blocks ~= BlockInfo(Array!char(name), mode, contents);
		}

		// save the original file contents for a possible later parsing as part of an
		// extension include directive (blocks are replaced in-place as part of the parsing
		// process)
		Vector!FileInfo new_files;
		foreach (ref file; files) {
			auto file_info = FileInfo(Array!char(file.name[]), Array!Node(file.nodes[]));
			//foreach(ref node; file.nodes[]) {
			//	file_info.nodes ~= node.clone();
			//}
			new_files ~= file_info;
		}
		new_files[base_idx].nodes[] = clone(new_files[base_idx].nodes[]);

		// parse base template
		Vector!size_t new_import_stack = Vector!size_t(import_stack);
		new_import_stack ~= file_index;
		return parseDietWithExtensions(new_files[], base_idx, blocks, new_import_stack[]);
	}

	static string extractFilename(Node n) @safe
	{
		enforcep(n.contents.length >= 1 && n.contents[0].kind != NodeContent.Kind.node,
			"Missing block name.", n.loc);
		enforcep(n.contents[0].kind == NodeContent.Kind.text,
			"Dynamic includes are not supported.", n.loc);
		bool all_nodes = true;
		if (n.contents.length > 1) foreach (nc; n.contents[1 .. $]) {
			if (nc.kind != NodeContent.Kind.node) {
				all_nodes = false;
				break;
			}
		}
		enforcep(n.contents.length == 1 || all_nodes,
			format!"'%s' must only contain a block name and child nodes."(n.name[]), n.loc);
		enforcep(n.attributes.length == 0, format!"'%s' cannot have attributes."(n.name[]), n.loc);
		return n.contents[0].value[].ctstrip;
	}

	Vector!Node processNode(Node n) @safe nothrow {
		Vector!Node ret;

		void insert(Node[] nodes) @safe nothrow {
			foreach (i, n; nodes) {
				auto np = processNode(n);
				if (np.length > 0) {
					if (ret.length == 0) ret[] = nodes[0 .. i];
					ret ~= np;
				} else if (ret.length > 0) ret ~= n;
			}
			if (ret.length == 0 && nodes.length > 0) ret[] = nodes;
		}

		if (n.name[] == "block") {
			auto name = extractFilename(n);
			Vector!BlockInfo blockdefs;
			foreach (b; blocks) {
				if (b.name[] == name[])
					blockdefs ~= b;

			}

			foreach (b; blockdefs[]) {
				if (b.mode == BlockInfo.Mode.prepend)
					insert(b.contents[]);
			}
			
			Vector!BlockInfo replblocks;
			foreach(b; blockdefs[]) {
				if (b.mode == BlockInfo.Mode.replace)
					replblocks ~= b;
			}
			if (!replblocks.empty) {
				insert(replblocks.front.contents[]);
			} else {
				Vector!Node contents;

				foreach (nc; n.contents[1 .. $]) {
					assert(nc.kind == NodeContent.Kind.node, "Block contains non-node child!?");
					contents ~= nc.node;
				}
				insert(contents[]);
			}

			foreach (b; blockdefs[]) {
				if (b.mode == BlockInfo.Mode.append)
					insert(b.contents[]);
			}
		} else if (n.name[] == "include") {
			auto name = extractFilename(n);
			size_t fidx;
			foreach(i, ref f; files) {
				if (matchesName(f.name[], name[], n.loc.file[]))
				{
					fidx = i;
					break;
				}
			}
			enforcep(fidx >= 0, format!"Missing include input file: %s for %s"(name[], n.loc.file[]), n.loc);

			if (n.contents.length > 1) {
				auto dummy = Node(n.loc, Array!char("extends"));
				dummy.addText(name[], n.contents[0].loc);

				Array!Node children;
				children ~= dummy;

				foreach (nc; n.contents[1 .. $]) {
					enforcep(nc.node.name[].length > 0 && nc.node.name[] == "block",
						"Only 'block' allowed as children of includes.", nc.loc);
					children ~= nc.node;
				}

				auto dummyfil = FileInfo(Array!char(format!"include%s"(ctExtension(files[file_index].name[]))), children);

				Vector!BlockInfo sub_blocks;
				Vector!FileInfo concat_vec = Vector!FileInfo(files);
				concat_vec ~= dummyfil;
				auto sub_nodes = parseDietWithExtensions(concat_vec[], files.length, sub_blocks, import_stack);
				insert(sub_nodes[]);
			} else {
				Vector!size_t new_import_stack = Vector!size_t(import_stack);
				new_import_stack ~= file_index;
				auto sub_nodes = parseDietWithExtensions(files, fidx, blocks, new_import_stack[]);
				insert(sub_nodes[]);
			}
		} else {
			n.contents[] = n.contents[].mapJoin!((nc) nothrow {
				Vector!(NodeContent*) rn_arr;
				if (nc.kind == NodeContent.Kind.node) {
					auto mod = processNode(nc.node);
					if (mod.length > 0) {
						foreach(ref n; mod[])
							rn_arr ~= NodeContent.tag(n);
					} 
				}
				bool _all_non_blocks = true;
				foreach (ref n; rn_arr[]) {
					if (n.node.name[] == "block")
					{
						_all_non_blocks = false;
					}
				}
				assert(_all_non_blocks);
				return rn_arr.move();
			});
		}

		bool all_non_blocks = true;
		foreach (ref nn; ret[]) {
			if (nn.name[] == "block")
			{
				all_non_blocks = false;
			}
		}
		assert(all_non_blocks);

		return ret.move();
	}

	nodes[] = nodes[].mapJoin!(processNode);


	bool all_non_blocks = true;
	foreach (ref n; nodes[]) {
		if (n.name[] == "block")
		{
			all_non_blocks = false;
		}
	}
	assert(all_non_blocks);

	return nodes;
}

private struct BlockInfo {
	enum Mode {
		prepend,
		replace,
		append
	}
	Array!char name;
	Mode mode = Mode.replace;
	Array!Node contents;
}

private struct FileInfo {
	Array!char name;
	Array!Node nodes;
}


/** Parses a single Diet template file, without resolving includes and extensions.

	See_Also: `parseDiet`
*/
Node[] parseDietRaw(alias TR)(InputFile file)
{
	pragma(msg, "parseDietRaw");

	string indent_style;
	auto loc = Location(Array!char(file.name[]), 0);
	int prevlevel = -1;
	string input = file.contents[];
	Array!Node ret;
	// nested stack of nodes
	// the first dimension is corresponds to indentation based nesting
	// the second dimension is for in-line nested nodes
	Array!(Array!Node) stack;
	stack.length = 8;
	string previndent; // inherited by blank lines

	next_line:
	while (input.length) {
		Node pnode;
		if (prevlevel >= 0 && stack[prevlevel].length) pnode = stack[prevlevel][$-1];

		// skip whitespace at the beginning of the line
		string indent = input.skipIndent();

		// treat empty lines as if they had the indendation level of the last non-empty line
		if (input.length == 0 || input[0] == '\n' || input[0] == '\r')
			indent = previndent;
		else previndent = indent;

		enforcep(prevlevel >= 0 || indent.length == 0, "First node must not be indented.", loc);

		// determine the indentation style (tabs/spaces) from the first indented
		// line of the file
		if (indent.length && !indent_style.length) indent_style = indent;

		// determine nesting level
		bool is_text_line = pnode.name[].length > 0 && (pnode.attribs & (NodeAttribs.textNode|NodeAttribs.rawTextNode)) != 0;
		int level = 0;
		if (indent_style.length) {
			while (indent.ctstartsWith(indent_style)) {
				if (level > prevlevel) {
					enforcep(is_text_line, "Line is indented too deeply.", loc);
					break;
				}
				level++;
				indent = indent[indent_style.length .. $];
			}
		}

		enforcep(is_text_line || indent.length == 0, "Mismatched indentation style.", loc);

		// read the whole line as text if the parent node is a pure text node
		// ("." suffix) or pure raw text node (e.g. comments)
		if (level > prevlevel && prevlevel >= 0) {
			if (pnode.attribs & NodeAttribs.textNode) {
				if (!pnode.contents.empty) {
					pnode.addText("\n", loc);
					if (pnode.attribs & NodeAttribs.translated)
						pnode.translationKey ~= "\n";
				}
				if (indent.length) pnode.addText(indent, loc);
				parseTextLine!TR(input, pnode, loc);
				continue;
			} else if (pnode.attribs & NodeAttribs.rawTextNode) {
				if (!pnode.contents.empty)
					pnode.addText("\n", loc);
				if (indent.length) pnode.addText(indent, loc);
				auto tmploc = loc;
				pnode.addText(skipLine(input, loc), tmploc);
				continue;
			}
		}

		// skip empty lines
		if (input.length == 0) break;
		else if (input[0] == '\n') { loc.line++; input = input[1 .. $]; continue; }
		else if (input[0] == '\r') {
			loc.line++;
			input = input[1 .. $];
			if (input.length != 0 && input[0] == '\n')
				input = input[1 .. $];
			continue;
		}

		// parse the line and write it to the stack:

		if (stack.length < level+1) stack.length = level+1;

		if (input.ctstartsWith("//")) {
			// comments
			auto n = Node.init;
			n.loc = loc;
			if (input[2 .. $].ctstartsWith("-")) { n.name[] = cast(string)Node.SpecialName.hidden; input = input[3 .. $]; }
			else { n.name[] = cast(string)Node.SpecialName.comment; input = input[2 .. $]; }
			n.attribs |= NodeAttribs.rawTextNode;
			auto tmploc = loc;
			n.addText(skipLine(input, loc), tmploc);
			stack[level].clear();
			stack[level] ~= n;
		} else if (input.ctstartsWith('-')) {
			// D statements
			input = input[1 .. $];
			auto n = Node.init;
			n.loc = loc;
			n.name[] = cast(string)Node.SpecialName.code;
			auto tmploc = loc;
			n.addText(skipLine(input, loc), tmploc);
			stack[level].clear();
			stack[level] ~= n;
		} else if (input.ctstartsWith(':')) {
			// filters
			stack[level].clear();


			Vector!char chain;

			do {
				input = input[1 .. $];
				size_t idx = 0;
				if (chain.length) chain ~= ' ';
				chain ~= skipIdent(input, idx, "-_", loc, false, true);
				input = input[idx .. $];
				if (input.ctstartsWith(' ')) input = input[1 .. $];
			} while (input.ctstartsWith(':'));

			Node chn = Node.init;
			chn.loc = loc;
			chn.name[] = cast(string)Node.SpecialName.filter;
			chn.attribs = NodeAttribs.textNode;
			chn.attributes.clear();
			chn.attributes ~= Attribute(loc, "filterChain", AttributeContent.text(chain[]));
			stack[level] ~= chn;

			/*auto tmploc = loc;
			auto trailing = skipLine(input, loc);
			if (trailing.length) parseTextLine(input, chn, tmploc);*/
			parseTextLine!TR(input, chn, loc);
		} else {
			// normal tag line
			bool has_nested;
			stack[level].clear();
			do stack[level] ~= parseTagLine!TR(input, loc, has_nested);
			while (has_nested);
		}

		// add it to its parent contents
		foreach (i; 1 .. stack[level].length)
			stack[level][i-1].contents ~= NodeContent.tag(stack[level][i]);
		if (level > 0) stack[level-1][$-1].contents ~= NodeContent.tag(stack[level][0]);
		else ret ~= stack[0][0];

		// remember the nesting level for the next line
		prevlevel = level;
	}

	return ret[].copy();
}

private Node parseTagLine(alias TR)(ref string input, ref Location loc, out bool has_nested) @trusted
{
	pragma(msg, "parseTagLine");
	size_t idx = 0;

	auto ret = Node.init;
	ret.loc = loc;

	if (input.ctstartsWith("!!! ")) { // legacy doctype support
		input = input[4 .. $];
		ret.name[] = "doctype";
		parseTextLine!TR(input, ret, loc);
		return ret;
	}

	if (input.ctstartsWith('<')) { // inline HTML/XML
		ret.name[] = cast(string)Node.SpecialName.text;
		parseTextLine!TR(input, ret, loc);
		return ret;
	}

	if (input.ctstartsWith('|')) { // text line
		input = input[1 .. $];
		ret.name[] = cast(string)Node.SpecialName.text;
		if (idx < input.length && input[idx] == '&') { ret.attribs |= NodeAttribs.translated; idx++; }
	} else { // normal tag
		if (parseTag(input, idx, ret, has_nested, loc))
			return ret;
	}

	if (idx+1 < input.length && input[idx .. idx+2] == "!=") {
		enforcep(!(ret.attribs & NodeAttribs.translated), "Compile-time translation is not supported for (raw) assignments.", ret.loc);
		idx += 2;
		auto l = loc;
		ret.contents ~= NodeContent.rawInterpolation(ctstrip(skipLine(input, idx, loc)), l);
		input = input[idx .. $];
	} else if (idx < input.length && input[idx] == '=') {
		enforcep(!(ret.attribs & NodeAttribs.translated), "Compile-time translation is not supported for assignments.", ret.loc);
		idx++;
		auto l = loc;
		ret.contents ~= NodeContent.interpolation(ctstrip(skipLine(input, idx, loc)), l);
		input = input[idx .. $];
	} else {
		auto tmploc = loc;
		auto remainder = skipLine(input, idx, loc);
		input = input[idx .. $];

		if (remainder.length && remainder[0] == ' ') {
			// parse the rest of the line as text contents (if any non-ws)
			remainder = remainder[1 .. $];
			parseTextLine!TR(remainder, ret, tmploc);
		} else if (ret.name[] == Node.SpecialName.text) {
			// allow omitting the whitespace for "|" text nodes
			parseTextLine!TR(remainder, ret, tmploc);
		} else {
			import std.string : strip;
			enforcep(remainder.ctstrip().length == 0,
				format!"Expected node text separated by a space character or end of line, but got '%d'."(remainder), loc);
		}
	}

	return ret;
}

private bool parseTag(ref string input, ref size_t idx, ref Node dst, ref bool has_nested, ref Location loc)
@safe {
	pragma(msg, "parseTag");

	dst.name[] = skipIdent(input, idx, ":-_", loc, true);

	// a trailing ':' is not part of the tag name, but signals a nested node
	if (dst.name[].ctendsWith(":")) {
		dst.name.removeBack();
		idx--;
	}

	bool have_id = false;
	while (idx < input.length) {
		if (input[idx] == '#') {
		 	// node ID
			idx++;
			auto value = skipIdent(input, idx, "-_", loc);
			enforcep(value.length > 0, "Expected id.", loc);
			enforcep(!have_id, "Only one \"id\" definition using '#' is allowed.", loc);
			have_id = true;
			dst.attributes ~= Attribute.text("id", value, loc);
		} else if (input[idx] == '.') {
			// node classes
			if (idx+1 >= input.length || input[idx+1].isWhite)
				goto textBlock;
			idx++;
			auto value = skipIdent(input, idx, "-_", loc);
			enforcep(value.length > 0, "Expected class name identifier.", loc);
			dst.attributes ~= Attribute.text("class", value, loc);
		} else break;
	}

	// generic attributes
	if (idx < input.length && input[idx] == '(')
		parseAttributes(input, idx, dst, loc);

	// avoid whitespace inside of tag
	if (idx < input.length && input[idx] == '<') {
		idx++;
		dst.attribs |= NodeAttribs.fitInside;
	}

	// avoid whitespace outside of tag
	if (idx < input.length && input[idx] == '>') {
		idx++;
		dst.attribs |= NodeAttribs.fitOutside;
	}

	// avoid whitespace inside of tag (also allowed after >)
	if (!(dst.attribs & NodeAttribs.fitInside) && idx < input.length && input[idx] == '<') {
		idx++;
		dst.attribs |= NodeAttribs.fitInside;
	}

	// translate text contents
	if (idx < input.length && input[idx] == '&') {
		idx++;
		dst.attribs |= NodeAttribs.translated;
	}

	// treat nested lines as text
	if (idx < input.length && input[idx] == '.') {
		textBlock:
		dst.attribs |= NodeAttribs.textNode;
		idx++;
		skipLine(input, idx, loc); // ignore the rest of the line
		input = input[idx .. $];
		return true;
	}

	// another nested tag on the same line
	if (idx < input.length && input[idx] == ':') {
		idx++;

		// skip trailing whitespace (but no line breaks)
		while (idx < input.length && (input[idx] == ' ' || input[idx] == '\t'))
			idx++;

		// see if we got anything left on the line
		if (idx < input.length) {
			if (input[idx] == '\n' || input[idx] == '\r') {
				// FIXME: should we rather error out here?
				skipLine(input, idx, loc);
			} else {
				// leaves the rest of the line to parse another tag
				has_nested = true;
			}
		}
		input = input[idx .. $];
		return true;
	}

	return false;
}

bool isDirSeparator(char c)  @safe pure nothrow @nogc
{
    if (c == '/') return true;
    if (c == '\\') return true;
    return false;
}

string basenameWithoutExtension(string path) {
	size_t begin;
	size_t end;
	foreach(i, c; path) {
		if (isDirSeparator(c)) {
			begin = i + 1;
		}
		if (c == '.') {
			end = i;
		}
	}
	return path[begin .. end];
}

/**
	Parses a single line of text (possibly containing interpolations and inline tags).

	If there a a newline at the end, it will be appended to the contents of the
	destination node.
*/
private void parseTextLine(alias TR, bool translate = true)(ref string input, ref Node dst, ref Location loc)
{
	pragma(msg, "parseTextLine");

	size_t idx = 0;

	if (translate && dst.attribs & NodeAttribs.translated) {
		Location loccopy = loc;
		auto kln = skipLine(input, idx, loc);
		input = input[idx .. $];
		dst.translationKey ~= kln;
		static if (is(typeof(TR(string.init, string.init))))
			auto tln = TR(kln, loc.file[].basenameWithoutExtension);
		else
			auto tln = TR(kln);
		parseTextLineRaw(tln, dst, loccopy);
		return;
	}

	parseTextLineRaw(input, dst, loc);
}

private void parseTextLineRaw(ref string input, ref Node dst, ref Location loc)
@safe {
	pragma(msg, "parseTextLineRaw");

	size_t sidx = 0, idx = 0;

	void flushText()
	@safe {
		if (idx > sidx) dst.addText(input[sidx .. idx], loc);
	}

	while (idx < input.length) {
		char cur = input[idx];
		switch (cur) {
			default: idx++; break;
			case '\\':
				if (idx+1 < input.length && (input[idx+1] == '#' || input[idx+1] == '!')) {
					flushText();
					sidx = idx+1;
					idx += 2;
				} else idx++;
				break;
			case '!', '#':
				if (idx+1 < input.length && input[idx+1] == '{') {
					flushText();
					idx += 2;
					auto expr = skipUntilClosingBrace(input, idx, loc);
					idx++;
					if (cur == '#') dst.contents ~= NodeContent.interpolation(expr, loc);
					else dst.contents ~= NodeContent.rawInterpolation(expr, loc);
					sidx = idx;
				} else if (cur == '#' && idx+1 < input.length && input[idx+1] == '[') {
					flushText();
					idx += 2;
					auto tag = skipUntilClosingBracket(input, idx, loc);
					idx++;
					bool has_nested;
					auto itag = parseTagLine!identity(tag, loc, has_nested);
					enforcep(!(itag.attribs & (NodeAttribs.textNode|NodeAttribs.rawTextNode)),
						"Multi-line text nodes are not permitted for inline-tags.", loc);
					enforcep(!(itag.attribs & NodeAttribs.translated),
						"Inline-tags cannot be translated individually.", loc);
					enforcep(!has_nested, "Nested inline-tags not allowed.", loc);
					dst.contents ~= NodeContent.tag(itag);
					sidx = idx;
				} else idx++;
				break;
			case '\r':
				flushText();
				idx++;
				if (idx < input.length && input[idx] == '\n') idx++;
				input = input[idx .. $];
				loc.line++;
				return;
			case '\n':
				flushText();
				idx++;
				input = input[idx .. $];
				loc.line++;
				return;
		}
	}

	flushText();
	assert(idx == input.length);
	input = null;
}

private string skipLine(ref string input, ref size_t idx, ref Location loc)
@safe {
	pragma(msg, "skipLine");
	auto sidx = idx;

	while (idx < input.length) {
		char cur = input[idx];
		switch (cur) {
			default: idx++; break;
			case '\r':
				auto ret = input[sidx .. idx];
				idx++;
				if (idx < input.length && input[idx] == '\n') idx++;
				loc.line++;
				return ret;
			case '\n':
				auto ret = input[sidx .. idx];
				idx++;
				loc.line++;
				return ret;
		}
	}

	return input[sidx .. $];
}

private string skipLine(ref string input, ref Location loc)
@safe {
	pragma(msg, "skipLine");
	size_t idx = 0;
	auto ret = skipLine(input, idx, loc);
	input = input[idx .. $];
	return ret;
}

private void parseAttributes(ref string input, ref size_t i, ref Node node, in Location loc)
@safe {
	pragma(msg, "parseAttributes");
	assert(i < input.length && input[i] == '(');
	i++;

	skipAnyWhitespace(input, i);
	while (i < input.length && input[i] != ')') {
		string name = parseIdent(input, i, ",)=", loc);
		Vector!char value;
		skipAnyWhitespace(input, i);
		if( i < input.length && input[i] == '=' ){
			i++;
			skipAnyWhitespace(input, i);
			enforcep(i < input.length, "'=' must be followed by attribute string.", loc);
			value[] = skipExpression(input, i, loc, true);
			assert(i <= input.length);
			if (isStringLiteral(value[]) && value[0] == '\'') {
				value.clear();
				value ~= `"`;
				auto tmp = dstringUnescape(value[1 .. $-1]);
				value ~= dstringEscape(tmp);
				value ~= `"`;
			}
		} else value[] = "true";

		enforcep(i < input.length, "Unterminated attribute section.", loc);
		enforcep(input[i] == ')' || input[i] == ',', 
			format!"Unexpected text following attribute: '%s' ('%s')"(input[0..i], input[i..$]), loc);
		if (input[i] == ',') {
			i++;
			skipAnyWhitespace(input, i);
		}

		if (name == "class" && value[] == `""`) continue;

		if (isStringLiteral(value[])) {
			Vector!AttributeContent content;
			parseAttributeText(value[1 .. $-1], content, loc);
			node.attributes ~= Attribute(loc, name, content[]);
		} else {
			node.attributes ~= Attribute.expr(name, value[], loc);
		}
	}

	enforcep(i < input.length, "Missing closing clamp.", loc);
	i++;
}

private void parseAttributeText(string input, ref Vector!AttributeContent dst, in Location loc)
@safe {
	pragma(msg, "parseAttributeText");
	size_t sidx = 0, idx = 0;

	void flushText()
	{
		if (idx > sidx) dst ~= AttributeContent.text(input[sidx .. idx]);
	}

	while (idx < input.length) {
		char cur = input[idx];
		switch (cur) {
			default: idx++; break;
			case '\\':
				flushText();
				dst ~= AttributeContent.text(dstringUnescape(sanitizeEscaping(input[idx .. idx+2])));
				idx += 2;
				sidx = idx;
				break;
			case '!', '#':
				if (idx+1 < input.length && input[idx+1] == '{') {
					flushText();
					idx += 2;
					auto expr = dstringUnescape(skipUntilClosingBrace(input, idx, loc));
					idx++;
					if (cur == '#') dst ~= AttributeContent.interpolation(expr);
					else dst ~= AttributeContent.rawInterpolation(expr);
					sidx = idx;
				} else idx++;
				break;
		}
	}

	flushText();
	input = input[idx .. $];
}

private string skipUntilClosingBrace(in string s, ref size_t idx, in Location loc)
@safe {
	pragma(msg, "skipUntilClosingBrace");
	import std.algorithm.comparison : among;

	int level = 0;
	auto start = idx;
	while( idx < s.length ){
		if( s[idx] == '{' ) level++;
		else if( s[idx] == '}' ) level--;
		enforcep(!s[idx].among('\n', '\r'), "Missing '}' before end of line.", loc);
		if( level < 0 ) return s[start .. idx];
		idx++;
	}
	enforcep(false, "Missing closing brace", loc);
	assert(false);
}

private string skipUntilClosingBracket(in string s, ref size_t idx, in Location loc)
@safe {
	pragma(msg, "skipUntilClosingBracket");
	import std.algorithm.comparison : among;

	int level = 0;
	auto start = idx;
	while( idx < s.length ){
		if( s[idx] == '[' ) level++;
		else if( s[idx] == ']' ) level--;
		enforcep(!s[idx].among('\n', '\r'), "Missing ']' before end of line.", loc);
		if( level < 0 ) return s[start .. idx];
		idx++;
	}
	enforcep(false, "Missing closing bracket", loc);
	assert(false);
}

/++
    Params: c = The character to test.
    Returns: Whether `c` is an ASCII letter (A .. Z, a .. z).
  +/
bool isAlpha(dchar c) @safe pure nothrow @nogc
{
    // Optimizer can turn this into a bitmask operation on 64 bit code
    return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}

private string skipIdent(in string s, ref size_t idx, string additional_chars,
	in Location loc, bool accept_empty = false, bool require_alpha_start = false)
@safe {
	pragma(msg, "skipIdent");

	size_t start = idx;
	while (idx < s.length) {
		if (isAlpha(s[idx])) idx++;
		else if ((!require_alpha_start || start != idx) && s[idx] >= '0' && s[idx] <= '9') idx++;
		else {
			bool found = false;
			foreach (ch; additional_chars)
				if (s[idx] == ch) {
					found = true;
					idx++;
					break;
				}
			if (!found) {
				enforcep(accept_empty || start != idx, format!"Expected identifier but got '%s'."(s[idx]), loc);
				return s[start .. idx];
			}
		}
	}
	enforcep(start != idx, "Expected identifier but got nothing.", loc);
	return s[start .. idx];
}

/// Skips all trailing spaces and tab characters of the input string.
private string skipIndent(ref string input)
@safe {
	pragma(msg, "skipIndent");
	size_t idx = 0;
	while (idx < input.length && isIndentChar(input[idx]))
		idx++;
	auto ret = input[0 .. idx];
	input = input[idx .. $];
	return ret;
}

private bool isIndentChar(dchar ch) @safe { return ch == ' ' || ch == '\t'; }

private string skipAnyWhitespace(in string s, ref size_t idx)
@safe {
	pragma(msg, "skipAnyWhitespace");

	size_t start = idx;
	while (idx < s.length) {
		if (s[idx].isWhite) idx++;
		else break;
	}
	return s[start .. idx];
}

private bool isStringLiteral(string str)
@safe {
	size_t i = 0;

	// skip leading white space
	while (i < str.length && (str[i] == ' ' || str[i] == '\t')) i++;

	// no string literal inside
	if (i >= str.length) return false;

	char delimiter = str[i++];
	if (delimiter != '"' && delimiter != '\'') return false;

	while (i < str.length && str[i] != delimiter) {
		if (str[i] == '\\') i++;
		i++;
	}

	// unterminated string literal
	if (i >= str.length) return false;

	i++; // skip delimiter

	// skip trailing white space
	while (i < str.length && (str[i] == ' ' || str[i] == '\t')) i++;

	// check if the string has ended with the closing delimiter
	return i == str.length;
}

@safe unittest {
	assert(isStringLiteral(`""`));
	assert(isStringLiteral(`''`));
	assert(isStringLiteral(`"hello"`));
	assert(isStringLiteral(`'hello'`));
	assert(isStringLiteral(` 	"hello"	 `));
	assert(isStringLiteral(` 	'hello'	 `));
	assert(isStringLiteral(`"hel\"lo"`));
	assert(isStringLiteral(`"hel'lo"`));
	assert(isStringLiteral(`'hel\'lo'`));
	assert(isStringLiteral(`'hel"lo'`));
	assert(isStringLiteral(`'#{"address_"~item}'`));
	assert(!isStringLiteral(`"hello\`));
	assert(!isStringLiteral(`"hello\"`));
	assert(!isStringLiteral(`"hello\"`));
	assert(!isStringLiteral(`"hello'`));
	assert(!isStringLiteral(`'hello"`));
	assert(!isStringLiteral(`"hello""world"`));
	assert(!isStringLiteral(`"hello" "world"`));
	assert(!isStringLiteral(`"hello" world`));
	assert(!isStringLiteral(`'hello''world'`));
	assert(!isStringLiteral(`'hello' 'world'`));
	assert(!isStringLiteral(`'hello' world`));
	assert(!isStringLiteral(`"name" value="#{name}"`));
}

private string skipExpression(in string s, ref size_t idx, in Location loc, bool multiline = false)
@safe {
	pragma(msg, "skipExpression");
	Vector!char clamp_stack;
	size_t start = idx;
	outer:
	while (idx < s.length) {
		switch (s[idx]) {
			default: break;
			case '\n', '\r':
				enforcep(multiline, "Unexpected end of line.", loc);
				break;
			case ',':
				if (clamp_stack.length == 0)
					break outer;
				break;
			case '"', '\'':
				idx++;
				skipAttribString(s, idx, s[idx-1], loc);
				break;
			case '(': clamp_stack ~= ')'; break;
			case '[': clamp_stack ~= ']'; break;
			case '{': clamp_stack ~= '}'; break;
			case ')', ']', '}':
				if (s[idx] == ')' && clamp_stack.length == 0)
					break outer;
				enforcep(clamp_stack.length > 0 && clamp_stack[$-1] == s[idx], format!"Unexpected '%s'"(s[idx]), loc);
				clamp_stack.removeBack();
				break;
		}
		idx++;
	}

	enforcep(clamp_stack.length == 0, format!"Expected '%s' before end of attribute expression."(clamp_stack.empty ? '?' : clamp_stack[$-1]), loc);
	return ctstrip(s[start .. idx]);
}


private string skipAttribString(in string s, ref size_t idx, char delimiter, in Location loc)
@safe {
	pragma(msg, "skipAttribString");
	size_t start = idx;
	while( idx < s.length ){
		if( s[idx] == '\\' ){
			// pass escape character through - will be handled later by buildInterpolatedString
			idx++;
			enforcep(idx < s.length, "'\\' must be followed by something (escaped character)!", loc);
		} else if( s[idx] == delimiter ) break;
		idx++;
	}
	enforcep(idx < s.length, format!"Unterminated attribute string: %s||"(s[start-1 .. $]), loc);
	return s[start .. idx];
}

private bool matchesName(string filename, string logical_name, string parent_name)
@safe {
	pragma(msg, "matchesName");
	if (filename == logical_name) return true;
	auto ext = parent_name.ctExtension;
	if (filename.ctendsWith(ext) && filename[0 .. $-ext.length] == logical_name) return true;
	return false;
}

private Vector!T mapJoin(alias modify, T)(T[] arr)
{
	Vector!T ret;
	size_t start = 0;
	foreach (i; 0 .. arr.length) {
		auto mod = modify(arr[i]);
		if (mod.length > 0) {
			ret ~= arr[start .. i];
			ret ~= mod[];
			start = i + 1;
		}
	}

	if (start == 0) return Vector!T(arr);

	ret ~= arr[start .. $];

	return ret.move();
}
