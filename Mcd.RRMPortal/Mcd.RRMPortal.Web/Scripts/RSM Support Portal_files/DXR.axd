var __aspxClassesScriptParsed = false;
var __aspxDocumentLoaded = false; 
ASPxClientEvent = _aspxCreateClass(null, {
 constructor: function() {
  this.handlerInfoList = [];
 },
 AddHandler: function(handler, executionContext) {
  if(typeof(executionContext) == "undefined")
   executionContext = null;
  this.RemoveHandler(handler, executionContext);
  var handlerInfo = ASPxClientEvent.CreateHandlerInfo(handler, executionContext);
  this.handlerInfoList.push(handlerInfo);
 },
 RemoveHandler: function(handler, executionContext) {
  this.removeHandlerByCondition(function(handlerInfo) {
   return handlerInfo.handler == handler && 
    (!executionContext || handlerInfo.executionContext == executionContext);
  });
 },
 removeHandlerByCondition: function(predicate) {
   for(var i = this.handlerInfoList.length - 1; i >= 0; i--) {
   var handlerInfo = this.handlerInfoList[i];
   if(predicate(handlerInfo))
    _aspxArrayRemoveAt(this.handlerInfoList, i);
  }
 },
 removeHandlerByControlName: function(controlName) {
  this.removeHandlerByCondition(function(handlerInfo) {
   return handlerInfo.executionContext &&  
    handlerInfo.executionContext.name === controlName;
  });
 },
 ClearHandlers: function() {
  this.handlerInfoList.length = 0;
 },
 FireEvent: function(obj, args) {
  for(var i = 0; i < this.handlerInfoList.length; i++) {
   var handlerInfo = this.handlerInfoList[i];
   handlerInfo.handler.call(handlerInfo.executionContext, obj, args);
  }
 },
 InsertFirstHandler: function(handler, executionContext){
  if(typeof(executionContext) == "undefined")
   executionContext = null;
  var handlerInfo = ASPxClientEvent.CreateHandlerInfo(handler, executionContext);
  _aspxArrayInsert(this.handlerInfoList, handlerInfo, 0);
 },
 IsEmpty: function() {
  return this.handlerInfoList.length == 0;
 }
});
ASPxClientEvent.CreateHandlerInfo = function(handler, executionContext) {
 return {
  handler: handler,
  executionContext: executionContext
 };
};
ASPxClientEventArgs = _aspxCreateClass(null, {
 constructor: function() {
 }
});
ASPxClientEventArgs.Empty = new ASPxClientEventArgs();
ASPxClientCancelEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(){
  this.constructor.prototype.constructor.call(this);
  this.cancel = false;
 }
});
ASPxClientProcessingModeEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(processOnServer){
  this.constructor.prototype.constructor.call(this);
  this.processOnServer = processOnServer;
 }
});
ASPxClientProcessingModeCancelEventArgs = _aspxCreateClass(ASPxClientProcessingModeEventArgs, {
 constructor: function(processOnServer){
  this.constructor.prototype.constructor.call(this, processOnServer);
  this.cancel = false;
 }
});
ASPxClientBeginCallbackEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(command){
  this.constructor.prototype.constructor.call(this);
  this.command = command;
 }
});
ASPxClientEndCallbackEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(){
  this.constructor.prototype.constructor.call(this);
 }
});
ASPxClientCustomDataCallbackEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(result) {
  this.constructor.prototype.constructor.call(this);
  this.result = result;
 }
});
ASPxClientCallbackErrorEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(message){
  this.constructor.prototype.constructor.call(this);
  this.message = message;
  this.handled = false;
 }
});
ASPxClientControlsInitializedEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(isCallback) {
  this.isCallback = isCallback;
 }
});
ASPxClientAdaptiveLayoutChangingEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(){
  this.constructor.prototype.constructor.call(this);
  this.isAdaptiveView = false;
 }
});
ASPxClientControlCollection = _aspxCreateClass(null, {
 constructor: function(){
  this.elements = new Object();
  this.prevWndWidth = "";
  this.prevWndHeight = "";
  this.BeforeInitCallback = new ASPxClientEvent();
  this.ControlsInitialized = new ASPxClientEvent();
 },
 Add: function(element){
  this.elements[element.name] = element;
 },
 Remove: function(element) {
  this.elements[element.name] = null;
 },
 Get: function(name){
  return this.elements[name];
 },
 GetGlobal: function(name) {
  var result = window[name];
  return result && result.isASPxClientControl
   ? result
   : null;
 },
 GetByName: function(name){
  return this.Get(name) || this.GetGlobal(name);
 },
 ForEachControl: function(processFunc, context) {
  if(!context)
   context = this;
  for(var name in this.elements) {
   var control = this.elements[name];
   if(ASPxIdent.IsASPxClientControl(control))
    if(processFunc.call(context, control))
     return;
  }
 },
 forEachControlHierarchy: function(container, context, collapseControls, processFunc) {
  context = context || this;
  var controlTree = new ASPxClientControlTree(this, container);
  controlTree.forEachControl(collapseControls, function(control) {
   processFunc.call(context, control);
  });
 },
 AdjustControls: function(container, collapseControls) {
  container = container || null;
  window.setTimeout(function() {
   this.AdjustControlsCore(container, collapseControls);
  }.aspxBind(this), 0);
 },
 AdjustControlsCore: function(container, collapseControls) {
  this.forEachControlHierarchy(container, this, collapseControls, function(control) {
   control.AdjustControl();
  });
 },
 CollapseControls: function(container) {
  this.ProcessControlsInContainer(container, function(control) {
   if(control.isASPxClientEdit)
    control.CollapseEditor();
  });
 },
 AtlasInitialize: function(isCallback) {
  if(__aspxIE && __aspxBrowserMajorVersion < 9) {
   var func = function() {
    if(_aspxIsLinksLoaded())
     _aspxProcessScriptsAndLinks("", isCallback); 
    else
     setTimeout(func, 100);
   }   
   func();
  }
  else
   _aspxProcessScriptsAndLinks("", isCallback);
 },
 DOMContentLoaded: function() {
  this.ForEachControl(function(control){
    control.DOMContentLoaded();
  });
 },
 Initialize: function() {
  this.InitializeElements(false );
  if(typeof(Sys) != "undefined" && typeof(Sys.Application) != "undefined") {
   var checkIsInitialized = function() {
    if(Sys.Application.get_isInitialized())
     Sys.Application.add_load(aspxCAInit);
    else
     setTimeout(checkIsInitialized, 0);
   }
   checkIsInitialized();
  }
  this.InitWindowSizeCache();
 },
 InitializeElements: function(isCallback) {
  this.ForEachControl(function(control){
   if(!control.isInitialized)
    control.Initialize();
  });
  if(typeof(_aspxGetEditorStretchedInputElementsManager) != "undefined")
   _aspxGetEditorStretchedInputElementsManager().Initialize();
  this.AfterInitializeElements(true);
  this.AfterInitializeElements(false);
  this.RaiseControlsInitialized(isCallback);
 },
 AfterInitializeElements: function(leadingCall) {
  this.ForEachControl(function(control){
   if (control.leadingAfterInitCall && leadingCall || !control.leadingAfterInitCall && !leadingCall) {
    if(!control.isInitialized)
     control.AfterInitialize();
   }
  });
 },
 DoFinalizeCallback: function() {
  this.ForEachControl(function(control){
   control.DoFinalizeCallback();
  });
 },
 ProcessControlsInContainer: function(container, processFunc) {
  this.ForEachControl(function(control){
   if(!container || this.IsControlInContainer(container, control))
    processFunc(control);
  });
 },
 IsControlInContainer: function(container, control) {
  if(control.GetMainElement) {
   var mainElement = control.GetMainElement();
   if(mainElement && (mainElement != container)) {
    if(_aspxGetIsParent(container, mainElement))
     return true;
   }
  }
  return false;
 },
 RaiseControlsInitialized: function(isCallback) {
  if(!this.ControlsInitialized.IsEmpty()){
   if(typeof(isCallback) == "undefined")
    isCallback = true;
   var args = new ASPxClientControlsInitializedEventArgs(isCallback);
   this.ControlsInitialized.FireEvent(this, args);
  }
 },
 Before_WebForm_InitCallback: function(callbackOwnerID){
  var args = new ASPxClientBeforeInitCallbackEventArgs(callbackOwnerID);
  this.BeforeInitCallback.FireEvent(this, args);
 },
 InitWindowSizeCache: function(){
  this.prevWndWidth = _aspxGetDocumentClientWidth();
  this.prevWndHeight = _aspxGetDocumentClientHeight();
 },
 BrowserWindowSizeChanged: function(){
  var wndWidth = _aspxGetDocumentClientWidth();
  var wndHeight = _aspxGetDocumentClientHeight();
  var browserWindowSizeChanged = (this.prevWndWidth != wndWidth) || (this.prevWndHeight != wndHeight);
  if(browserWindowSizeChanged){
   this.prevWndWidth = wndWidth;
   this.prevWndHeight = wndHeight;
   return true;
  }
  return false;
 },
 OnBrowserWindowResize: function(evt){
  var shouldIgnoreNestedEvents = __aspxIE && __aspxBrowserMajorVersion == 8;
  if(shouldIgnoreNestedEvents) {
   if(this.prevWndWidth === "" || this.prevWndHeight === "" || this.browserWindowResizeLocked)
    return;
   this.browserWindowResizeLocked = true;
  }
  this.OnBrowserWindowResizeCore(evt);
  if(shouldIgnoreNestedEvents)
   this.browserWindowResizeLocked = false;
 },
 OnBrowserWindowResizeCore: function(evt){
  if(this.BrowserWindowSizeChanged()) {
   this.forEachControlHierarchy(null, this, true, function(control) {
    if(control.IsDOMInitialized())
     control.OnBrowserWindowResizeInternal(evt);
   });
  }
 }
});
ASPxClientControlTree = _aspxCreateClass(null, {
 constructor: function(controlCollection, container) {
  this.container = container;
  this.domMap = { };
  this.rootNode = this.createNode(null, null);
  this.createControlTree(controlCollection, container);
 },
 forEachControl: function(collapseControls, processFunc) {
  var observer = _aspxGetDomObserver();
  observer.pause(this.container, true);
  var documentScrollInfo;
  if(collapseControls) {
   documentScrollInfo = _aspxGetOuterScrollPosition(document.body);
   this.collapseControls(this.rootNode);
  }
  var adjustNodes = [], 
   autoHeightNodes = [];
  var requireReAdjust = this.forEachControlCore(this.rootNode, collapseControls, processFunc, adjustNodes, autoHeightNodes);
  if(requireReAdjust)
   this.forEachControlsBackward(adjustNodes, collapseControls, processFunc);
  else {
   for(var i = 0, node; node = autoHeightNodes[i]; i++)
    node.control.AdjustAutoHeight();
  }
  if(collapseControls)
   _aspxRestoreOuterScrollPosition(documentScrollInfo);
  observer.resume(this.container, true);
 },
 forEachControlCore: function(node, collapseControls, processFunc, adjustNodes, autoHeightNodes) {
  var requireReAdjust = false,
   size, newSize;
  if(node.control) {
   var checkReadjustment = collapseControls && node.control.IsControlCollapsed() && node.control.CanCauseReadjustment();
   if(checkReadjustment)
    size = node.control.GetControlPercentMarkerSize(false, true);
   if(node.control.IsControlCollapsed() && !node.control.IsExpandableByAdjustment())
    node.control.ExpandControl();
   processFunc(node.control);
   if(checkReadjustment) {
    newSize = node.control.GetControlPercentMarkerSize(false, true);
    requireReAdjust = size.width !== newSize.width;
   }
   if(node.control.sizingConfig.supportAutoHeight)
    autoHeightNodes.push(node);
   node.control.ResetControlPercentMarkerSize();
  }
  for(var childNode, i = 0; childNode = node.children[i]; i++)
   requireReAdjust = this.forEachControlCore(childNode, collapseControls, processFunc, adjustNodes, autoHeightNodes) || requireReAdjust;
  adjustNodes.push(node);
  return requireReAdjust;
 },
 forEachControlsBackward: function(adjustNodes, collapseControls, processFunc) {
  for(var i = 0, node; node = adjustNodes[i]; i++)
   this.forEachControlsBackwardCore(node, collapseControls, processFunc);
 },
 forEachControlsBackwardCore: function(node, collapseControls, processFunc) {
  if(node.control)
   processFunc(node.control);
  if(node.children.length > 1) {
   for(var i = 0, childNode; childNode = node.children[i]; i++)
    processFunc(childNode.control);
  }
 },
 collapseControls: function(node) {
  for(var childNode, i = 0; childNode = node.children[i]; i++)
   this.collapseControls(childNode);
  if(node.control && node.control.NeedCollapseControl())
   node.control.CollapseControl();
 },
 createControlTree: function(controlCollection, container) {
  controlCollection.ProcessControlsInContainer(container, function(control) {
   control.RegisterInControlTree(this);
  }.aspxBind(this));
  for(var domElementID in this.domMap) {
   if(!this.domMap.hasOwnProperty(domElementID)) continue;
   var node = this.domMap[domElementID];
   var parentNode = this.findParentNode(domElementID);
   parentNode = parentNode || this.rootNode;
   var childNode = node.mainNode || node;
   this.addChildNode(parentNode, childNode);
  }
 },
 findParentNode: function(id) {
  var element = document.getElementById(id).parentNode;
  while(element && element.tagName !== "BODY") {
   if(element.id) {
    var parentNode = this.domMap[element.id];
    if(parentNode)
     return parentNode;
   }
   element = element.parentNode;
  }
  return null;
 },
 addChildNode: function(node, childNode) {
  if(!childNode.parentNode) {
   node.children.push(childNode);
   childNode.parentNode = node;
  }
 },
 addRelatedNode: function(node, relatedNode) {
  this.addChildNode(node, relatedNode);
  relatedNode.mainNode = node;
 },
 createNode: function(domElementID, control) {
  var node = {
   control: control,
   children: [],
   parentNode: null,
   mainNode: null
  };
  if(domElementID)
   this.domMap[domElementID] = node;
  return node;
 }
});
ASPxClientControl = _aspxCreateClass(null, {
 constructor: function(name){
  this.isASPxClientControl = true;
  this.name = name;
  this.uniqueID = name;  
  this.encodeHtml = true;
  this.enabled = true;
  this.clientEnabled = true;
  this.clientVisible = true;
  this.rtl = false;
  this.autoPostBack = false;
  this.allowMultipleCallbacks = true;
  this.callBack = null;
  this.enableCallbackAnimation = false;
  this.enableSlideCallbackAnimation = false;
  this.slideAnimationDirection = null;
  this.beginCallbackAnimationProcessing = false;
  this.endCallbackAnimationProcessing = false;
  this.savedCallbackResult = null;
  this.savedCallbacks = null;
  this.isCallbackAnimationPrevented = false;
  this.lpDelay = 300;
  this.lpTimer = -1;
  this.isNative = false;
  this.requestCount = 0;
  this.enableSwipeGestures = false;
  this.supportGestures = false;
  this.repeatedGestureValue = 0;
  this.repeatedGestureCount = 0;
  this.isInitialized = false;
  this.isControlCollapsed = false;
  this.initialFocused = false;
  this.leadingAfterInitCall = false; 
  this.adjustedSizes = { };
  this.adjustedHeight = 0;
  this.serverEvents = [];
  this.dialogContentHashTable = { };
  this.loadingPanelElement = null;
  this.loadingDivElement = null;  
  this.hasPhantomLoadingElements = false;
  this.mainElement = null;
  this.renderIFrameForPopupElements = false;
  this.widthValueSetInPercentage = false;
  this.heightValueSetInPercentage = false;
  this.touchUIMouseScroller = null;
  this.verticalAlignedElements = { };
  this.wrappedTextContainers = { };
  this.scrollPositionState = { };
  this.sizingConfig = {
   allowSetWidth: true,
   allowSetHeight: true,
   correction : false,
   adjustControl : false,
   supportPercentHeight: false,
   supportAutoHeight: false
  };
  this.percentSizeConfig = {
   width: -1,
   height: -1,
   markerWidth: -1,
   markerHeight: -1
  };
  this.Init = new ASPxClientEvent();
  this.BeginCallback = new ASPxClientEvent();
  this.EndCallback = new ASPxClientEvent();
  this.EndCallbackAnimationStart = new ASPxClientEvent();
  this.CallbackError = new ASPxClientEvent();
  this.CustomDataCallback = new ASPxClientEvent();
  this.LayoutChanging = new ASPxClientEvent();
  aspxGetControlCollection().Add(this);  
 },
 HtmlEncode: function(text) {
  return this.encodeHtml ? _aspxEncodeHtml(text) : text;
 },
 Initialize: function() {
  if(this.callBack != null)
   this.InitializeCallBackData();
 },
 InlineInitialize: function() {
  this.InitializeDOM();
 },
 InitializeGestures: function() {
  if(this.enableSwipeGestures && this.supportGestures) {
   ASPxGesturesHelper.AddSwipeGestureHandler(this.name, 
    function() { return this.GetCallbackAnimationElement(); }.aspxBind(this), 
    function(evt) { return this.CanHandleGestureCore(evt); }.aspxBind(this), 
    function(value) { return this.AllowStartGesture(); }.aspxBind(this),
    function(value) { return this.StartGesture(); }.aspxBind(this),
    function(value) { return this.AllowExecuteGesture(value); }.aspxBind(this),
    function(value) { this.ExecuteGesture(value); }.aspxBind(this),
    function(value) { this.CancelGesture(value); }.aspxBind(this)
   );
   if(__aspxMSTouchUI)
    this.touchUIMouseScroller = ASPxMouseScroller.Create(
     function() { return this.GetCallbackAnimationElement(); }.aspxBind(this),
     function() { return null; },
     function() { return this.GetCallbackAnimationElement(); }.aspxBind(this),
     function(element) { return this.NeedPreventTouchUIMouseScrolling(element); }.aspxBind(this),
     true
    );
  }
 },
 NeedPreventTouchUIMouseScrolling: function(element) {
  return false;
 },
 InitailizeFocus: function() {
  if(this.initialFocused && this.IsVisible())
   this.Focus();
 },
 AfterCreate: function() { 
  this.InlineInitialize();
  this.InitializeGestures();
  if(!this.CanInitializeAdjustmentOnDOMContentLoaded() || __aspxStartupScriptsRunning)
   this.InitializeAdjustment();
 },
 DOMContentLoaded: function() {
  if(this.CanInitializeAdjustmentOnDOMContentLoaded()) 
   this.InitializeAdjustment();
 },
 CanInitializeAdjustmentOnDOMContentLoaded: function() {
  return !__aspxIE || __aspxBrowserVersion >= 10; 
 },
 InitializeAdjustment: function() {
  this.UpdateAdjustmentFlags();
  this.AdjustControl();
 },
 AfterInitialize: function() {
  this.AdjustControl();
  this.InitailizeFocus();
  this.isInitialized = true;
  this.RaiseInit();
  if(this.savedCallbacks) {
   for(var i = 0; i < this.savedCallbacks.length; i++) 
    this.CreateCallbackInternal(this.savedCallbacks[i].arg, this.savedCallbacks[i].command, 
     false, this.savedCallbacks[i].callbackInfo);
   this.savedCallbacks = null;
  }
 },
 InitializeCallBackData: function() {
 },
 RenderExistsOnPage: function() {
  return _aspxIsExistsElement(this.GetMainElement());
 },
 IsStateControllerEnabled: function(){
  return typeof(aspxGetStateController) != "undefined" && aspxGetStateController();
 },
 InitializeDOM: function() {
  var mainElement = this.GetMainElement();
  if(mainElement)
   mainElement["dxinit"] = true;
 },
 IsDOMInitialized: function() {
  var mainElement = this.GetMainElement();
  return mainElement && mainElement["dxinit"];
 },
 GetWidth: function() {
  return this.GetMainElement().offsetWidth;
 },
 GetHeight: function() {
  return this.GetMainElement().offsetHeight;
 },
 SetWidth: function(width) {
  if(this.sizingConfig.allowSetWidth)
   this.SetSizeCore("width", width, "GetWidth", false);
 },
 SetHeight: function(height) {
  if(this.sizingConfig.allowSetHeight)
   this.SetSizeCore("height", height, "GetHeight", false);
 },
 SetSizeCore: function(sizePropertyName, size, getFunctionName, corrected) {
  if(size < 0)
   return;
  this.GetMainElement().style[sizePropertyName] = size + "px";
  this.UpdateAdjustmentFlags();
  if(this.sizingConfig.adjustControl)
   this.AdjustControl(true);
  if(this.sizingConfig.correction && !corrected) {
   var realSize = this[getFunctionName]();
   if(realSize != size) {
    var correctedSize = size - (realSize - size);
    this.SetSizeCore(sizePropertyName, correctedSize, getFunctionName, true);
   }
  }
 },
 AdjustControl: function(nestedCall) {
  if(this.IsAdjustmentRequired() && (!ASPxClientControl.adjustControlLocked || nestedCall)) {
   ASPxClientControl.adjustControlLocked = true;
   try {
    if(!this.IsAdjustmentAllowed())
     return;
    this.AdjustControlCore();
    this.UpdateAdjustedSizes();
    this.percentMarkerSize = undefined;
   } 
   finally {
    delete ASPxClientControl.adjustControlLocked;
   }
  }
  this.TryShowPhantomLoadingElements();
 },
 ResetControlAdjustment: function () {
  this.adjustedSizes = { };
 },
 UpdateAdjustmentFlags: function() {
  var mainElement = this.GetMainElement();
  if(mainElement) {
   var mainElementStyle = _aspxGetCurrentStyle(mainElement);
   this.UpdatePercentSizeConfig([mainElementStyle.width, mainElement.style.width], [mainElementStyle.height, mainElement.style.height]);
  }
 },
 UpdatePercentSizeConfig: function(widths, heights) {
  this.widthValueSetInPercentage = false;
  this.heightValueSetInPercentage = false;
  for(var i = 0; i < widths.length; i++) {
   if(_aspxIsPercentageSize(widths[i])) {
    this.percentSizeConfig.width = widths[i];
    this.widthValueSetInPercentage = true;
    break;
   }
  }
  for(var i = 0; i < heights.length; i++) {
   if(_aspxIsPercentageSize(heights[i])) {
    this.percentSizeConfig.height = heights[i];
    this.heightValueSetInPercentage = true;
    break;
   }
  }
  this.ResetControlPercentMarkerSize();
 },
 GetAdjustedSizes: function() {
  var mainElement = this.GetMainElement();
  if(mainElement) 
   return { width: mainElement.offsetWidth, height: mainElement.offsetHeight };
  return { width: 0, height: 0 };
 },
 IsAdjusted: function() {
  return (this.adjustedSizes.width && this.adjustedSizes.width > 0) && (this.adjustedSizes.height && this.adjustedSizes.height > 0);
 },
 IsAdjustmentRequired: function() {
  if(!this.IsAdjusted())
   return true;
  if(this.widthValueSetInPercentage)
   return true;
  if(this.heightValueSetInPercentage)
   return true;
  var sizes = this.GetAdjustedSizes();
  for(var name in sizes){
   if(this.adjustedSizes[name] !== sizes[name])
    return true;
  }
  return false;
 },
 IsAdjustmentAllowed: function() {
  var mainElement = this.GetMainElement();
  return mainElement && this.IsDisplayed() && !this.IsHidden() && this.IsDOMInitialized();
 },
 UpdateAdjustedSizes: function() {
  var sizes = this.GetAdjustedSizes();
  for(var name in sizes)
   this.adjustedSizes[name] = sizes[name];
 },
 AdjustControlCore: function() {
 },
 AdjustAutoHeight: function() {
 },
 IsControlCollapsed: function() {
  return this.isControlCollapsed;
 },
 NeedCollapseControl: function() {
  return this.NeedCollapseControlCore() && this.IsAdjustmentRequired() && this.IsAdjustmentAllowed();
 },
 NeedCollapseControlCore: function() {
  return false;
 },
 CollapseEditor: function() {
 },
 CollapseControl: function() {
  this.SaveScrollPositions();
  var mainElement = this.GetMainElement(),
   marker = this.GetControlPercentSizeMarker(),
   scrollHeight = mainElement.scrollHeight;
  if(this.heightValueSetInPercentage && this.sizingConfig.supportPercentHeight && scrollHeight <= mainElement.offsetHeight)
   marker.style.height = this.percentSizeConfig.height;
  else
   marker.style.height = scrollHeight + "px";
  mainElement.style.display = "none";
  this.isControlCollapsed = true;
 },
 ExpandControl: function() {
  var mainElement = this.GetMainElement();
  mainElement.style.display = "";
  this.GetControlPercentSizeMarker().style.height = "0px";
  this.isControlCollapsed = false;
  this.RestoreScrollPositions();
 },
 CanCauseReadjustment: function() {
  return this.NeedCollapseControlCore();
 },
 IsExpandableByAdjustment: function() {
  return false;
 },
 SaveScrollPositions: function() {
  var mainElement = this.GetMainElement();
  this.scrollPositionState.outer = _aspxGetOuterScrollPosition(mainElement.parentNode);
  this.scrollPositionState.inner = _aspxGetInnerScrollPositions(mainElement);
 },
 RestoreScrollPositions: function() {
  _aspxRestoreOuterScrollPosition(this.scrollPositionState.outer);
  _aspxRestoreInnerScrollPositions(this.scrollPositionState.inner);
 },
 GetControlPercentSizeMarker: function() {
  if(this.percentSizeMarker === undefined) {
   this.percentSizeMarker = _aspxCreateHtmlElementFromString("<div style='height:0px;font-size:0px;line-height:0;width:100%;'></div>");
   _aspxInsertElementAfter(this.percentSizeMarker, this.GetMainElement());
  }
  return this.percentSizeMarker;
 },
 KeepControlPercentSizeMarker: function(needCollapse, needCalculateHeight) {
  var mainElement = this.GetMainElement(),
   marker = this.GetControlPercentSizeMarker(),
   markerHeight;
  if(needCollapse)
   this.CollapseControl();
  if(this.widthValueSetInPercentage && marker.style.width !== this.percentSizeConfig.width)
   marker.style.width = this.percentSizeConfig.width;
  if(needCalculateHeight) {
   if(this.IsControlCollapsed())
    markerHeight = marker.style.height;
   marker.style.height = this.percentSizeConfig.height;
  }
  this.percentSizeConfig.markerWidth = marker.offsetWidth;
  if(needCalculateHeight) {
   this.percentSizeConfig.markerHeight = marker.offsetHeight;
   if(this.IsControlCollapsed())
    marker.style.height = markerHeight;
   else
    marker.style.height = "0px";
  }
  if(needCollapse)
   this.ExpandControl();
 },
 ResetControlPercentMarkerSize: function() {
  this.percentSizeConfig.markerWidth = -1;
  this.percentSizeConfig.markerHeight = -1;
 },
 GetControlPercentMarkerSize: function(hideControl, force) {
  var needCalculateHeight = this.heightValueSetInPercentage && this.sizingConfig.supportPercentHeight;
  if(force || this.percentSizeConfig.markerWidth < 1 || (needCalculateHeight && this.percentSizeConfig.markerHeight < 1))
   this.KeepControlPercentSizeMarker(hideControl && !this.IsControlCollapsed(), needCalculateHeight);
  return {
   width: this.percentSizeConfig.markerWidth,
   height: this.percentSizeConfig.markerHeight
  };
 },
 OnBrowserWindowResize: function(evt) {
 },
 OnBrowserWindowResizeInternal: function(evt){
  if(this.BrowserWindowResizeSubscriber()) 
   this.OnBrowserWindowResize(evt);
 },
 BrowserWindowResizeSubscriber: function() {
  return this.widthValueSetInPercentage;
 },
 CorrectWrappedText: function(getElements, key, reCorrect) {
  var elements = this.GetCachedElements(getElements, this.wrappedTextContainers, key);
  for(var i = 0; i < elements.length; i++)
   this.CorrectWrappedTextInContainer(elements[i], reCorrect);
 },
 CorrectWrappedTextInContainer: function(container, reCorrect) {
  if(!container || (container.dxWrappedTextCorrected && !reCorrect) || container.offsetWidth === 0) return;
  _aspxAdjustWrappedTextInContainer(container);
  container.dxWrappedTextCorrected = true;
 },
 CorrectVerticalAlignment: function(alignMethod, getElements, key, reAlign) {
  var elements = this.GetCachedElements(getElements, this.verticalAlignedElements, key);
  for(var i = 0; i < elements.length; i++)
   this.CorrectElementVerticalAlignment(alignMethod, elements[i], reAlign);
 },
 CorrectElementVerticalAlignment: function(alignMethod, element, reAlign) {
  if(!element || (element.dxVerticalAligned && !reAlign) || element.offsetHeight === 0) return;
  alignMethod(element);
  element.dxVerticalAligned = true;
 },
 ClearVerticalAlignedElementsCache: function() {
  this.verticalAlignedElements = {};
 },
 ClearWrappedTextContainersCache: function() {
  this.wrappedTextContainers = {};
 },
 GetCachedElements: function(getElements, cache, key) {
  if(!key) key = "elements";
  if(!cache[key] || !_aspxIsValidElements(cache[key])){
   var elements = getElements.call(this);
   if(!ASPxIdent.IsArray(elements))
    elements = [elements];
   cache[key] = elements;
  }
  return cache[key];
 },
 AdjustPagerControls: function() {
  if(typeof(aspxGetPagersCollection) != "undefined")
   aspxGetPagersCollection().AdjustControls(this.GetMainElement());
 },
 OnAdaptiveLayoutChanging: function(isAdaptiveView) {
 },
 RaiseAdaptiveLayoutChanging: function(isAdaptiveView) {
  if(!this.LayoutChanging.IsEmpty()){
   var args = new ASPxClientAdaptiveLayoutChangingEventArgs(isAdaptiveView);
   this.LayoutChanging.FireEvent(this, args);
   return args.isAdaptiveView;
  }
  return isAdaptiveView;
 },
 SetAdaptiveClassNames: function(prevClassName, newClassName) {
  var maiElement = this.GetMainElement();
  if(maiElement) {
   _aspxRemoveClassNameFromElement(maiElement, prevClassName);
   _aspxAddClassNameToElement(maiElement, newClassName);
  }
 },
 RegisterInControlTree: function(tree) {
  var mainElement = this.GetMainElement();
  if(mainElement && mainElement.id)
   tree.createNode(mainElement.id, this);
 },
 RegisterServerEventAssigned: function(eventNames){
  for(var i = 0; i < eventNames.length; i++)
   this.serverEvents[eventNames[i]] = true;
 },
 IsServerEventAssigned: function(eventName){
  return !!this.serverEvents[eventName];
 },
 GetChild: function(idPostfix){
  var mainElement = this.GetMainElement();
  return mainElement ? _aspxGetChildById(mainElement, this.name + idPostfix) : null;
 },
 GetItemElementName: function(element) {
  var name = "";
  if(element.id)
   name = element.id.substring(this.name.length + 1);
  return name;
 },
 GetLinkElement: function(element) {
  if (element == null) return null;
  return (element.tagName == "A") ? element : _aspxGetChildByTagName(element, "A", 0);
 },
 GetInternalHyperlinkElement: function(parentElement, index) {
  var element = _aspxGetChildByTagName(parentElement, "A", index);
  if (element == null) 
   element = _aspxGetChildByTagName(parentElement, "SPAN", index);
  return element;
 },
 GetParentForm: function(){
  return _aspxGetParentByTagName(this.GetMainElement(), "FORM");
 },
 GetMainElement: function(){
  if(!_aspxIsExistsElement(this.mainElement))
   this.mainElement = _aspxGetElementById(this.name);
  return this.mainElement;
 },
 OnControlClick: function(clickedElement, htmlEvent) {
 },
 IsLoadingContainerVisible: function(){
  return this.IsVisible();
 },
 GetLoadingPanelElement: function(){
  return _aspxGetElementById(this.name + "_LP");
 },
 GetClonedLoadingPanel: function(){
  return document.getElementById(this.GetLoadingPanelElement().id + "V"); 
 },
 CloneLoadingPanel: function(element, parent) {
  var clone = element.cloneNode(true);
  clone.id = element.id + "V";
  parent.appendChild(clone);
  return clone;
 },
 CreateLoadingPanelWithoutBordersInsideContainer: function(container) {
  var loadingPanel = this.CreateLoadingPanelInsideContainer(container, false, true, true);
  var contentStyle = _aspxGetCurrentStyle(container);
  if(!loadingPanel || !contentStyle)
   return;
  var elements = [ ];
  elements.push(loadingPanel.tagName == "TABLE" ? loadingPanel : _aspxGetChildByTagName(loadingPanel, "TABLE", 0));
  var cells = _aspxGetElementsByTagName(loadingPanel, "TD");
  if(!cells) cells = [ ];
  for(var i = 0; i < cells.length; i++)
   elements.push(cells[i]);
  for(var i = 0; i < elements.length; i++) {
   var el = elements[i];
   el.style.backgroundColor = contentStyle.backgroundColor;
   _aspxRemoveBordersAndShadows(el);
  }
 },
 CreateLoadingPanelInsideContainer: function(parentElement, hideContent, collapseHeight, collapseWidth) {
  if(this.ShouldHideExistingLoadingElements())
   this.HideLoadingPanel();
  if(parentElement == null)
   return null;
  if(!this.IsLoadingContainerVisible()) {
   this.hasPhantomLoadingElements = true;
   return null;
  }
  var element = this.GetLoadingPanelElement();
  if (element != null){
   var width = collapseWidth ? 0 : _aspxGetClearClientWidth(parentElement);
   var height = collapseHeight ? 0 : _aspxGetClearClientHeight(parentElement);
   if(hideContent){
    for(var i = parentElement.childNodes.length - 1; i > -1; i--){
     if(parentElement.childNodes[i].style)
      parentElement.childNodes[i].style.display = "none";
     else if(parentElement.childNodes[i].nodeType == 3) 
      parentElement.removeChild(parentElement.childNodes[i]);
    }
   }
   else
    parentElement.innerHTML = "";
   var table = document.createElement("TABLE");
   parentElement.appendChild(table);
   table.border = 0;
   table.cellPadding = 0;
   table.cellSpacing = 0;
   _aspxSetStyles(table, {
    width: (width > 0) ? width : "100%",
    height: (height > 0) ? height : "100%"
   });
   var tbody = document.createElement("TBODY");
   table.appendChild(tbody);
   var tr = document.createElement("TR");
   tbody.appendChild(tr);
   var td = document.createElement("TD");
   tr.appendChild(td);
   td.align = "center";
   td.vAlign = "middle";
   element = this.CloneLoadingPanel(element, td);
   _aspxSetElementDisplay(element, true);
   this.loadingPanelElement = element;
   return element;
  } else
   parentElement.innerHTML = "&nbsp;";
  return null;
 },
 CreateLoadingPanelWithAbsolutePosition: function(parentElement, offsetElement) {
  if(this.ShouldHideExistingLoadingElements())
   this.HideLoadingPanel();
  if(parentElement == null)
   return null;
  if(!this.IsLoadingContainerVisible()) {
   this.hasPhantomLoadingElements = true;
   return null;
  }
  if(!offsetElement)
   offsetElement = parentElement;
  var element = this.GetLoadingPanelElement();
  if(element != null) {
   element = this.CloneLoadingPanel(element, parentElement);
   _aspxSetStyles(element, {
    position: "absolute",
    display: ""
   });
   this.SetLoadingPanelLocation(offsetElement, element);
   this.loadingPanelElement = element;
   return element;
  }
  return null;
 },
 CreateLoadingPanelInline: function(parentElement){
  if(this.ShouldHideExistingLoadingElements())
   this.HideLoadingPanel();
  if(parentElement == null)
   return null;
  if(!this.IsLoadingContainerVisible()) {
   this.hasPhantomLoadingElements = true;
   return null;
  }
  var element = this.GetLoadingPanelElement();
  if(element != null) {
   element = this.CloneLoadingPanel(element, parentElement);
   _aspxSetElementDisplay(element, true);
   this.loadingPanelElement = element;
   return element;
  }
  return null;
 },
 ShowLoadingPanel: function() {
 },
 ShowLoadingElements: function() {
  if(this.InCallback() || this.lpTimer > -1) return;
  this.ShowLoadingDiv();
  if(this.IsCallbackAnimationEnabled())
   this.StartBeginCallbackAnimation();
  else
   this.ShowLoadingElementsInternal();
 },
 ShowLoadingElementsInternal: function() {
  if(this.lpDelay > 0 && !this.IsCallbackAnimationEnabled()) 
   this.lpTimer = _aspxSetTimeout(function() { 
    this.ShowLoadingPanelOnTimer(); 
   }.aspxBind(this), this.lpDelay);
  else {
   this.RestoreLoadingDivOpacity();
   this.ShowLoadingPanel();
  }
 },
 GetLoadingPanelOffsetElement: function (baseElement) {
  if(this.IsCallbackAnimationEnabled()) {
   var element = this.GetLoadingPanelCallbackAnimationOffsetElement();
   if(element) {
    var container = typeof(ASPxAnimationHelper) != "undefined" ? ASPxAnimationHelper.findSlideAnimationContainer(element) : null;
    if(container)
     return container.parentNode.parentNode;
    else
     return element;
   }
  }
  return baseElement;
 },
 GetLoadingPanelCallbackAnimationOffsetElement: function () {
  return this.GetCallbackAnimationElement();
 },
 IsCallbackAnimationEnabled: function () {
  return (this.enableCallbackAnimation || this.enableSlideCallbackAnimation) && !this.isCallbackAnimationPrevented;
 },
 StartBeginCallbackAnimation: function () {
  this.beginCallbackAnimationProcessing = true;
  this.isCallbackFinished = false;
  var element = this.GetCallbackAnimationElement();
  if(element && this.enableSlideCallbackAnimation && this.slideAnimationDirection) 
   ASPxAnimationHelper.slideOut(element, this.slideAnimationDirection, this.FinishBeginCallbackAnimation.aspxBind(this));
  else if(element && this.enableCallbackAnimation) 
   ASPxAnimationHelper.fadeOut(element, this.FinishBeginCallbackAnimation.aspxBind(this));
  else
   this.FinishBeginCallbackAnimation();
 },
 CancelBeginCallbackAnimation: function() {
  if(this.beginCallbackAnimationProcessing) {
   this.beginCallbackAnimationProcessing = false;
   var element = this.GetCallbackAnimationElement();
   ASPxAnimationHelper.cancelAnimation(element);
  }
 },
 FinishBeginCallbackAnimation: function () {
  this.beginCallbackAnimationProcessing = false;
  if(!this.isCallbackFinished)
   this.ShowLoadingElementsInternal();
  else {
   this.DoCallback(this.savedCallbackResult);
   this.savedCallbackResult = null;
  }
 },
 CheckBeginCallbackAnimationInProgress: function(callbackResult) {
  if(this.beginCallbackAnimationProcessing) {
   this.savedCallbackResult = callbackResult;
   this.isCallbackFinished = true;
   return true;
  }
  return false;
 },
 StartEndCallbackAnimation: function () {
  this.HideLoadingPanel();
  this.SetInitialLoadingDivOpacity();
  this.RaiseEndCallbackAnimationStart();
  this.endCallbackAnimationProcessing = true;
  var element = this.GetCallbackAnimationElement();
  if(element && this.enableSlideCallbackAnimation && this.slideAnimationDirection) 
   ASPxAnimationHelper.slideIn(element, this.slideAnimationDirection, this.FinishEndCallbackAnimation.aspxBind(this));
  else if(element && this.enableCallbackAnimation) 
   ASPxAnimationHelper.fadeIn(element, this.FinishEndCallbackAnimation.aspxBind(this));
  else
   this.FinishEndCallbackAnimation();
  this.slideAnimationDirection = null;
 },
 FinishEndCallbackAnimation: function () {
  this.DoEndCallback();
  this.endCallbackAnimationProcessing = false;
  this.CheckRepeatGesture();
 },
 CheckEndCallbackAnimationNeeded: function() {
  if(!this.endCallbackAnimationProcessing && this.requestCount == 1) {
   this.StartEndCallbackAnimation();
   return true;
  }
  return false;
 },
 PreventCallbackAnimation: function() {
  this.isCallbackAnimationPrevented = true;
 },
 GetCallbackAnimationElement: function() {
  return null;
 },
 AssignSlideAnimationDirectionByPagerArgument: function(arg, currentPageIndex) {
  this.slideAnimationDirection = null;
  if(this.enableSlideCallbackAnimation && typeof(ASPxAnimationHelper) != "undefined") {
   if (arg == ASPxClientPagerCommands.Next || arg == ASPxClientPagerCommands.Last)
    this.slideAnimationDirection = ASPxAnimationHelper.SLIDE_LEFT_DIRECTION;
   else if (arg == ASPxClientPagerCommands.First || arg == ASPxClientPagerCommands.Prev)
    this.slideAnimationDirection = ASPxAnimationHelper.SLIDE_RIGHT_DIRECTION;
   else if(!isNaN(currentPageIndex) && arg.indexOf(ASPxClientPagerCommands.PageNumber) == 0) {
    var newPageIndex = parseInt(arg.substring(2));
    if(!isNaN(newPageIndex))
     this.slideAnimationDirection = newPageIndex < currentPageIndex ? ASPxAnimationHelper.SLIDE_RIGHT_DIRECTION : ASPxAnimationHelper.SLIDE_LEFT_DIRECTION;
   }
  }
 },
 TryShowPhantomLoadingElements: function () {
  if (this.hasPhantomLoadingElements && this.InCallback()) {
   this.ShowLoadingDivAndPanel();
   this.hasPhantomLoadingElements = false;
  }
 },
 ShowLoadingDivAndPanel: function () {
  this.ShowLoadingDiv();
  this.RestoreLoadingDivOpacity();
  this.ShowLoadingPanel();
 },
 HideLoadingElements: function() {
  this.CancelBeginCallbackAnimation();
  this.HideLoadingPanel();
  this.HideLoadingDiv();
 },
 ShowLoadingPanelOnTimer: function() {
  this.ClearLoadingPanelTimer();
  if(this.RenderExistsOnPage()) {
   this.RestoreLoadingDivOpacity();
   this.ShowLoadingPanel();
  }
 },
 ClearLoadingPanelTimer: function() {
  this.lpTimer = _aspxClearTimer(this.lpTimer);  
 },
 HideLoadingPanel: function() {
  this.ClearLoadingPanelTimer();
  this.hasPhantomLoadingElements = false;
  if(_aspxIsExistsElement(this.loadingPanelElement)) {
   _aspxRemoveElement(this.loadingPanelElement);
   this.loadingPanelElement = null;
  }
 },
 SetLoadingPanelLocation: function(offsetElement, loadingPanel, x, y, offsetX, offsetY) {
  if(!_aspxIsExists(x) || !_aspxIsExists(y)){
   var x1 = _aspxGetAbsoluteX(offsetElement);
   var y1 = _aspxGetAbsoluteY(offsetElement);
   var x2 = x1;
   var y2 = y1;
   if(offsetElement == document.body){
    x2 += _aspxGetDocumentMaxClientWidth();
    y2 += _aspxGetDocumentMaxClientHeight();
   }
   else{
    x2 += offsetElement.offsetWidth;
    y2 += offsetElement.offsetHeight;
   }
   if(x1 < _aspxGetDocumentScrollLeft())
    x1 = _aspxGetDocumentScrollLeft();
   if(y1 < _aspxGetDocumentScrollTop())
    y1 = _aspxGetDocumentScrollTop();
   if(x2 > _aspxGetDocumentScrollLeft() + _aspxGetDocumentClientWidth())
    x2 = _aspxGetDocumentScrollLeft() + _aspxGetDocumentClientWidth();
   if(y2 > _aspxGetDocumentScrollTop() + _aspxGetDocumentClientHeight())
    y2 = _aspxGetDocumentScrollTop() + _aspxGetDocumentClientHeight();
   x = x1 + ((x2 - x1 - loadingPanel.offsetWidth) / 2);
   y = y1 + ((y2 - y1 - loadingPanel.offsetHeight) / 2);
  }
  if(_aspxIsExists(offsetX) && _aspxIsExists(offsetY)){
   x += offsetX;
   y += offsetY;
  }
  x = _aspxPrepareClientPosForElement(x, loadingPanel, true);
  y = _aspxPrepareClientPosForElement(y, loadingPanel, false);
  if(__aspxIE && __aspxBrowserVersion > 8 && (y - Math.floor(y) === 0.5))
   y = Math.ceil(y);
  _aspxSetStyles(loadingPanel, { left: x, top: y });
 },
 GetLoadingDiv: function(){
  return _aspxGetElementById(this.name + "_LD");
 },
 CreateLoadingDiv: function(parentElement, offsetElement){
  if(this.ShouldHideExistingLoadingElements())
   this.HideLoadingDiv();
  if(parentElement == null) 
   return null;
  if(!this.IsLoadingContainerVisible()) {
   this.hasPhantomLoadingElements = true;
   return null;
  }
  if(!offsetElement)
   offsetElement = parentElement;
  var div = this.GetLoadingDiv();
  if(div != null){
   div = div.cloneNode(true);
   parentElement.appendChild(div);
   _aspxSetElementDisplay(div, true);
   _aspxAttachEventToElement(div, ASPxClientTouchUI.touchMouseDownEventName, _aspxPreventEvent);
   _aspxAttachEventToElement(div, ASPxClientTouchUI.touchMouseMoveEventName, _aspxPreventEvent);
   _aspxAttachEventToElement(div, ASPxClientTouchUI.touchMouseUpEventName, _aspxPreventEvent);
   this.SetLoadingDivBounds(offsetElement, div);
   this.loadingDivElement = div;
   this.SetInitialLoadingDivOpacity();
   return div;
  }
  return null;
 },
 SetInitialLoadingDivOpacity: function() {
  if(!this.loadingDivElement) return;
  _aspxSaveStyleAttribute(this.loadingDivElement, "opacity");
  _aspxSaveStyleAttribute(this.loadingDivElement, "filter");
  _aspxSetElementOpacity(this.loadingDivElement, 0.01);
 },
 RestoreLoadingDivOpacity: function() {
  if(!this.loadingDivElement) return;
  _aspxRestoreStyleAttribute(this.loadingDivElement, "opacity");
  _aspxRestoreStyleAttribute(this.loadingDivElement, "filter");
 },
 SetLoadingDivBounds: function(offsetElement, loadingDiv) {
  var absX = (offsetElement == document.body) ? 0 : _aspxGetAbsoluteX(offsetElement);
  var absY = (offsetElement == document.body) ? 0 : _aspxGetAbsoluteY(offsetElement);
  _aspxSetStyles(loadingDiv, {
   left: _aspxPrepareClientPosForElement(absX, loadingDiv, true),
   top: _aspxPrepareClientPosForElement(absY, loadingDiv, false)
  });
  var width = (offsetElement == document.body) ? _aspxGetDocumentWidth() : offsetElement.offsetWidth;
  var height = (offsetElement == document.body) ? _aspxGetDocumentHeight() : offsetElement.offsetHeight;
  if(height < 0) 
   height = 0;
  _aspxSetStyles(loadingDiv, { width: width, height: height });
  var correctedWidth = 2 * width - loadingDiv.offsetWidth;
  if(correctedWidth <= 0) correctedWidth = width;
  var correctedHeight = 2 * height - loadingDiv.offsetHeight;
  if (correctedHeight <= 0) correctedHeight = height;
  _aspxSetStyles(loadingDiv, { width: correctedWidth, height: correctedHeight });
 },
 ShowLoadingDiv: function() {
 },
 HideLoadingDiv: function() {
  this.hasPhantomLoadingElements = false;
  if(_aspxIsExistsElement(this.loadingDivElement)){
   _aspxRemoveElement(this.loadingDivElement);
   this.loadingDivElement = null;
  }
 },
 CanHandleGesture: function(evt) {
  return false;
 },
 CanHandleGestureCore: function(evt) {
  var source = _aspxGetEventSource(evt);
  if(_aspxGetIsParent(this.loadingPanelElement, source) || _aspxGetIsParent(this.loadingDivElement, source))
   return true; 
  var callbackAnimationElement = this.GetCallbackAnimationElement();
  if(!callbackAnimationElement)
   return false;
  var animationContainer = ASPxAnimationHelper.getSlideAnimationContainer(callbackAnimationElement, false, false);
  if(animationContainer && _aspxGetIsParent(animationContainer, source) && !_aspxGetIsParent(animationContainer.childNodes[0], source))
   return true; 
  return this.CanHandleGesture(evt); 
 },
 AllowStartGesture: function() {
  return !this.beginCallbackAnimationProcessing && !this.endCallbackAnimationProcessing;
 },
 StartGesture: function() {
 },
 AllowExecuteGesture: function(value) {
  return false;
 },
 ExecuteGesture: function(value) {
 },
 CancelGesture: function(value) {
  if(this.repeatedGestureCount === 0) {
   this.repeatedGestureValue = value;
   this.repeatedGestureCount = 1;
  }
  else {
   if(this.repeatedGestureValue * value > 0)
    this.repeatedGestureCount++;
   else
    this.repeatedGestureCount--;
   if(this.repeatedGestureCount === 0)
    this.repeatedGestureCount = 0;
  }
 },
 CheckRepeatGesture: function() {
  if(this.repeatedGestureCount !== 0) {
   if(this.AllowExecuteGesture(this.repeatedGestureValue))
    this.ExecuteGesture(this.repeatedGestureValue, this.repeatedGestureCount);
   this.repeatedGestureValue = 0;
   this.repeatedGestureCount = 0;
  }
 },
 AllowExecutePagerGesture: function (pageIndex, pageCount, value) {
  if(pageIndex < 0) return false;
  if(pageCount <= 1) return false;
  if(value > 0 && pageIndex === 0) return false;
  if(value < 0 && pageIndex === pageCount - 1) return false;
  return true;
 },
 ExecutePagerGesture: function(pageIndex, pageCount, value, count, method) {
  if(!count) count = 1;
  var pageIndex = pageIndex + (value < 0 ? count : -count);
  if(pageIndex < 0) pageIndex = 0;
  if(pageIndex > pageCount - 1) pageIndex = pageCount - 1;
  method(ASPxClientPagerCommands.PageNumber + pageIndex);
 },
 RaiseInit: function(){
  if(!this.Init.IsEmpty()){
   var args = new ASPxClientEventArgs();
   this.Init.FireEvent(this, args);
  }
 },
 RaiseBeginCallbackInternal: function(command){
  if(!this.BeginCallback.IsEmpty()){
   var args = new ASPxClientBeginCallbackEventArgs(command);
   this.BeginCallback.FireEvent(this, args);
  }
 },
 RaiseBeginCallback: function(command){
  this.RaiseBeginCallbackInternal(command);
  if(typeof(aspxGetGlobalEvents) != "undefined")
   aspxGetGlobalEvents().OnBeginCallback(this, command);
 },
 RaiseEndCallback: function(){
  if(!this.EndCallback.IsEmpty()){
   var args = new ASPxClientEndCallbackEventArgs();
   this.EndCallback.FireEvent(this, args);
  }
  if(typeof(aspxGetGlobalEvents) != "undefined")
   aspxGetGlobalEvents().OnEndCallback(this);
 },
 RaiseEndCallbackAnimationStart: function(){
  if(!this.EndCallbackAnimationStart.IsEmpty()){
   var args = new ASPxClientEventArgs();
   this.EndCallbackAnimationStart.FireEvent(this, args);
  }
 },
 RaiseCallbackError: function(message) {
  if(!this.CallbackError.IsEmpty()) {
   var args = new ASPxClientCallbackErrorEventArgs(message);
   this.CallbackError.FireEvent(this, args);
   if(args.handled)
    return { isHandled: true, errorMessage: args.message };
  }
  if(typeof(aspxGetGlobalEvents) != "undefined") {
   var args = new ASPxClientCallbackErrorEventArgs(message);
   aspxGetGlobalEvents().OnCallbackError(this, args);
   if(args.handled)
    return { isHandled: true, errorMessage: args.message };
  }
  return { isHandled: false, errorMessage: message };
 },
 IsVisible: function() {
  var element = this.GetMainElement();
  return _aspxElementIsVisible(element);
 },
 IsDisplayed: function() {
  var element = this.GetMainElement();
  while(element && element.tagName != "BODY") {
   if(!_aspxGetElementDisplay(element)) 
    return false;
   element = element.parentNode;
  }
  return true;
 },
 IsHidden: function() {
  var element = this.GetMainElement();
  return element.offsetWidth == 0 && element.offsetHeight == 0;
 },
 Focus: function() {
 },
 GetClientVisible: function(){
  return this.GetVisible();
 },
 SetClientVisible: function(visible){
  this.SetVisible(visible);
 },
 GetVisible: function(){
  return this.clientVisible;
 },
 SetVisible: function(visible){
  if(this.clientVisible != visible){
   this.clientVisible = visible;
   _aspxSetElementDisplay(this.GetMainElement(), visible);
   if (visible) {
    this.AdjustControl();
    var mainElement = this.GetMainElement();
    if(mainElement)
     aspxGetControlCollection().AdjustControls(mainElement);
   }
  }
 },
 GetEnabled: function() {
  return this.clientEnabled;
 },
 SetEnabled: function(enabled) {
  this.clientEnabled = enabled;
  if(ASPxClientControl.setEnabledLocked)
   return;
  else
   ASPxClientControl.setEnabledLocked = true;
  aspxGetControlCollection().ProcessControlsInContainer(this.GetMainElement(), function(control) {
   if(_aspxIsFunction(control.SetEnabled))
    control.SetEnabled(enabled);
  });
  delete ASPxClientControl.setEnabledLocked;
 },
 InCallback: function() {
  return this.requestCount > 0;
 },
 DoBeginCallback: function(command) {
  this.RaiseBeginCallback(command || "");
  aspxGetControlCollection().Before_WebForm_InitCallback(this.name);
  if(typeof(WebForm_InitCallback) != "undefined" && WebForm_InitCallback) {
   __theFormPostData = "";
   __theFormPostCollection = [ ];
   this.ClearPostBackEventInput("__EVENTTARGET");
   this.ClearPostBackEventInput("__EVENTARGUMENT");
   WebForm_InitCallback();
   this.savedFormPostData = __theFormPostData;   
   this.savedFormPostCollection = __theFormPostCollection;
  }
 },
 ClearPostBackEventInput: function(id){
  var element = _aspxGetElementById(id);
  if(element != null) element.value = "";
 },
 PerformDataCallback: function(arg, handler) {
  this.CreateCustomDataCallback(arg, "", handler);
 }, 
 CreateCallback: function(arg, command) {
  var callbackInfo = this.CreateCallbackInfo(ASPxCallbackType.Common, null);
  this.CreateCallbackByInfo(arg, command, callbackInfo);
 },
 CreateCustomDataCallback: function(arg, command, handler) {
  var callbackInfo = this.CreateCallbackInfo(ASPxCallbackType.Data, handler);
  this.CreateCallbackByInfo(arg, command, callbackInfo);
 },
 CreateCallbackByInfo: function(arg, command, callbackInfo) {
  if(!this.CanCreateCallback()) return;
  if(typeof(WebForm_DoCallback) != "undefined" && WebForm_DoCallback && __aspxDocumentLoaded)
   this.CreateCallbackInternal(arg, command, true, callbackInfo);
  else {
   if(!this.savedCallbacks)
    this.savedCallbacks = [];
   var callbackInfo = { arg: arg, command: command, callbackInfo: callbackInfo };
   if(this.allowMultipleCallbacks)
    this.savedCallbacks.push(callbackInfo);
   else
    this.savedCallbacks[0] = callbackInfo;
  }
 },
 CreateCallbackInternal: function(arg, command, viaTimer, callbackInfo) {
  this.requestCount++;
  this.DoBeginCallback(command);
  if(typeof(arg) == "undefined")
   arg = "";
  if(typeof(command) == "undefined")
   command = "";
  var callbackID = this.SaveCallbackInfo(callbackInfo);
  if(viaTimer)
   window.setTimeout("aspxCreateCallback('" + this.name + "', '" + escape(arg) + "', '" + escape(command) + "', " + callbackID + ");", 0);
  else
   this.CreateCallbackCore(arg, command, callbackID);
 },
 CancelCallbackInternal: function() {
  this.CancelCallbackCore();
  this.HideLoadingElements();
 },
 CancelCallbackCore: function() {
 },
 CreateCallbackCore: function(arg, command, callbackID) {
  var callBackMethod = this.GetCallbackMethod(command);
  __theFormPostData = this.savedFormPostData;
  __theFormPostCollection = this.savedFormPostCollection;
  callBackMethod.call(this, this.GetSerializedCallbackInfoByID(callbackID) + arg);
 },
 GetCallbackMethod: function(command){
  return this.callBack;
 },
 CanCreateCallback: function() {
  return !this.InCallback() || (this.allowMultipleCallbacks && !this.beginCallbackAnimationProcessing && !this.endCallbackAnimationProcessing);
 },
 DoLoadCallbackScripts: function() {
  _aspxProcessScriptsAndLinks(this.name, true);
 },
 DoEndCallback: function() {
  if(this.IsCallbackAnimationEnabled() && this.CheckEndCallbackAnimationNeeded()) 
   return;
  this.requestCount--;
  if(this.HideLoadingPanelOnCallback() && this.requestCount < 1) 
   this.HideLoadingElements();
  if(this.enableSwipeGestures && this.supportGestures) {
   ASPxGesturesHelper.UpdateSwipeAnimationContainer(this.name);
   if(this.touchUIMouseScroller)
    this.touchUIMouseScroller.update();
  }
  this.isCallbackAnimationPrevented = false;
  this.OnCallbackFinalized();
  this.RaiseEndCallback();
 },
 DoFinalizeCallback: function() {
 },
 OnCallbackFinalized: function() {
 },
 HideLoadingPanelOnCallback: function() {
  return true;
 },
 ShouldHideExistingLoadingElements: function() {
  return true;
 },
 EvalCallbackResult: function(resultString){
  return eval(resultString)
 },
 DoCallback: function(result) {
  if(this.IsCallbackAnimationEnabled() && this.CheckBeginCallbackAnimationInProgress(result))
   return;
  result = _aspxTrim(result);
  if(result.indexOf(__aspxCallbackResultPrefix) != 0) 
   this.ProcessCallbackGeneralError(result);
  else {
   var resultObj = null;
   try {
    resultObj = this.EvalCallbackResult(result);
   } 
   catch(e) {
   }
   if(resultObj) {
    if(resultObj.redirect){
     if(!__aspxIE)
      window.location.href = resultObj.redirect;
     else { 
      var fakeLink = document.createElement("a");
      fakeLink.href = resultObj.redirect;
      document.body.appendChild(fakeLink); 
      fakeLink.click();
     }
    }
    else if(resultObj.generalError){
     this.ProcessCallbackGeneralError(resultObj.generalError);
    }
    else {
     var errorObj = resultObj.error;
     if(errorObj)
      this.ProcessCallbackError(errorObj);
     else {
      if(resultObj.cp) {
       for(var name in resultObj.cp)
        this[name] = resultObj.cp[name];
      }
      var callbackInfo = this.DequeueCallbackInfo(resultObj.id);
      if(callbackInfo.type == ASPxCallbackType.Data) 
       this.ProcessCustomDataCallback(resultObj.result, callbackInfo);
      else 
       this.ProcessCallback(resultObj.result);
     }
    }
   } 
  }
  this.DoLoadCallbackScripts();
 },
 DoCallbackError: function(result) {
  this.HideLoadingElements();
  this.ProcessCallbackGeneralError(result); 
 },
 DoControlClick: function(evt) {
  this.OnControlClick(_aspxGetEventSource(evt), evt);
 },
 ProcessCallback: function(result) {
  this.OnCallback(result);
 },
 ProcessCustomDataCallback: function(result, callbackInfo) {
  if(callbackInfo.handler != null)
   callbackInfo.handler(this, result);
  this.RaiseCustomDataCallback(result);
 },
 RaiseCustomDataCallback: function(result) {
  if(!this.CustomDataCallback.IsEmpty()) {
   var arg = new ASPxClientCustomDataCallbackEventArgs(result);
   this.CustomDataCallback.FireEvent(this, arg);
  }
 },
 OnCallback: function(result) {
 },
 CreateCallbackInfo: function(type, handler) {
  return { type: type, handler: handler };
 },
 GetSerializedCallbackInfoByID: function(callbackID) {
  return this.GetCallbackInfoByID(callbackID).type + callbackID + __aspxCallbackSeparator;
 },
 SaveCallbackInfo: function(callbackInfo) {
  var activeCallbacksInfo = this.GetActiveCallbacksInfo();
  for(var i = 0; i < activeCallbacksInfo.length; i++) {
   if(activeCallbacksInfo[i] == null) {
    activeCallbacksInfo[i] = callbackInfo;
    return i;
   }
  }
  activeCallbacksInfo.push(callbackInfo);
  return activeCallbacksInfo.length - 1;
 },
 GetActiveCallbacksInfo: function() {
  var persistentProperties = this.GetPersistentProperties();
  if(!persistentProperties.activeCallbacks)
   persistentProperties.activeCallbacks = [ ];
  return persistentProperties.activeCallbacks;
 },
 GetPersistentProperties: function() {
  var storage = _aspxGetPersistentControlPropertiesStorage();
  var persistentProperties = storage[this.name];
  if(!persistentProperties) {
   persistentProperties = { };
   storage[this.name] = persistentProperties;
  }
  return persistentProperties;
 },
 GetCallbackInfoByID: function(callbackID) {
  return this.GetActiveCallbacksInfo()[callbackID];
 },
 DequeueCallbackInfo: function(index) {
  var activeCallbacksInfo = this.GetActiveCallbacksInfo();
  if(index < 0 || index >= activeCallbacksInfo.length)
   return null;
  var result = activeCallbacksInfo[index];
  activeCallbacksInfo[index] = null;
  return result;
 },
 ProcessCallbackError: function(errorObj) {
  var data = _aspxIsExists(errorObj.data) ? errorObj.data : null;
  var result = this.RaiseCallbackError(errorObj.message);
  if(result.isHandled)
   this.OnCallbackErrorAfterUserHandle(result.errorMessage, data); 
  else
   this.OnCallbackError(result.errorMessage, data); 
 },
 OnCallbackError: function(errorMessage, data) {
  if(errorMessage)
   alert(errorMessage);
 },
 OnCallbackErrorAfterUserHandle: function(errorMessage, data) {
 },
 ProcessCallbackGeneralError: function(errorMessage) {
  var result = this.RaiseCallbackError(errorMessage);
  if(!result.isHandled)
   this.OnCallbackGeneralError(result.errorMessage);
 },
 OnCallbackGeneralError: function(errorMessage) {
  this.OnCallbackError(errorMessage, null);
 },
 SendPostBack: function(params) {
  if(typeof(__doPostBack) != "undefined")
   __doPostBack(this.uniqueID, params);
  else{
   var form = this.GetParentForm();
   if(form) form.submit();
  }
 }
});
ASPxClientControl.AdjustControls = function(container, collapseControls){
 aspxGetControlCollection().AdjustControls(container, collapseControls);
};
ASPxClientControl.Cast = function(obj) {
 if(typeof obj == "string")
  return window[obj];
 return obj;
};
ASPxClientControl.GetControlCollection = function(){
 return aspxGetControlCollection();
}
var __aspxControlCollection = null;
function aspxGetControlCollection(){
 if(__aspxControlCollection == null)
  __aspxControlCollection = new ASPxClientControlCollection();
 return __aspxControlCollection;
}
var __aspxPersistentControlPropertiesStorage = null;
function _aspxGetPersistentControlPropertiesStorage() {
 if(__aspxPersistentControlPropertiesStorage == null)
  __aspxPersistentControlPropertiesStorage = { };
 return __aspxPersistentControlPropertiesStorage;
}
function _aspxFunctionIsInCallstack(currentCallee, targetFunction, depthLimit) {
 var candidate = currentCallee;
 var depth = 0;
 while(candidate && depth <= depthLimit) {
  candidate = candidate.caller;
  if(candidate == targetFunction)
   return true;
  depth++;
 }
 return false;
}
function aspxCAInit() {
 var isAppInit = typeof(Sys$_Application$initialize) != "undefined" &&
  _aspxFunctionIsInCallstack(arguments.callee, Sys$_Application$initialize, 10 );
 aspxGetControlCollection().AtlasInitialize(!isAppInit);
}
function aspxCreateCallback(name, arg, command, callbackID){
 var control = aspxGetControlCollection().Get(name);
 if(control != null)
  control.CreateCallbackCore(unescape(arg), unescape(command), callbackID);
}
function aspxCallback(result, context){
 var collection = aspxGetControlCollection();
 collection.DoFinalizeCallback();
 var control = collection.Get(context);
 if(control != null)
  control.DoCallback(result);
}
function aspxCallbackError(result, context){
 var control = aspxGetControlCollection().Get(context);
 if(control != null)
  control.DoCallbackError(result, false);
}
function aspxCClick(name, evt) {
 var control = aspxGetControlCollection().Get(name);
 if(control != null) control.DoControlClick(evt);
}
_aspxAttachEventToElement(window, "resize", aspxGlobalWindowResize);
function aspxGlobalWindowResize(evt){
 aspxGetControlCollection().OnBrowserWindowResize(evt); 
}
_aspxAttachEventToElement(window.document, "DOMContentLoaded", aspxClassesDOMContentLoaded);
function aspxClassesDOMContentLoaded(evt){
 aspxGetControlCollection().DOMContentLoaded();
}
_aspxAttachEventToElement(window, "load", aspxClassesWindowOnLoad);
function aspxClassesWindowOnLoad(evt){
 __aspxDocumentLoaded = true;
 _aspxSweepDuplicatedLinks();
 ASPxResourceManager.SynchronizeResources();
 aspxGetControlCollection().Initialize();
 _aspxInitializeScripts();
 _aspxInitializeLinks();
 _aspxInitializeFocus();
}
ASPxIdent = { };
ASPxIdent.IsDate = function(obj) {
 return obj && obj.constructor == Date;
};
ASPxIdent.IsRegExp = function(obj) {
 return obj && obj.constructor === RegExp;
};
ASPxIdent.IsArray = function(obj) {
 return obj && obj.constructor == Array;
};
ASPxIdent.IsASPxClientControl = function(obj) {
 return obj && obj.isASPxClientControl;
};
ASPxIdent.IsASPxClientEdit = function(obj) {
 return obj && obj.isASPxClientEdit;
};
ASPxIdent.IsASPxClientRadioButtonList = function(obj) {
 return obj && obj.isASPxClientRadioButtonList;
};
ASPxClientPagerCommands = {
 Next : "PBN",
 Prev : "PBP",
 Last : "PBL",
 First : "PBF",
 PageNumber : "PN",
 PageSize : "PSP"
};
if(_aspxIsFunction(window.WebForm_InitCallbackAddField)) {
 (function() {
  var original = window.WebForm_InitCallbackAddField;
  window.WebForm_InitCallbackAddField = function(name, value) {
   if(typeof(name) == "string" && name)
    original.apply(null, arguments);
  };
 })();
}
function aspxFireDefaultButton(evt, buttonID) {
 if(_aspxIsDefaultButtonEvent(evt, buttonID)) {
  var defaultButton = _aspxGetElementById(buttonID);
  if(defaultButton && defaultButton.click) {
   if(_aspxIsFocusable(defaultButton))
    defaultButton.focus();
   _aspxDoElementClick(defaultButton);
   _aspxPreventEventAndBubble(evt);
   return false;
  }
 }
 return true;
}
function _aspxIsDefaultButtonEvent(evt, defaultButtonID) {
 if(evt.keyCode != ASPxKey.Enter)
  return false;
 var srcElement = _aspxGetEventSource(evt);
 if(!srcElement || srcElement.id === defaultButtonID)
  return true;
 var tagName = srcElement.tagName;
 var type = srcElement.type;
 return tagName != "TEXTAREA" && tagName != "BUTTON" && tagName != "A" &&
  (tagName != "INPUT" || type != "checkbox" && type != "radio" && type != "button" && type != "submit" && type != "reset");
}
ASPxPostHandler = _aspxCreateClass(null, {
 constructor: function() {
  this.Post = new ASPxClientEvent();
  this.PostFinalization = new ASPxClientEvent();
  this.observableForms = [];
  this.ReplaceGlobalPostFunctions();
  this.HandleDxCallbackBeginning();
  this.HandleMSAjaxRequestBeginning();
 },
 Update: function() {
  this.ReplaceFormsSubmit(true);
 },
 OnPost: function(ownerID, isCallback, isMSAjaxRequest, isDXCallback) {
  var args = new ASPxClientPostHandlerOnPostEventArgs(ownerID, isCallback, isMSAjaxRequest, isDXCallback);
  this.Post.FireEvent(this, args);
  if(args.cancel)
   return false;
  this.PostFinalization.FireEvent(this, ASPxClientEventArgs.Empty);
  return true;
 },
 ReplaceGlobalPostFunctions: function() {
  if(_aspxIsFunction(window.__doPostBack))
   this.ReplaceDoPostBack();
  if(_aspxIsFunction(window.WebForm_DoCallback))
   this.ReplaceDoCallback();
  this.ReplaceFormsSubmit();
 },
 HandleDxCallbackBeginning: function() {
  aspxGetControlCollection().BeforeInitCallback.AddHandler(function(s, e) {
   _aspxRaisePostHandlerOnPost(e.callbackOwnerID, true, false, true); 
  });
 },
 HandleMSAjaxRequestBeginning: function() {
  if(window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager && Sys.WebForms.PageRequestManager.getInstance) {
   var pageRequestManager = Sys.WebForms.PageRequestManager.getInstance();
   if(pageRequestManager != null && ASPxIdent.IsArray(pageRequestManager._onSubmitStatements)) {
    pageRequestManager._onSubmitStatements.unshift(function() {
     var postbackSettings = Sys.WebForms.PageRequestManager.getInstance()._postBackSettings;
     var postHandler = aspxGetPostHandler();
     _aspxRaisePostHandlerOnPost(postbackSettings.asyncTarget, true, true);
     return !postHandler.cancelPostProcessing;
    });
   }
  }
 },
 ReplaceDoPostBack: function() {
  var original = __doPostBack;
  __doPostBack = function(eventTarget, eventArgument) {
   var postHandler = aspxGetPostHandler();
   _aspxRaisePostHandlerOnPost(eventTarget);
   if(postHandler.cancelPostProcessing)
    return;
   original(eventTarget, eventArgument);
  };
 },
 ReplaceDoCallback: function() {
  var original = WebForm_DoCallback;
  WebForm_DoCallback = function(eventTarget, eventArgument, eventCallback, context, errorCallback, useAsync) {
   var postHandler = aspxGetPostHandler();
   if(postHandler.dxCallbackHandled)
    delete postHandler.dxCallbackHandled;
   else
    _aspxRaisePostHandlerOnPost(eventTarget, true);
   if(postHandler.cancelPostProcessing)
    return;
   return original(eventTarget, eventArgument, eventCallback, context, errorCallback, useAsync);
  };
 },
 ReplaceFormsSubmit: function(checkObservableCollection) {
  for(var i = 0; i < document.forms.length; i++) { 
   var form = document.forms[i];
   if(checkObservableCollection && _aspxArrayIndexOf(this.observableForms, form) >= 0)
    continue;
   if(form.submit)
    this.ReplaceFormSubmit(form);
   this.ReplaceFormOnSumbit(form);
   this.observableForms.push(form);
  }
 },
 ReplaceFormSubmit: function(form) {
  var originalSubmit = form.submit;
  form.submit = function() {
   var postHandler = aspxGetPostHandler();
   _aspxRaisePostHandlerOnPost();
   if(postHandler.cancelPostProcessing)
    return false;
   var callee = arguments.callee;
   this.submit = originalSubmit;
   var submitResult = this.submit();
   this.submit = callee;
   return submitResult;
  };
  form = null;
 },
 ReplaceFormOnSumbit: function(form) {
  var originalSubmit = form.onsubmit;
  form.onsubmit = function() {
   var postHandler = aspxGetPostHandler();
   if(postHandler.msAjaxRequestBeginningHandled)
    delete postHandler.msAjaxRequestBeginningHandled;
   else
    _aspxRaisePostHandlerOnPost();
   if(postHandler.cancelPostProcessing)
    return false;
   return _aspxIsFunction(originalSubmit)
    ? originalSubmit.apply(this, arguments)
    : true;
  };
  form = null;
 }
});
function _aspxRaisePostHandlerOnPost(ownerID, isCallback, isMSAjaxRequestBeginning, isDXCallbackBeginning) {
 var postHandler = aspxGetPostHandler();
 if(isMSAjaxRequestBeginning)
  postHandler.msAjaxRequestBeginningHandled = true;
 else if(isDXCallbackBeginning)
  postHandler.dxCallbackHandled = true;
 postHandler.cancelPostProcessing = !postHandler.OnPost(ownerID, isCallback, isMSAjaxRequestBeginning, isDXCallbackBeginning);
}
function aspxGetPostHandler() {
 if (!window.__aspxPostHandler)
  window.__aspxPostHandler = new ASPxPostHandler();
 return window.__aspxPostHandler;
}
ASPxClientBeforeInitCallbackEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(callbackOwnerID){
  this.constructor.prototype.constructor.call(this);
  this.callbackOwnerID = callbackOwnerID;
 }
});
ASPxClientPostHandlerOnPostEventArgs = _aspxCreateClass(ASPxClientCancelEventArgs, {
 constructor: function(ownerID, isCallback, isMSAjaxCallback, isDXCallback){
  this.constructor.prototype.constructor.call(this);
  this.ownerID = ownerID;
  this.isCallback = !!isCallback;
  this.isDXCallback = !!isDXCallback;
  this.isMSAjaxCallback = !!isMSAjaxCallback;
 }
});
ASPxResourceManager = {
 HandlerStr: "DXR.axd?r=",
 ResourceHashes: {},
 SynchronizeResources: function(method){
  if(!method){
   method = function(name, resource) { 
    this.UpdateInputElements(name, resource); 
   }.aspxBind(this);
  }
  var resources = this.GetResourcesData();
  for(var name in resources)
   method(name, resources[name]);
 },
 GetResourcesData: function(){
  return {
   DXScript: this.GetResourcesElementsString(_aspxGetIncludeScripts(), "src", "DXScript"),
   DXCss: this.GetResourcesElementsString(_aspxGetLinks(), "href", "DXCss")
  };
 },
 GetResourcesElementsString: function(elements, urlAttr, id){
  if(!this.ResourceHashes[id]) 
   this.ResourceHashes[id] = {};
  var hash = this.ResourceHashes[id];
  for(var i = 0; i < elements.length; i++) {
   var resourceUrl = _aspxGetAttribute(elements[i], urlAttr);
   if(resourceUrl) {
    var pos = resourceUrl.indexOf(this.HandlerStr);
    if(pos > -1){
     var list = resourceUrl.substr(pos + this.HandlerStr.length);
     var ampPos = list.lastIndexOf("-");
     if(ampPos > -1)
      list = list.substr(0, ampPos);
     var indexes = list.split(",");
     for(var j = 0; j < indexes.length; j++)
      hash[indexes[j]] = indexes[j];
    }
    else
     hash[resourceUrl] = resourceUrl;
   }
  }
  var array = [];
  for(var key in hash) 
   array.push(key);
  return array.join(",");
 },
 UpdateInputElements: function(typeName, list){
  for(var i = 0; i < document.forms.length; i++){
   var inputElement = document.forms[i][typeName];
   if(!inputElement)
    inputElement = this.CreateInputElement(document.forms[i], typeName);
   inputElement.value = list;
  }
 },
 CreateInputElement: function(form, typeName){
  var inputElement = _aspxCreateHiddenField(typeName, typeName);
  form.appendChild(inputElement);
  return inputElement;
 }
};
var __aspxIncludeScriptPrefix = "dxis_";
var __aspxStartupScriptPrefix = "dxss_";
var __aspxIncludeScriptsCache = {};
var __aspxCreatedIncludeScripts = [];
var __aspxAppendedScriptsCount = 0;
var __aspxCallbackOwnerNames = [];
var __aspxScriptsRestartHandlers = { };
function _aspxGetScriptCode(script) {
 var useFirstChildElement = __aspxChrome && __aspxBrowserVersion < 11 
  || __aspxSafari && __aspxBrowserVersion < 5; 
 var text = useFirstChildElement ? script.firstChild.data : script.text;
 var comment = "<!--";
 var pos = text.indexOf(comment);
 if(pos > -1)
  text = text.substr(pos + comment.length);
 return text;
}
function _aspxAppendScript(script) {
 var parent = document.getElementsByTagName("head")[0];
 if(!parent)
  parent = document.body;
 if(parent)
  parent.appendChild(script);
}
function _aspxIsKnownIncludeScript(script) {
 return !!__aspxIncludeScriptsCache[script.src];
}
function _aspxCacheIncludeScript(script) {
 __aspxIncludeScriptsCache[script.src] = 1;
}
function _aspxProcessScriptsAndLinks(ownerName, isCallback) {
 if(!__aspxDocumentLoaded) return; 
 _aspxProcessScripts(ownerName, isCallback);
 _aspxSweepDuplicatedLinks();
 _aspxMoveLinkElements();
 __aspxCachedRules = { };
}
function _aspxGetStartupScripts() {
 return _aspxGetScriptsCore(__aspxStartupScriptPrefix);
}
function _aspxGetIncludeScripts() {
 return _aspxGetScriptsCore(__aspxIncludeScriptPrefix);
}
function _aspxGetScriptsCore(prefix) {
 var result = [];
 var scripts = document.getElementsByTagName("SCRIPT");
 for(var i = 0; i < scripts.length; i++) {
  if (scripts[i].id.indexOf(prefix) == 0)
   result.push(scripts[i]);
 }
 return result;
}
function _aspxGetLinks() {
 var result = [];
 var links = document.getElementsByTagName("LINK");;
 for(var i = 0; i < links.length; i++) 
  result[i] = links[i];
 return result;
}
function _aspxIsLinksLoaded() {
 var links = _aspxGetLinks();
 for(var i = 0, link; link = links[i]; i++) {
  if(link.readyState && link.readyState.toLowerCase() == "loading")
    return false;
  }
 return true;
}
function _aspxInitializeLinks() {
 var links = _aspxGetLinks();
 for(var i = 0; i < links.length; i++)
  links[i].loaded = true; 
}
function _aspxInitializeScripts() {
 var scripts = _aspxGetIncludeScripts();
 for(var i = 0; i < scripts.length; i++)
  _aspxCacheIncludeScript(scripts[i]);   
 var startupScripts = _aspxGetStartupScripts();
 for(var i = 0; i < startupScripts.length; i++)
  startupScripts[i].executed = true; 
}
function _aspxSweepDuplicatedLinks() {
 var hash = { };
 var links = _aspxGetLinks();
 for(var i = 0; i < links.length; i++) {
  var href = links[i].href;
  if(!href)
   continue;
  if(hash[href]){
   if((__aspxIE || !hash[href].loaded) && links[i].loaded) {
    _aspxRemoveElement(hash[href]);
    hash[href] = links[i];
   }
   else
    _aspxRemoveElement(links[i]);
  }
  else
   hash[href] = links[i];
 }
}
function _aspxSweepDuplicatedScripts() {
 var hash = { };
 var scripts = _aspxGetIncludeScripts();
 for(var i = 0; i < scripts.length; i++) {
  var src = scripts[i].src;
  if(!src) continue;
  if(hash[src])
   _aspxRemoveElement(scripts[i]);
  else
   hash[src] = scripts[i];
 }
}
function _aspxProcessScripts(ownerName, isCallback) {
 var scripts = _aspxGetIncludeScripts();
 var previousCreatedScript = null;
 var firstCreatedScript = null;
 for(var i = 0; i < scripts.length; i++) {
  var script = scripts[i];
  if(script.src == "") continue; 
  if(_aspxIsKnownIncludeScript(script))
   continue;
  var createdScript = document.createElement("script");
  createdScript.type = "text/javascript";
  createdScript.src = script.src;
  createdScript.id = script.id;
  function AreScriptsEqual(script1, script2) {
   return script1.src == script2.src;
  }
  if(_aspxArrayIndexOf(__aspxCreatedIncludeScripts, createdScript, AreScriptsEqual) >= 0)
   continue;
  __aspxCreatedIncludeScripts.push(createdScript);
  _aspxRemoveElement(script);
  if(__aspxIE && __aspxBrowserVersion < 9) {
   createdScript.onreadystatechange = new Function("_aspxOnScriptReadyStateChangedCallback(this, " + isCallback + ");");
  } else if(__aspxWebKitFamily || (__aspxFirefox && __aspxBrowserVersion >= 4) || __aspxIE && __aspxBrowserVersion >= 9) {
   createdScript.onload = new Function("_aspxOnScriptLoadCallback(this, " + isCallback + ");");
   if(firstCreatedScript == null)
    firstCreatedScript = createdScript;
   createdScript.nextCreatedScript = null;
   if(previousCreatedScript != null)
    previousCreatedScript.nextCreatedScript = createdScript;
   previousCreatedScript = createdScript;
  } else {
   createdScript.onload = new Function("_aspxOnScriptLoadCallback(this);");
   _aspxAppendScript(createdScript);
   _aspxCacheIncludeScript(createdScript);
  }
 }
 if(firstCreatedScript != null) {
  _aspxAppendScript(firstCreatedScript);
  _aspxCacheIncludeScript(firstCreatedScript);
 }
 if(isCallback)
  __aspxCallbackOwnerNames.push(ownerName);
 if(__aspxCreatedIncludeScripts.length == 0)
  _aspxFinalizeScriptProcessing(isCallback);
}
function _aspxFinalizeScriptProcessing(isCallback) {
 __aspxCreatedIncludeScripts = [];
 __aspxAppendedScriptsCount = 0;
 _aspxSweepDuplicatedScripts();
 _aspxRunStartupScripts(isCallback);
 ASPxResourceManager.SynchronizeResources();
}
var __aspxStartupScriptsRunning = false;
function _aspxRunStartupScripts(isCallback) {
 __aspxStartupScriptsRunning = true;
 try {
  _aspxRunStartupScriptsCore();
 }
 finally {
  __aspxStartupScriptsRunning = false;
 }
 if(__aspxDocumentLoaded) {
  aspxGetControlCollection().InitializeElements(isCallback);
  for(var key in __aspxScriptsRestartHandlers)
   __aspxScriptsRestartHandlers[key]();
  _aspxRunEndCallbackScript();
 }
}
function _aspxRunStartupScriptsCore() {
 var scripts = _aspxGetStartupScripts();
 var code;
 for(var i = 0; i < scripts.length; i++){
  if(!scripts[i].executed) {
   code = _aspxGetScriptCode(scripts[i]);
   eval(code);
   scripts[i].executed = true;
  }
 }
}
function _aspxRunEndCallbackScript() {
 while(__aspxCallbackOwnerNames.length > 0) {
  var callbackOwnerName = __aspxCallbackOwnerNames.pop();
  var callbackOwner = aspxGetControlCollection().Get(callbackOwnerName);
  if(callbackOwner)
   callbackOwner.DoEndCallback();
 }
}
function _aspxOnScriptReadyStateChangedCallback(scriptElement, isCallback) {
 if(scriptElement.readyState == "loaded") {
  _aspxCacheIncludeScript(scriptElement);
  for(var i = 0; i < __aspxCreatedIncludeScripts.length; i++) {
   var script = __aspxCreatedIncludeScripts[i];
   if(_aspxIsKnownIncludeScript(script)) {
    if(!script.executed) {
     script.executed = true;
     _aspxAppendScript(script);
     __aspxAppendedScriptsCount++;
    }
   } else
    break;
  }
  if(__aspxCreatedIncludeScripts.length == __aspxAppendedScriptsCount)
   _aspxFinalizeScriptProcessing(isCallback);
 }
}
function _aspxOnScriptLoadCallback(scriptElement, isCallback) {
 __aspxAppendedScriptsCount++;
 if(scriptElement.nextCreatedScript) {
  _aspxAppendScript(scriptElement.nextCreatedScript);
  _aspxCacheIncludeScript(scriptElement.nextCreatedScript);
 }
 if(__aspxCreatedIncludeScripts.length == __aspxAppendedScriptsCount)
  _aspxFinalizeScriptProcessing(isCallback);
}
function _aspxAddScriptsRestartHandler(objectName, handler) {
 __aspxScriptsRestartHandlers[objectName] = handler;
}
function _aspxMoveLinkElements() {
 var head = _aspxGetElementsByTagName(document, "head")[0];
 var bodyLinks = _aspxGetElementsByTagName(document.body, "link");
 if(head && bodyLinks.length > 0){
  var headLinks = _aspxGetElementsByTagName(head, "link");
  var dxLinkAnchor = head.firstChild;
  for(var i = 0; i < headLinks.length; i++){
   if(headLinks[i].href.indexOf(ASPxResourceManager.HandlerStr) > -1)
    dxLinkAnchor = headLinks[i].nextSibling;
  }
  while(bodyLinks.length > 0) 
   head.insertBefore(bodyLinks[0], dxLinkAnchor);
 }
}
ASPxIFrame = _aspxCreateClass(null, {
 constructor: function(params) {
  this.params = params || {};
  this.params.src = this.params.src || "";
  this.CreateElements();
 },
 CreateElements: function() {
  var elements = ASPxIFrame.Create(this.params);
  this.containerElement = elements.container;
  this.iframeElement = elements.iframe;
  this.AttachOnLoadHandler(this, this.iframeElement);
  this.SetLoading(true);
  if(this.params.onCreate)
   this.params.onCreate(this.containerElement, this.iframeElement);
 },
 AttachOnLoadHandler: function(instance, element) {
  _aspxAttachEventToElement(element, "load", function() {
   instance.OnLoad(element);
  });
 },
 OnLoad: function(element) {
  this.SetLoading(false, element);
  if(!element.preventCustomOnLoad && this.params.onLoad)
   this.params.onLoad();
 },
 IsLoading: function(element) {
  element = element || this.iframeElement;
  if(element)
   return element.loading;
  return false;
 },
 SetLoading: function(value, element) {
  element = element || this.iframeElement;
  if(element)
   element.loading = value;
 },
 GetContentUrl: function() {
  return this.params.src;
 },
 SetContentUrl: function(url, preventBrowserCaching) {
  if(url) {
   this.params.src = url;
   if(preventBrowserCaching)
    url = ASPxIFrame.AddRandomParamToUrl(url);
   this.SetLoading(true);
   this.iframeElement.src = url;
  }
 },
 RefreshContentUrl: function() {
  if(this.IsLoading())
   return;
  this.SetLoading(true);
  var oldContainerElement = this.containerElement;
  var oldIframeElement = this.iframeElement;
  var postfix = "_del" + Math.floor(Math.random()*100000).toString();
  if(this.params.id)
   oldIframeElement.id = this.params.id + postfix;
  if(this.params.name)
   oldIframeElement.name = this.params.name + postfix;
  _aspxSetStyles(oldContainerElement, { height: 0 });
  this.CreateElements();
  oldIframeElement.preventCustomOnLoad = true;
  oldIframeElement.src = ASPx.BlankUrl;
  window.setTimeout(function() {
   oldContainerElement.parentNode.removeChild(oldContainerElement);
  }, 10000); 
 }
});
ASPxIFrame.Create = function(params) {
 var iframeHtmlStringParts = [ "<iframe frameborder='0'" ];
 if(params) {
  if(params.id)
   iframeHtmlStringParts.push(" id='", params.id, "'");
  if(params.name)
   iframeHtmlStringParts.push(" name='", params.name, "'");
  if(params.title)
   iframeHtmlStringParts.push(" title='", params.title, "'");
  if(params.scrolling)
   iframeHtmlStringParts.push(" scrolling='", params.scrolling, "'");
  if(params.src)
   iframeHtmlStringParts.push(" src='", params.src, "'");
 }
 iframeHtmlStringParts.push("></iframe>");
 var containerElement = _aspxCreateHtmlElementFromString("<div style='border-width: 0px; padding: 0px; margin: 0px'></div>");
 var iframeElement = _aspxCreateHtmlElementFromString(iframeHtmlStringParts.join(""));
 containerElement.appendChild(iframeElement);
 return {
  container: containerElement,
  iframe: iframeElement
 };
};
ASPxIFrame.AddRandomParamToUrl = function(url) {
 var prefix = url.indexOf("?") > -1
  ? "&"
  : "?";
 var param = prefix + Math.floor(Math.random()*100000).toString();
 var anchorIndex = url.indexOf("#");
 return anchorIndex == -1
  ? url + param
  : url.substr(0, anchorIndex) + param + url.substr(anchorIndex);
};
ASPxIFrame.GetWindow = function(name) {
 if(__aspxIE)
  return window.frames[name].window;
 else{
  var frameElement = document.getElementById(name);
  return (frameElement != null) ? frameElement.contentWindow : null;
 }
};
ASPxIFrame.GetDocument = function(name) {
 var frameElement;
 if(__aspxIE) {
  frameElement = window.frames[name];
  return (frameElement != null) ? frameElement.document : null;
 }
 else {
  frameElement = document.getElementById(name);
  return (frameElement != null) ? frameElement.contentDocument : null;
 }
};
ASPxIFrame.GetDocumentBody = function(name) {
 var doc = ASPxIFrame.GetDocument(name);
 return (doc != null) ? doc.body : null;
};
ASPxIFrame.GetElement = function(name) {
 if(__aspxIE)
  return window.frames[name].window.frameElement;
 else
  return document.getElementById(name);
};
ASPxKbdHelper = _aspxCreateClass(null, {
 constructor: function(control) {
  this.control = control;
 },
 Init: function() {
  ASPxKbdHelper.GlobalInit();
  var element = this.GetFocusableElement();
  element.tabIndex = Math.max(element.tabIndex, 0);
  var instance = this;
  _aspxAttachEventToElement(element, "click", function(e) {
   instance.HandleClick(e);
  });  
  _aspxAttachEventToElement(element, "focus", function(e) {    
   if(!instance.CanFocus(e))
    return true;
   ASPxKbdHelper.active = instance;
  });
  _aspxAttachEventToElement(element, "blur", function() {
   delete ASPxKbdHelper.active;
  });    
 },
 GetFocusableElement: function() { return this.control.GetMainElement(); },
 CanFocus: function(e) {
  var tag = _aspxGetEventSource(e).tagName;
  if(tag == "A" || tag == "TEXTAREA" || tag == "INPUT" || tag == "SELECT" || tag == "IFRAME" || tag == "OBJECT")
   return false; 
  return true;
 },
 HandleClick: function(e) {
  if(!this.CanFocus(e))
   return;
  this.Focus();
 },
 Focus: function() {
  try {
   this.GetFocusableElement().focus();   
  } catch(e) {
  }
 },
 HandleKeyDown: function(e) { }, 
 HandleKeyPress: function(e) { }, 
 HandleKeyUp: function(e) { }
});
ASPxKbdHelper.GlobalInit = function() {
 if(ASPxKbdHelper.ready)
  return;
 _aspxAttachEventToDocument("keydown", ASPxKbdHelper.OnKeyDown);
 _aspxAttachEventToDocument("keypress", ASPxKbdHelper.OnKeyPress);
 _aspxAttachEventToDocument("keyup", ASPxKbdHelper.OnKeyUp);
 ASPxKbdHelper.ready = true; 
};
ASPxKbdHelper.swallowKey = false;
ASPxKbdHelper.accessKeys = { };
ASPxKbdHelper.ProcessKey = function(e, actionName) {
 if(!ASPxKbdHelper.active) 
  return;
 if(ASPxKbdHelper.active.GetFocusableElement() !== _aspxGetFocusedElement())
  return;
 var ctl = ASPxKbdHelper.active.control;
 if(ctl !== aspxGetControlCollection().Get(ctl.name)) {
  delete ASPxKbdHelper.active;
  return;
 }
 if(!ASPxKbdHelper.swallowKey) 
  ASPxKbdHelper.swallowKey = ASPxKbdHelper.active[actionName](e);
 if(ASPxKbdHelper.swallowKey)
  _aspxPreventEvent(e);
};
ASPxKbdHelper.OnKeyDown = function(e) {
 ASPxKbdHelper.swallowKey = false; 
 if(e.ctrlKey && e.shiftKey && ASPxKbdHelper.TryAccessKey(_aspxGetKeyCode(e)))
  _aspxPreventEvent(e);  
 else 
  ASPxKbdHelper.ProcessKey(e, "HandleKeyDown"); 
};
ASPxKbdHelper.OnKeyPress = function(e) { ASPxKbdHelper.ProcessKey(e, "HandleKeyPress"); };
ASPxKbdHelper.OnKeyUp = function(e) { ASPxKbdHelper.ProcessKey(e, "HandleKeyUp"); };
ASPxKbdHelper.RegisterAccessKey = function(obj) {
 var key = obj.accessKey;
 if(!key) return;
 ASPxKbdHelper.accessKeys[key.toLowerCase()] = obj.name;
};
ASPxKbdHelper.TryAccessKey = function(code) {
 var name = ASPxKbdHelper.accessKeys[String.fromCharCode(code).toLowerCase()];
 if(!name) return false;
 var obj = aspxGetControlCollection().Get(name);
 if(!obj) return false;
 var el = obj.GetMainElement();
 if(!el) return false;
 el.focus();
 return true;
};
var __aspxFocusedElement = null;
function aspxOnElementFocused(evt) {
 evt = _aspxGetEvent(evt);
 if(evt && evt.target)
  __aspxFocusedElement = evt.target;
}
function _aspxInitializeFocus() {
 if(!_aspxGetActiveElement())
  _aspxAttachEventToDocument("focus", aspxOnElementFocused);
}
function _aspxGetFocusedElement() {
 var activeElement = _aspxGetActiveElement();
 return activeElement ? activeElement : __aspxFocusedElement;
}
function _aspxChangeElementContainer(element, container, savePreviousContainer) {
 if(element.parentNode != container) {
  var parentNode = element.parentNode;
  parentNode.removeChild(element);
  container.appendChild(element);
  if(savePreviousContainer)
   element.previousContainer = parentNode;
 }
}
function _aspxRestoreElementContainer(element) {
 if(element.previousContainer) {
  _aspxChangeElementContainer(element, element.previousContainer, false);
  element.previousContainer = null;
 }
}
var ASPxCacheHelper = {};
ASPxCacheHelper.GetCachedValue = function(obj, cacheName, func, cacheObj) {
 if(!cacheObj)
  cacheObj = obj;
 if(!cacheObj.cache)
  cacheObj.cache = {};
 if(!_aspxIsExists(cacheObj.cache[cacheName]))
  cacheObj.cache[cacheName] = func.apply(obj, []);
 return cacheObj.cache[cacheName];
};
ASPxCacheHelper.DropCachedValue = function(cacheObj, cacheName) {
 cacheObj.cache[cacheName] = null;
};  
ASPxClientTemporaryCache = _aspxCreateClass(null, {
 constructor: function() { 
  this.cache = { };
  this.invalidateTimerID = -1;
 },
 Get: function(key, getObjectFunc, context, args) {
  if(this.invalidateTimerID < 0) {
   this.invalidateTimerID = window.setTimeout(function() {
    this.Invalidate();
   }.aspxBind(this), 0);
  }
  if(!_aspxIsExists(this.cache[key])) {
   if(!_aspxIsExists(args))
    args = [ ];
   this.cache[key] = getObjectFunc.apply(context, args);
  }
  return this.cache[key];
 },
 Invalidate: function() {
  this.cache = { };
  this.invalidateTimerID = _aspxClearTimer(this.invalidateTimerID);
 }
});
ASPxClientCheckBoxCheckState = {
 Checked : "Checked",
 Unchecked : "Unchecked",
 Indeterminate : "Indeterminate"
};
ASPxClientCheckBoxInputKey = { 
 Checked : "C",
 Unchecked : "U",
 Indeterminate : "I"
};
ASPxCheckableElementStateController = _aspxCreateClass(null, {
 constructor: function(imageProperties) {
  this.checkBoxStates = [];
  this.imageProperties = imageProperties;
 },
 GetValueByInputKey: function(inputKey) {
  return this.GetFirstValueBySecondValue("Value", "StateInputKey", inputKey);
 },
 GetInputKeyByValue: function(value) {
  return this.GetFirstValueBySecondValue("StateInputKey", "Value", value);
 },
 GetImagePropertiesNumByInputKey: function(value) {
  return this.GetFirstValueBySecondValue("ImagePropertiesNumber", "StateInputKey", value);
 },
 GetNextCheckBoxValue: function(currentValue, allowGrayed) {
  var currentInputKey = this.GetInputKeyByValue(currentValue);
  var nextInputKey = '';
  switch(currentInputKey) {
   case ASPxClientCheckBoxInputKey.Checked:
    nextInputKey = ASPxClientCheckBoxInputKey.Unchecked; break;
   case ASPxClientCheckBoxInputKey.Unchecked:
    nextInputKey = allowGrayed ? ASPxClientCheckBoxInputKey.Indeterminate : ASPxClientCheckBoxInputKey.Checked; break;
   case ASPxClientCheckBoxInputKey.Indeterminate:
    nextInputKey = ASPxClientCheckBoxInputKey.Checked; break;
  }
  return this.GetValueByInputKey(nextInputKey);
 },
 GetCheckStateByInputKey: function(inputKey) {
  switch(inputKey) {
   case ASPxClientCheckBoxInputKey.Checked: 
    return ASPxClientCheckBoxCheckState.Checked;
   case ASPxClientCheckBoxInputKey.Unchecked: 
    return ASPxClientCheckBoxCheckState.Unchecked;
   case ASPxClientCheckBoxInputKey.Indeterminate: 
    return ASPxClientCheckBoxCheckState.Indeterminate;
  }
 },
 GetValueByCheckState: function(checkState) {
  switch(checkState) {
   case ASPxClientCheckBoxCheckState.Checked: 
    return this.GetValueByInputKey(ASPxClientCheckBoxInputKey.Checked);
   case ASPxClientCheckBoxCheckState.Unchecked: 
    return this.GetValueByInputKey(ASPxClientCheckBoxInputKey.Unchecked);
   case ASPxClientCheckBoxCheckState.Indeterminate: 
    return this.GetValueByInputKey(ASPxClientCheckBoxInputKey.Indeterminate);
  }
 },
 GetFirstValueBySecondValue: function(firstValueName, secondValueName, secondValue) {
  return this.GetValueByFunc(firstValueName, 
   function(checkBoxState) { return checkBoxState[secondValueName] === secondValue; });
 },
 GetValueByFunc: function(valueName, func) {
  for(var i = 0; i < this.checkBoxStates.length; i++) {
   if(func(this.checkBoxStates[i]))
    return this.checkBoxStates[i][valueName];
  }  
 },
 AssignElementClassName: function(element, cssClassPropertyKey, disabledCssClassPropertyKey, assignedClassName) {
  var classNames = [ ];
  for(var i = 0; i < this.imageProperties[cssClassPropertyKey].length; i++) {
   classNames.push(this.imageProperties[disabledCssClassPropertyKey][i]);
   classNames.push(this.imageProperties[cssClassPropertyKey][i]);
  }
  var elementClassName = element.className;
  for(var i = 0; i < classNames.length; i++) {
   var className = classNames[i];
   var index = elementClassName.indexOf(className);
   if(index > -1)
    elementClassName = elementClassName.replace((index == 0 ? '' : ' ') + className, "");
  }
  elementClassName += " " + assignedClassName;
  element.className = elementClassName;
 },
 UpdateInternalCheckBoxDecoration: function(mainElement, inputKey, enabled) {
  var imagePropertiesNumber = this.GetImagePropertiesNumByInputKey(inputKey);
  for (var imagePropertyKey in this.imageProperties) {
   var propertyValue = this.imageProperties[imagePropertyKey][imagePropertiesNumber];
   propertyValue = propertyValue || !isNaN(propertyValue) ? propertyValue : "";
   switch(imagePropertyKey) {
    case "0" : mainElement.title = propertyValue; break;
    case "1" : mainElement.style.width = propertyValue + (propertyValue != "" ? "px" : ""); break;
    case "2" : mainElement.style.height = propertyValue + (propertyValue != "" ? "px" : ""); break;
   }
   if(enabled) {
    switch(imagePropertyKey) {
     case "3" : this.SetImageSrc(mainElement, propertyValue); break;
     case "4" : 
      this.AssignElementClassName(mainElement, "4", "8", propertyValue);
      break;
     case "5" : this.SetBackgroundPosition(mainElement, propertyValue, true); break;
     case "6" : this.SetBackgroundPosition(mainElement, propertyValue, false); break;
    }
   } else {
     switch(imagePropertyKey) {
     case "7" : this.SetImageSrc(mainElement, propertyValue); break;
     case "8" : 
      this.AssignElementClassName(mainElement, "4", "8", propertyValue);
      break;
     case "9" : this.SetBackgroundPosition(mainElement, propertyValue, true); break;
     case "10" : this.SetBackgroundPosition(mainElement, propertyValue, false); break;
    }
   }
  }
 },
 SetImageSrc: function(mainElement, src) {
  if(src === ""){
   mainElement.style.backgroundImage = "";
   mainElement.style.backgroundPosition = "";
  }
  else{
   mainElement.style.backgroundImage = "url(" + src + ")";
   this.SetBackgroundPosition(mainElement, 0, true);
   this.SetBackgroundPosition(mainElement, 0, false);
  }
 },
 SetBackgroundPosition: function(element, value, isX) {
  if(value === "") {
   element.style.backgroundPosition = value;
   return;
  }
  if(element.style.backgroundPosition === "")
   element.style.backgroundPosition = isX ? "-" + value.toString() + "px 0px" : "0px -" + value.toString() + "px";
  else {
   var position = element.style.backgroundPosition.split(' ');
   element.style.backgroundPosition = isX ? '-' + value.toString() + "px " + position[1] :  position[0] + " -" + value.toString() + "px";
  }
 },
 AddState: function(value, stateInputKey, imagePropertiesNumber) {
  this.checkBoxStates.push({
   "Value" : value, 
   "StateInputKey" : stateInputKey, 
   "ImagePropertiesNumber" : imagePropertiesNumber
  });
 }
});
ASPxCheckableElementStateController.Create = function(imageProperties, valueChecked, valueUnchecked, valueGrayed, allowGrayed) {
 var stateController = new ASPxCheckableElementStateController(imageProperties);
 stateController.AddState(valueChecked, ASPxClientCheckBoxInputKey.Checked, 0);
 stateController.AddState(valueUnchecked, ASPxClientCheckBoxInputKey.Unchecked, 1);
 if(typeof(valueGrayed) != "undefined")
  stateController.AddState(valueGrayed, ASPxClientCheckBoxInputKey.Indeterminate, allowGrayed ? 2 : 1);
 stateController.allowGrayed = allowGrayed;
 return stateController;
};
ASPxCheckableElementHelper = _aspxCreateClass(null, {
 InternalCheckBoxInitialize: function(internalCheckBox) {
  this.AttachToMainElement(internalCheckBox);
  this.AttachToInputElement(internalCheckBox);
 },
 AttachToMainElement: function(internalCheckBox) {
  var instance = this;
  if(internalCheckBox.mainElement) {
    _aspxAttachEventToElement(internalCheckBox.mainElement, "click",
    function (evt) { 
     instance.InvokeClick(internalCheckBox, evt);
     if(!internalCheckBox.disableCancelBubble)
      return _aspxPreventEventAndBubble(evt);
    }
   );
   _aspxAttachEventToElement(internalCheckBox.mainElement, "mousedown",
    function (evt) {
     internalCheckBox.Refocus();
    }
   );
   _aspxPreventElementDragAndSelect(internalCheckBox.mainElement, true);
  }
 },
 AttachToInputElement: function(internalCheckBox) {
  var instance = this;
  if(internalCheckBox.inputElement && internalCheckBox.mainElement) {
   _aspxAttachEventToElement(internalCheckBox.inputElement, "focus",
    function (evt) { 
     if(!internalCheckBox.enabled)
      internalCheckBox.inputElement.blur();
     else
      internalCheckBox.OnFocus();
    }
   );
   _aspxAttachEventToElement(internalCheckBox.inputElement, "blur", 
    function (evt) { 
     internalCheckBox.OnLostFocus();
    }
   );
   _aspxAttachEventToElement(internalCheckBox.inputElement, "keyup",
    function (evt) { 
     if(_aspxGetKeyCode(evt) == ASPxKey.Space)
      instance.InvokeClick(internalCheckBox, evt);
    }
   );
   _aspxAttachEventToElement(internalCheckBox.inputElement, "keydown",
    function (evt) { 
     if(_aspxGetKeyCode(evt) == ASPxKey.Space)
      return _aspxPreventEvent(evt);
    }
   );
  }
 },
 IsKBSInputWrapperExist: function() {
  return __aspxOpera || __aspxWebKitFamily;
 },
 GetICBMainElementByInput: function(icbInputElement) {
  return this.IsKBSInputWrapperExist() ? icbInputElement.parentNode.parentNode : icbInputElement.parentNode;
 },
 InvokeClick: function(internalCheckBox, evt) {
   if(internalCheckBox.enabled && !internalCheckBox.readOnly) {
   var inputElementValue = internalCheckBox.inputElement.value;
   internalCheckBox.inputElement.focus();
   if(!__aspxIE) 
    internalCheckBox.inputElement.value = inputElementValue;
   this.InvokeClickCore(internalCheckBox, evt)
   }
 },
 InvokeClickCore: function(internalCheckBox, evt) {
  internalCheckBox.OnClick(evt);
 }
});
ASPxCheckableElementHelper.Instance = new ASPxCheckableElementHelper();
ASPxClientCheckBoxInternal = _aspxCreateClass(null, {
 constructor: function(inputElement, stateController, allowGrayed, allowGrayedByClick, helper, container, storeValueInInput, key, disableCancelBubble) {
  this.inputElement = inputElement;
  this.mainElement = helper.GetICBMainElementByInput(this.inputElement);
  this.name = (key ? key : this.inputElement.id) + ASPxClientCheckBoxInternal.GetICBMainElementPostfix();
  this.mainElement.id = this.name;
  this.stateController = stateController;
  this.container = container;
  this.allowGrayed = allowGrayed;
  this.allowGrayedByClick = allowGrayedByClick;
  this.autoSwitchEnabled = true;
  this.storeValueInInput = !!storeValueInInput;
  this.storedInputKey = !this.storeValueInInput ? this.inputElement.value : null;
  this.disableCancelBubble = !!disableCancelBubble;
  this.focusDecoration = null;
  this.focused = false;
  this.focusLocked = false;
  this.enabled = true;
  this.readOnly = false;
  this.CheckedChanged = new ASPxClientEvent();
  this.Focus = new ASPxClientEvent();
  this.LostFocus = new ASPxClientEvent();
  helper.InternalCheckBoxInitialize(this);
 },
 ChangeInputElementTabIndex: function() {  
  var changeMethod = this.enabled ? _aspxRestoreTabIndexAttribute : _aspxSaveTabIndexAttributeAndReset;
  changeMethod(this.inputElement);
 },
 CreateFocusDecoration: function(focusedStyle) {
   this.focusDecoration = new ASPxClientEditStyleDecoration(this);
   this.focusDecoration.AddStyle('F', focusedStyle[0], focusedStyle[1]);
   this.focusDecoration.AddPostfix("");
 },
 UpdateFocusDecoration: function() {
  this.focusDecoration.Update();
 },  
 StoreInputKey: function(inputKey) {
  if(this.storeValueInInput)
   this.inputElement.value = inputKey;
  else
   this.storedInputKey = inputKey;
 },
 GetStoredInputKey: function() {
  if(this.storeValueInInput)
   return this.inputElement.value;
  else
   return this.storedInputKey;
 },
 OnClick: function(e) {
  if(this.autoSwitchEnabled) {
   var currentValue = this.GetValue();
   var value = this.stateController.GetNextCheckBoxValue(currentValue, this.allowGrayedByClick && this.allowGrayed);
   this.SetValue(value);
  }
  this.CheckedChanged.FireEvent(this, e);
 },
 OnFocus: function() {
  if(!this.IsFocusLocked()) {
   this.focused = true;
   this.UpdateFocusDecoration();
   this.Focus.FireEvent(this, null);
  } else
   this.UnlockFocus();
 },
 OnLostFocus: function() {
   if(!this.IsFocusLocked()) {
   this.focused = false;
   this.UpdateFocusDecoration();
   this.LostFocus.FireEvent(this, null);
  }
 },
 Refocus: function() {
  if(this.focused) {
   this.LockFocus();
   this.inputElement.blur();
   _aspxSetFocus(this.inputElement);
  }
 },
 LockFocus: function() {
  this.focusLocked = true;
 },
 UnlockFocus: function() {
  this.focusLocked = false;
 },
 IsFocusLocked: function() {
  return this.focusLocked;
 },
 SetValue: function(value) {
  var currentValue = this.GetValue();
  if(currentValue !== value) {
   var newInputKey = this.stateController.GetInputKeyByValue(value);
   if(newInputKey) {
    this.StoreInputKey(newInputKey);   
    this.stateController.UpdateInternalCheckBoxDecoration(this.mainElement, newInputKey, this.enabled);
   }
  }
 },
 GetValue: function() {
  return this.stateController.GetValueByInputKey(this.GetCurrentInputKey());
 },
 GetCurrentCheckState: function() {
  return this.stateController.GetCheckStateByInputKey(this.GetCurrentInputKey());
 },
 GetCurrentInputKey: function() {
  return this.GetStoredInputKey();
 },
 GetChecked: function() {
  return this.GetCurrentInputKey() === ASPxClientCheckBoxInputKey.Checked;
 },
 SetChecked: function(checked) {
  var newValue = this.stateController.GetValueByCheckState(checked ? ASPxClientCheckBoxCheckState.Checked : ASPxClientCheckBoxCheckState.Unchecked);
  this.SetValue(newValue);
 },
 SetEnabled: function(enabled) {
  if(this.enabled != enabled) {
   this.enabled = enabled;
   this.stateController.UpdateInternalCheckBoxDecoration(this.mainElement, this.GetCurrentInputKey(), this.enabled);
   this.ChangeInputElementTabIndex();
  }
 }
});
ASPxClientCheckBoxInternal.GetICBMainElementPostfix = function() {
 return "_D";
};
ASPxCheckBoxInternalCollection = _aspxCreateClass(null, {
 constructor: function(imageProperties, allowGrayed, storeValueInInput, helper, disableCancelBubble) {
  this.checkBoxes = {};
  this.stateController = allowGrayed 
   ? ASPxCheckableElementStateController.Create(imageProperties, ASPxClientCheckBoxInputKey.Checked, ASPxClientCheckBoxInputKey.Unchecked, ASPxClientCheckBoxInputKey.Indeterminate, true)
   : ASPxCheckableElementStateController.Create(imageProperties, ASPxClientCheckBoxInputKey.Checked, ASPxClientCheckBoxInputKey.Unchecked);
  this.helper = helper || ASPxCheckableElementHelper.Instance;
  this.storeValueInInput = !!storeValueInInput;
  this.disableCancelBubble = !!disableCancelBubble;
 },
 Add: function(key, inputElement, container) {
  this.Remove(key);
  this.checkBoxes[key] = this.CreateInternalCheckBox(key, inputElement, container);
  return this.checkBoxes[key];
 },
 Clear: function(){
  this.checkBoxes = {};
 },
 Remove: function(key) {
  delete this.checkBoxes[key];
 },
 Get: function(id) {
  return this.checkBoxes[id];
 },
 SetImageProperties: function(imageProperties) {
  this.stateController.imageProperties = imageProperties;
 },
 CreateInternalCheckBox: function(key, inputElement, container) {
  return new ASPxClientCheckBoxInternal(inputElement, this.stateController, this.stateController.allowGrayed, false, this.helper, container, this.storeValueInInput, key, this.disableCancelBubble);
 }
});
ASPxClientEditStyleDecoration = _aspxCreateClass(null, {
 constructor: function(editor) {
  this.editor = editor;
  this.postfixList = [ ];
  this.styles = { };
  this.innerStyles = { };
 },
 GetStyleSheet: function() {
  if(!ASPxClientEditStyleDecoration.__sheet)
   ASPxClientEditStyleDecoration.__sheet = _aspxCreateStyleSheet();
  return ASPxClientEditStyleDecoration.__sheet;
 },
 AddPostfix: function(value, applyClass, applyBorders, applyBackground) {
  this.postfixList.push(value);
 },
 AddStyle: function(key, className, cssText) {
  this.styles[key] = this.CreateRule(className, cssText);
  this.innerStyles[key] = this.CreateRule("", this.FilterInnerCss(cssText));
 },
 CreateRule: function(className, cssText) {
  return _aspxTrim(className + " " + _aspxCreateImportantStyleRule(this.GetStyleSheet(), cssText));
 },
 Update: function() {
  for(var i = 0; i < this.postfixList.length; i++) {
   var postfix = this.postfixList[i];
   var inner = postfix.length > 0;
   var element = _aspxGetElementById(this.editor.name + postfix);
   if(!element) continue;
   if(this.HasDecoration("I")) {
    var isValid = this.editor.GetIsValid();
    this.ApplyDecoration("I", element, inner, !isValid);
   }
   if(this.HasDecoration("F"))
    this.ApplyDecoration("F", element, inner, this.editor.focused);
   if(this.HasDecoration("N")) {
    var apply = !this.editor.focused;
    if (apply) {
     if (this.editor.CanApplyNullTextDecoration) {
      apply = this.editor.CanApplyNullTextDecoration();
     } else {
      var value = this.editor.GetValue();
      apply = apply && (value == null || value === "");
     }
    }
    if(apply)
     _aspxChangeAttribute(element, "spellcheck", "false");
    else
     _aspxRestoreAttribute(element, "spellcheck");
    this.ApplyDecoration("N", element, inner, apply);
   }
  }
 },
 HasDecoration: function(key) {
  return !!this.styles[key];
 },
 ApplyDecoration: function(key, element, inner, active) {
  var value = inner ? this.innerStyles[key] : this.styles[key];
  element.className = element.className.replace(value, "");
  if(__aspxIE && __aspxBrowserMajorVersion >= 11)
   var reflow = element.offsetWidth; 
  if(active) {
   element.className = _aspxTrim(element.className + " " + value);
   if (__aspxIE && __aspxBrowserVersion > 10 && element.border != null) { 
    var border = parseInt(element.border) || 0;
    element.border = 1;
    element.border = border;
   }
  }
 },
 FilterInnerCss: function(css) {
  return css.replace(/(border|background-image)[^:]*:[^;]+/gi, "");
 }
});
var ASPxClientTouchUI = {
 isGesture: false,
 isMouseEventFromScrolling: false,
 isNativeScrollingAllowed: true,
 clickSensetivity: 10,
 documentTouchHandlers: {},
 documentEventAttachingAllowed: true,
 msTouchDraggableClassName: "dxMSTouchDraggable",
 touchMouseDownEventName: __aspxWebKitTouchUI ? "touchstart" : "mousedown",
 touchMouseUpEventName:   __aspxWebKitTouchUI ? "touchend"   : "mouseup",
 touchMouseMoveEventName: __aspxWebKitTouchUI ? "touchmove"  : "mousemove",
 isTouchEvent: function(evt) { 
  return __aspxWebKitTouchUI && _aspxIsExists(evt.changedTouches); 
 },
 isTouchEventName: function(eventName) {
  return __aspxWebKitTouchUI && (eventName.indexOf("touch") > -1 || eventName.indexOf("gesture") > -1);
 },
 getEventX: function(evt) { 
  return evt.changedTouches[0].pageX; 
 },
 getEventY: function (evt) { 
  return evt.changedTouches[0].pageY; 
 },
 getWebkitMajorVersion: function(){
  if(!this.webkitMajorVersion){
   var regExp = new RegExp("applewebkit/(\\d+)", "i");
   var matches = regExp.exec(__aspxUserAgent);
   if(matches && matches.index >= 1)
    this.webkitMajorVersion = matches[1];
  }
  return this.webkitMajorVersion;
 },
 getIsLandscapeOrientation: function(){
  if(__aspxMacOSMobilePlatform || __aspxAndroidMobilePlatform)
   return Math.abs(window.orientation) == 90;
  return _aspxGetDocumentClientWidth() > _aspxGetDocumentClientHeight();
 },
 nativeWebKitScrollingSupported: function() {
  return __aspxMacOSMobilePlatform && (__aspxBrowserVersion >= 5.1 || this.getWebkitMajorVersion() > 533)
   || __aspxAndroidMobilePlatform && __aspxPlaformMajorVersion >= 3;
 },
 makeScrollableIfRequired: function(element, options) {
  if(__aspxWebKitTouchUI && element) {
   var overflow = _aspxGetCurrentStyle(element).overflow;
   if (element.tagName == "DIV" &&  overflow != "hidden" && overflow != "visible" ){
    return this.MakeScrollable(element);
   }
  }
 },
 preventScrollOnEvent: function(evt){
 },
 handleFastTapIfRequired: function(evt, action, preventCommonClickEvents) {
  if(__aspxWebKitTouchUI && evt.type == 'touchstart' && action) {
   this.FastTapHelper.HandleFastTap(evt, action, preventCommonClickEvents);
   return true;
  }
  return false;
 },
 ensureDocumentSizesCorrect: function (){
  return (document.documentElement.clientWidth - document.documentElement.clientHeight) / (screen.width - screen.height) > 0;
 },
 ensureOrientationChanged: function(onOrientationChangedFunction){
  if(ASPxClientUtils.iOSPlatform || this.ensureDocumentSizesCorrect())
   onOrientationChangedFunction();
  else {
   window.setTimeout(function(){
    this.ensureOrientationChanged(onOrientationChangedFunction);
   }.aspxBind(this), 100);
  }
 },
 onEventAttachingToDocument: function(eventName, func){
  if(__aspxMacOSMobilePlatform && this.isTouchEventName(eventName)) {
   if(!this.documentTouchHandlers[eventName])
    this.documentTouchHandlers[eventName] = [];
   this.documentTouchHandlers[eventName].push(func);
   return this.documentEventAttachingAllowed;
  }
  return true;
 },
 onEventDettachedFromDocument: function(eventName, func){
  if(__aspxMacOSMobilePlatform && this.isTouchEventName(eventName)) {
   var handlers = this.documentTouchHandlers[eventName];
   if(handlers)
    _aspxArrayRemove(handlers, func);
  }
 },
 processDocumentTouchEventHandlers: function(proc) {
  var touchEventNames = ["touchstart", "touchend", "touchmove", "gesturestart", "gestureend"];
  for (var i = 0; i < touchEventNames.length; i++) {
   var eventName = touchEventNames[i];
   var handlers = this.documentTouchHandlers[eventName];
   if(handlers) {
    for (var j = 0; j < handlers.length; j++) {
     proc(eventName,handlers[j]);
    }
   }
  }
 },
 removeDocumentTouchEventHandlers: function() {
  if(__aspxMacOSMobilePlatform) {
   this.documentEventAttachingAllowed = false;
   this.processDocumentTouchEventHandlers(_aspxDetachEventFromDocumentCore);
  }
 },
 restoreDocumentTouchEventHandlers: function () {
  if(__aspxMacOSMobilePlatform) {
   this.documentEventAttachingAllowed = true;
   this.processDocumentTouchEventHandlers(_aspxAttachEventToDocumentCore);
  }
 },
 IsNativeScrolling: function() {
  return ASPxClientTouchUI.nativeWebKitScrollingSupported() && ASPxClientTouchUI.isNativeScrollingAllowed;
 },
 msTouchCreateGerturesWrapper: function(element, onTap){
  if(!window.navigator.msPointerEnabled || typeof(MSGesture) == "undefined") 
   return;
  var gesture = new MSGesture();
  gesture.target = element;
  _aspxAttachEventToElement(element, "MSPointerDown", function(evt){
   gesture.addPointer(evt.pointerId);
  });
  _aspxAttachEventToElement(element, "MSPointerUp", function(evt){
   gesture.stop();
  });
  if(onTap)
   _aspxAttachEventToElement(element, "MSGestureTap", onTap);
  return gesture;
 }
};
var ASPxClientAdaptiveCore = {
 adaptiveMode: false,
 isAdaptiveView: function(){ return false; }
};
(function() {
 ASPxDomObserver = _aspxCreateClass(null, {
  constructor: function() {
   this.items = { };
  },
  subscribe: function(elementID, callbackFunc) {
   var item = this.items[elementID];
   if(item)
    this.unsubscribe(elementID);
   item = {
    elementID: elementID,
    callbackFunc: callbackFunc,
    pauseCount: 0
   };
   this.prepareItem(item);
   this.items[elementID] = item;
  },
  prepareItem: function(item) {
  },
  unsubscribe: function(elementID) {
   this.items[elementID] = null;
  },
  getItemElement: function(item) {
   var element = this.getElementById(item.elementID);
   if(element)
    return element;
   this.unsubscribe(item.elementID);
   return null;
  },
  getElementById: function(elementID) {
   var element = document.getElementById(elementID);
   return element && _aspxIsValidElement(element) ? element : null;
  },
  pause: function(element, includeSubtree) {
   this.changeItemsState(element, includeSubtree, true);
  },
  resume: function(element, includeSubtree) {
   this.changeItemsState(element, includeSubtree, false);
  },
  forEachItem: function(processFunc, context) {
   context = context || this;
   for(var itemName in this.items) {
    if(!this.items.hasOwnProperty(itemName))
     continue;
    var item = this.items[itemName];
    if(item) {
     var needBreak = processFunc.call(context, item);
     if(needBreak)
      return;
    }
   }
  },
  changeItemsState: function(element, includeSubtree, pause) {
   this.forEachItem(function(item) {
    if(!element)
     this.changeItemState(item, pause);
    else {
     var itemElement = this.getItemElement(item);
     if(itemElement && (element == itemElement || (includeSubtree && _aspxGetIsParent(element, itemElement)))) {
      this.changeItemState(item, pause);
      if(!includeSubtree)
       return true;
     }
    }
   }.aspxBind(this));
  },
  changeItemState: function(item, pause) {
   if(pause)
    this.pauseItem(item)
   else
    this.resumeItem(item);
  },
  pauseItem: function(item) {
   item.paused = true;
   item.pauseCount++;
  },
  resumeItem: function(item) {
   if(item.pauseCount > 0) {
    if(item.pauseCount == 1)
     item.paused = false;
    item.pauseCount--;
   }
  }
 });
 ASPxDomObserver.IsMutationObserverAvailable = function() {
  return !!window.MutationObserver;
 };
 ASPxTimerObserver = _aspxCreateClass(ASPxDomObserver, {
  constructor: function() {
   this.constructor.prototype.constructor.call(this);
   this.timerID = -1;
   this.observationTimeout = 300;
   this.startObserving();
  },
  startObserving: function() {
   if(this.timerID !== -1)
    window.clearTimeout(this.timerID);
   this.timerID = window.setTimeout(this.onTimeout, this.observationTimeout);
  },
  onTimeout: function() {
   var observer = _aspxGetDomObserver();
   observer.doObserve();
   observer.startObserving();
  },
  doObserve: function() {
   if(!__aspxDocumentLoaded) return;
   this.forEachItem(function(item) {
    if(!item.paused)
     this.doObserveForItem(item);
   }.aspxBind(this));
  },
  doObserveForItem: function(item) {
   var element = this.getItemElement(item);
   if(element)
    item.callbackFunc.call(this, element);
  }
 });
 ASPxMutationObserver = _aspxCreateClass(ASPxDomObserver, {
  constructor: function() {
   this.constructor.prototype.constructor.call(this);
   this.callbackTimeout = 10;
  },
  prepareItem: function(item) {
   item.callbackTimerID = -1;
   var target = this.getElementById(item.elementID);
   if(!target)
    return;
   var observerCallbackFunc = function() {
    if(item.callbackTimerID === -1) {
     var timeoutHander = function() {
      item.callbackTimerID = -1;
      item.callbackFunc.call(this, target);
     }.aspxBind(this);
     item.callbackTimerID = window.setTimeout(timeoutHander, this.callbackTimeout);
    }
   }.aspxBind(this);
   var observer = new MutationObserver(observerCallbackFunc);
   var config = { attributes: true, childList: true, characterData: true, subtree: true };
   observer.observe(target, config);
   item.observer = observer;
   item.config = config;
  },
  unsubscribe: function(elementID) {
   var item = this.items[elementID];
   if(item) {
    item.observer.disconnect();
    item.observer = null;
   }
   this.constructor.prototype.unsubscribe.call(this, elementID);
  },
  pauseItem: function(item) {
   this.constructor.prototype.pauseItem.call(this, item);
   item.observer.disconnect();
  },
  resumeItem: function(item) {
   this.constructor.prototype.resumeItem.call(this, item);
   if(!item.paused) {
    var target = this.getItemElement(item);
    if(target)
     item.observer.observe(target, item.config);
   }
  }
 });
 var __aspxDomObserver = null;
 function _aspxGetDomObserver() {
  if(__aspxDomObserver == null)
   __aspxDomObserver = ASPxDomObserver.IsMutationObserverAvailable() ? new ASPxMutationObserver() : new ASPxTimerObserver();
  return __aspxDomObserver;
 };
 window._aspxGetDomObserver = _aspxGetDomObserver;
})();
__aspxClassesScriptParsed = true;

