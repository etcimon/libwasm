module spasm.bindings.VideoPlaybackQuality;

import spasm.types;
import spasm.bindings.Performance;

@safe:
nothrow:

struct VideoPlaybackQuality {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double creationTime()() {
    return Object_Getter__double(this.handle, "creationTime");
  }
  uint totalVideoFrames()() {
    return Object_Getter__uint(this.handle, "totalVideoFrames");
  }
  uint droppedVideoFrames()() {
    return Object_Getter__uint(this.handle, "droppedVideoFrames");
  }
  uint corruptedVideoFrames()() {
    return Object_Getter__uint(this.handle, "corruptedVideoFrames");
  }
}


