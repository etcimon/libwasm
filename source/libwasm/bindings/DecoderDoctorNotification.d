module libwasm.bindings.DecoderDoctorNotification;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct DecoderDoctorNotification {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DecoderDoctorNotification(libwasm_add__object());
  }
  void type()(DecoderDoctorNotificationType type) {
    Object_Call_int__void(this.handle, "type", type);
  }
  DecoderDoctorNotificationType type()() {
    return Object_Getter__int(this.handle, "type");
  }
  void isSolved()(bool isSolved) {
    Object_Call_bool__void(this.handle, "isSolved", isSolved);
  }
  bool isSolved()() {
    return Object_Getter__bool(this.handle, "isSolved");
  }
  void decoderDoctorReportId()(string decoderDoctorReportId) {
    Object_Call_string__void(this.handle, "decoderDoctorReportId", decoderDoctorReportId);
  }
  string decoderDoctorReportId()() {
    return Object_Getter__string(this.handle, "decoderDoctorReportId");
  }
  void formats()(string formats) {
    Object_Call_string__void(this.handle, "formats", formats);
  }
  string formats()() {
    return Object_Getter__string(this.handle, "formats");
  }
  void decodeIssue()(string decodeIssue) {
    Object_Call_string__void(this.handle, "decodeIssue", decodeIssue);
  }
  string decodeIssue()() {
    return Object_Getter__string(this.handle, "decodeIssue");
  }
  void docURL()(string docURL) {
    Object_Call_string__void(this.handle, "docURL", docURL);
  }
  string docURL()() {
    return Object_Getter__string(this.handle, "docURL");
  }
  void resourceURL()(string resourceURL) {
    Object_Call_string__void(this.handle, "resourceURL", resourceURL);
  }
  string resourceURL()() {
    return Object_Getter__string(this.handle, "resourceURL");
  }
}
enum DecoderDoctorNotificationType {
  cannot_play,
  platform_decoder_not_found,
  can_play_but_some_missing_decoders,
  cannot_initialize_pulseaudio,
  unsupported_libavcodec,
  decode_error,
  decode_warning
}


