/** Types to represent the DOM tree.

	The DOM tree is used as an intermediate representation between the parser
	and the generator. Filters and other kinds of transformations can be
	executed on the DOM tree. The generator itself will apply filters and
	other traits using `diet.traits.applyTraits`.
*/
module diet.dom;

import diet.internal.string;
import diet.defs;
import memutils.vector;
import memutils.scoped;

@safe:
nothrow:

string expectText(const(Attribute) att)
{
	import diet.defs;
	if (att.contents.length == 0) return null;
	enforcep(att.isText, format!"'%s' expected to be a pure text attribute."(att.name[]), att.loc);
	return att.contents[0].value[];
}

string expectText(const(Node) n)
{
	import diet.defs;
	if (n.contents.length == 0) return null;
	enforcep(n.contents.length > 0 && n.contents[0].kind == NodeContent.Kind.text &&
		(n.contents.length == 1 || n.contents[1].kind != NodeContent.Kind.node),
		"Expected pure text node.", n.loc);
	return n.contents[0].value[];
}

string expectExpression(const(Attribute) att)
{
	import diet.defs;
	enforcep(att.isExpression, format!"'%s' expected to be an expression attribute."(att.name[]), att.loc);
	return att.contents[0].value[];
}

Vector!Node clone(in Node[] nodes)
{
	auto ret = Vector!Node(nodes.length);
	foreach (i, ref n; ret) n = nodes[i].clone;
	return ret.move();
}

bool isExpression(const(Attribute) att) { return att.contents.length == 1 && att.contents[0].kind == AttributeContent.Kind.interpolation; }
bool isText(const(Attribute) att) { return att.contents.length == 0 || att.contents.length == 1 && att.contents[0].kind == AttributeContent.Kind.text; }

/** Converts an array of attribute contents to node contents.
*/
NodeContent[] toNodeContent(in AttributeContent[] contents, Location loc)
{
	auto ret = Vector!NodeContent(contents.length);
	foreach (i, ref c; contents) {
		final switch (c.kind) {
			case AttributeContent.Kind.text: ret[i] = NodeContent.text(c.value[], loc); break;
			case AttributeContent.Kind.interpolation: ret[i] = NodeContent.interpolation(c.value[], loc); break;
			case AttributeContent.Kind.rawInterpolation: ret[i] = NodeContent.rawInterpolation(c.value[], loc); break;
		}
	}
	return ret[].copy();
}


/** Encapsulates a full Diet template document.
*/
/*final*/ struct Document { // non-final because of https://issues.dlang.org/show_bug.cgi?id=17146
	Array!Node nodes;

	this(Node[] nodes) nothrow { this.nodes = Array!Node(nodes); }
}


