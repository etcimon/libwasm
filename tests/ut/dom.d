module ut.dom;

version (unittest)  : import unit_threaded;
import libwasm.dom;
import libwasm.spa;
import libwasm.types;

@safe:

struct Div
{
  mixin NodeDef!"div";
}

unittest
{
  renderToString!Div.should == "<div></div>";
}

unittest
{
  struct Styled
  {
    @style!"class"mixin NodeDef!"div";
  }

  renderToString!Styled.should == `<div class="class"></div>`;
}

unittest
{
  struct App
  {
    mixin NodeDef!"section";
    @child Div div;
  }

  renderToString!App.should == "<section><div></div></section>";
}

unittest
{
  struct Toggle
  {
    mixin NodeDef!"li";
    @style!"active"bool active;
  }

  Toggle toggle;
  auto node = toggle.renderToNode;
  node.renderToString().should == "<li></li>";
  toggle.update.active = true;
  node.renderToString().should == `<li class="active"></li>`;
}

unittest
{
  struct ChildStyle
  {
    mixin NodeDef!"li";
    @style!"inner"@child Div div;
  }

  renderToString!ChildStyle.should == `<li><div class="inner"></div></li>`;
}

unittest
{
  struct ChildVisibility
  {
    mixin NodeDef!"li";
    @child Div div;
    @visible!"div"bool show;
  }

  ChildVisibility app;
  auto node = app.renderToNode;
  node.renderToString().should == `<li></li>`;
  app.update.show = true;
  node.renderToString().should == `<li><div></div></li>`;
}

unittest
{
  struct Inner
  {
    mixin NodeDef!"span";
    @attr int* key;
  }

  struct App
  {
    mixin NodeDef!"div";
    int key = 0;
    @child Inner inner;
  }

  App app;
  auto node = app.renderToNode;
  node.renderToString().should == `<div><span key=0></span></div>`;
  app.update.key = 5;
  node.renderToString().should == `<div><span key=5></span></div>`;
}

unittest
{
  static struct Appy
  {
  nothrow:
    mixin NodeDef!"section";
    bool hidden;
    @style!"active"bool isActive(bool hidden)
    {
      return !hidden;
    }
  }

  Appy app;
  auto node = app.renderToNode;
  node.renderToString().should == `<section class="active"></section>`;
  app.update.hidden = true;
  node.renderToString().should == `<section></section>`;
}

unittest
{
  static struct Inner
  {
    mixin NodeDef!"div";
    @attr int* count;
  }

  static struct App
  {
    mixin NodeDef!"section";
    int number = 6;
    @(param.count!(number))
    @child Inner inner;
  }

  App app;
  auto node = app.renderToNode;
  node.renderToString().should == `<section><div count=6></div></section>`;
  app.update.number = 5;
  node.renderToString().should == `<section><div count=5></div></section>`;
}

unittest
{
  alias ChildNode = NamedNodeDef!"root"*;
  static struct Parent
  {
    mixin NodeDef!"section";
    @child ChildNode left;
    @child ChildNode right;
  }

  static struct Div
  {
    mixin NodeDef!"div";
    @prop string innerHTML;
  }

  static struct App
  {
    @(param.left!left
        .right!right)
    @child Parent parent;
    Div left = {innerHTML: "l"};
    @(param.innerHTML!"r")
    Div right;
  }

  App app;
  auto node = app.renderToNode;
  node.renderToString()
    .should == `<section><div innerHTML="l"></div><div innerHTML="r"></div></section>`;
}

unittest
{
  alias ChildNode = NamedNodeDef!"root"*;
  static struct Parent
  {
    mixin NodeDef!"section";
    @child ChildNode left;
  }

  static struct Left
  {
    mixin NodeDef!"div";
    @child ChildNode top;
  }

  static struct Top
  {
    mixin NodeDef!"header";
    @prop string innerHTML = "top";
  }

  static struct App
  {
    @(param.left!left)
    @child Parent parent;
    @(param.top!top)
    Left left;
    Top top;
  }

  App app;
  auto node = app.renderToNode;
  node.renderToString().should == `<section><div><header innerHTML="top"></header></div></section>`;
}
