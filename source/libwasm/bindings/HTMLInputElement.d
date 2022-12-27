module libwasm.bindings.HTMLInputElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.AutocompleteInfo;
import libwasm.bindings.Directory;
import libwasm.bindings.Element;
import libwasm.bindings.File;
import libwasm.bindings.FileList;
import libwasm.bindings.FileSystemEntry;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;
import libwasm.bindings.HTMLImageElement;
import libwasm.bindings.NodeList;
import libwasm.bindings.ValidityState;

@safe:
nothrow:

struct DateTimeValue {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DateTimeValue(libwasm_add__object());
  }
  void hour()(int hour) {
    Object_Call_int__void(this.handle, "hour", hour);
  }
  int hour()() {
    return Object_Getter__int(this.handle, "hour");
  }
  void minute()(int minute) {
    Object_Call_int__void(this.handle, "minute", minute);
  }
  int minute()() {
    return Object_Getter__int(this.handle, "minute");
  }
  void year()(int year) {
    Object_Call_int__void(this.handle, "year", year);
  }
  int year()() {
    return Object_Getter__int(this.handle, "year");
  }
  void month()(int month) {
    Object_Call_int__void(this.handle, "month", month);
  }
  int month()() {
    return Object_Getter__int(this.handle, "month");
  }
  void day()(int day) {
    Object_Call_int__void(this.handle, "day", day);
  }
  int day()() {
    return Object_Getter__int(this.handle, "day");
  }
}
struct HTMLInputElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void accept()(string accept) {
    Object_Call_string__void(this._parent, "accept", accept);
  }
  string accept()() {
    return Object_Getter__string(this._parent, "accept");
  }
  void alt()(string alt) {
    Object_Call_string__void(this._parent, "alt", alt);
  }
  string alt()() {
    return Object_Getter__string(this._parent, "alt");
  }
  void autocomplete()(string autocomplete) {
    Object_Call_string__void(this._parent, "autocomplete", autocomplete);
  }
  string autocomplete()() {
    return Object_Getter__string(this._parent, "autocomplete");
  }
  void autofocus()(bool autofocus) {
    Object_Call_bool__void(this._parent, "autofocus", autofocus);
  }
  bool autofocus()() {
    return Object_Getter__bool(this._parent, "autofocus");
  }
  void defaultChecked()(bool defaultChecked) {
    Object_Call_bool__void(this._parent, "defaultChecked", defaultChecked);
  }
  bool defaultChecked()() {
    return Object_Getter__bool(this._parent, "defaultChecked");
  }
  void checked()(bool checked) {
    Object_Call_bool__void(this._parent, "checked", checked);
  }
  bool checked()() {
    return Object_Getter__bool(this._parent, "checked");
  }
  void disabled()(bool disabled) {
    Object_Call_bool__void(this._parent, "disabled", disabled);
  }
  bool disabled()() {
    return Object_Getter__bool(this._parent, "disabled");
  }
  auto form()() {
    return recastOpt!(HTMLFormElement)(Object_Getter__OptionalHandle(this._parent, "form"));
  }
  void files(T0)(scope auto ref Optional!(T0) files) if (isTOrPointer!(T0, FileList)) {
    Serialize_Object_VarArgCall!void(this._parent, "files", "Optional!Handle", tuple(!files.empty, cast(Handle)files.front.handle));
  }
  auto files()() {
    return recastOpt!(FileList)(Object_Getter__OptionalHandle(this._parent, "files"));
  }
  void formAction()(string formAction) {
    Object_Call_string__void(this._parent, "formAction", formAction);
  }
  string formAction()() {
    return Object_Getter__string(this._parent, "formAction");
  }
  void formEnctype()(string formEnctype) {
    Object_Call_string__void(this._parent, "formEnctype", formEnctype);
  }
  string formEnctype()() {
    return Object_Getter__string(this._parent, "formEnctype");
  }
  void formMethod()(string formMethod) {
    Object_Call_string__void(this._parent, "formMethod", formMethod);
  }
  string formMethod()() {
    return Object_Getter__string(this._parent, "formMethod");
  }
  void formNoValidate()(bool formNoValidate) {
    Object_Call_bool__void(this._parent, "formNoValidate", formNoValidate);
  }
  bool formNoValidate()() {
    return Object_Getter__bool(this._parent, "formNoValidate");
  }
  void formTarget()(string formTarget) {
    Object_Call_string__void(this._parent, "formTarget", formTarget);
  }
  string formTarget()() {
    return Object_Getter__string(this._parent, "formTarget");
  }
  void height()(uint height) {
    Object_Call_uint__void(this._parent, "height", height);
  }
  uint height()() {
    return Object_Getter__uint(this._parent, "height");
  }
  void indeterminate()(bool indeterminate) {
    Object_Call_bool__void(this._parent, "indeterminate", indeterminate);
  }
  bool indeterminate()() {
    return Object_Getter__bool(this._parent, "indeterminate");
  }
  void inputMode()(string inputMode) {
    Object_Call_string__void(this._parent, "inputMode", inputMode);
  }
  string inputMode()() {
    return Object_Getter__string(this._parent, "inputMode");
  }
  auto list()() {
    return recastOpt!(HTMLElement)(Object_Getter__OptionalHandle(this._parent, "list"));
  }
  void max()(string max) {
    Object_Call_string__void(this._parent, "max", max);
  }
  string max()() {
    return Object_Getter__string(this._parent, "max");
  }
  void maxLength()(int maxLength) {
    Object_Call_int__void(this._parent, "maxLength", maxLength);
  }
  int maxLength()() {
    return Object_Getter__int(this._parent, "maxLength");
  }
  void min()(string min) {
    Object_Call_string__void(this._parent, "min", min);
  }
  string min()() {
    return Object_Getter__string(this._parent, "min");
  }
  void minLength()(int minLength) {
    Object_Call_int__void(this._parent, "minLength", minLength);
  }
  int minLength()() {
    return Object_Getter__int(this._parent, "minLength");
  }
  void multiple()(bool multiple) {
    Object_Call_bool__void(this._parent, "multiple", multiple);
  }
  bool multiple()() {
    return Object_Getter__bool(this._parent, "multiple");
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void pattern()(string pattern) {
    Object_Call_string__void(this._parent, "pattern", pattern);
  }
  string pattern()() {
    return Object_Getter__string(this._parent, "pattern");
  }
  void placeholder()(string placeholder) {
    Object_Call_string__void(this._parent, "placeholder", placeholder);
  }
  string placeholder()() {
    return Object_Getter__string(this._parent, "placeholder");
  }
  void readOnly()(bool readOnly) {
    Object_Call_bool__void(this._parent, "readOnly", readOnly);
  }
  bool readOnly()() {
    return Object_Getter__bool(this._parent, "readOnly");
  }
  void required()(bool required) {
    Object_Call_bool__void(this._parent, "required", required);
  }
  bool required()() {
    return Object_Getter__bool(this._parent, "required");
  }
  void size()(uint size) {
    Object_Call_uint__void(this._parent, "size", size);
  }
  uint size()() {
    return Object_Getter__uint(this._parent, "size");
  }
  void src()(string src) {
    Object_Call_string__void(this._parent, "src", src);
  }
  string src()() {
    return Object_Getter__string(this._parent, "src");
  }
  void step()(string step) {
    Object_Call_string__void(this._parent, "step", step);
  }
  string step()() {
    return Object_Getter__string(this._parent, "step");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void defaultValue()(string defaultValue) {
    Object_Call_string__void(this._parent, "defaultValue", defaultValue);
  }
  string defaultValue()() {
    return Object_Getter__string(this._parent, "defaultValue");
  }
  void value()(string value) {
    Object_Call_string__void(this._parent, "value", value);
  }
  string value()() {
    return Object_Getter__string(this._parent, "value");
  }
  void valueAsDate(T0)(scope auto ref Optional!(T0) valueAsDate) if (isTOrPointer!(T0, Date)) {
    Serialize_Object_VarArgCall!void(this._parent, "valueAsDate", "Optional!Handle", tuple(!valueAsDate.empty, cast(Handle)valueAsDate.front.handle));
  }
  auto valueAsDate()() {
    return recastOpt!(Date)(Object_Getter__OptionalHandle(this._parent, "valueAsDate"));
  }
  void valueAsNumber()(double valueAsNumber) {
    Object_Call_double__void(this._parent, "valueAsNumber", valueAsNumber);
  }
  double valueAsNumber()() {
    return Object_Getter__double(this._parent, "valueAsNumber");
  }
  void width()(uint width) {
    Object_Call_uint__void(this._parent, "width", width);
  }
  uint width()() {
    return Object_Getter__uint(this._parent, "width");
  }
  void stepUp()(int n /* = 1 */) {
    Object_Call_int__void(this._parent, "stepUp", n);
  }
  void stepUp()() {
    Object_Call__void(this._parent, "stepUp");
  }
  void stepDown()(int n /* = 1 */) {
    Object_Call_int__void(this._parent, "stepDown", n);
  }
  void stepDown()() {
    Object_Call__void(this._parent, "stepDown");
  }
  bool willValidate()() {
    return Object_Getter__bool(this._parent, "willValidate");
  }
  auto validity()() {
    return ValidityState(Object_Getter__Handle(this._parent, "validity"));
  }
  string validationMessage()() {
    return Object_Getter__string(this._parent, "validationMessage");
  }
  bool checkValidity()() {
    return Object_Getter__bool(this._parent, "checkValidity");
  }
  bool reportValidity()() {
    return Object_Getter__bool(this._parent, "reportValidity");
  }
  void setCustomValidity()(string error) {
    Object_Call_string__void(this._parent, "setCustomValidity", error);
  }
  auto labels()() {
    return recastOpt!(NodeList)(Object_Getter__OptionalHandle(this._parent, "labels"));
  }
  void select()() {
    Object_Call__void(this._parent, "select");
  }
  void selectionStart(T0)(scope auto ref Optional!(T0) selectionStart) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this._parent, "selectionStart", "Optional!(uint)", tuple(!selectionStart.empty, selectionStart.front));
  }
  Optional!(uint) selectionStart()() {
    return Object_Getter__OptionalUint(this._parent, "selectionStart");
  }
  void selectionEnd(T0)(scope auto ref Optional!(T0) selectionEnd) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this._parent, "selectionEnd", "Optional!(uint)", tuple(!selectionEnd.empty, selectionEnd.front));
  }
  Optional!(uint) selectionEnd()() {
    return Object_Getter__OptionalUint(this._parent, "selectionEnd");
  }
  void selectionDirection(T0)(scope auto ref Optional!(T0) selectionDirection) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "selectionDirection", "Optional!(string)", tuple(!selectionDirection.empty, selectionDirection.front));
  }
  Optional!(string) selectionDirection()() {
    return Object_Getter__OptionalString(this._parent, "selectionDirection");
  }
  void setRangeText()(string replacement) {
    Object_Call_string__void(this._parent, "setRangeText", replacement);
  }
  void setRangeText()(string replacement, uint start, uint end, SelectionMode selectionMode /* = "preserve" */) {
    Serialize_Object_VarArgCall!void(this._parent, "setRangeText", "string;uint;uint;Enum", tuple(replacement, start, end, selectionMode));
  }
  void setRangeText()(string replacement, uint start, uint end) {
    Serialize_Object_VarArgCall!void(this._parent, "setRangeText", "string;uint;uint", tuple(replacement, start, end));
  }
  void setSelectionRange()(uint start, uint end, string direction) {
    Serialize_Object_VarArgCall!void(this._parent, "setSelectionRange", "uint;uint;string", tuple(start, end, direction));
  }
  void setSelectionRange()(uint start, uint end) {
    Serialize_Object_VarArgCall!void(this._parent, "setSelectionRange", "uint;uint", tuple(start, end));
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
  void useMap()(string useMap) {
    Object_Call_string__void(this._parent, "useMap", useMap);
  }
  string useMap()() {
    return Object_Getter__string(this._parent, "useMap");
  }
  auto controllers()() {
    return XULControllers(Object_Getter__Handle(this._parent, "controllers"));
  }
  int textLength()() {
    return Object_Getter__int(this._parent, "textLength");
  }
  auto mozGetFileNameArray()() {
    return Sequence!(string)(Object_Getter__Handle(this._parent, "mozGetFileNameArray"));
  }
  void mozSetFileNameArray()(scope ref Sequence!(string) fileNames) {
    Object_Call_Handle__void(this._parent, "mozSetFileNameArray", fileNames.handle);
  }
  void mozSetFileArray()(scope ref Sequence!(File) files) {
    Object_Call_Handle__void(this._parent, "mozSetFileArray", files.handle);
  }
  void mozSetDirectory()(string directoryPath) {
    Object_Call_string__void(this._parent, "mozSetDirectory", directoryPath);
  }
  void mozSetDndFilesAndDirectories()(scope ref Sequence!(SumType!(File, Directory)) list) {
    Object_Call_Handle__void(this._parent, "mozSetDndFilesAndDirectories", list.handle);
  }
  auto ownerNumberControl()() {
    return recastOpt!(HTMLInputElement)(Object_Getter__OptionalHandle(this._parent, "ownerNumberControl"));
  }
  bool mozIsTextField()(bool aExcludePassword) {
    return Serialize_Object_VarArgCall!bool(this._parent, "mozIsTextField", "bool", tuple(aExcludePassword));
  }
  bool hasBeenTypePassword()() {
    return Object_Getter__bool(this._parent, "hasBeenTypePassword");
  }
  void previewValue()(string previewValue) {
    Object_Call_string__void(this._parent, "previewValue", previewValue);
  }
  string previewValue()() {
    return Object_Getter__string(this._parent, "previewValue");
  }
  auto getAutocompleteInfo()() {
    return recastOpt!(AutocompleteInfo)(Object_Getter__OptionalHandle(this._parent, "getAutocompleteInfo"));
  }
  void allowdirs()(bool allowdirs) {
    Object_Call_bool__void(this._parent, "allowdirs", allowdirs);
  }
  bool allowdirs()() {
    return Object_Getter__bool(this._parent, "allowdirs");
  }
  bool isFilesAndDirectoriesSupported()() {
    return Object_Getter__bool(this._parent, "isFilesAndDirectoriesSupported");
  }
  auto getFilesAndDirectories()() {
    return JsPromise!(Sequence!(SumType!(File, Directory)))(Object_Getter__Handle(this._parent, "getFilesAndDirectories"));
  }
  auto getFiles()(bool recursiveFlag /* = false */) {
    return JsPromise!(Sequence!(File))(Object_Call_bool__Handle(this._parent, "getFiles", recursiveFlag));
  }
  auto getFiles()() {
    return JsPromise!(Sequence!(File))(Object_Getter__Handle(this._parent, "getFiles"));
  }
  void chooseDirectory()() {
    Object_Call__void(this._parent, "chooseDirectory");
  }
  auto webkitEntries()() {
    return Sequence!(FileSystemEntry)(Object_Getter__Handle(this._parent, "webkitEntries"));
  }
  void webkitdirectory()(bool webkitdirectory) {
    Object_Call_bool__void(this._parent, "webkitdirectory", webkitdirectory);
  }
  bool webkitdirectory()() {
    return Object_Getter__bool(this._parent, "webkitdirectory");
  }
  auto getDateTimeInputBoxValue()() {
    return DateTimeValue(Object_Getter__Handle(this._parent, "getDateTimeInputBoxValue"));
  }
  auto dateTimeBoxElement()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "dateTimeBoxElement"));
  }
  double getMinimum()() {
    return Object_Getter__double(this._parent, "getMinimum");
  }
  double getMaximum()() {
    return Object_Getter__double(this._parent, "getMaximum");
  }
  void openDateTimePicker()(scope ref DateTimeValue initialValue) {
    Object_Call_Handle__void(this._parent, "openDateTimePicker", initialValue.handle);
  }
  void openDateTimePicker()() {
    Object_Call__void(this._parent, "openDateTimePicker");
  }
  void updateDateTimePicker()(scope ref DateTimeValue value) {
    Object_Call_Handle__void(this._parent, "updateDateTimePicker", value.handle);
  }
  void updateDateTimePicker()() {
    Object_Call__void(this._parent, "updateDateTimePicker");
  }
  void closeDateTimePicker()() {
    Object_Call__void(this._parent, "closeDateTimePicker");
  }
  void setFocusState()(bool aIsFocused) {
    Object_Call_bool__void(this._parent, "setFocusState", aIsFocused);
  }
  void updateValidityState()() {
    Object_Call__void(this._parent, "updateValidityState");
  }
  double getStep()() {
    return Object_Getter__double(this._parent, "getStep");
  }
  double getStepBase()() {
    return Object_Getter__double(this._parent, "getStepBase");
  }
  auto editor()() {
    return recastOpt!(nsIEditor)(Object_Getter__OptionalHandle(this._parent, "editor"));
  }
  bool isInputEventTarget()() {
    return Object_Getter__bool(this._parent, "isInputEventTarget");
  }
  void setUserInput()(string input) {
    Object_Call_string__void(this._parent, "setUserInput", input);
  }
  enum int UNKNOWN_REQUEST = -1;
  enum int CURRENT_REQUEST = 0;
  enum int PENDING_REQUEST = 1;
  void loadingEnabled()(bool loadingEnabled) {
    Object_Call_bool__void(this._parent, "loadingEnabled", loadingEnabled);
  }
  bool loadingEnabled()() {
    return Object_Getter__bool(this._parent, "loadingEnabled");
  }
  short imageBlockingStatus()() {
    return Serialize_Object_VarArgCall!short(this._parent, "imageBlockingStatus", "", tuple());
  }
  void addObserver()(scope ref imgINotificationObserver aObserver) {
    Object_Call_Handle__void(this._parent, "addObserver", aObserver.handle);
  }
  void removeObserver()(scope ref imgINotificationObserver aObserver) {
    Object_Call_Handle__void(this._parent, "removeObserver", aObserver.handle);
  }
  auto getRequest()(int aRequestType) {
    return recastOpt!(imgIRequest)(Object_Call_int__OptionalHandle(this._parent, "getRequest", aRequestType));
  }
  int getRequestType()(scope ref imgIRequest aRequest) {
    return Serialize_Object_VarArgCall!int(this._parent, "getRequestType", "Handle", tuple(cast(Handle)aRequest.handle));
  }
  auto currentURI()() {
    return recastOpt!(URI)(Object_Getter__OptionalHandle(this._parent, "currentURI"));
  }
  auto currentRequestFinalURI()() {
    return recastOpt!(URI)(Object_Getter__OptionalHandle(this._parent, "currentRequestFinalURI"));
  }
  void forceReload()(bool aNotify /* = true */) {
    Object_Call_bool__void(this._parent, "forceReload", aNotify);
  }
  void forceReload()() {
    Object_Call__void(this._parent, "forceReload");
  }
  void forceImageState()(bool aForce, uint aState) {
    Serialize_Object_VarArgCall!void(this._parent, "forceImageState", "bool;uint", tuple(aForce, aState));
  }
}
struct MozEditableElement {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto editor()() {
    return recastOpt!(nsIEditor)(Object_Getter__OptionalHandle(this.handle, "editor"));
  }
  bool isInputEventTarget()() {
    return Object_Getter__bool(this.handle, "isInputEventTarget");
  }
  void setUserInput()(string input) {
    Object_Call_string__void(this.handle, "setUserInput", input);
  }
}
enum SelectionMode {
  select,
  start,
  end,
  preserve
}


