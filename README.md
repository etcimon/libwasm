# libwasm

<img src="https://github.com/skoppe/libwasm/workflows/build/badge.svg"/>&nbsp;<img src="https://img.shields.io/badge/ldc%201.17%20--%201.20%20-supported-brightgreen"/>

libwasm is a library to develop single page applications in D that compile to webassembly.

It contains bindings to the most commonly used web apis, including the dom, fetch, audio, and webgl.

As well as a small but powerful SPA framework, which includes CSS. Yes. CSS-in-wasm.

<details><summary>Table Of Contents</summary>

- [libwasm](#libwasm)
  - [Web Bindings](#Web-Bindings)
  - [SPA framework](#SPA-framework)
  - [Examples](#Examples)
  - [How to start](#How-to-start)
  - [Using the web bindings](#Using-the-web-bindings)
  - [How to compile your application](#How-to-compile-your-application)
  - [Migrating from an older version](#migrating-from-an-older-version)
  - [Writing your own js bindings](#Writing-your-own-js-bindings)
  - [Optimizing for size](#Optimizing-for-size)
  - [Limitations](#Limitations)
  - [Hot module reloading](#Hot-module-reloading)
    - [Enabling hmr for new projects](#Enabling-hmr-for-new-projects)
    - [Enabling hmr for existing projects](#Enabling-hmr-for-existing-projects)
    - [How it works](#How-it-works)
  - [How the SPA framework works](#How-the-SPA-framework-works)

</details>

## Web Bindings

D bindings are generated from webidl files. The bindings try to mimick as much as possible the javascript api's you are already familiar with.

Until Webassembly gets host bindings it is still necessary to generate JS glue code. A small bindgen utility is included to generate exactly the glue code you need.

## SPA framework

It uses D's compile time feature to generate optimized rendering code specific for your application.

Not only are your applications fast, they are also small. The [todo-mvc example](https://skoppe.github.io/libwasm/examples/todo-mvc/) project is only 5797 (wasm) + 2199 (html+js) bytes when gzipped.

## Examples

- [fetch](https://github.com/skoppe/libwasm/tree/master/examples/fetch). Shows how to use the fetch api and access returned json. [Demo](https://skoppe.github.io/libwasm/examples/fetch/index.html).
- [dom](https://github.com/skoppe/libwasm/tree/master/examples/dom). Shows how to manipulate the DOM. [Demo](https://skoppe.github.io/libwasm/examples/dom/index.html).
- [canvas](https://github.com/skoppe/libwasm/tree/master/examples/canvas). Shows how to draw text on the Canvas. [Demo](https://skoppe.github.io/libwasm/examples/canvas/index.html).
- todo-mvc. Uses the SPA framework to implement the famous [todo mvc application](http://todomvc.com).
- underun. A D port of a js13k competition game written by Dominic Szablewski. You can play the D version [here](https://skoppe.github.io/libwasm/examples/underrun/).

## How to start

Make sure to have at least ldc 1.17.0 installed.

- run `dub init <my-project> libwasm`, this will create a folder named `<my-project>` with a dub file and the latest libwasm added as dependency
- add `dflags "-betterC"` to your dub.sdl or add `"dflags": ["-betterC"]` to your dub.json
- run `dub upgrade && dub run libwasm:bootstrap-webpack` to generate the webpack/dev-server boilerplate
- start writing!

You can add any extra css/js you'll need to the `index.template.html`, or you can use any of the myriad features of webpack to include what you need.

## Using the web bindings

The `libwasm.bindings` module defines most web apis. You probably need to import `libwasm.dom` and `libwasm.types` too as well.

Make sure to run `dub run libwasm:webidl -- --bindgen` after compiling to ensure all required js glue code is generated.

## How to compile your application

Make sure to have at least ldc 1.17.0 installed. Also, make sure that `ldc2 --version` returns the `wasm32` among its target types. If not, you may need to install ldc from official sources or run one in docker (e.g. `dlang2/ldc-ubuntu:1.20.0`).

Run `dub build --compiler=ldc2 --build=release` to compile your application, then run `npx webpack` to generate the `index.html`.

You can also `npm run start` to start a webpack development server that serves your application on localhost:3000.

- Note: I could not get it to build on my aged mac (el capitan). Instead I use the `dlang2/ldc-ubuntu:1.20.0` docker image to run ldc.

- Note: if you have some issues please read the [BUILDING.md](BUILDING.md) file before opening an issue.

## Migrating from an older version

This project is still in it's beta phase (0.x.x):

- any minor upgrade WILL contain breaking changes. There will be at least one beta release (0.x.0-beta.1)
- any patch upgrade SHOULD NOT contain breaking changes.

Please read the [CHANGELOG.md](CHANGELOG.md) for breaking changes, as well as [BUILDING.md](BUILDING.md) for supported compilers and open issues.

## Writing your own js bindings

In case you want to write a custom js function, the first step is writing a function definition in D.

```d
extern(C) export int myFunc(uint index);
```

After that you write a libwasm module in javascript. Simply put a file in the `./libwasm/modules/` folder and export a jsExports object.

```js
export let jsExports = {
  myFunc: index => {
    return 42;
  }
};
```

Manually put the file in the `./libwasm/modules/index.js` or just run `dub run libwasm:webidl -- --bindgen` to automatically include it.

The `./libwasm/entry.js` and the `./libwasm/modules/libwasm.js` file will combine all exports and use them during the WebAssembly initialization.

Working with strings (arrays) and aggregates requires a bit more work. You can study the generated `bindings.js` file in the examples to see how it works.

## Optimizing for size

Since ldc 1.13.0 there is the `-fvisibility=hidden` flag that hides all functions that aren't explicitly prefixed with the `export` keyword. This flag reduces binary size considerably and has reduced the need for manual stripping almost completely.

By default symbol names aren't stripped, which means the full mangled name is in the binary, this is convenient for debugging but adds to the binary's size. Add `-strip-all` to the lflags in your `dub.(sdl|json)` to strip all internal function names.

For yet unknown reasons a pointer to each struct's init section gets exported as a global. These globals are completely unused and add some additional bloat. The binaryen project has several tools to (dis)assemble a wasm to text representation and back, which allows manual removing of those exported symbols. (note: this section needs an update, as this no longer applies)

Also, llvm doesn't skip consecutive zeros in the data segment. Running wasm-opt (from binaryen project) removes them and reduces code size further.

Using the [Binaryen](https://github.com/WebAssembly/binaryen) toolkit we can optimize even further than LLVM's WebAssembly backend does.

```bash
# Optimize for size.
wasm-opt -Os -o main-optimized.wasm main.wasm
# Optimize aggressively for size.
wasm-opt -Oz -o main-optimized.wasm main.wasm
# Optimize for speed.
wasm-opt -O -o main-optimized.wasm main.wasm
# Optimize aggressively for speed.
wasm-opt -O3 -o main-optimized.wasm main.wasm
```

## Limitations

This project uses betterC, which means there is no D runtime. This also means that most phobos functions don't work, as well any D features that rely on the D runtime. If you get any weird errors, this is probably the reason why.

## Hot module reloading

The spa framework in libwasm has basic support for hot module reloading. Style changes are reloaded correctly as well as basic attributes (`@prop`, `@attr`, `@visible`, etc.) Anything more complex (like lists/arrays) will just revert to their init state.

### Enabling hmr for new projects

Make sure you use libwasm `v0.2.0-beta.6` and add the following to your `dub.sdl`:

```
configuration "hmr" {
  targetType "executable"
  versions "hmr"
  lflags "--export=dumpApp" "--export=loadApp"
}
```

Or to your `dub.json`:

```
"configurations": [{
  "name": "hmr",
  "targetType": "executable",
  "versions": ["hmr"]
}]
```

And compile with `dub build --build=release --config=hmr`

### Enabling hmr for existing projects

Update to `>=0.2.x` and add the same configuration mentioned above but also rerun `dub run libwasm:bootstrap-webpack` in your projects root folder. This will update your dev-server.js and your spa.js and libwasm.js modules.

### How it works

The server running with `npm run start` starts up a websocket on port 3001 and notifies connected clients whenever the webassembly binary changes.

The js glue code connects to the websocket (dev-only) and does the following for each notification:

- calls `dumpApp` which will serializes the aggregate in the `mixin Spa!(App, Theme)` to string
- removes all created dom elements and styles
- reload the wasm binary (which renders a fresh application)
- calls `loadApp` which will deserializes the string and triggers dom updates

## How the SPA framework works

Each html element is mapped to a D struct. Each attribute, property, eventlistener and any children nodes are (annotated) members of that struct.

Here is an example of rendering a div node.

```d
struct App {
  mixin Node!"div";
}
mixin Spa!App;
```

The mixin ensures the app is rendered and integrates with the js runtime code.

The following example shows how to set properties on the rendered node.

```d
struct App {
  mixin Node!"div";
  @prop innerText = "Hello World!";
}
mixin Spa!App;
```

Properties can also be a result of a function.

```d
struct App {
  mixin Node!"div";
  @prop string innerText() {
    return "Hello World!";
  };
}
mixin Spa!App;
```

Here we add a button child component.

```d
struct Button {
  mixin Node!"button";
  @prop innerText = "Click me!";
}
struct App {
  mixin Node!"div";
  @child Button button;
}
mixin Spa!App;
```

Now we add a event listener to the button.

```d
struct Button {
  mixin Node!"button";
  mixin Slot!"click";
  @prop innerText = "Click me!";
  @callback void onClick(MouseEvent event) {
    this.emit(click);
  }
}
struct App {
  mixin Node!"div";
  @child Button button;
}
mixin Spa!App;
```

The `onClick` function is called whenever an onclick event is generated on the dom node.

In order to propagate events between structs - often you have a parent component that has logic - a `Slot!click` is mixed into the struct. The separation between the slot and the callback function is on purpose. It provides isolation from dom events and it simplifies event listeners on arrays (doesn't require keying).

Here we connect the slot from the App.

```d
struct Button {
  mixin Node!"button";
  mixin Slot!"click";
  @prop innerText = "Click me!";
  @callback void onClick(MouseEvent event) {
    this.emit(click);
  }
}
struct App {
  mixin Node!"div";
  @child Button button;
  @connect!"button.click" void click() {
  }
}
mixin Spa!App;
```

The `@connect` annotation ensures the `click` function is called whenever there is an `this.emit(click)` call in Button.

In the next example we show how to propagate properties from one component down into another.

```d
struct Button {
  mixin Node!"button";
  mixin Slot!"click"
  @prop string* innerText;
  @callback void onClick(MouseEvent event) {
    this.emit(click);
  }
}
struct App {
  mixin Node!"div";
  @child Button button;
  string innerText = "Click Me!";
  @connect!"button.click" void click() {
    this.update.innerText = "Clicked!";
  }
}
mixin Spa!App;
```

The result is when the button is clicked the text is changed into "Clicked!".

We have inserted a `string innerText` field into App, and made the one in Button a pointer. When a struct is rendered for the first time, libwasm will assign any pointers to the equivalent member of their parent. This approach is chosen due to its low performance impact (just a extra pointer to store) and simplicity (no need to pass prop structs between components).

The second piece is the `update` template function, this function uses static introspection to determine exactly what to update. This is almost always inlined in the resulting wasm code. Here we deviate the most from traditional virtual-dom approaches. Instead of completely rendering the App component and diffing the result, the `update` template function knows exactly what to update.

Here we show how lists are implemented.

```d
struct Item {
  mixin Node!"li";
  @prop string innerText;
}
struct Button {
  mixin Node!"button";
  mixin Slot!"click";
  @prop string innerText = "Add";
  @callback void onClick(MouseEvent event) {
    this.emit(click);
  }
}
struct App {
  mixin Node!"div";
  @child Button button;
  @child UnorderedList!Item items;
  @connect!"button.click" void click() {
    Item* item = allocator.make!Item;
    item.innerText = "Item";
    items.put(item);
  }
}
mixin Spa!App;
```

We added an `UnorderedList!Item` child. This is a standard component and renders an `<ul>` node with children.

Here we show how to do event listeners on arrays.

```d
struct Item {
  mixin Node!"li";
  mixin Slot!"click";
  @prop string innerText;
  @callback void onClick(MouseEvent event) {
    this.emit(click);
  }
}
struct Button {
  mixin Node!"button";
  mixin Slot!"click";
  @prop string innerText = "Add";
  @callback void onClick(MouseEvent event) {
    this.emit(click);
  }
}
struct App {
  mixin Node!"div";
  @child Button button;
  @child UnorderedList!Item list;
  @connect!"button.click" void click() {
    Item* item = allocator.make!Item;
    item.innerText = "Item";
    list.put(item);
  }
  @connect!("list.items","click") void itemClick(size_t idx) {
  }
}
mixin Spa!App;
```

In the `@connect` annotation we split the part to the underlying DynamicArray in `UnorderedList` and the path to the slot from the Item component. Plus there is an extra argument signifying the index of the item in the array.

This is works with a simple pointer range search in the array. It introduces no memory overhead or keying.

In this example we show how we can use standard range algorithms to transform arrays.

```d
struct Item {
  mixin Node!"li";
  mixin Slot!"click";
  @prop string innerText;
  @style!"active" bool active = false;
  @callback void onClick(MouseEvent event) {
    this.emit(click);
  }
  void toggle() {
    this.update.active = !active;
  }
}
struct Button {
  mixin Node!"button";
  mixin Slot!"click";
  @prop string innerText = "Add";
  @callback void onClick(MouseEvent event) {
    this.emit(click);
  }
}
struct App {
  mixin Node!"div";
  @child Button addButton;
  @child Button toggleButton = {innerText: "Only Active"};
  @child UnorderedList!Item list;
  bool onlyActive;
  DynamicArray!(Item*) items;
  @connect!"toggleButton.click" void toggleClick() {
    this.update.onlyActive = !onlyActive;
  }
  @connect!"addButton.click" void addClick() {
    Item* item = allocator.make!Item;
    item.innerText = "Item";
    items.put(item);
    this.update!(items);
  }
  @connect!("list.items","click") void itemClick(size_t idx) {
    list.items[idx].toggle();
    this.update!(items);
  }
  auto transform(ref DynamicArray!(Item*) items, bool onlyActive) {
    import std.algorithm : filter;
    items[].filter!(i=>(i.active || !onlyActive)).update(list);
  }
}
mixin Spa!App;
```

Before showing the standard range usage we had to make some adjustments and additions to the example.

In the Item Component we added an `active` bool, and we annotated this with `@style!"active"`. Whenever active is true the active style is added, and vice versa. We added a `toggle` function that toggles the `active` bool.

We reused the Button component in the App for a Toggle, using D's struct initializer to overwrite the innerText property.

We added the `onlyActive` bool and this is updated by clicking on the toggleButton.

We also added an `DynamicArray!(Item*) items` field. This will contain our complete list and the UnorderedList's appender will only contain the items we want.

The `itemClick` function is updated to call the items toggle function and updates the items.

Now we can discuss the `transform` function. This function does the filtering of Item's based on the value of `onlyActive` compared to the Item's `active` bool.

Anytime there is a call to the templated `update` function (e.g. in `toggleClick` and in `addClick`), besides updating what is necessary it will also call any member function which has a parameter which correspronds with the value that is being updated.

Since the transform function has the `items` and `onlyActive` as parameters, the update function will call it whenever `items` or `onlyActive` is changed.

In the `transform` function we have our normal D range programming with an `update(list)` at the end. This will make sure our `UnorderedList!Item` field will get the items from the range. Essentially the `UnorderedList!Item` acts as an Sink or OutputRange where each element of the InputRange will be placed into, it also does any necessary diffing with the dom.

There is a little caveat here. Since the transform function works by filtering on the active field of the Item, whenever the active field of an Item changes we need to call `update` on `items` again to ensure the list is updated. Therefore we needed to hoist the toggling from the Item Component into the App Component. The update function only works downwards and it cannot update parent properties.

The next example shows how we can do inline css styles.

```d
struct AppStyle {
  struct root {
    auto margin = "10px";
  }
  struct button {
    auto backgroundColor = "white";
    @("hover") struct hover {
      auto backgroundColor = "gray";
    }
  }
  struct toggle {
    auto backgroundColor = "purple";
  }
}
@styleset!(AppStyle)
struct App {
  @style!"root" mixin Node!"div";
  @child Button button;
  @connect("button.click") void toggle() {
    button.update.toggle = !button.toggle;
  }
}
@styleset!(AppStyle)
struct Button {
  mixin Event!"click";
  @style!"button" mixin Node!"button";
  @style!"toggle" bool toggle;
  @callback void onClick(MouseEvent event) {
    this.click.emit;
  }
}
mixin Spa!App;
```

Here you see the AppStyle struct, which contains some nested structs which themselves contains properties known from css. The idea is that Component can apply any of these nested structs.

Both the App and the Button struct have a `@styleset!(AppStyle)` annotation.

The App Component has a `@style!"root"` applied to its Node mixin. This means it will get a css class set with all the css properties defined in `AppStyle.root`.

The Button Component has the `AppStyle.button` on its Node mixin, and the `AppStyle.toggle` applies to the `toggle` bool. Whenever toggle is true, the toggle class is applied and vica versa.

The css is created at compile time and injected on startup into the html page. The class names are converted to hashes based on css name + css properties. This allows use to deduplicate classes with same css content.
