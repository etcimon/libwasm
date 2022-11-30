module libwasm.bindings.SVGElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CSSStyleDeclaration;
import libwasm.bindings.DOMStringMap;
import libwasm.bindings.Element;
import libwasm.bindings.EventHandler;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGSVGElement;

@safe:
nothrow:

struct SVGElement {
  nothrow:
  libwasm.bindings.Element.Element _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Element(h);
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  auto className()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "className"));
  }
  auto dataset()() {
    return DOMStringMap(Object_Getter__Handle(this._parent, "dataset"));
  }
  auto style()() {
    return CSSStyleDeclaration(Object_Getter__Handle(this._parent, "style"));
  }
  auto ownerSVGElement()() {
    return Optional!(SVGSVGElement)(Object_Getter__OptionalHandle(this._parent, "ownerSVGElement"));
  }
  auto viewportElement()() {
    return Optional!(SVGElement)(Object_Getter__OptionalHandle(this._parent, "viewportElement"));
  }
  void tabIndex()(int tabIndex) {
    Object_Call_int__void(this._parent, "tabIndex", tabIndex);
  }
  int tabIndex()() {
    return Object_Getter__int(this._parent, "tabIndex");
  }
  void focus()() {
    Object_Call__void(this._parent, "focus");
  }
  void blur()() {
    Object_Call__void(this._parent, "blur");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void onblur(T0)(scope auto ref Optional!(T0) onblur) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onblur", !onblur.empty, onblur.front);
  }
  EventHandler onblur()() {
    return Object_Getter__EventHandler(this._parent, "onblur");
  }
  void onfocus(T0)(scope auto ref Optional!(T0) onfocus) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onfocus", !onfocus.empty, onfocus.front);
  }
  EventHandler onfocus()() {
    return Object_Getter__EventHandler(this._parent, "onfocus");
  }
  void onauxclick(T0)(scope auto ref Optional!(T0) onauxclick) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onauxclick", !onauxclick.empty, onauxclick.front);
  }
  EventHandler onauxclick()() {
    return Object_Getter__EventHandler(this._parent, "onauxclick");
  }
  void oncanplay(T0)(scope auto ref Optional!(T0) oncanplay) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncanplay", !oncanplay.empty, oncanplay.front);
  }
  EventHandler oncanplay()() {
    return Object_Getter__EventHandler(this._parent, "oncanplay");
  }
  void oncanplaythrough(T0)(scope auto ref Optional!(T0) oncanplaythrough) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncanplaythrough", !oncanplaythrough.empty, oncanplaythrough.front);
  }
  EventHandler oncanplaythrough()() {
    return Object_Getter__EventHandler(this._parent, "oncanplaythrough");
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this._parent, "onchange");
  }
  void onclick(T0)(scope auto ref Optional!(T0) onclick) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclick", !onclick.empty, onclick.front);
  }
  EventHandler onclick()() {
    return Object_Getter__EventHandler(this._parent, "onclick");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this._parent, "onclose");
  }
  void oncontextmenu(T0)(scope auto ref Optional!(T0) oncontextmenu) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncontextmenu", !oncontextmenu.empty, oncontextmenu.front);
  }
  EventHandler oncontextmenu()() {
    return Object_Getter__EventHandler(this._parent, "oncontextmenu");
  }
  void ondblclick(T0)(scope auto ref Optional!(T0) ondblclick) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondblclick", !ondblclick.empty, ondblclick.front);
  }
  EventHandler ondblclick()() {
    return Object_Getter__EventHandler(this._parent, "ondblclick");
  }
  void ondrag(T0)(scope auto ref Optional!(T0) ondrag) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondrag", !ondrag.empty, ondrag.front);
  }
  EventHandler ondrag()() {
    return Object_Getter__EventHandler(this._parent, "ondrag");
  }
  void ondragend(T0)(scope auto ref Optional!(T0) ondragend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragend", !ondragend.empty, ondragend.front);
  }
  EventHandler ondragend()() {
    return Object_Getter__EventHandler(this._parent, "ondragend");
  }
  void ondragenter(T0)(scope auto ref Optional!(T0) ondragenter) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragenter", !ondragenter.empty, ondragenter.front);
  }
  EventHandler ondragenter()() {
    return Object_Getter__EventHandler(this._parent, "ondragenter");
  }
  void ondragexit(T0)(scope auto ref Optional!(T0) ondragexit) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragexit", !ondragexit.empty, ondragexit.front);
  }
  EventHandler ondragexit()() {
    return Object_Getter__EventHandler(this._parent, "ondragexit");
  }
  void ondragleave(T0)(scope auto ref Optional!(T0) ondragleave) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragleave", !ondragleave.empty, ondragleave.front);
  }
  EventHandler ondragleave()() {
    return Object_Getter__EventHandler(this._parent, "ondragleave");
  }
  void ondragover(T0)(scope auto ref Optional!(T0) ondragover) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragover", !ondragover.empty, ondragover.front);
  }
  EventHandler ondragover()() {
    return Object_Getter__EventHandler(this._parent, "ondragover");
  }
  void ondragstart(T0)(scope auto ref Optional!(T0) ondragstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondragstart", !ondragstart.empty, ondragstart.front);
  }
  EventHandler ondragstart()() {
    return Object_Getter__EventHandler(this._parent, "ondragstart");
  }
  void ondrop(T0)(scope auto ref Optional!(T0) ondrop) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondrop", !ondrop.empty, ondrop.front);
  }
  EventHandler ondrop()() {
    return Object_Getter__EventHandler(this._parent, "ondrop");
  }
  void ondurationchange(T0)(scope auto ref Optional!(T0) ondurationchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondurationchange", !ondurationchange.empty, ondurationchange.front);
  }
  EventHandler ondurationchange()() {
    return Object_Getter__EventHandler(this._parent, "ondurationchange");
  }
  void onemptied(T0)(scope auto ref Optional!(T0) onemptied) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onemptied", !onemptied.empty, onemptied.front);
  }
  EventHandler onemptied()() {
    return Object_Getter__EventHandler(this._parent, "onemptied");
  }
  void onended(T0)(scope auto ref Optional!(T0) onended) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onended", !onended.empty, onended.front);
  }
  EventHandler onended()() {
    return Object_Getter__EventHandler(this._parent, "onended");
  }
  void oninput(T0)(scope auto ref Optional!(T0) oninput) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oninput", !oninput.empty, oninput.front);
  }
  EventHandler oninput()() {
    return Object_Getter__EventHandler(this._parent, "oninput");
  }
  void oninvalid(T0)(scope auto ref Optional!(T0) oninvalid) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oninvalid", !oninvalid.empty, oninvalid.front);
  }
  EventHandler oninvalid()() {
    return Object_Getter__EventHandler(this._parent, "oninvalid");
  }
  void onkeydown(T0)(scope auto ref Optional!(T0) onkeydown) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onkeydown", !onkeydown.empty, onkeydown.front);
  }
  EventHandler onkeydown()() {
    return Object_Getter__EventHandler(this._parent, "onkeydown");
  }
  void onkeypress(T0)(scope auto ref Optional!(T0) onkeypress) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onkeypress", !onkeypress.empty, onkeypress.front);
  }
  EventHandler onkeypress()() {
    return Object_Getter__EventHandler(this._parent, "onkeypress");
  }
  void onkeyup(T0)(scope auto ref Optional!(T0) onkeyup) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onkeyup", !onkeyup.empty, onkeyup.front);
  }
  EventHandler onkeyup()() {
    return Object_Getter__EventHandler(this._parent, "onkeyup");
  }
  void onload(T0)(scope auto ref Optional!(T0) onload) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onload", !onload.empty, onload.front);
  }
  EventHandler onload()() {
    return Object_Getter__EventHandler(this._parent, "onload");
  }
  void onloadeddata(T0)(scope auto ref Optional!(T0) onloadeddata) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onloadeddata", !onloadeddata.empty, onloadeddata.front);
  }
  EventHandler onloadeddata()() {
    return Object_Getter__EventHandler(this._parent, "onloadeddata");
  }
  void onloadedmetadata(T0)(scope auto ref Optional!(T0) onloadedmetadata) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onloadedmetadata", !onloadedmetadata.empty, onloadedmetadata.front);
  }
  EventHandler onloadedmetadata()() {
    return Object_Getter__EventHandler(this._parent, "onloadedmetadata");
  }
  void onloadend(T0)(scope auto ref Optional!(T0) onloadend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onloadend", !onloadend.empty, onloadend.front);
  }
  EventHandler onloadend()() {
    return Object_Getter__EventHandler(this._parent, "onloadend");
  }
  void onloadstart(T0)(scope auto ref Optional!(T0) onloadstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onloadstart", !onloadstart.empty, onloadstart.front);
  }
  EventHandler onloadstart()() {
    return Object_Getter__EventHandler(this._parent, "onloadstart");
  }
  void onmousedown(T0)(scope auto ref Optional!(T0) onmousedown) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmousedown", !onmousedown.empty, onmousedown.front);
  }
  EventHandler onmousedown()() {
    return Object_Getter__EventHandler(this._parent, "onmousedown");
  }
  void onmouseenter(T0)(scope auto ref Optional!(T0) onmouseenter) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseenter", !onmouseenter.empty, onmouseenter.front);
  }
  EventHandler onmouseenter()() {
    return Object_Getter__EventHandler(this._parent, "onmouseenter");
  }
  void onmouseleave(T0)(scope auto ref Optional!(T0) onmouseleave) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseleave", !onmouseleave.empty, onmouseleave.front);
  }
  EventHandler onmouseleave()() {
    return Object_Getter__EventHandler(this._parent, "onmouseleave");
  }
  void onmousemove(T0)(scope auto ref Optional!(T0) onmousemove) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmousemove", !onmousemove.empty, onmousemove.front);
  }
  EventHandler onmousemove()() {
    return Object_Getter__EventHandler(this._parent, "onmousemove");
  }
  void onmouseout(T0)(scope auto ref Optional!(T0) onmouseout) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseout", !onmouseout.empty, onmouseout.front);
  }
  EventHandler onmouseout()() {
    return Object_Getter__EventHandler(this._parent, "onmouseout");
  }
  void onmouseover(T0)(scope auto ref Optional!(T0) onmouseover) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseover", !onmouseover.empty, onmouseover.front);
  }
  EventHandler onmouseover()() {
    return Object_Getter__EventHandler(this._parent, "onmouseover");
  }
  void onmouseup(T0)(scope auto ref Optional!(T0) onmouseup) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmouseup", !onmouseup.empty, onmouseup.front);
  }
  EventHandler onmouseup()() {
    return Object_Getter__EventHandler(this._parent, "onmouseup");
  }
  void onwheel(T0)(scope auto ref Optional!(T0) onwheel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwheel", !onwheel.empty, onwheel.front);
  }
  EventHandler onwheel()() {
    return Object_Getter__EventHandler(this._parent, "onwheel");
  }
  void onpause(T0)(scope auto ref Optional!(T0) onpause) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpause", !onpause.empty, onpause.front);
  }
  EventHandler onpause()() {
    return Object_Getter__EventHandler(this._parent, "onpause");
  }
  void onplay(T0)(scope auto ref Optional!(T0) onplay) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onplay", !onplay.empty, onplay.front);
  }
  EventHandler onplay()() {
    return Object_Getter__EventHandler(this._parent, "onplay");
  }
  void onplaying(T0)(scope auto ref Optional!(T0) onplaying) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onplaying", !onplaying.empty, onplaying.front);
  }
  EventHandler onplaying()() {
    return Object_Getter__EventHandler(this._parent, "onplaying");
  }
  void onprogress(T0)(scope auto ref Optional!(T0) onprogress) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onprogress", !onprogress.empty, onprogress.front);
  }
  EventHandler onprogress()() {
    return Object_Getter__EventHandler(this._parent, "onprogress");
  }
  void onratechange(T0)(scope auto ref Optional!(T0) onratechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onratechange", !onratechange.empty, onratechange.front);
  }
  EventHandler onratechange()() {
    return Object_Getter__EventHandler(this._parent, "onratechange");
  }
  void onreset(T0)(scope auto ref Optional!(T0) onreset) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onreset", !onreset.empty, onreset.front);
  }
  EventHandler onreset()() {
    return Object_Getter__EventHandler(this._parent, "onreset");
  }
  void onresize(T0)(scope auto ref Optional!(T0) onresize) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onresize", !onresize.empty, onresize.front);
  }
  EventHandler onresize()() {
    return Object_Getter__EventHandler(this._parent, "onresize");
  }
  void onscroll(T0)(scope auto ref Optional!(T0) onscroll) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onscroll", !onscroll.empty, onscroll.front);
  }
  EventHandler onscroll()() {
    return Object_Getter__EventHandler(this._parent, "onscroll");
  }
  void onseeked(T0)(scope auto ref Optional!(T0) onseeked) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onseeked", !onseeked.empty, onseeked.front);
  }
  EventHandler onseeked()() {
    return Object_Getter__EventHandler(this._parent, "onseeked");
  }
  void onseeking(T0)(scope auto ref Optional!(T0) onseeking) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onseeking", !onseeking.empty, onseeking.front);
  }
  EventHandler onseeking()() {
    return Object_Getter__EventHandler(this._parent, "onseeking");
  }
  void onselect(T0)(scope auto ref Optional!(T0) onselect) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onselect", !onselect.empty, onselect.front);
  }
  EventHandler onselect()() {
    return Object_Getter__EventHandler(this._parent, "onselect");
  }
  void onshow(T0)(scope auto ref Optional!(T0) onshow) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onshow", !onshow.empty, onshow.front);
  }
  EventHandler onshow()() {
    return Object_Getter__EventHandler(this._parent, "onshow");
  }
  void onstalled(T0)(scope auto ref Optional!(T0) onstalled) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstalled", !onstalled.empty, onstalled.front);
  }
  EventHandler onstalled()() {
    return Object_Getter__EventHandler(this._parent, "onstalled");
  }
  void onsubmit(T0)(scope auto ref Optional!(T0) onsubmit) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsubmit", !onsubmit.empty, onsubmit.front);
  }
  EventHandler onsubmit()() {
    return Object_Getter__EventHandler(this._parent, "onsubmit");
  }
  void onsuspend(T0)(scope auto ref Optional!(T0) onsuspend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsuspend", !onsuspend.empty, onsuspend.front);
  }
  EventHandler onsuspend()() {
    return Object_Getter__EventHandler(this._parent, "onsuspend");
  }
  void ontimeupdate(T0)(scope auto ref Optional!(T0) ontimeupdate) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontimeupdate", !ontimeupdate.empty, ontimeupdate.front);
  }
  EventHandler ontimeupdate()() {
    return Object_Getter__EventHandler(this._parent, "ontimeupdate");
  }
  void onvolumechange(T0)(scope auto ref Optional!(T0) onvolumechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onvolumechange", !onvolumechange.empty, onvolumechange.front);
  }
  EventHandler onvolumechange()() {
    return Object_Getter__EventHandler(this._parent, "onvolumechange");
  }
  void onwaiting(T0)(scope auto ref Optional!(T0) onwaiting) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwaiting", !onwaiting.empty, onwaiting.front);
  }
  EventHandler onwaiting()() {
    return Object_Getter__EventHandler(this._parent, "onwaiting");
  }
  void onselectstart(T0)(scope auto ref Optional!(T0) onselectstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onselectstart", !onselectstart.empty, onselectstart.front);
  }
  EventHandler onselectstart()() {
    return Object_Getter__EventHandler(this._parent, "onselectstart");
  }
  void ontoggle(T0)(scope auto ref Optional!(T0) ontoggle) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontoggle", !ontoggle.empty, ontoggle.front);
  }
  EventHandler ontoggle()() {
    return Object_Getter__EventHandler(this._parent, "ontoggle");
  }
  void onpointercancel(T0)(scope auto ref Optional!(T0) onpointercancel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointercancel", !onpointercancel.empty, onpointercancel.front);
  }
  EventHandler onpointercancel()() {
    return Object_Getter__EventHandler(this._parent, "onpointercancel");
  }
  void onpointerdown(T0)(scope auto ref Optional!(T0) onpointerdown) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerdown", !onpointerdown.empty, onpointerdown.front);
  }
  EventHandler onpointerdown()() {
    return Object_Getter__EventHandler(this._parent, "onpointerdown");
  }
  void onpointerup(T0)(scope auto ref Optional!(T0) onpointerup) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerup", !onpointerup.empty, onpointerup.front);
  }
  EventHandler onpointerup()() {
    return Object_Getter__EventHandler(this._parent, "onpointerup");
  }
  void onpointermove(T0)(scope auto ref Optional!(T0) onpointermove) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointermove", !onpointermove.empty, onpointermove.front);
  }
  EventHandler onpointermove()() {
    return Object_Getter__EventHandler(this._parent, "onpointermove");
  }
  void onpointerout(T0)(scope auto ref Optional!(T0) onpointerout) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerout", !onpointerout.empty, onpointerout.front);
  }
  EventHandler onpointerout()() {
    return Object_Getter__EventHandler(this._parent, "onpointerout");
  }
  void onpointerover(T0)(scope auto ref Optional!(T0) onpointerover) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerover", !onpointerover.empty, onpointerover.front);
  }
  EventHandler onpointerover()() {
    return Object_Getter__EventHandler(this._parent, "onpointerover");
  }
  void onpointerenter(T0)(scope auto ref Optional!(T0) onpointerenter) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerenter", !onpointerenter.empty, onpointerenter.front);
  }
  EventHandler onpointerenter()() {
    return Object_Getter__EventHandler(this._parent, "onpointerenter");
  }
  void onpointerleave(T0)(scope auto ref Optional!(T0) onpointerleave) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpointerleave", !onpointerleave.empty, onpointerleave.front);
  }
  EventHandler onpointerleave()() {
    return Object_Getter__EventHandler(this._parent, "onpointerleave");
  }
  void ongotpointercapture(T0)(scope auto ref Optional!(T0) ongotpointercapture) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ongotpointercapture", !ongotpointercapture.empty, ongotpointercapture.front);
  }
  EventHandler ongotpointercapture()() {
    return Object_Getter__EventHandler(this._parent, "ongotpointercapture");
  }
  void onlostpointercapture(T0)(scope auto ref Optional!(T0) onlostpointercapture) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onlostpointercapture", !onlostpointercapture.empty, onlostpointercapture.front);
  }
  EventHandler onlostpointercapture()() {
    return Object_Getter__EventHandler(this._parent, "onlostpointercapture");
  }
  void onmozfullscreenchange(T0)(scope auto ref Optional!(T0) onmozfullscreenchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmozfullscreenchange", !onmozfullscreenchange.empty, onmozfullscreenchange.front);
  }
  EventHandler onmozfullscreenchange()() {
    return Object_Getter__EventHandler(this._parent, "onmozfullscreenchange");
  }
  void onmozfullscreenerror(T0)(scope auto ref Optional!(T0) onmozfullscreenerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmozfullscreenerror", !onmozfullscreenerror.empty, onmozfullscreenerror.front);
  }
  EventHandler onmozfullscreenerror()() {
    return Object_Getter__EventHandler(this._parent, "onmozfullscreenerror");
  }
  void onanimationcancel(T0)(scope auto ref Optional!(T0) onanimationcancel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onanimationcancel", !onanimationcancel.empty, onanimationcancel.front);
  }
  EventHandler onanimationcancel()() {
    return Object_Getter__EventHandler(this._parent, "onanimationcancel");
  }
  void onanimationend(T0)(scope auto ref Optional!(T0) onanimationend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onanimationend", !onanimationend.empty, onanimationend.front);
  }
  EventHandler onanimationend()() {
    return Object_Getter__EventHandler(this._parent, "onanimationend");
  }
  void onanimationiteration(T0)(scope auto ref Optional!(T0) onanimationiteration) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onanimationiteration", !onanimationiteration.empty, onanimationiteration.front);
  }
  EventHandler onanimationiteration()() {
    return Object_Getter__EventHandler(this._parent, "onanimationiteration");
  }
  void onanimationstart(T0)(scope auto ref Optional!(T0) onanimationstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onanimationstart", !onanimationstart.empty, onanimationstart.front);
  }
  EventHandler onanimationstart()() {
    return Object_Getter__EventHandler(this._parent, "onanimationstart");
  }
  void ontransitioncancel(T0)(scope auto ref Optional!(T0) ontransitioncancel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontransitioncancel", !ontransitioncancel.empty, ontransitioncancel.front);
  }
  EventHandler ontransitioncancel()() {
    return Object_Getter__EventHandler(this._parent, "ontransitioncancel");
  }
  void ontransitionend(T0)(scope auto ref Optional!(T0) ontransitionend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontransitionend", !ontransitionend.empty, ontransitionend.front);
  }
  EventHandler ontransitionend()() {
    return Object_Getter__EventHandler(this._parent, "ontransitionend");
  }
  void ontransitionrun(T0)(scope auto ref Optional!(T0) ontransitionrun) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontransitionrun", !ontransitionrun.empty, ontransitionrun.front);
  }
  EventHandler ontransitionrun()() {
    return Object_Getter__EventHandler(this._parent, "ontransitionrun");
  }
  void ontransitionstart(T0)(scope auto ref Optional!(T0) ontransitionstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontransitionstart", !ontransitionstart.empty, ontransitionstart.front);
  }
  EventHandler ontransitionstart()() {
    return Object_Getter__EventHandler(this._parent, "ontransitionstart");
  }
  void onwebkitanimationend(T0)(scope auto ref Optional!(T0) onwebkitanimationend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwebkitanimationend", !onwebkitanimationend.empty, onwebkitanimationend.front);
  }
  EventHandler onwebkitanimationend()() {
    return Object_Getter__EventHandler(this._parent, "onwebkitanimationend");
  }
  void onwebkitanimationiteration(T0)(scope auto ref Optional!(T0) onwebkitanimationiteration) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwebkitanimationiteration", !onwebkitanimationiteration.empty, onwebkitanimationiteration.front);
  }
  EventHandler onwebkitanimationiteration()() {
    return Object_Getter__EventHandler(this._parent, "onwebkitanimationiteration");
  }
  void onwebkitanimationstart(T0)(scope auto ref Optional!(T0) onwebkitanimationstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwebkitanimationstart", !onwebkitanimationstart.empty, onwebkitanimationstart.front);
  }
  EventHandler onwebkitanimationstart()() {
    return Object_Getter__EventHandler(this._parent, "onwebkitanimationstart");
  }
  void onwebkittransitionend(T0)(scope auto ref Optional!(T0) onwebkittransitionend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwebkittransitionend", !onwebkittransitionend.empty, onwebkittransitionend.front);
  }
  EventHandler onwebkittransitionend()() {
    return Object_Getter__EventHandler(this._parent, "onwebkittransitionend");
  }
  void oncopy(T0)(scope auto ref Optional!(T0) oncopy) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncopy", !oncopy.empty, oncopy.front);
  }
  EventHandler oncopy()() {
    return Object_Getter__EventHandler(this._parent, "oncopy");
  }
  void oncut(T0)(scope auto ref Optional!(T0) oncut) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncut", !oncut.empty, oncut.front);
  }
  EventHandler oncut()() {
    return Object_Getter__EventHandler(this._parent, "oncut");
  }
  void onpaste(T0)(scope auto ref Optional!(T0) onpaste) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpaste", !onpaste.empty, onpaste.front);
  }
  EventHandler onpaste()() {
    return Object_Getter__EventHandler(this._parent, "onpaste");
  }
  void ontouchstart(T0)(scope auto ref Optional!(T0) ontouchstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontouchstart", !ontouchstart.empty, ontouchstart.front);
  }
  EventHandler ontouchstart()() {
    return Object_Getter__EventHandler(this._parent, "ontouchstart");
  }
  void ontouchend(T0)(scope auto ref Optional!(T0) ontouchend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontouchend", !ontouchend.empty, ontouchend.front);
  }
  EventHandler ontouchend()() {
    return Object_Getter__EventHandler(this._parent, "ontouchend");
  }
  void ontouchmove(T0)(scope auto ref Optional!(T0) ontouchmove) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontouchmove", !ontouchmove.empty, ontouchmove.front);
  }
  EventHandler ontouchmove()() {
    return Object_Getter__EventHandler(this._parent, "ontouchmove");
  }
  void ontouchcancel(T0)(scope auto ref Optional!(T0) ontouchcancel) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontouchcancel", !ontouchcancel.empty, ontouchcancel.front);
  }
  EventHandler ontouchcancel()() {
    return Object_Getter__EventHandler(this._parent, "ontouchcancel");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
}