/** Represents a single node in the DOM tree.
*/
/*final*/ struct Node { // non-final because of https://issues.dlang.org/show_bug.cgi?id=17146
	@safe nothrow:

	/// A set of names that identify special-purpose nodes
	enum SpecialName {
		/** Normal comment. The content will appear in the output if the output
			format supports comments.
		*/
		comment = "//",

		/** Hidden comment. The content will never appear in the output.
		*/
		hidden = "//-",

		/** D statement. A node that has pure text as its first content,
			optionally followed by any number of child nodes. The text content
			is either a complete D statement, or an open block statement
			(without a block statement appended). In the latter case, all nested
			nodes are considered to be part of the block statement's body by
			the generator.
		*/
		code = "-",

		/** A dummy node that contains only text and string interpolations.
			These nodes behave the same as if their node content would be
			inserted in their place, except that they will cause whitespace
			(usually a space or a newline) to be prepended in the output, if
			they are not the first child of their parent.
		*/
		text = "|",

		/** Filter node. These nodes contain only text and string interpolations
			and have a "filterChain" attribute that contains a space separated
			list of filter names that are applied in reverse order when the
			traits (see `diet.traits.applyTraits`) are applied by the generator.
		*/
		filter = ":"
	}

	/// Start location of the node in the source file.
	Location loc;
	/// Name of the node
	Array!char name;
	/// A key-value set of attributes.
	Array!Attribute attributes;
	/// The main contents of the node.
	Array!(NodeContent*) contents;
	/// Flags that control the parser and generator behavior.
	NodeAttribs attribs;
	/// Original text used to look up the translation (only set if translated)
	Array!char translationKey;

	/// Returns the "id" attribute.
	@property inout(Attribute) id() inout { return getAttribute("id"); }
	/// Returns "class" attribute - a white space separated list of style class identifiers.
	@property inout(Attribute) class_() inout { return getAttribute("class"); }

	Node clone()
	const {
		Node ret;
		ret.loc.file[] = this.loc.file[];
		ret.loc.line = this.loc.line;
		ret.name[] = this.name[];
		ret.attribs = this.attribs;
		ret.translationKey[] = this.translationKey[];
		ret.attributes.length = this.attributes.length;
		foreach (i, ref a; ret.attributes[]) {
			a.copyFrom(this.attributes[i]);
		} 
		ret.contents.length = this.contents.length;
		foreach (i, ref c; ret.contents[]) c = this.contents[i].clone;
		return ret;
	}

	/** Adds a piece of text to the node's contents.

		If the node already has some content and the last piece of content is
		also text, with a matching location, the text will be appended to that
		`NodeContent`'s value. Otherwise, a new `NodeContent` will be appended.

		Params:
			text = The text to append to the node
			loc = Location in the source file
	*/
	void addText(string text, in Location loc)
	{
		if (contents.length && contents[$-1].kind == NodeContent.Kind.text && contents[$-1].loc == loc)
			contents[$-1].value ~= text;
		else contents ~= NodeContent.text(text, loc);
	}

	/** Removes all content if it conists of only white space. */
	void stripIfOnlyWhitespace()
	{
		if (!this.hasNonWhitespaceContent)
			contents.clear();
	}

	/** Determines if this node has any non-whitespace contents. */
	bool hasNonWhitespaceContent()
	const {
		foreach (c; contents[]) {
			if (c.kind != NodeContent.Kind.text || c.value[].ctstrip.length > 0)
				return true;
		}
		return false;
	}

	/** Strips any leading whitespace from the contents. */
	void stripLeadingWhitespace() 
	{
		while (contents.length >= 1 && contents[0].kind == NodeContent.Kind.text) {
			contents[0].value[] = ctstripLeft(contents[0].value[]);
			if (contents[0].value.length == 0)
				contents.removeFront();
			else break;
		}
	}

	/** Strips any trailign whitespace from the contents. */
	void stripTrailingWhitespace() 
	{
		while (contents.length >= 1 && contents[$-1].kind == NodeContent.Kind.text) {
			contents[$-1].value[] = ctstripRight(contents[$-1].value[]);
			if (contents[$-1].value.length == 0)
				contents.removeBack();
			else break;
		}
	}

	/// Tests if the node consists of only a single, static string.
	bool isTextNode() const { return contents.length == 1 && contents[0].kind == NodeContent.Kind.text; }

	/// Tests if the node consists only of text and interpolations, but doesn't contain child nodes.
	bool isProceduralTextNode() const { 
		foreach(ref c; contents[]) {
			if (c.kind == NodeContent.Kind.node)
				return false;
		}
		return true;
	}

	bool hasAttribute(string name)
	const {

		foreach (ref a; this.attributes[])
			if (a.name[] == name[])
				return true;
		return false;
	}

	/** Returns a given named attribute.

		If the attribute doesn't exist, an empty value will be returned.
	*/
	inout(Attribute) getAttribute(string name)
	inout @trusted {
		foreach (ref a; this.attributes[])
			if (a.name[] == name[])
				return cast(inout)a;
		auto ret = Attribute.init;
		ret.loc.file[] = loc.file[];
		ret.loc.line = loc.line;
		ret.name[] = name[];
		return cast(inout)ret;
	}

	void setAttribute(Attribute att)
	{
		foreach (ref da; attributes[])
			if (da.name[] == att.name[]) {
				da = att;
				return;
			}
		attributes ~= att;
	}

	/// Outputs a simple string representation of the node.
	string toString() const {
		return format!"Node(%s, %s)"(loc.file[], name[]);
	}

	bool opEquals(scope const Node other) scope const { return this.tupleof == other.tupleof; }
}


/** Flags that control parser or generator behavior.
*/
enum NodeAttribs {
	none = 0,
	translated = 1<<0,  /// Translate node contents
	textNode = 1<<1,    /// All nested lines are treated as text
	rawTextNode = 1<<2, /// All nested lines are treated as raw text (no interpolations or inline tags)
	fitOutside = 1<<3,  /// Don't insert white space outside of the node when generating output (currently ignored by the HTML generator)
	fitInside = 1<<4,   /// Don't insert white space around the node contents when generating output (currently ignored by the HTML generator)
}


/** A single node attribute.

	Attributes are key-value pairs, where the value can either be empty
	(considered as a Boolean value of `true`), a string with optional
	string interpolations, or a D expression (stored as a single
	`interpolation` `AttributeContent`).
*/
struct Attribute {
	@safe nothrow:

	/// Location in source file
	Location loc;
	/// Name of the attribute
	Array!char name;
	/// Value of the attribute
	Array!AttributeContent contents;

	void copyFrom(Attribute a) {
		loc.file[] = a.loc.file[];
		loc.line = a.loc.line;
		name[] = a.name[];
		contents.clear();
		foreach(i, ref content; a.contents[]) {
			AttributeContent c;
			c.kind = content.kind;
			c.value[] = content.value[];
		}
	}

	/// Creates a new attribute with a static text value.
	static Attribute text(string name, string value, in Location loc) { return Attribute(loc, name, AttributeContent.text(value)); }
	/// Creates a new attribute with an expression based value.
	static Attribute expr(string name, string value, in Location loc) { return Attribute(loc, name, AttributeContent.interpolation(value)); }

	this(in Location loc, string name, AttributeContent[] contents)
	{
		this.name = name;
		this.contents = contents;
		this.loc.file[] = loc.file[];
		this.loc.line = loc.line;
	}

