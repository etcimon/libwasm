module spasm.rt.gc;

import std.traits : isPointer, isBasicType, isCallable, PointerTarget;
import std.meta : staticMap, Filter;
import spasm.types : assumeUsed;
import spasm.rt.allocator : poolAllocatorIndex, MarkResult;

nothrow:

auto mark(T)(T arr) if (is(T : A[], A)) {
  return mark(arr.ptr);
}

auto mark(T)(T* ptr) {
  return poolAllocatorIndex.mark(cast(void*)ptr);
}

alias MarkFunction = void function(void*);

struct Node {
  nothrow:
  MarkFunction markFn;
  void* root;
  void markIt() {
    mark(root);
    markFn(root);
  }
}

__gshared Node singleNode = void;

extern(C) export @assumeUsed void markMemory() {
  singleNode.markIt();
}

extern(C) export @assumeUsed void freeUnmarked() {
}

void markMemory(T)(T* root) {
}

void addRoot(T)(T* root) {
  addNode(Node(cast(MarkFunction)&markMemory!(T), cast(void*)root));
}

void addNode(Node node) {
  // TODO: for now we simply have only one root
  singleNode = node;
}

import spasm.rt.allocator : PoolAllocatorList, WasmAllocator;
import stdx.allocator.building_blocks.segregator : Segregator;

alias SpasmGCAllocator = WasmAllocator;

version (SPASM_GC_DEBUG)
extern(C) export @assumeUsed void renderGCStats() {
  import spasm.rt.allocator;
  import spasm.dom : document, addCss;
  import spasm.types : as, invalidHandle;
  import spasm.bindings.html : HTMLElement;
  import spasm.rt.array : text;
  import std.algorithm : each, sum, map;
  import mir.bitop : ctpop;
  import stdx.allocator.building_blocks.region : InSituRegion;
  import optional;
  auto stackAllocator = InSituRegion!(2048)();
  static __gshared HTMLElement gcRootDomNode = HTMLElement(invalidHandle);
  if (gcRootDomNode.handle == invalidHandle) {
    gcRootDomNode = document.createElement("div").as!HTMLElement;
    gcRootDomNode.classList.add("spasm_gc_debug");
    document.body_.front.appendChild(gcRootDomNode);
    addCss(".spasm_gc_debug{position:absolute;width:50%;left:25%}.spasm_gc_debug .spasm_gc_debug_garbage{background:#03A9F4;height:20px;display:inline-block}.spasm_gc_debug .spasm_gc_debug_marked{background:yellow;height:20px;display:inline-block}.spasm_gc_debug_container{display:flex;border:1px solid #e2e2e2;background:white;margin:2px 0px;}.spasm_gc_debug_legend{position:absolute;left:5px;text-shadow:1px 1px 1px white;}");
  }
  gcRootDomNode.innerHTML = "";
  foreach(stats; poolAllocatorIndex.getStats()) {
    auto blocksUsed = stats.control.map!(ctpop!ulong).sum();
    auto blocksMarked = stats.markers.map!(ctpop!ulong).sum();
    ulong cumUsedPer = (blocksMarked*100) / stats.blockCount;
    ulong cumGarbagePer = ((blocksUsed-blocksMarked)*100) / stats.blockCount;
    string line = stackAllocator.text("<div class='spasm_gc_debug_legend'>", stats.blockSize ,": ", blocksUsed, " / ", stats.blockCount, "</div><div style='width:", cumUsedPer, "%' class='spasm_gc_debug_marked'></div>", "<div style='width:", cumGarbagePer, "%' class='spasm_gc_debug_garbage'></div>");
    auto lineNode = document.createElement("div").as!HTMLElement;
    lineNode.classList.add("spasm_gc_debug_container");
    lineNode.innerHTML = line;
    gcRootDomNode.appendChild(lineNode);
    stackAllocator.deallocateAll();
  }
}
