module spasm.bindings.MIDIInputMap;

import spasm.types;
@safe:
nothrow:

struct MIDIInputMap {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint size() {
    return Maplike_string_Handle_size(this.handle);
  }
  void clear() {
    Maplike_string_Handle_clear(this.handle);
  }
  void delete_(string key) {
    Maplike_string_Handle_delete(this.handle, key);
  }
  Iterator!(ArrayPair!(string, MIDIInput)) entries() {
    return Iterator!(ArrayPair!(string, MIDIInput))(Maplike_string_Handle_entries(this.handle));
  }
  extern(C) void forEach(void delegate(string, Handle, Handle) callback) {
    Maplike_string_Handle_forEach(this.handle, callback);
  }
  MIDIInput get(string key) {
    return MIDIInput(Maplike_string_Handle_get(this.handle, key));
  }
  bool has(string key) {
    return Maplike_string_Handle_has(this.handle, key);
  }
  Iterator!(string) keys() {
    return Iterator!(string)(Maplike_string_Handle_keys(this.handle));
  }
  void set(string key, scope ref MIDIInput value) {
    Maplike_string_Handle_set(this.handle, key, value.handle);
  }
  Iterator!(MIDIInput) values() {
    return Iterator!(MIDIInput)(Maplike_string_Handle_values(this.handle));
  }
}


extern (C) uint Maplike_string_Handle_size(Handle);
extern (C) void Maplike_string_Handle_clear(Handle);
extern (C) void Maplike_string_Handle_delete(Handle, string key);
extern (C) Handle Maplike_string_Handle_entries(Handle);
extern (C) void Maplike_string_Handle_forEach(Handle, void delegate(string, Handle, Handle));
extern (C) MIDIInput Maplike_string_Handle_get(Handle, string);
extern (C) bool Maplike_string_Handle_has(Handle, string);
extern (C) Handle Maplike_string_Handle_keys(Handle);
extern (C) void Maplike_string_Handle_set(Handle, string key, Handle value);
extern (C) Handle Maplike_string_Handle_values(Handle);