	this(in Location loc, string name, AttributeContent content)
	{
		this.name = name;
		this.contents ~= content;
		this.loc.file[] = loc.file[];
		this.loc.line = loc.line;
	}

	/// Creates a copy of the attribute.
	@property Attribute dup() const {
		auto ret = Attribute.init;
		ret.loc.file[] = loc.file[];
		ret.loc.line = loc.line;
		ret.name[] = name[];
		foreach (ref c; contents[]) {
			auto content = AttributeContent.init;
			content.value[] = c.value[];
			content.kind = c.kind;
			ret.contents ~= content;
		}
		return ret;
	}

	/** Appends raw text to the attribute.

		If the attribute already has contents and the last piece of content is
		also text, then the text will be appended to the value of that
		`AttributeContent`. Otherwise, a new `AttributeContent` will be
		appended to `contents`.
	*/
	void addText(string str)
	{
		if (contents.length && contents[$-1].kind == AttributeContent.Kind.text)
			contents[$-1].value ~= str;
		else
			contents ~= AttributeContent.text(str);
	}

	/** Appends a list of contents.

		If the list of contents starts with a text `AttributeContent`, then this
		first part will be appended using the same rules as for `addText`. The
		remaining parts will be appended normally.
	*/
	void addContents(const(AttributeContent)[] contents) @trusted
	{
		if (contents.length > 0 && contents[0].kind == AttributeContent.Kind.text) {
			addText(contents[0].value[]);
			contents = contents[1 .. $];
		}
		foreach(ref c; contents[]) {
			auto content = AttributeContent.init;
			content.value[] = c.value[];
			content.kind = c.kind;
			this.contents ~= content;
		}
		
	}
}


/** A single piece of an attribute value.
*/
struct AttributeContent {
	@safe nothrow:

	///
	enum Kind {
		text,             /// Raw text (will be escaped by the generator as necessary)
		interpolation,    /// A D expression that will be converted to text at runtime (escaped as necessary)
		rawInterpolation  /// A D expression that will be converted to text at runtime (not escaped)
	}

	/// Kind of this attribute content
	Kind kind;
	/// The value - either text or a D expression
	Array!char value;

	/// Creates a new text attribute content value.
	static AttributeContent text(string text) { return AttributeContent(Kind.text, Array!char(text)); }
	/// Creates a new string interpolation attribute content value.
	static AttributeContent interpolation(string expression) { return AttributeContent(Kind.interpolation, Array!char(expression)); }
	/// Creates a new raw string interpolation attribute content value.
	static AttributeContent rawInterpolation(string expression) { return AttributeContent(Kind.rawInterpolation, Array!char(expression)); }
}


/** A single piece of node content.
*/
struct NodeContent {
	@safe nothrow:

	///
	enum Kind {
		node,            /// A child node
		text,            /// Raw text (not escaped in the output)
		interpolation,   /// A D expression that will be converted to text at runtime (escaped as necessary)
		rawInterpolation /// A D expression that will be converted to text at runtime (not escaped)
	}

	/// Kind of this node content
	Kind kind;
	/// Location of the content in the source file
	Location loc;
	/// The node - only used for `Kind.node`
	Node node;
	/// The string value - either text or a D expression
	Array!char value;

	/// Creates a new child node content value.
	static NodeContent* tag(Node node) { return alloc!NodeContent(Kind.node, Location(Array!char(node.loc.file[]), node.loc.line), node); }
	/// Creates a new text node content value.
	static NodeContent* text(string text, in Location loc) { return alloc!NodeContent(Kind.text, Location(Array!char(loc.file[]), loc.line), Node.init, Array!char(text)); }
	/// Creates a new string interpolation node content value.
	static NodeContent* interpolation(string text, in Location loc) { return alloc!NodeContent(Kind.interpolation, Location(Array!char(loc.file[]), loc.line), Node.init, Array!char(text)); }
	/// Creates a new raw string interpolation node content value.
	static NodeContent* rawInterpolation(string text, in Location loc) { return alloc!NodeContent(Kind.rawInterpolation, Location(Array!char(loc.file[]), loc.line), Node.init, Array!char(text)); }

	@property NodeContent* clone()
	const {
		NodeContent* ret = alloc!NodeContent();
		ret.kind = this.kind;
		ret.loc.line = this.loc.line;
		ret.loc.file[] = this.loc.file[];
		ret.value[] = this.value[];
		if (this.node.name[].length > 0) ret.node = this.node.clone;
		return ret;
	}

	/// Compares node content for equality.
	bool opEquals(const scope NodeContent* other)
	const scope {
		if (this.kind != other.kind) return false;
		if (this.loc != other.loc) return false;
		if (this.value != other.value) return false;
		if (this.node is other.node) return true;
		if (this.node.name[].length == 0 || other.node.name[].length == 0) return false;
		return this.node.opEquals(other.node);
	}
}


/// Represents the location of an entity within the source file.
struct Location {
	/// Name of the source file
	Array!char file;
	/// Zero based line index within the file
	int line;
}
