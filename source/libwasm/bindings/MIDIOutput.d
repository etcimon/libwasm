module libwasm.bindings.MIDIOutput;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.MIDIPort;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct MIDIOutput {
  nothrow:
  libwasm.bindings.MIDIPort.MIDIPort _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MIDIPort(h);
  }
  void send()(scope ref Sequence!(ubyte) data, double timestamp) {
    Serialize_Object_VarArgCall!void(this._parent, "send", "Handle;double", tuple(cast(Handle)data.handle, timestamp));
  }
  void send()(scope ref Sequence!(ubyte) data) {
    Object_Call_Handle__void(this._parent, "send", data.handle);
  }
  void clear()() {
    Object_Call__void(this._parent, "clear");
  }
}


