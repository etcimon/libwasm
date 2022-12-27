module libwasm.bindings.MIDIOutputMap;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct MIDIOutputMap {
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
  Iterator!(ArrayPair!(string, MIDIOutput)) entries() {
    return Iterator!(ArrayPair!(string, MIDIOutput))(Maplike_string_Handle_entries(this.handle));
  }
  extern(C) void forEach(void delegate(string, Handle, Handle) callback) {
    Maplike_string_Handle_forEach(this.handle, callback);
  }
  MIDIOutput get(string key) {
    return MIDIOutput(Maplike_string_Handle_get(this.handle, key));
  }
  bool has(string key) {
    return Maplike_string_Handle_has(this.handle, key);
  }
  Iterator!(string) keys() {
    return Iterator!(string)(Maplike_string_Handle_keys(this.handle));
  }
  void set(string key, scope ref MIDIOutput value) {
    Maplike_string_Handle_set(this.handle, key, value.handle);
  }
  Iterator!(MIDIOutput) values() {
    return Iterator!(MIDIOutput)(Maplike_string_Handle_values(this.handle));
  }
}


extern (C) uint Maplike_string_Handle_size(Handle);
extern (C) void Maplike_string_Handle_clear(Handle);
extern (C) void Maplike_string_Handle_delete(Handle, string key);
extern (C) Handle Maplike_string_Handle_entries(Handle);
extern (C) void Maplike_string_Handle_forEach(Handle, void delegate(string, Handle, Handle));
extern (C) MIDIOutput Maplike_string_Handle_get(Handle, string);
extern (C) bool Maplike_string_Handle_has(Handle, string);
extern (C) Handle Maplike_string_Handle_keys(Handle);
extern (C) void Maplike_string_Handle_set(Handle, string key, Handle value);
extern (C) Handle Maplike_string_Handle_values(Handle);