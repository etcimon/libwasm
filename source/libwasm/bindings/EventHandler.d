module libwasm.bindings.EventHandler;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct DocumentAndElementEventHandlers {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void oncopy(T0)(scope auto ref Optional!(T0) oncopy) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "oncopy", !oncopy.empty, oncopy.front);
  }
  EventHandler oncopy()() {
    return Object_Getter__EventHandler(this.handle, "oncopy");
  }
  void oncut(T0)(scope auto ref Optional!(T0) oncut) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "oncut", !oncut.empty, oncut.front);
  }
  EventHandler oncut()() {
    return Object_Getter__EventHandler(this.handle, "oncut");
  }
  void onpaste(T0)(scope auto ref Optional!(T0) onpaste) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpaste", !onpaste.empty, onpaste.front);
  }
  EventHandler onpaste()() {
    return Object_Getter__EventHandler(this.handle, "onpaste");
  }
}
alias EventHandler = Optional!(EventHandlerNonNull);
alias EventHandlerNonNull = Any delegate(Event);
struct GlobalEventHandlers {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this.handle, "onabort");
  }
  void onblur(T0)(scope auto ref Optional!(T0) onblur) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onblur", !onblur.empty, onblur.front);
  }
  EventHandler onblur()() {
    return Object_Getter__EventHandler(this.handle, "onblur");
  }
  void onfocus(T0)(scope auto ref Optional!(T0) onfocus) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onfocus", !onfocus.empty, onfocus.front);
  }
  EventHandler onfocus()() {
    return Object_Getter__EventHandler(this.handle, "onfocus");
  }
  void onauxclick(T0)(scope auto ref Optional!(T0) onauxclick) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onauxclick", !onauxclick.empty, onauxclick.front);
  }
  EventHandler onauxclick()() {
    return Object_Getter__EventHandler(this.handle, "onauxclick");
  }
  void oncanplay(T0)(scope auto ref Optional!(T0) oncanplay) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "oncanplay", !oncanplay.empty, oncanplay.front);
  }
  EventHandler oncanplay()() {
    return Object_Getter__EventHandler(this.handle, "oncanplay");
  }
  void oncanplaythrough(T0)(scope auto ref Optional!(T0) oncanplaythrough) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "oncanplaythrough", !oncanplaythrough.empty, oncanplaythrough.front);
  }
  EventHandler oncanplaythrough()() {
    return Object_Getter__EventHandler(this.handle, "oncanplaythrough");
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this.handle, "onchange");
  }
  void onclick(T0)(scope auto ref Optional!(T0) onclick) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onclick", !onclick.empty, onclick.front);
  }
  EventHandler onclick()() {
    return Object_Getter__EventHandler(this.handle, "onclick");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this.handle, "onclose");
  }
  void oncontextmenu(T0)(scope auto ref Optional!(T0) oncontextmenu) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "oncontextmenu", !oncontextmenu.empty, oncontextmenu.front);
  }
  EventHandler oncontextmenu()() {
    return Object_Getter__EventHandler(this.handle, "oncontextmenu");
  }
  void ondblclick(T0)(scope auto ref Optional!(T0) ondblclick) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondblclick", !ondblclick.empty, ondblclick.front);
  }
  EventHandler ondblclick()() {
    return Object_Getter__EventHandler(this.handle, "ondblclick");
  }
  void ondrag(T0)(scope auto ref Optional!(T0) ondrag) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondrag", !ondrag.empty, ondrag.front);
  }
  EventHandler ondrag()() {
    return Object_Getter__EventHandler(this.handle, "ondrag");
  }
  void ondragend(T0)(scope auto ref Optional!(T0) ondragend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondragend", !ondragend.empty, ondragend.front);
  }
  EventHandler ondragend()() {
    return Object_Getter__EventHandler(this.handle, "ondragend");
  }
  void ondragenter(T0)(scope auto ref Optional!(T0) ondragenter) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondragenter", !ondragenter.empty, ondragenter.front);
  }
  EventHandler ondragenter()() {
    return Object_Getter__EventHandler(this.handle, "ondragenter");
  }
  void ondragexit(T0)(scope auto ref Optional!(T0) ondragexit) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondragexit", !ondragexit.empty, ondragexit.front);
  }
  EventHandler ondragexit()() {
    return Object_Getter__EventHandler(this.handle, "ondragexit");
  }
  void ondragleave(T0)(scope auto ref Optional!(T0) ondragleave) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondragleave", !ondragleave.empty, ondragleave.front);
  }
  EventHandler ondragleave()() {
    return Object_Getter__EventHandler(this.handle, "ondragleave");
  }
  void ondragover(T0)(scope auto ref Optional!(T0) ondragover) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondragover", !ondragover.empty, ondragover.front);
  }
  EventHandler ondragover()() {
    return Object_Getter__EventHandler(this.handle, "ondragover");
  }
  void ondragstart(T0)(scope auto ref Optional!(T0) ondragstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondragstart", !ondragstart.empty, ondragstart.front);
  }
  EventHandler ondragstart()() {
    return Object_Getter__EventHandler(this.handle, "ondragstart");
  }
  void ondrop(T0)(scope auto ref Optional!(T0) ondrop) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondrop", !ondrop.empty, ondrop.front);
  }
  EventHandler ondrop()() {
    return Object_Getter__EventHandler(this.handle, "ondrop");
  }
  void ondurationchange(T0)(scope auto ref Optional!(T0) ondurationchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ondurationchange", !ondurationchange.empty, ondurationchange.front);
  }
  EventHandler ondurationchange()() {
    return Object_Getter__EventHandler(this.handle, "ondurationchange");
  }
  void onemptied(T0)(scope auto ref Optional!(T0) onemptied) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onemptied", !onemptied.empty, onemptied.front);
  }
  EventHandler onemptied()() {
    return Object_Getter__EventHandler(this.handle, "onemptied");
  }
  void onended(T0)(scope auto ref Optional!(T0) onended) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onended", !onended.empty, onended.front);
  }
  EventHandler onended()() {
    return Object_Getter__EventHandler(this.handle, "onended");
  }
  void oninput(T0)(scope auto ref Optional!(T0) oninput) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "oninput", !oninput.empty, oninput.front);
  }
  EventHandler oninput()() {
    return Object_Getter__EventHandler(this.handle, "oninput");
  }
  void oninvalid(T0)(scope auto ref Optional!(T0) oninvalid) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "oninvalid", !oninvalid.empty, oninvalid.front);
  }
  EventHandler oninvalid()() {
    return Object_Getter__EventHandler(this.handle, "oninvalid");
  }
  void onkeydown(T0)(scope auto ref Optional!(T0) onkeydown) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onkeydown", !onkeydown.empty, onkeydown.front);
  }
  EventHandler onkeydown()() {
    return Object_Getter__EventHandler(this.handle, "onkeydown");
  }
  void onkeypress(T0)(scope auto ref Optional!(T0) onkeypress) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onkeypress", !onkeypress.empty, onkeypress.front);
  }
  EventHandler onkeypress()() {
    return Object_Getter__EventHandler(this.handle, "onkeypress");
  }
  void onkeyup(T0)(scope auto ref Optional!(T0) onkeyup) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onkeyup", !onkeyup.empty, onkeyup.front);
  }
  EventHandler onkeyup()() {
    return Object_Getter__EventHandler(this.handle, "onkeyup");
  }
  void onload(T0)(scope auto ref Optional!(T0) onload) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onload", !onload.empty, onload.front);
  }
  EventHandler onload()() {
    return Object_Getter__EventHandler(this.handle, "onload");
  }
  void onloadeddata(T0)(scope auto ref Optional!(T0) onloadeddata) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onloadeddata", !onloadeddata.empty, onloadeddata.front);
  }
  EventHandler onloadeddata()() {
    return Object_Getter__EventHandler(this.handle, "onloadeddata");
  }
  void onloadedmetadata(T0)(scope auto ref Optional!(T0) onloadedmetadata) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onloadedmetadata", !onloadedmetadata.empty, onloadedmetadata.front);
  }
  EventHandler onloadedmetadata()() {
    return Object_Getter__EventHandler(this.handle, "onloadedmetadata");
  }
  void onloadend(T0)(scope auto ref Optional!(T0) onloadend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onloadend", !onloadend.empty, onloadend.front);
  }
  EventHandler onloadend()() {
    return Object_Getter__EventHandler(this.handle, "onloadend");
  }
  void onloadstart(T0)(scope auto ref Optional!(T0) onloadstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onloadstart", !onloadstart.empty, onloadstart.front);
  }
  EventHandler onloadstart()() {
    return Object_Getter__EventHandler(this.handle, "onloadstart");
  }
  void onmousedown(T0)(scope auto ref Optional!(T0) onmousedown) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmousedown", !onmousedown.empty, onmousedown.front);
  }
  EventHandler onmousedown()() {
    return Object_Getter__EventHandler(this.handle, "onmousedown");
  }
  void onmouseenter(T0)(scope auto ref Optional!(T0) onmouseenter) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmouseenter", !onmouseenter.empty, onmouseenter.front);
  }
  EventHandler onmouseenter()() {
    return Object_Getter__EventHandler(this.handle, "onmouseenter");
  }
  void onmouseleave(T0)(scope auto ref Optional!(T0) onmouseleave) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmouseleave", !onmouseleave.empty, onmouseleave.front);
  }
  EventHandler onmouseleave()() {
    return Object_Getter__EventHandler(this.handle, "onmouseleave");
  }
  void onmousemove(T0)(scope auto ref Optional!(T0) onmousemove) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmousemove", !onmousemove.empty, onmousemove.front);
  }
  EventHandler onmousemove()() {
    return Object_Getter__EventHandler(this.handle, "onmousemove");
  }
  void onmouseout(T0)(scope auto ref Optional!(T0) onmouseout) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmouseout", !onmouseout.empty, onmouseout.front);
  }
  EventHandler onmouseout()() {
    return Object_Getter__EventHandler(this.handle, "onmouseout");
  }
  void onmouseover(T0)(scope auto ref Optional!(T0) onmouseover) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmouseover", !onmouseover.empty, onmouseover.front);
  }
  EventHandler onmouseover()() {
    return Object_Getter__EventHandler(this.handle, "onmouseover");
  }
  void onmouseup(T0)(scope auto ref Optional!(T0) onmouseup) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmouseup", !onmouseup.empty, onmouseup.front);
  }
  EventHandler onmouseup()() {
    return Object_Getter__EventHandler(this.handle, "onmouseup");
  }
  void onwheel(T0)(scope auto ref Optional!(T0) onwheel) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onwheel", !onwheel.empty, onwheel.front);
  }
  EventHandler onwheel()() {
    return Object_Getter__EventHandler(this.handle, "onwheel");
  }
  void onpause(T0)(scope auto ref Optional!(T0) onpause) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpause", !onpause.empty, onpause.front);
  }
  EventHandler onpause()() {
    return Object_Getter__EventHandler(this.handle, "onpause");
  }
  void onplay(T0)(scope auto ref Optional!(T0) onplay) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onplay", !onplay.empty, onplay.front);
  }
  EventHandler onplay()() {
    return Object_Getter__EventHandler(this.handle, "onplay");
  }
  void onplaying(T0)(scope auto ref Optional!(T0) onplaying) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onplaying", !onplaying.empty, onplaying.front);
  }
  EventHandler onplaying()() {
    return Object_Getter__EventHandler(this.handle, "onplaying");
  }
  void onprogress(T0)(scope auto ref Optional!(T0) onprogress) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onprogress", !onprogress.empty, onprogress.front);
  }
  EventHandler onprogress()() {
    return Object_Getter__EventHandler(this.handle, "onprogress");
  }
  void onratechange(T0)(scope auto ref Optional!(T0) onratechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onratechange", !onratechange.empty, onratechange.front);
  }
  EventHandler onratechange()() {
    return Object_Getter__EventHandler(this.handle, "onratechange");
  }
  void onreset(T0)(scope auto ref Optional!(T0) onreset) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onreset", !onreset.empty, onreset.front);
  }
  EventHandler onreset()() {
    return Object_Getter__EventHandler(this.handle, "onreset");
  }
  void onresize(T0)(scope auto ref Optional!(T0) onresize) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onresize", !onresize.empty, onresize.front);
  }
  EventHandler onresize()() {
    return Object_Getter__EventHandler(this.handle, "onresize");
  }
  void onscroll(T0)(scope auto ref Optional!(T0) onscroll) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onscroll", !onscroll.empty, onscroll.front);
  }
  EventHandler onscroll()() {
    return Object_Getter__EventHandler(this.handle, "onscroll");
  }
  void onseeked(T0)(scope auto ref Optional!(T0) onseeked) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onseeked", !onseeked.empty, onseeked.front);
  }
  EventHandler onseeked()() {
    return Object_Getter__EventHandler(this.handle, "onseeked");
  }
  void onseeking(T0)(scope auto ref Optional!(T0) onseeking) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onseeking", !onseeking.empty, onseeking.front);
  }
  EventHandler onseeking()() {
    return Object_Getter__EventHandler(this.handle, "onseeking");
  }
  void onselect(T0)(scope auto ref Optional!(T0) onselect) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onselect", !onselect.empty, onselect.front);
  }
  EventHandler onselect()() {
    return Object_Getter__EventHandler(this.handle, "onselect");
  }
  void onshow(T0)(scope auto ref Optional!(T0) onshow) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onshow", !onshow.empty, onshow.front);
  }
  EventHandler onshow()() {
    return Object_Getter__EventHandler(this.handle, "onshow");
  }
  void onstalled(T0)(scope auto ref Optional!(T0) onstalled) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onstalled", !onstalled.empty, onstalled.front);
  }
  EventHandler onstalled()() {
    return Object_Getter__EventHandler(this.handle, "onstalled");
  }
  void onsubmit(T0)(scope auto ref Optional!(T0) onsubmit) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onsubmit", !onsubmit.empty, onsubmit.front);
  }
  EventHandler onsubmit()() {
    return Object_Getter__EventHandler(this.handle, "onsubmit");
  }
  void onsuspend(T0)(scope auto ref Optional!(T0) onsuspend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onsuspend", !onsuspend.empty, onsuspend.front);
  }
  EventHandler onsuspend()() {
    return Object_Getter__EventHandler(this.handle, "onsuspend");
  }
  void ontimeupdate(T0)(scope auto ref Optional!(T0) ontimeupdate) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ontimeupdate", !ontimeupdate.empty, ontimeupdate.front);
  }
  EventHandler ontimeupdate()() {
    return Object_Getter__EventHandler(this.handle, "ontimeupdate");
  }
  void onvolumechange(T0)(scope auto ref Optional!(T0) onvolumechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onvolumechange", !onvolumechange.empty, onvolumechange.front);
  }
  EventHandler onvolumechange()() {
    return Object_Getter__EventHandler(this.handle, "onvolumechange");
  }
  void onwaiting(T0)(scope auto ref Optional!(T0) onwaiting) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onwaiting", !onwaiting.empty, onwaiting.front);
  }
  EventHandler onwaiting()() {
    return Object_Getter__EventHandler(this.handle, "onwaiting");
  }
  void onselectstart(T0)(scope auto ref Optional!(T0) onselectstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onselectstart", !onselectstart.empty, onselectstart.front);
  }
  EventHandler onselectstart()() {
    return Object_Getter__EventHandler(this.handle, "onselectstart");
  }
  void ontoggle(T0)(scope auto ref Optional!(T0) ontoggle) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ontoggle", !ontoggle.empty, ontoggle.front);
  }
  EventHandler ontoggle()() {
    return Object_Getter__EventHandler(this.handle, "ontoggle");
  }
  void onpointercancel(T0)(scope auto ref Optional!(T0) onpointercancel) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpointercancel", !onpointercancel.empty, onpointercancel.front);
  }
  EventHandler onpointercancel()() {
    return Object_Getter__EventHandler(this.handle, "onpointercancel");
  }
  void onpointerdown(T0)(scope auto ref Optional!(T0) onpointerdown) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpointerdown", !onpointerdown.empty, onpointerdown.front);
  }
  EventHandler onpointerdown()() {
    return Object_Getter__EventHandler(this.handle, "onpointerdown");
  }
  void onpointerup(T0)(scope auto ref Optional!(T0) onpointerup) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpointerup", !onpointerup.empty, onpointerup.front);
  }
  EventHandler onpointerup()() {
    return Object_Getter__EventHandler(this.handle, "onpointerup");
  }
  void onpointermove(T0)(scope auto ref Optional!(T0) onpointermove) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpointermove", !onpointermove.empty, onpointermove.front);
  }
  EventHandler onpointermove()() {
    return Object_Getter__EventHandler(this.handle, "onpointermove");
  }
  void onpointerout(T0)(scope auto ref Optional!(T0) onpointerout) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpointerout", !onpointerout.empty, onpointerout.front);
  }
  EventHandler onpointerout()() {
    return Object_Getter__EventHandler(this.handle, "onpointerout");
  }
  void onpointerover(T0)(scope auto ref Optional!(T0) onpointerover) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpointerover", !onpointerover.empty, onpointerover.front);
  }
  EventHandler onpointerover()() {
    return Object_Getter__EventHandler(this.handle, "onpointerover");
  }
  void onpointerenter(T0)(scope auto ref Optional!(T0) onpointerenter) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpointerenter", !onpointerenter.empty, onpointerenter.front);
  }
  EventHandler onpointerenter()() {
    return Object_Getter__EventHandler(this.handle, "onpointerenter");
  }
  void onpointerleave(T0)(scope auto ref Optional!(T0) onpointerleave) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpointerleave", !onpointerleave.empty, onpointerleave.front);
  }
  EventHandler onpointerleave()() {
    return Object_Getter__EventHandler(this.handle, "onpointerleave");
  }
  void ongotpointercapture(T0)(scope auto ref Optional!(T0) ongotpointercapture) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ongotpointercapture", !ongotpointercapture.empty, ongotpointercapture.front);
  }
  EventHandler ongotpointercapture()() {
    return Object_Getter__EventHandler(this.handle, "ongotpointercapture");
  }
  void onlostpointercapture(T0)(scope auto ref Optional!(T0) onlostpointercapture) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onlostpointercapture", !onlostpointercapture.empty, onlostpointercapture.front);
  }
  EventHandler onlostpointercapture()() {
    return Object_Getter__EventHandler(this.handle, "onlostpointercapture");
  }
  void onmozfullscreenchange(T0)(scope auto ref Optional!(T0) onmozfullscreenchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmozfullscreenchange", !onmozfullscreenchange.empty, onmozfullscreenchange.front);
  }
  EventHandler onmozfullscreenchange()() {
    return Object_Getter__EventHandler(this.handle, "onmozfullscreenchange");
  }
  void onmozfullscreenerror(T0)(scope auto ref Optional!(T0) onmozfullscreenerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmozfullscreenerror", !onmozfullscreenerror.empty, onmozfullscreenerror.front);
  }
  EventHandler onmozfullscreenerror()() {
    return Object_Getter__EventHandler(this.handle, "onmozfullscreenerror");
  }
  void onanimationcancel(T0)(scope auto ref Optional!(T0) onanimationcancel) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onanimationcancel", !onanimationcancel.empty, onanimationcancel.front);
  }
  EventHandler onanimationcancel()() {
    return Object_Getter__EventHandler(this.handle, "onanimationcancel");
  }
  void onanimationend(T0)(scope auto ref Optional!(T0) onanimationend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onanimationend", !onanimationend.empty, onanimationend.front);
  }
  EventHandler onanimationend()() {
    return Object_Getter__EventHandler(this.handle, "onanimationend");
  }
  void onanimationiteration(T0)(scope auto ref Optional!(T0) onanimationiteration) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onanimationiteration", !onanimationiteration.empty, onanimationiteration.front);
  }
  EventHandler onanimationiteration()() {
    return Object_Getter__EventHandler(this.handle, "onanimationiteration");
  }
  void onanimationstart(T0)(scope auto ref Optional!(T0) onanimationstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onanimationstart", !onanimationstart.empty, onanimationstart.front);
  }
  EventHandler onanimationstart()() {
    return Object_Getter__EventHandler(this.handle, "onanimationstart");
  }
  void ontransitioncancel(T0)(scope auto ref Optional!(T0) ontransitioncancel) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ontransitioncancel", !ontransitioncancel.empty, ontransitioncancel.front);
  }
  EventHandler ontransitioncancel()() {
    return Object_Getter__EventHandler(this.handle, "ontransitioncancel");
  }
  void ontransitionend(T0)(scope auto ref Optional!(T0) ontransitionend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ontransitionend", !ontransitionend.empty, ontransitionend.front);
  }
  EventHandler ontransitionend()() {
    return Object_Getter__EventHandler(this.handle, "ontransitionend");
  }
  void ontransitionrun(T0)(scope auto ref Optional!(T0) ontransitionrun) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ontransitionrun", !ontransitionrun.empty, ontransitionrun.front);
  }
  EventHandler ontransitionrun()() {
    return Object_Getter__EventHandler(this.handle, "ontransitionrun");
  }
  void ontransitionstart(T0)(scope auto ref Optional!(T0) ontransitionstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ontransitionstart", !ontransitionstart.empty, ontransitionstart.front);
  }
  EventHandler ontransitionstart()() {
    return Object_Getter__EventHandler(this.handle, "ontransitionstart");
  }
  void onwebkitanimationend(T0)(scope auto ref Optional!(T0) onwebkitanimationend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onwebkitanimationend", !onwebkitanimationend.empty, onwebkitanimationend.front);
  }
  EventHandler onwebkitanimationend()() {
    return Object_Getter__EventHandler(this.handle, "onwebkitanimationend");
  }
  void onwebkitanimationiteration(T0)(scope auto ref Optional!(T0) onwebkitanimationiteration) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onwebkitanimationiteration", !onwebkitanimationiteration.empty, onwebkitanimationiteration.front);
  }
  EventHandler onwebkitanimationiteration()() {
    return Object_Getter__EventHandler(this.handle, "onwebkitanimationiteration");
  }
  void onwebkitanimationstart(T0)(scope auto ref Optional!(T0) onwebkitanimationstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onwebkitanimationstart", !onwebkitanimationstart.empty, onwebkitanimationstart.front);
  }
  EventHandler onwebkitanimationstart()() {
    return Object_Getter__EventHandler(this.handle, "onwebkitanimationstart");
  }
  void onwebkittransitionend(T0)(scope auto ref Optional!(T0) onwebkittransitionend) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onwebkittransitionend", !onwebkittransitionend.empty, onwebkittransitionend.front);
  }
  EventHandler onwebkittransitionend()() {
    return Object_Getter__EventHandler(this.handle, "onwebkittransitionend");
  }
}
alias OnBeforeUnloadEventHandler = Optional!(OnBeforeUnloadEventHandlerNonNull);
alias OnBeforeUnloadEventHandlerNonNull = Optional!(string) delegate(Event);
alias OnErrorEventHandler = Optional!(OnErrorEventHandlerNonNull);
struct OnErrorEventHandlerForNodes {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this.handle, "onerror");
  }
}
struct OnErrorEventHandlerForWindow {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, OnErrorEventHandlerNonNull)) {
    OnErrorEventHandlerForWindow_onerror_Set(this.handle, !onerror.empty, onerror.front);
  }
  OnErrorEventHandler onerror()() {
    return OnErrorEventHandlerForWindow_onerror_Get(this.handle);
  }
}
alias OnErrorEventHandlerNonNull = Any delegate(SumType!(Event, string), string, uint, uint, Any);
struct WindowEventHandlers {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void onafterprint(T0)(scope auto ref Optional!(T0) onafterprint) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onafterprint", !onafterprint.empty, onafterprint.front);
  }
  EventHandler onafterprint()() {
    return Object_Getter__EventHandler(this.handle, "onafterprint");
  }
  void onbeforeprint(T0)(scope auto ref Optional!(T0) onbeforeprint) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onbeforeprint", !onbeforeprint.empty, onbeforeprint.front);
  }
  EventHandler onbeforeprint()() {
    return Object_Getter__EventHandler(this.handle, "onbeforeprint");
  }
  void onbeforeunload(T0)(scope auto ref Optional!(T0) onbeforeunload) if (isTOrPointer!(T0, OnBeforeUnloadEventHandlerNonNull)) {
    WindowEventHandlers_onbeforeunload_Set(this.handle, !onbeforeunload.empty, onbeforeunload.front);
  }
  OnBeforeUnloadEventHandler onbeforeunload()() {
    return WindowEventHandlers_onbeforeunload_Get(this.handle);
  }
  void onhashchange(T0)(scope auto ref Optional!(T0) onhashchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onhashchange", !onhashchange.empty, onhashchange.front);
  }
  EventHandler onhashchange()() {
    return Object_Getter__EventHandler(this.handle, "onhashchange");
  }
  void onlanguagechange(T0)(scope auto ref Optional!(T0) onlanguagechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onlanguagechange", !onlanguagechange.empty, onlanguagechange.front);
  }
  EventHandler onlanguagechange()() {
    return Object_Getter__EventHandler(this.handle, "onlanguagechange");
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this.handle, "onmessage");
  }
  void onmessageerror(T0)(scope auto ref Optional!(T0) onmessageerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onmessageerror", !onmessageerror.empty, onmessageerror.front);
  }
  EventHandler onmessageerror()() {
    return Object_Getter__EventHandler(this.handle, "onmessageerror");
  }
  void onoffline(T0)(scope auto ref Optional!(T0) onoffline) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onoffline", !onoffline.empty, onoffline.front);
  }
  EventHandler onoffline()() {
    return Object_Getter__EventHandler(this.handle, "onoffline");
  }
  void ononline(T0)(scope auto ref Optional!(T0) ononline) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "ononline", !ononline.empty, ononline.front);
  }
  EventHandler ononline()() {
    return Object_Getter__EventHandler(this.handle, "ononline");
  }
  void onpagehide(T0)(scope auto ref Optional!(T0) onpagehide) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpagehide", !onpagehide.empty, onpagehide.front);
  }
  EventHandler onpagehide()() {
    return Object_Getter__EventHandler(this.handle, "onpagehide");
  }
  void onpageshow(T0)(scope auto ref Optional!(T0) onpageshow) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpageshow", !onpageshow.empty, onpageshow.front);
  }
  EventHandler onpageshow()() {
    return Object_Getter__EventHandler(this.handle, "onpageshow");
  }
  void onpopstate(T0)(scope auto ref Optional!(T0) onpopstate) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onpopstate", !onpopstate.empty, onpopstate.front);
  }
  EventHandler onpopstate()() {
    return Object_Getter__EventHandler(this.handle, "onpopstate");
  }
  void onstorage(T0)(scope auto ref Optional!(T0) onstorage) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onstorage", !onstorage.empty, onstorage.front);
  }
  EventHandler onstorage()() {
    return Object_Getter__EventHandler(this.handle, "onstorage");
  }
  void onunload(T0)(scope auto ref Optional!(T0) onunload) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onunload", !onunload.empty, onunload.front);
  }
  EventHandler onunload()() {
    return Object_Getter__EventHandler(this.handle, "onunload");
  }
}


extern (C) void OnErrorEventHandlerForWindow_onerror_Set(Handle, bool, OnErrorEventHandlerNonNull);
extern (C) OnErrorEventHandler OnErrorEventHandlerForWindow_onerror_Get(Handle);
extern (C) void WindowEventHandlers_onbeforeunload_Set(Handle, bool, OnBeforeUnloadEventHandlerNonNull);
extern (C) OnBeforeUnloadEventHandler WindowEventHandlers_onbeforeunload_Get(Handle);