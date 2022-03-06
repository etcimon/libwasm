module spasm.bindings.InputEvent;

import spasm.types;
import spasm.bindings.DataTransfer;
import spasm.bindings.UIEvent;

@safe:
nothrow:

struct InputEvent {
  nothrow:
  spasm.bindings.UIEvent.UIEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEvent(h);
  }
  bool isComposing()() {
    return Object_Getter__bool(this._parent, "isComposing");
  }
  string inputType()() {
    return Object_Getter__string(this._parent, "inputType");
  }
  Optional!(string) data()() {
    return Object_Getter__OptionalString(this._parent, "data");
  }
  auto dataTransfer()() {
    return Object_Getter__OptionalHandle(this._parent, "dataTransfer");
  }
}
struct InputEventInit {
  nothrow:
  spasm.bindings.UIEvent.UIEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEventInit(h);
  }
  static auto create() {
    return InputEventInit(spasm_add__object());
  }
  void isComposing()(bool isComposing) {
    Object_Call_bool__void(this._parent, "isComposing", isComposing);
  }
  bool isComposing()() {
    return Object_Getter__bool(this._parent, "isComposing");
  }
  void inputType()(string inputType) {
    Object_Call_string__void(this._parent, "inputType", inputType);
  }
  string inputType()() {
    return Object_Getter__string(this._parent, "inputType");
  }
  void data(T0)(scope auto ref Optional!(T0) data) if (isTOrPointer!(T0, string)) {
    InputEventInit_data_Set(this._parent, !data.empty, data.front);
  }
  Optional!(string) data()() {
    return Object_Getter__OptionalString(this._parent, "data");
  }
}


extern (C) void InputEventInit_data_Set(Handle, bool, string);