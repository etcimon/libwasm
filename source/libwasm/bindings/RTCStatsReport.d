module libwasm.bindings.RTCStatsReport;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct RTCCodecStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCCodecStats(libwasm_add__object());
  }
  void payloadType()(uint payloadType) {
    Object_Call_uint__void(this._parent, "payloadType", payloadType);
  }
  uint payloadType()() {
    return Object_Getter__uint(this._parent, "payloadType");
  }
  void codec()(string codec) {
    Object_Call_string__void(this._parent, "codec", codec);
  }
  string codec()() {
    return Object_Getter__string(this._parent, "codec");
  }
  void clockRate()(uint clockRate) {
    Object_Call_uint__void(this._parent, "clockRate", clockRate);
  }
  uint clockRate()() {
    return Object_Getter__uint(this._parent, "clockRate");
  }
  void channels()(uint channels) {
    Object_Call_uint__void(this._parent, "channels", channels);
  }
  uint channels()() {
    return Object_Getter__uint(this._parent, "channels");
  }
  void parameters()(string parameters) {
    Object_Call_string__void(this._parent, "parameters", parameters);
  }
  string parameters()() {
    return Object_Getter__string(this._parent, "parameters");
  }
}
struct RTCIceCandidatePairStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCIceCandidatePairStats(libwasm_add__object());
  }
  void transportId()(string transportId) {
    Object_Call_string__void(this._parent, "transportId", transportId);
  }
  string transportId()() {
    return Object_Getter__string(this._parent, "transportId");
  }
  void localCandidateId()(string localCandidateId) {
    Object_Call_string__void(this._parent, "localCandidateId", localCandidateId);
  }
  string localCandidateId()() {
    return Object_Getter__string(this._parent, "localCandidateId");
  }
  void remoteCandidateId()(string remoteCandidateId) {
    Object_Call_string__void(this._parent, "remoteCandidateId", remoteCandidateId);
  }
  string remoteCandidateId()() {
    return Object_Getter__string(this._parent, "remoteCandidateId");
  }
  void state()(RTCStatsIceCandidatePairState state) {
    Object_Call_int__void(this._parent, "state", state);
  }
  RTCStatsIceCandidatePairState state()() {
    return Object_Getter__int(this._parent, "state");
  }
  void priority()(uint priority) {
    Object_Call_uint__void(this._parent, "priority", priority);
  }
  uint priority()() {
    return Object_Getter__uint(this._parent, "priority");
  }
  void nominated()(bool nominated) {
    Object_Call_bool__void(this._parent, "nominated", nominated);
  }
  bool nominated()() {
    return Object_Getter__bool(this._parent, "nominated");
  }
  void writable()(bool writable) {
    Object_Call_bool__void(this._parent, "writable", writable);
  }
  bool writable()() {
    return Object_Getter__bool(this._parent, "writable");
  }
  void readable()(bool readable) {
    Object_Call_bool__void(this._parent, "readable", readable);
  }
  bool readable()() {
    return Object_Getter__bool(this._parent, "readable");
  }
  void bytesSent()(uint bytesSent) {
    Object_Call_uint__void(this._parent, "bytesSent", bytesSent);
  }
  uint bytesSent()() {
    return Object_Getter__uint(this._parent, "bytesSent");
  }
  void bytesReceived()(uint bytesReceived) {
    Object_Call_uint__void(this._parent, "bytesReceived", bytesReceived);
  }
  uint bytesReceived()() {
    return Object_Getter__uint(this._parent, "bytesReceived");
  }
  void lastPacketSentTimestamp()(double lastPacketSentTimestamp) {
    Object_Call_double__void(this._parent, "lastPacketSentTimestamp", lastPacketSentTimestamp);
  }
  double lastPacketSentTimestamp()() {
    return Object_Getter__double(this._parent, "lastPacketSentTimestamp");
  }
  void lastPacketReceivedTimestamp()(double lastPacketReceivedTimestamp) {
    Object_Call_double__void(this._parent, "lastPacketReceivedTimestamp", lastPacketReceivedTimestamp);
  }
  double lastPacketReceivedTimestamp()() {
    return Object_Getter__double(this._parent, "lastPacketReceivedTimestamp");
  }
  void selected()(bool selected) {
    Object_Call_bool__void(this._parent, "selected", selected);
  }
  bool selected()() {
    return Object_Getter__bool(this._parent, "selected");
  }
  void componentId()(uint componentId) {
    Object_Call_uint__void(this._parent, "componentId", componentId);
  }
  uint componentId()() {
    return Object_Getter__uint(this._parent, "componentId");
  }
}
struct RTCIceCandidateStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCIceCandidateStats(libwasm_add__object());
  }
  void address()(string address) {
    Object_Call_string__void(this._parent, "address", address);
  }
  string address()() {
    return Object_Getter__string(this._parent, "address");
  }
  void port()(int port) {
    Object_Call_int__void(this._parent, "port", port);
  }
  int port()() {
    return Object_Getter__int(this._parent, "port");
  }
  void protocol()(string protocol) {
    Object_Call_string__void(this._parent, "protocol", protocol);
  }
  string protocol()() {
    return Object_Getter__string(this._parent, "protocol");
  }
  void candidateType()(RTCIceCandidateType candidateType) {
    Object_Call_int__void(this._parent, "candidateType", candidateType);
  }
  RTCIceCandidateType candidateType()() {
    return Object_Getter__int(this._parent, "candidateType");
  }
  void priority()(int priority) {
    Object_Call_int__void(this._parent, "priority", priority);
  }
  int priority()() {
    return Object_Getter__int(this._parent, "priority");
  }
  void relayProtocol()(string relayProtocol) {
    Object_Call_string__void(this._parent, "relayProtocol", relayProtocol);
  }
  string relayProtocol()() {
    return Object_Getter__string(this._parent, "relayProtocol");
  }
  void transportId()(string transportId) {
    Object_Call_string__void(this._parent, "transportId", transportId);
  }
  string transportId()() {
    return Object_Getter__string(this._parent, "transportId");
  }
}
enum RTCIceCandidateType {
  host,
  srflx,
  prflx,
  relay
}
struct RTCIceComponentStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCIceComponentStats(libwasm_add__object());
  }
  void transportId()(string transportId) {
    Object_Call_string__void(this._parent, "transportId", transportId);
  }
  string transportId()() {
    return Object_Getter__string(this._parent, "transportId");
  }
  void component()(int component) {
    Object_Call_int__void(this._parent, "component", component);
  }
  int component()() {
    return Object_Getter__int(this._parent, "component");
  }
  void bytesSent()(uint bytesSent) {
    Object_Call_uint__void(this._parent, "bytesSent", bytesSent);
  }
  uint bytesSent()() {
    return Object_Getter__uint(this._parent, "bytesSent");
  }
  void bytesReceived()(uint bytesReceived) {
    Object_Call_uint__void(this._parent, "bytesReceived", bytesReceived);
  }
  uint bytesReceived()() {
    return Object_Getter__uint(this._parent, "bytesReceived");
  }
  void activeConnection()(bool activeConnection) {
    Object_Call_bool__void(this._parent, "activeConnection", activeConnection);
  }
  bool activeConnection()() {
    return Object_Getter__bool(this._parent, "activeConnection");
  }
}
struct RTCInboundRTPStreamStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCRtpStreamStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCRtpStreamStats(h);
  }
  static auto create() {
    return RTCInboundRTPStreamStats(libwasm_add__object());
  }
  void packetsReceived()(uint packetsReceived) {
    Object_Call_uint__void(this._parent, "packetsReceived", packetsReceived);
  }
  uint packetsReceived()() {
    return Object_Getter__uint(this._parent, "packetsReceived");
  }
  void bytesReceived()(uint bytesReceived) {
    Object_Call_uint__void(this._parent, "bytesReceived", bytesReceived);
  }
  uint bytesReceived()() {
    return Object_Getter__uint(this._parent, "bytesReceived");
  }
  void jitter()(double jitter) {
    Object_Call_double__void(this._parent, "jitter", jitter);
  }
  double jitter()() {
    return Object_Getter__double(this._parent, "jitter");
  }
  void packetsLost()(uint packetsLost) {
    Object_Call_uint__void(this._parent, "packetsLost", packetsLost);
  }
  uint packetsLost()() {
    return Object_Getter__uint(this._parent, "packetsLost");
  }
  void roundTripTime()(double roundTripTime) {
    Object_Call_double__void(this._parent, "roundTripTime", roundTripTime);
  }
  double roundTripTime()() {
    return Object_Getter__double(this._parent, "roundTripTime");
  }
  void discardedPackets()(uint discardedPackets) {
    Object_Call_uint__void(this._parent, "discardedPackets", discardedPackets);
  }
  uint discardedPackets()() {
    return Object_Getter__uint(this._parent, "discardedPackets");
  }
  void framesDecoded()(uint framesDecoded) {
    Object_Call_uint__void(this._parent, "framesDecoded", framesDecoded);
  }
  uint framesDecoded()() {
    return Object_Getter__uint(this._parent, "framesDecoded");
  }
}
struct RTCMediaStreamStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCMediaStreamStats(libwasm_add__object());
  }
  void streamIdentifier()(string streamIdentifier) {
    Object_Call_string__void(this._parent, "streamIdentifier", streamIdentifier);
  }
  string streamIdentifier()() {
    return Object_Getter__string(this._parent, "streamIdentifier");
  }
  void trackIds()(scope ref Sequence!(string) trackIds) {
    Object_Call_Handle__void(this._parent, "trackIds", trackIds.handle);
  }
  auto trackIds()() {
    return Sequence!(string)(Object_Getter__Handle(this._parent, "trackIds"));
  }
}
struct RTCMediaStreamTrackStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCMediaStreamTrackStats(libwasm_add__object());
  }
  void trackIdentifier()(string trackIdentifier) {
    Object_Call_string__void(this._parent, "trackIdentifier", trackIdentifier);
  }
  string trackIdentifier()() {
    return Object_Getter__string(this._parent, "trackIdentifier");
  }
  void remoteSource()(bool remoteSource) {
    Object_Call_bool__void(this._parent, "remoteSource", remoteSource);
  }
  bool remoteSource()() {
    return Object_Getter__bool(this._parent, "remoteSource");
  }
  void ssrcIds()(scope ref Sequence!(string) ssrcIds) {
    Object_Call_Handle__void(this._parent, "ssrcIds", ssrcIds.handle);
  }
  auto ssrcIds()() {
    return Sequence!(string)(Object_Getter__Handle(this._parent, "ssrcIds"));
  }
  void frameWidth()(uint frameWidth) {
    Object_Call_uint__void(this._parent, "frameWidth", frameWidth);
  }
  uint frameWidth()() {
    return Object_Getter__uint(this._parent, "frameWidth");
  }
  void frameHeight()(uint frameHeight) {
    Object_Call_uint__void(this._parent, "frameHeight", frameHeight);
  }
  uint frameHeight()() {
    return Object_Getter__uint(this._parent, "frameHeight");
  }
  void framesPerSecond()(double framesPerSecond) {
    Object_Call_double__void(this._parent, "framesPerSecond", framesPerSecond);
  }
  double framesPerSecond()() {
    return Object_Getter__double(this._parent, "framesPerSecond");
  }
  void framesSent()(uint framesSent) {
    Object_Call_uint__void(this._parent, "framesSent", framesSent);
  }
  uint framesSent()() {
    return Object_Getter__uint(this._parent, "framesSent");
  }
  void framesReceived()(uint framesReceived) {
    Object_Call_uint__void(this._parent, "framesReceived", framesReceived);
  }
  uint framesReceived()() {
    return Object_Getter__uint(this._parent, "framesReceived");
  }
  void framesDecoded()(uint framesDecoded) {
    Object_Call_uint__void(this._parent, "framesDecoded", framesDecoded);
  }
  uint framesDecoded()() {
    return Object_Getter__uint(this._parent, "framesDecoded");
  }
  void framesDropped()(uint framesDropped) {
    Object_Call_uint__void(this._parent, "framesDropped", framesDropped);
  }
  uint framesDropped()() {
    return Object_Getter__uint(this._parent, "framesDropped");
  }
  void framesCorrupted()(uint framesCorrupted) {
    Object_Call_uint__void(this._parent, "framesCorrupted", framesCorrupted);
  }
  uint framesCorrupted()() {
    return Object_Getter__uint(this._parent, "framesCorrupted");
  }
  void audioLevel()(double audioLevel) {
    Object_Call_double__void(this._parent, "audioLevel", audioLevel);
  }
  double audioLevel()() {
    return Object_Getter__double(this._parent, "audioLevel");
  }
  void echoReturnLoss()(double echoReturnLoss) {
    Object_Call_double__void(this._parent, "echoReturnLoss", echoReturnLoss);
  }
  double echoReturnLoss()() {
    return Object_Getter__double(this._parent, "echoReturnLoss");
  }
  void echoReturnLossEnhancement()(double echoReturnLossEnhancement) {
    Object_Call_double__void(this._parent, "echoReturnLossEnhancement", echoReturnLossEnhancement);
  }
  double echoReturnLossEnhancement()() {
    return Object_Getter__double(this._parent, "echoReturnLossEnhancement");
  }
}
struct RTCOutboundRTPStreamStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCRtpStreamStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCRtpStreamStats(h);
  }
  static auto create() {
    return RTCOutboundRTPStreamStats(libwasm_add__object());
  }
  void packetsSent()(uint packetsSent) {
    Object_Call_uint__void(this._parent, "packetsSent", packetsSent);
  }
  uint packetsSent()() {
    return Object_Getter__uint(this._parent, "packetsSent");
  }
  void bytesSent()(uint bytesSent) {
    Object_Call_uint__void(this._parent, "bytesSent", bytesSent);
  }
  uint bytesSent()() {
    return Object_Getter__uint(this._parent, "bytesSent");
  }
  void targetBitrate()(double targetBitrate) {
    Object_Call_double__void(this._parent, "targetBitrate", targetBitrate);
  }
  double targetBitrate()() {
    return Object_Getter__double(this._parent, "targetBitrate");
  }
  void droppedFrames()(uint droppedFrames) {
    Object_Call_uint__void(this._parent, "droppedFrames", droppedFrames);
  }
  uint droppedFrames()() {
    return Object_Getter__uint(this._parent, "droppedFrames");
  }
  void framesEncoded()(uint framesEncoded) {
    Object_Call_uint__void(this._parent, "framesEncoded", framesEncoded);
  }
  uint framesEncoded()() {
    return Object_Getter__uint(this._parent, "framesEncoded");
  }
}
struct RTCRTPContributingSourceStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCRTPContributingSourceStats(libwasm_add__object());
  }
  void contributorSsrc()(uint contributorSsrc) {
    Object_Call_uint__void(this._parent, "contributorSsrc", contributorSsrc);
  }
  uint contributorSsrc()() {
    return Object_Getter__uint(this._parent, "contributorSsrc");
  }
  void inboundRtpStreamId()(string inboundRtpStreamId) {
    Object_Call_string__void(this._parent, "inboundRtpStreamId", inboundRtpStreamId);
  }
  string inboundRtpStreamId()() {
    return Object_Getter__string(this._parent, "inboundRtpStreamId");
  }
}
struct RTCRtpStreamStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCRtpStreamStats(libwasm_add__object());
  }
  void ssrc()(uint ssrc) {
    Object_Call_uint__void(this._parent, "ssrc", ssrc);
  }
  uint ssrc()() {
    return Object_Getter__uint(this._parent, "ssrc");
  }
  void mediaType()(string mediaType) {
    Object_Call_string__void(this._parent, "mediaType", mediaType);
  }
  string mediaType()() {
    return Object_Getter__string(this._parent, "mediaType");
  }
  void kind()(string kind) {
    Object_Call_string__void(this._parent, "kind", kind);
  }
  string kind()() {
    return Object_Getter__string(this._parent, "kind");
  }
  void transportId()(string transportId) {
    Object_Call_string__void(this._parent, "transportId", transportId);
  }
  string transportId()() {
    return Object_Getter__string(this._parent, "transportId");
  }
  void codecId()(string codecId) {
    Object_Call_string__void(this._parent, "codecId", codecId);
  }
  string codecId()() {
    return Object_Getter__string(this._parent, "codecId");
  }
  void firCount()(uint firCount) {
    Object_Call_uint__void(this._parent, "firCount", firCount);
  }
  uint firCount()() {
    return Object_Getter__uint(this._parent, "firCount");
  }
  void pliCount()(uint pliCount) {
    Object_Call_uint__void(this._parent, "pliCount", pliCount);
  }
  uint pliCount()() {
    return Object_Getter__uint(this._parent, "pliCount");
  }
  void nackCount()(uint nackCount) {
    Object_Call_uint__void(this._parent, "nackCount", nackCount);
  }
  uint nackCount()() {
    return Object_Getter__uint(this._parent, "nackCount");
  }
  void qpSum()(uint qpSum) {
    Object_Call_uint__void(this._parent, "qpSum", qpSum);
  }
  uint qpSum()() {
    return Object_Getter__uint(this._parent, "qpSum");
  }
  void remoteId()(string remoteId) {
    Object_Call_string__void(this._parent, "remoteId", remoteId);
  }
  string remoteId()() {
    return Object_Getter__string(this._parent, "remoteId");
  }
  void localId()(string localId) {
    Object_Call_string__void(this._parent, "localId", localId);
  }
  string localId()() {
    return Object_Getter__string(this._parent, "localId");
  }
  void mediaTrackId()(string mediaTrackId) {
    Object_Call_string__void(this._parent, "mediaTrackId", mediaTrackId);
  }
  string mediaTrackId()() {
    return Object_Getter__string(this._parent, "mediaTrackId");
  }
  void bitrateMean()(double bitrateMean) {
    Object_Call_double__void(this._parent, "bitrateMean", bitrateMean);
  }
  double bitrateMean()() {
    return Object_Getter__double(this._parent, "bitrateMean");
  }
  void bitrateStdDev()(double bitrateStdDev) {
    Object_Call_double__void(this._parent, "bitrateStdDev", bitrateStdDev);
  }
  double bitrateStdDev()() {
    return Object_Getter__double(this._parent, "bitrateStdDev");
  }
  void framerateMean()(double framerateMean) {
    Object_Call_double__void(this._parent, "framerateMean", framerateMean);
  }
  double framerateMean()() {
    return Object_Getter__double(this._parent, "framerateMean");
  }
  void framerateStdDev()(double framerateStdDev) {
    Object_Call_double__void(this._parent, "framerateStdDev", framerateStdDev);
  }
  double framerateStdDev()() {
    return Object_Getter__double(this._parent, "framerateStdDev");
  }
}
struct RTCStats {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCStats(libwasm_add__object());
  }
  void timestamp()(double timestamp) {
    Object_Call_double__void(this.handle, "timestamp", timestamp);
  }
  double timestamp()() {
    return Object_Getter__double(this.handle, "timestamp");
  }
  void type()(RTCStatsType type) {
    Object_Call_int__void(this.handle, "type", type);
  }
  RTCStatsType type()() {
    return Object_Getter__int(this.handle, "type");
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
}
enum RTCStatsIceCandidatePairState {
  frozen,
  waiting,
  inprogress,
  failed,
  succeeded,
  cancelled
}
struct RTCStatsReport {
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
  Iterator!(ArrayPair!(string, JsObject)) entries() {
    return Iterator!(ArrayPair!(string, JsObject))(Maplike_string_Handle_entries(this.handle));
  }
  extern(C) void forEach(void delegate(string, Handle, Handle) callback) {
    Maplike_string_Handle_forEach(this.handle, callback);
  }
  JsObject get(string key) {
    return JsObject(Maplike_string_Handle_get(this.handle, key));
  }
  bool has(string key) {
    return Maplike_string_Handle_has(this.handle, key);
  }
  Iterator!(string) keys() {
    return Iterator!(string)(Maplike_string_Handle_keys(this.handle));
  }
  void set(string key, scope ref JsObject value) {
    Maplike_string_Handle_set(this.handle, key, value.handle);
  }
  Iterator!(JsObject) values() {
    return Iterator!(JsObject)(Maplike_string_Handle_values(this.handle));
  }
  string mozPcid()() {
    return Object_Getter__string(this.handle, "mozPcid");
  }
}
struct RTCStatsReportInternal {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCStatsReportInternal(libwasm_add__object());
  }
  void pcid()(string pcid) {
    Object_Call_string__void(this.handle, "pcid", pcid);
  }
  string pcid()() {
    return Object_Getter__string(this.handle, "pcid");
  }
  void inboundRTPStreamStats()(scope ref Sequence!(RTCInboundRTPStreamStats) inboundRTPStreamStats) {
    Object_Call_Handle__void(this.handle, "inboundRTPStreamStats", inboundRTPStreamStats.handle);
  }
  auto inboundRTPStreamStats()() {
    return Sequence!(RTCInboundRTPStreamStats)(Object_Getter__Handle(this.handle, "inboundRTPStreamStats"));
  }
  void outboundRTPStreamStats()(scope ref Sequence!(RTCOutboundRTPStreamStats) outboundRTPStreamStats) {
    Object_Call_Handle__void(this.handle, "outboundRTPStreamStats", outboundRTPStreamStats.handle);
  }
  auto outboundRTPStreamStats()() {
    return Sequence!(RTCOutboundRTPStreamStats)(Object_Getter__Handle(this.handle, "outboundRTPStreamStats"));
  }
  void rtpContributingSourceStats()(scope ref Sequence!(RTCRTPContributingSourceStats) rtpContributingSourceStats) {
    Object_Call_Handle__void(this.handle, "rtpContributingSourceStats", rtpContributingSourceStats.handle);
  }
  auto rtpContributingSourceStats()() {
    return Sequence!(RTCRTPContributingSourceStats)(Object_Getter__Handle(this.handle, "rtpContributingSourceStats"));
  }
  void mediaStreamTrackStats()(scope ref Sequence!(RTCMediaStreamTrackStats) mediaStreamTrackStats) {
    Object_Call_Handle__void(this.handle, "mediaStreamTrackStats", mediaStreamTrackStats.handle);
  }
  auto mediaStreamTrackStats()() {
    return Sequence!(RTCMediaStreamTrackStats)(Object_Getter__Handle(this.handle, "mediaStreamTrackStats"));
  }
  void mediaStreamStats()(scope ref Sequence!(RTCMediaStreamStats) mediaStreamStats) {
    Object_Call_Handle__void(this.handle, "mediaStreamStats", mediaStreamStats.handle);
  }
  auto mediaStreamStats()() {
    return Sequence!(RTCMediaStreamStats)(Object_Getter__Handle(this.handle, "mediaStreamStats"));
  }
  void transportStats()(scope ref Sequence!(RTCTransportStats) transportStats) {
    Object_Call_Handle__void(this.handle, "transportStats", transportStats.handle);
  }
  auto transportStats()() {
    return Sequence!(RTCTransportStats)(Object_Getter__Handle(this.handle, "transportStats"));
  }
  void iceComponentStats()(scope ref Sequence!(RTCIceComponentStats) iceComponentStats) {
    Object_Call_Handle__void(this.handle, "iceComponentStats", iceComponentStats.handle);
  }
  auto iceComponentStats()() {
    return Sequence!(RTCIceComponentStats)(Object_Getter__Handle(this.handle, "iceComponentStats"));
  }
  void iceCandidatePairStats()(scope ref Sequence!(RTCIceCandidatePairStats) iceCandidatePairStats) {
    Object_Call_Handle__void(this.handle, "iceCandidatePairStats", iceCandidatePairStats.handle);
  }
  auto iceCandidatePairStats()() {
    return Sequence!(RTCIceCandidatePairStats)(Object_Getter__Handle(this.handle, "iceCandidatePairStats"));
  }
  void iceCandidateStats()(scope ref Sequence!(RTCIceCandidateStats) iceCandidateStats) {
    Object_Call_Handle__void(this.handle, "iceCandidateStats", iceCandidateStats.handle);
  }
  auto iceCandidateStats()() {
    return Sequence!(RTCIceCandidateStats)(Object_Getter__Handle(this.handle, "iceCandidateStats"));
  }
  void codecStats()(scope ref Sequence!(RTCCodecStats) codecStats) {
    Object_Call_Handle__void(this.handle, "codecStats", codecStats.handle);
  }
  auto codecStats()() {
    return Sequence!(RTCCodecStats)(Object_Getter__Handle(this.handle, "codecStats"));
  }
  void localSdp()(string localSdp) {
    Object_Call_string__void(this.handle, "localSdp", localSdp);
  }
  string localSdp()() {
    return Object_Getter__string(this.handle, "localSdp");
  }
  void remoteSdp()(string remoteSdp) {
    Object_Call_string__void(this.handle, "remoteSdp", remoteSdp);
  }
  string remoteSdp()() {
    return Object_Getter__string(this.handle, "remoteSdp");
  }
  void timestamp()(double timestamp) {
    Object_Call_double__void(this.handle, "timestamp", timestamp);
  }
  double timestamp()() {
    return Object_Getter__double(this.handle, "timestamp");
  }
  void iceRestarts()(uint iceRestarts) {
    Object_Call_uint__void(this.handle, "iceRestarts", iceRestarts);
  }
  uint iceRestarts()() {
    return Object_Getter__uint(this.handle, "iceRestarts");
  }
  void iceRollbacks()(uint iceRollbacks) {
    Object_Call_uint__void(this.handle, "iceRollbacks", iceRollbacks);
  }
  uint iceRollbacks()() {
    return Object_Getter__uint(this.handle, "iceRollbacks");
  }
  void offerer()(bool offerer) {
    Object_Call_bool__void(this.handle, "offerer", offerer);
  }
  bool offerer()() {
    return Object_Getter__bool(this.handle, "offerer");
  }
  void closed()(bool closed) {
    Object_Call_bool__void(this.handle, "closed", closed);
  }
  bool closed()() {
    return Object_Getter__bool(this.handle, "closed");
  }
  void trickledIceCandidateStats()(scope ref Sequence!(RTCIceCandidateStats) trickledIceCandidateStats) {
    Object_Call_Handle__void(this.handle, "trickledIceCandidateStats", trickledIceCandidateStats.handle);
  }
  auto trickledIceCandidateStats()() {
    return Sequence!(RTCIceCandidateStats)(Object_Getter__Handle(this.handle, "trickledIceCandidateStats"));
  }
  void rawLocalCandidates()(scope ref Sequence!(string) rawLocalCandidates) {
    Object_Call_Handle__void(this.handle, "rawLocalCandidates", rawLocalCandidates.handle);
  }
  auto rawLocalCandidates()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "rawLocalCandidates"));
  }
  void rawRemoteCandidates()(scope ref Sequence!(string) rawRemoteCandidates) {
    Object_Call_Handle__void(this.handle, "rawRemoteCandidates", rawRemoteCandidates.handle);
  }
  auto rawRemoteCandidates()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "rawRemoteCandidates"));
  }
}
enum RTCStatsType {
  inbound_rtp,
  outbound_rtp,
  remote_inbound_rtp,
  remote_outbound_rtp,
  csrc,
  session,
  track,
  transport,
  candidate_pair,
  local_candidate,
  remote_candidate
}
struct RTCTransportStats {
  nothrow:
  libwasm.bindings.RTCStatsReport.RTCStats _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCStats(h);
  }
  static auto create() {
    return RTCTransportStats(libwasm_add__object());
  }
  void bytesSent()(uint bytesSent) {
    Object_Call_uint__void(this._parent, "bytesSent", bytesSent);
  }
  uint bytesSent()() {
    return Object_Getter__uint(this._parent, "bytesSent");
  }
  void bytesReceived()(uint bytesReceived) {
    Object_Call_uint__void(this._parent, "bytesReceived", bytesReceived);
  }
  uint bytesReceived()() {
    return Object_Getter__uint(this._parent, "bytesReceived");
  }
}


extern (C) uint Maplike_string_Handle_size(Handle);
extern (C) void Maplike_string_Handle_clear(Handle);
extern (C) void Maplike_string_Handle_delete(Handle, string key);
extern (C) Handle Maplike_string_Handle_entries(Handle);
extern (C) void Maplike_string_Handle_forEach(Handle, void delegate(string, Handle, Handle));
extern (C) JsObject Maplike_string_Handle_get(Handle, string);
extern (C) bool Maplike_string_Handle_has(Handle, string);
extern (C) Handle Maplike_string_Handle_keys(Handle);
extern (C) void Maplike_string_Handle_set(Handle, string key, Handle value);
extern (C) Handle Maplike_string_Handle_values(Handle);