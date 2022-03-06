module spasm.bindings.MIDIOutput;

import spasm.types;
import spasm.bindings.MIDIPort;
import spasm.bindings.Performance;

@safe:
nothrow:

struct MIDIOutput {
  nothrow:
  spasm.bindings.MIDIPort.MIDIPort _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MIDIPort(h);
  }
  void send()(scope ref Sequence!(ubyte) data, double timestamp) {
    MIDIOutput_send(this._parent, data.handle, timestamp);
  }
  void send()(scope ref Sequence!(ubyte) data) {
    Object_Call_Handle__void(this._parent, "send", data.handle);
  }
  void clear()() {
    Object_Call__void(this._parent, "clear");
  }
}


extern (C) void MIDIOutput_send(Handle, Handle, double);