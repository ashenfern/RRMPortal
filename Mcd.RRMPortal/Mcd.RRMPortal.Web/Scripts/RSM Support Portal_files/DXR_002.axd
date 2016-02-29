var __aspxStateItemsExist = false;
var __aspxFocusedItemKind = "FocusedStateItem";
var __aspxHoverItemKind = "HoverStateItem";
var __aspxPressedItemKind = "PressedStateItem";
var __aspxSelectedItemKind = "SelectedStateItem";
var __aspxDisabledItemKind = "DisabledStateItem";
var __aspxCachedStatePrefix = "cached";
ASPxStateItem = _aspxCreateClass(null, {
 constructor: function(name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, kind, disableApplyingStyleToLink){
  this.name = name;
  this.classNames = classNames;
  this.customClassNames = [];
  this.resultClassNames = [];
  this.cssTexts = cssTexts;
  this.postfixes = postfixes;
  this.imageObjs = imageObjs;
  this.imagePostfixes = imagePostfixes;
  this.kind = kind;
  this.classNamePostfix = kind.substr(0, 1).toLowerCase();
  this.enabled = true;
  this.needRefreshBetweenElements = false;
  this.elements = null;
  this.images = null;
  this.linkColor = null;
  this.lintTextDecoration = null;
  this.disableApplyingStyleToLink = !!disableApplyingStyleToLink;
 },
 GetCssText: function(index){
  if(_aspxIsExists(this.cssTexts[index]))
   return this.cssTexts[index];
  return this.cssTexts[0];
 },
 CreateStyleRule: function(index){
  if(this.GetCssText(index) == "") return "";
  var styleSheet = _aspxGetCurrentStyleSheet();
  if(styleSheet)
   return _aspxCreateImportantStyleRule(styleSheet, this.GetCssText(index), this.classNamePostfix);  
  return ""; 
 },
 GetClassName: function(index){
  if(_aspxIsExists(this.classNames[index]))
   return this.classNames[index];
  return this.classNames[0];
 },
 GetResultClassName: function(index){
  if(!_aspxIsExists(this.resultClassNames[index])) {
   if(!_aspxIsExists(this.customClassNames[index]))
    this.customClassNames[index] = this.CreateStyleRule(index);
   if(this.GetClassName(index) != "" && this.customClassNames[index] != "")
    this.resultClassNames[index] = this.GetClassName(index) + " " + this.customClassNames[index];
   else if(this.GetClassName(index) != "")
    this.resultClassNames[index] = this.GetClassName(index);
   else if(this.customClassNames[index] != "")
    this.resultClassNames[index] = this.customClassNames[index];
   else
    this.resultClassNames[index] = "";
  }
  return this.resultClassNames[index];
 },
 GetElements: function(element){
  if(!this.elements || !_aspxIsValidElements(this.elements)){
   if(this.postfixes && this.postfixes.length > 0){
    this.elements = [ ];
    var parentNode = element.parentNode;
    if(parentNode){
     for(var i = 0; i < this.postfixes.length; i++){
      var id = this.name + this.postfixes[i];
      this.elements[i] = _aspxGetChildById(parentNode, id);
      if(!this.elements[i])
       this.elements[i] = _aspxGetElementById(id);
     }
    }
   }
   else
    this.elements = [element];
  }
  return this.elements;
 },
 GetImages: function(element){
  if(!this.images || !_aspxIsValidElements(this.images)){
   this.images = [ ];
   if(this.imagePostfixes && this.imagePostfixes.length > 0){
    var elements = this.GetElements(element);
    for(var i = 0; i < this.imagePostfixes.length; i++){
     var id = this.name + this.imagePostfixes[i];
     for(var j = 0; j < elements.length; j++){
      if(!elements[j]) continue;
      if(elements[j].id == id)
       this.images[i] = elements[j];
      else
       this.images[i] = _aspxGetChildById(elements[j], id);
      if(this.images[i])
       break;
     }
    }
   }
  }
  return this.images;
 },
 Apply: function(element){
  if(!this.enabled) return;
  try{
   this.ApplyStyle(element);
   if(this.imageObjs && this.imageObjs.length > 0)
    this.ApplyImage(element);
   if(__aspxIE && __aspxBrowserMajorVersion >= 11)
    this.ForceRedrawAppearance(element);
  }
  catch(e){
  }
 },
 ApplyStyle: function(element){
  var elements = this.GetElements(element);
  for(var i = 0; i < elements.length; i++){
   if(!elements[i]) continue;
   var className = elements[i].className.replace(this.GetResultClassName(i), "");
   elements[i].className = _aspxTrim(className) + " " + this.GetResultClassName(i);
   if(!__aspxOpera || __aspxBrowserVersion >= 9)
    this.ApplyStyleToLinks(elements, i);
  }
 },
 ApplyStyleToLinks: function(elements, index){
  if(this.disableApplyingStyleToLink)
   return;
  var linkCount = 0;
  var savedLinkCount = -1;
  if(_aspxIsExists(elements[index]["savedLinkCount"]))
   savedLinkCount = parseInt(elements[index]["savedLinkCount"]);
  do{
   if(savedLinkCount > -1 && savedLinkCount <= linkCount)
    break;
   var link = elements[index]["link" + linkCount];
   if(!link){
    link = _aspxGetChildByTagName(elements[index], "A", linkCount);
    if(link)
     elements[index]["link" + linkCount] = link;
   }
   if(link)
    this.ApplyStyleToLinkElement(link, index);
   else
    elements[index]["savedLinkCount"] = linkCount;
   linkCount++;
  }
  while(link != null)
 },
 ApplyStyleToLinkElement: function(link, index){
  if(this.GetLinkColor(index) != "")
   _aspxChangeAttributeExtended(link.style, "color", link, "saved" + this.kind + "Color", this.GetLinkColor(index));
  if(this.GetLinkTextDecoration(index) != "")
   _aspxChangeAttributeExtended(link.style, "textDecoration", link, "saved" + this.kind + "TextDecoration", this.GetLinkTextDecoration(index));
 },
 ApplyImage: function(element){
  var images = this.GetImages(element);
  for(var i = 0; i < images.length; i++){
   if(!images[i] || !this.imageObjs[i]) continue;
   var useSpriteImage = typeof(this.imageObjs[i]) != "string";
   var newUrl = "", newCssClass = "", newBackground = "";
   if(useSpriteImage){
    newUrl = ASPx.EmptyImageUrl;           
    if(this.imageObjs[i].spriteCssClass) 
     newCssClass = this.imageObjs[i].spriteCssClass;
    if(this.imageObjs[i].spriteBackground)
     newBackground = this.imageObjs[i].spriteBackground;
   }
   else{
    newUrl = this.imageObjs[i];
    if(_aspxIsExistsAttribute(images[i].style, "background"))   
     newBackground = " ";
   }
   if(newUrl != "")
    _aspxChangeAttributeExtended(images[i], "src", images[i], "saved" + this.kind + "Src", newUrl);
   if(newCssClass != "")
    this.ApplyImageClassName(images[i], newCssClass);
   if(newBackground != ""){
    if(__aspxWebKitFamily) {
     var savedBackground = _aspxGetAttribute(images[i].style, "background");
     if(!useSpriteImage)
      savedBackground += " " + images[i].style["backgroundPosition"];
     _aspxSetAttribute(images[i], "saved" + this.kind + "Background", savedBackground);
     _aspxSetAttribute(images[i].style, "background", newBackground);
    }
    else
     _aspxChangeAttributeExtended(images[i].style, "background", images[i], "saved" + this.kind + "Background", newBackground);
   }     
  }
 },
 ApplyImageClassName: function(element, newClassName){
  var className = element.className.replace(newClassName, "");
  _aspxSetAttribute(element, "saved" + this.kind + "ClassName", className);
  element.className = className + " " + newClassName;
 },
 Cancel: function(element){
  if(!this.enabled) return;
  try{  
   if(this.imageObjs && this.imageObjs.length > 0)
    this.CancelImage(element);
   this.CancelStyle(element);
  }
  catch(e){
  }
 },
 CancelStyle: function(element){
  var elements = this.GetElements(element);
  for(var i = 0; i < elements.length; i++){
   if(!elements[i]) continue;
   var className = _aspxTrim(elements[i].className.replace(this.GetResultClassName(i), ""));
   elements[i].className = className;
   if(!__aspxOpera || __aspxBrowserVersion >= 9)
    this.CancelStyleFromLinks(elements, i);
  }
 },
 CancelStyleFromLinks: function(elements, index){
  if(this.disableApplyingStyleToLink)
   return;
  var linkCount = 0;
  var savedLinkCount = -1;
  if(_aspxIsExists(elements[index]["savedLinkCount"]))
   savedLinkCount = parseInt(elements[index]["savedLinkCount"]);
  do{
   if(savedLinkCount > -1 && savedLinkCount <= linkCount)
    break;
   var link = elements[index]["link" + linkCount];
   if(!link){
    link = _aspxGetChildByTagName(elements[index], "A", linkCount);
    if(link)
     elements[index]["link" + linkCount] = link;
   }
   if(link)
    this.CancelStyleFromLinkElement(link, index);
   else
    elements[index]["savedLinkCount"] = linkCount;
   linkCount++;
  }
  while(link != null)
 },
 CancelStyleFromLinkElement: function(link, index){
  if(this.GetLinkColor(index) != "")
   _aspxRestoreAttributeExtended(link.style, "color", link, "saved" + this.kind + "Color");
  if(this.GetLinkTextDecoration(index) != "")
   _aspxRestoreAttributeExtended(link.style, "textDecoration", link, "saved" + this.kind + "TextDecoration");
 },
 CancelImage: function(element){
  var images = this.GetImages(element);
  for(var i = 0; i < images.length; i++){
   if(!images[i] || !this.imageObjs[i]) continue;
   _aspxRestoreAttributeExtended(images[i], "src", images[i], "saved" + this.kind + "Src");
   this.CancelImageClassName(images[i]);
   _aspxRestoreAttributeExtended(images[i].style, "background", images[i], "saved" + this.kind + "Background");
  }
 },
 CancelImageClassName: function(element){
  var savedClassName = _aspxGetAttribute(element, "saved" + this.kind + "ClassName");
  if(_aspxIsExists(savedClassName)) {
   element.className = savedClassName;
   _aspxRemoveAttribute(element, "saved" + this.kind + "ClassName");
  }
 },
 Clone: function(){
  return new ASPxStateItem(this.name, this.classNames, this.cssTexts, this.postfixes, 
   this.imageObjs, this.imagePostfixes, this.kind, this.disableApplyingStyleToLink);
 },
 IsChildElement: function(element){
  if(element != null){
   var elements = this.GetElements(element);
   for(var i = 0; i < elements.length; i++){
    if(!elements[i]) continue;
    if(_aspxGetIsParent(elements[i], element)) 
     return true;
   }
  }
  return false;
 },
 ForceRedrawAppearance: function(element) {
  _aspxChangeStyleAttribute(element, "width", "0px");
  var dummy = element.offsetWidth;
  _aspxRestoreStyleAttribute(element, "width");
 },
 GetLinkColor: function(index){
  if(!_aspxIsExists(this.linkColor)){
   var rule = _aspxGetStyleSheetRule(this.customClassNames[index]);
   this.linkColor = rule ? rule.style.color : null;
   if(!_aspxIsExists(this.linkColor)){
    var rule = _aspxGetStyleSheetRule(this.GetClassName(index));
    this.linkColor = rule ? rule.style.color : null;
   }
   if(this.linkColor == null) 
    this.linkColor = "";
  }
  return this.linkColor;
 },
 GetLinkTextDecoration: function(index){
  if(!_aspxIsExists(this.linkTextDecoration)){
   var rule = _aspxGetStyleSheetRule(this.customClassNames[index]);
   this.linkTextDecoration = rule ? rule.style.textDecoration : null;
   if(!_aspxIsExists(this.linkTextDecoration)){
    var rule = _aspxGetStyleSheetRule(this.GetClassName(index));
    this.linkTextDecoration = rule ? rule.style.textDecoration : null;
   }
   if(this.linkTextDecoration == null) 
    this.linkTextDecoration = "";
  }
  return this.linkTextDecoration;
 }
});
ASPxClientStateEventArgs = _aspxCreateClass(null, {
 constructor: function(item, element){
  this.item = item;
  this.element = element;
  this.toElement = null;
  this.fromElement = null;
  this.htmlEvent = null;
 }
});
ASPxStateController = _aspxCreateClass(null, {
 constructor: function(){
  this.focusedItems = { };
  this.hoverItems = { };
  this.pressedItems = { };
  this.selectedItems = { };
  this.disabledItems = { };
  this.currentFocusedElement = null;
  this.currentFocusedItemName = null;
  this.currentHoverElement = null;
  this.currentHoverItemName = null;
  this.currentPressedElement = null;
  this.currentPressedItemName = null;
  this.savedCurrentPressedElement = null;
  this.savedCurrentMouseMoveSrcElement = null;
  this.AfterSetFocusedState = new ASPxClientEvent();
  this.AfterClearFocusedState = new ASPxClientEvent();
  this.AfterSetHoverState = new ASPxClientEvent();
  this.AfterClearHoverState = new ASPxClientEvent();
  this.AfterSetPressedState = new ASPxClientEvent();
  this.AfterClearPressedState = new ASPxClientEvent();
  this.AfterDisabled = new ASPxClientEvent();
  this.AfterEnabled = new ASPxClientEvent();
  this.BeforeSetFocusedState = new ASPxClientEvent();
  this.BeforeClearFocusedState = new ASPxClientEvent();
  this.BeforeSetHoverState = new ASPxClientEvent();
  this.BeforeClearHoverState = new ASPxClientEvent();
  this.BeforeSetPressedState = new ASPxClientEvent();
  this.BeforeClearPressedState = new ASPxClientEvent();
  this.BeforeDisabled = new ASPxClientEvent();
  this.BeforeEnabled = new ASPxClientEvent();
  this.FocusedItemKeyDown = new ASPxClientEvent();
 }, 
 AddHoverItem: function(name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, disableApplyingStyleToLink){
  this.AddItem(this.hoverItems, name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, __aspxHoverItemKind, disableApplyingStyleToLink);
  this.AddItem(this.focusedItems, name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, __aspxFocusedItemKind, disableApplyingStyleToLink);
 },
 AddPressedItem: function(name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes ,disableApplyingStyleToLink){
  this.AddItem(this.pressedItems, name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, __aspxPressedItemKind, disableApplyingStyleToLink);
 },
 AddSelectedItem: function(name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, disableApplyingStyleToLink){
  this.AddItem(this.selectedItems, name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, __aspxSelectedItemKind, disableApplyingStyleToLink);
 },
 AddDisabledItem: function(name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, disableApplyingStyleToLink){
  this.AddItem(this.disabledItems, name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, __aspxDisabledItemKind, disableApplyingStyleToLink);
 },
 AddItem: function(items, name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, kind , disableApplyingStyleToLink){
  var stateItem = new ASPxStateItem(name, classNames, cssTexts, postfixes, imageObjs, imagePostfixes, kind, disableApplyingStyleToLink);
  if(postfixes && postfixes.length > 0){
   for(var i = 0; i < postfixes.length; i ++){
    items[name + postfixes[i]] = stateItem;
   }
  }
  else
   items[name] = stateItem;
  __aspxStateItemsExist = true;
 },
 RemoveHoverItem: function(name){
  this.RemoveItem(this.hoverItems, name);
  this.RemoveItem(this.focusedItems, name);
 },
 RemovePressedItem: function(name){
  this.RemoveItem(this.pressedItems, name);
 },
 RemoveSelectedItem: function(name){
  this.RemoveItem(this.selectedItems, name);
 },
 RemoveDisabledItem: function(name){
  this.RemoveItem(this.disabledItems, name);
 },
 RemoveItem: function(items, name){
  delete items[name];
 },
 GetFocusedElement: function(srcElement){
  return this.GetItemElement(srcElement, this.focusedItems, __aspxFocusedItemKind);
 },
 GetHoverElement: function(srcElement){
  return this.GetItemElement(srcElement, this.hoverItems, __aspxHoverItemKind);
 },
 GetPressedElement: function(srcElement){
  return this.GetItemElement(srcElement, this.pressedItems, __aspxPressedItemKind);
 },
 GetSelectedElement: function(srcElement){
  return this.GetItemElement(srcElement, this.selectedItems, __aspxSelectedItemKind);
 },
 GetDisabledElement: function(srcElement){
  return this.GetItemElement(srcElement, this.disabledItems, __aspxDisabledItemKind);
 },
 GetItemElement: function(srcElement, items, kind){
  if(srcElement && srcElement[__aspxCachedStatePrefix + kind]){
   var cachedElement = srcElement[__aspxCachedStatePrefix + kind];
   if(cachedElement != __aspxEmptyCachedValue)
    return cachedElement;
   return null;
  }
  var element = srcElement;
  while(element != null) {
   var item = items[element.id];
   if(item){
    this.CacheItemElement(srcElement, kind, element);
    element[kind] = item;
    return element;
   }
   element = element.parentNode;
  }
  this.CacheItemElement(srcElement, kind, __aspxEmptyCachedValue);
  return null;
 },
 CacheItemElement: function(srcElement, kind, value){
  if(srcElement && !srcElement[__aspxCachedStatePrefix + kind])
   srcElement[__aspxCachedStatePrefix + kind] = value;
 },
 DoSetFocusedState: function(element, fromElement){
  var item = element[__aspxFocusedItemKind];
  if(item){
   var args = new ASPxClientStateEventArgs(item, element);
   args.fromElement = fromElement;
   this.BeforeSetFocusedState.FireEvent(this, args);
   item.Apply(element);
   this.AfterSetFocusedState.FireEvent(this, args);
  }
 },
 DoClearFocusedState: function(element, toElement){
  var item = element[__aspxFocusedItemKind];
  if(item){
   var args = new ASPxClientStateEventArgs(item, element);
   args.toElement = toElement;
   this.BeforeClearFocusedState.FireEvent(this, args);
   item.Cancel(element);
   this.AfterClearFocusedState.FireEvent(this, args);
  }
 },
 DoSetHoverState: function(element, fromElement){
  var item = element[__aspxHoverItemKind];
  if(item){
   var args = new ASPxClientStateEventArgs(item, element);
   args.fromElement = fromElement;
   this.BeforeSetHoverState.FireEvent(this, args);
   item.Apply(element);
   this.AfterSetHoverState.FireEvent(this, args);
  }
 },
 DoClearHoverState: function(element, toElement){
  var item = element[__aspxHoverItemKind];
  if(item){
   var args = new ASPxClientStateEventArgs(item, element);
   args.toElement = toElement;
   this.BeforeClearHoverState.FireEvent(this, args);
   item.Cancel(element);
   this.AfterClearHoverState.FireEvent(this, args);
  }
 },
 DoSetPressedState: function(element){
  var item = element[__aspxPressedItemKind];
  if(item){
   var args = new ASPxClientStateEventArgs(item, element);
   this.BeforeSetPressedState.FireEvent(this, args);
   item.Apply(element);
   this.AfterSetPressedState.FireEvent(this, args);
  }
 },
 DoClearPressedState: function(element){
  var item = element[__aspxPressedItemKind];
  if(item){
   var args = new ASPxClientStateEventArgs(item, element);
   this.BeforeClearPressedState.FireEvent(this, args);
   item.Cancel(element);
   this.AfterClearPressedState.FireEvent(this, args);
  }
 },
 SetCurrentFocusedElement: function(element){
  if(this.currentFocusedElement && !_aspxIsValidElement(this.currentFocusedElement)){
   this.currentFocusedElement = null;
   this.currentFocusedItemName = "";
  }
  if(this.currentFocusedElement != element){
   var oldCurrentFocusedElement = this.currentFocusedElement;
   var item = (element != null) ? element[__aspxFocusedItemKind] : null;
   var itemName = (item != null) ? item.name : "";
   if(this.currentFocusedItemName != itemName){
    if(this.currentHoverItemName != "")
     this.SetCurrentHoverElement(null);
    if(this.currentFocusedElement != null)
     this.DoClearFocusedState(this.currentFocusedElement, element);
    this.currentFocusedElement = element;
    item = (element != null) ? element[__aspxFocusedItemKind] : null;
    this.currentFocusedItemName = (item != null) ? item.name : "";
    if(this.currentFocusedElement != null)
     this.DoSetFocusedState(this.currentFocusedElement, oldCurrentFocusedElement);
   }
  }
 },
 SetCurrentHoverElement: function(element){
  if(this.currentHoverElement && !_aspxIsValidElement(this.currentHoverElement)){
   this.currentHoverElement = null;
   this.currentHoverItemName = "";
  }
  var item = (element != null) ? element[__aspxHoverItemKind] : null;
  if(item && !item.enabled) { 
   element = this.GetItemElement(element.parentNode, this.hoverItems, __aspxHoverItemKind);
   item = (element != null) ? element[__aspxHoverItemKind] : null;
  }
  if(this.currentHoverElement != element){
   var oldCurrentHoverElement = this.currentHoverElement,
    itemName = (item != null) ? item.name : "";
   if(this.currentHoverItemName != itemName || (item != null && item.needRefreshBetweenElements)){
    if(this.currentFocusedItemName != "")
     this.SetCurrentFocusedElement(null);
    if(this.currentHoverElement != null)
     this.DoClearHoverState(this.currentHoverElement, element);
    item = (element != null) ? element[__aspxHoverItemKind] : null;
    if(item == null || item.enabled){
     this.currentHoverElement = element;
     this.currentHoverItemName = (item != null) ? item.name : "";
     if(this.currentHoverElement != null)
      this.DoSetHoverState(this.currentHoverElement, oldCurrentHoverElement);
    }
   }
  }
 },
 SetCurrentPressedElement: function(element){
  if(this.currentPressedElement && !_aspxIsValidElement(this.currentPressedElement)){
   this.currentPressedElement = null;
   this.currentPressedItemName = "";
  }
  if(this.currentPressedElement != element){
   if(this.currentPressedElement != null)
    this.DoClearPressedState(this.currentPressedElement);
   var item = (element != null) ? element[__aspxPressedItemKind] : null;
   if(item == null || item.enabled){
    this.currentPressedElement = element;
    this.currentPressedItemName = (item != null) ? item.name : "";
    if(this.currentPressedElement != null)
     this.DoSetPressedState(this.currentPressedElement);
   }
  }
 },
 SetCurrentFocusedElementBySrcElement: function(srcElement){
  var element = this.GetFocusedElement(srcElement);
  this.SetCurrentFocusedElement(element);
 },
 SetCurrentHoverElementBySrcElement: function(srcElement){
  var element = this.GetHoverElement(srcElement);
  this.SetCurrentHoverElement(element);
 },
 SetCurrentPressedElementBySrcElement: function(srcElement){
  var element = this.GetPressedElement(srcElement);
  this.SetCurrentPressedElement(element);
 },
 SetPressedElement: function (element) {
  this.SetCurrentHoverElement(null);
  this.SetCurrentPressedElementBySrcElement(element);
  this.savedCurrentPressedElement = this.currentPressedElement;
 },
 SelectElement: function (element) {
  var item = element[__aspxSelectedItemKind];
  if(item)
   item.Apply(element);
 }, 
 SelectElementBySrcElement: function(srcElement){
  var element = this.GetSelectedElement(srcElement);
  if(element != null) this.SelectElement(element);
 }, 
 DeselectElement: function(element){
  var item = element[__aspxSelectedItemKind];
  if(item)
   item.Cancel(element);
 }, 
 DeselectElementBySrcElement: function(srcElement){
  var element = this.GetSelectedElement(srcElement);
  if(element != null) this.DeselectElement(element);
 },
 SetElementEnabled: function(element, enable){
  if(enable)
   this.EnableElement(element);
  else
   this.DisableElement(element);
 },
 DisableElement: function(element){
  var element = this.GetDisabledElement(element);
  if(element != null) {
   var item = element[__aspxDisabledItemKind];
   if(item){
    var args = new ASPxClientStateEventArgs(item, element);
    this.BeforeDisabled.FireEvent(this, args);
    if(item.name == this.currentPressedItemName)
     this.SetCurrentPressedElement(null);
    if(item.name == this.currentHoverItemName)
     this.SetCurrentHoverElement(null);
    item.Apply(element);
    this.SetMouseStateItemsEnabled(item.name, item.postfixes, false);
    this.AfterDisabled.FireEvent(this, args);
   }
  }
 }, 
 EnableElement: function(element){
  var element = this.GetDisabledElement(element);
  if(element != null) {
   var item = element[__aspxDisabledItemKind];
   if(item){
    var args = new ASPxClientStateEventArgs(item, element);
    this.BeforeEnabled.FireEvent(this, args);
    item.Cancel(element);
    this.SetMouseStateItemsEnabled(item.name, item.postfixes, true);
    this.AfterEnabled.FireEvent(this, args);
   }
  }
 }, 
 SetMouseStateItemsEnabled: function(name, postfixes, enabled){   
  if(postfixes && postfixes.length > 0){
   for(var i = 0; i < postfixes.length; i ++){
    this.SetItemsEnabled(this.hoverItems, name + postfixes[i], enabled);
    this.SetItemsEnabled(this.pressedItems, name + postfixes[i], enabled);
    this.SetItemsEnabled(this.focusedItems, name + postfixes[i], enabled);
   }
  }
  else{
   this.SetItemsEnabled(this.hoverItems, name, enabled);
   this.SetItemsEnabled(this.pressedItems, name, enabled);
   this.SetItemsEnabled(this.focusedItems, name, enabled);
  }  
 },
 SetItemsEnabled: function(items, name, enabled){   
  if(items[name])
   items[name].enabled = enabled;
 },
 OnFocusMove: function(evt){
  var element = _aspxGetEventSource(evt);
  aspxGetStateController().SetCurrentFocusedElementBySrcElement(element);
 },
 OnMouseMove: function(evt, checkElementChanged){
  var srcElement = _aspxGetEventSource(evt);
  if(checkElementChanged && srcElement == this.savedCurrentMouseMoveSrcElement) return;
  this.savedCurrentMouseMoveSrcElement = srcElement;
  if(__aspxIE && !_aspxGetIsLeftButtonPressed(evt) && this.savedCurrentPressedElement != null)
   this.ClearSavedCurrentPressedElement();
  if(this.savedCurrentPressedElement == null)
   this.SetCurrentHoverElementBySrcElement(srcElement);
  else{
   var element = this.GetPressedElement(srcElement);
   if(element != this.currentPressedElement){
    if(element == this.savedCurrentPressedElement)
     this.SetCurrentPressedElement(this.savedCurrentPressedElement);
    else
     this.SetCurrentPressedElement(null);
   }
  }
 },
 OnMouseDown: function(evt){
  if(!_aspxGetIsLeftButtonPressed(evt)) return;
  var srcElement = _aspxGetEventSource(evt);
  this.OnMouseDownOnElement(srcElement);
 },
 OnMouseDownOnElement: function (element) {
  if (this.GetPressedElement(element) == null) return;
  this.SetPressedElement(element);
 },
 OnMouseUp: function(evt){
  var srcElement = _aspxGetEventSource(evt);
  this.OnMouseUpOnElement(srcElement);
 },
 OnMouseUpOnElement: function(element){
  if(this.savedCurrentPressedElement == null) return;
  this.ClearSavedCurrentPressedElement();
  this.SetCurrentHoverElementBySrcElement(element);
 },
 OnMouseOver: function(evt){
  var element = _aspxGetEventSource(evt);
  if (element && element.tagName == "IFRAME")
   this.OnMouseMove(evt, true);
 },
 OnKeyDown: function(evt){
  var element = this.GetFocusedElement(_aspxGetEventSource(evt));
  if(element != null && element == this.currentFocusedElement) {
   var item = element[__aspxFocusedItemKind];
   if(item){
    var args = new ASPxClientStateEventArgs(item, element);
    args.htmlEvent = evt;
    this.FocusedItemKeyDown.FireEvent(this, args);
   }
  }
 },
 OnSelectStart: function(evt){
  if(this.savedCurrentPressedElement) {
   _aspxClearSelection();
   return false;
  }
 },
 ClearSavedCurrentPressedElement: function() {
  this.savedCurrentPressedElement = null;
  this.SetCurrentPressedElement(null);
 },
 ClearCache: function(srcElement, kind) {
  if(srcElement[__aspxCachedStatePrefix + kind])
   srcElement[__aspxCachedStatePrefix + kind] = null;
 },
 ClearElementCache: function(srcElement) {
  this.ClearCache(srcElement, __aspxFocusedItemKind);
  this.ClearCache(srcElement, __aspxHoverItemKind);
  this.ClearCache(srcElement, __aspxPressedItemKind);
  this.ClearCache(srcElement, __aspxSelectedItemKind);
  this.ClearCache(srcElement, __aspxDisabledItemKind);
 }
});
var __aspxStateController = null;
function aspxGetStateController(){
 if(__aspxStateController == null)
  __aspxStateController = new ASPxStateController();
 return __aspxStateController;
}
function aspxAddStateItems(method, namePrefix, classes, disableApplyingStyleToLink){
 for(var i = 0; i < classes.length; i ++){
  for(var j = 0; j < classes[i][2].length; j ++) {
   var name = namePrefix;
   if(classes[i][2][j])
    name += "_" + classes[i][2][j];
   var postfixes = classes[i][3] || null;
   var imageObjs = (classes[i][4] && classes[i][4][j]) || null;
   var imagePostfixes = classes[i][5] || null;
   method.call(aspxGetStateController(), name, classes[i][0], classes[i][1], postfixes, imageObjs, imagePostfixes, disableApplyingStyleToLink);
  }
 }
}
function aspxAddHoverItems(namePrefix, classes, disableApplyingStyleToLink){
 aspxAddStateItems(aspxGetStateController().AddHoverItem, namePrefix, classes, disableApplyingStyleToLink);
}
function aspxAddPressedItems(namePrefix, classes, disableApplyingStyleToLink){
 aspxAddStateItems(aspxGetStateController().AddPressedItem, namePrefix, classes, disableApplyingStyleToLink);
}
function aspxAddSelectedItems(namePrefix, classes, disableApplyingStyleToLink){
 aspxAddStateItems(aspxGetStateController().AddSelectedItem, namePrefix, classes, disableApplyingStyleToLink);
}
function aspxAddDisabledItems(namePrefix, classes, disableApplyingStyleToLink){
 aspxAddStateItems(aspxGetStateController().AddDisabledItem, namePrefix, classes, disableApplyingStyleToLink);
}
function aspxRemoveStateItems(method, namePrefix, classes){
 for(var i = 0; i < classes.length; i ++){
  for(var j = 0; j < classes[i][0].length; j ++) {
   var name = namePrefix;
   if(classes[i][0][j])
    name += "_" + classes[i][0][j];
   method.call(aspxGetStateController(), name);
  }
 }
}
function aspxRemoveHoverItems(namePrefix, classes){
 aspxRemoveStateItems(aspxGetStateController().RemoveHoverItem, namePrefix, classes);
}
function aspxRemovePressedItems(namePrefix, classes){
 aspxRemoveStateItems(aspxGetStateController().RemovePressedItem, namePrefix, classes);
}
function aspxRemoveSelectedItems(namePrefix, classes){
 aspxRemoveStateItems(aspxGetStateController().RemoveSelectedItem, namePrefix, classes);
}
function aspxRemoveDisabledItems(namePrefix, classes){
 aspxRemoveStateItems(aspxGetStateController().RemoveDisabledItem, namePrefix, classes);
}
function aspxAddAfterClearFocusedState(handler){
 aspxGetStateController().AfterClearFocusedState.AddHandler(handler);
}
function aspxAddAfterSetFocusedState(handler){
 aspxGetStateController().AfterSetFocusedState.AddHandler(handler);
}
function aspxAddAfterClearHoverState(handler){
 aspxGetStateController().AfterClearHoverState.AddHandler(handler);
}
function aspxAddAfterSetHoverState(handler){
 aspxGetStateController().AfterSetHoverState.AddHandler(handler);
}
function aspxAddAfterClearPressedState(handler){
 aspxGetStateController().AfterClearPressedState.AddHandler(handler);
}
function aspxAddAfterSetPressedState(handler){
 aspxGetStateController().AfterSetPressedState.AddHandler(handler);
}
function aspxAddAfterDisabled(handler){
 aspxGetStateController().AfterDisabled.AddHandler(handler);
}
function aspxAddAfterEnabled(handler){
 aspxGetStateController().AfterEnabled.AddHandler(handler);
}
function aspxAddBeforeClearFocusedState(handler){
 aspxGetStateController().BeforeClearFocusedState.AddHandler(handler);
}
function aspxAddBeforeSetFocusedState(handler){
 aspxGetStateController().BeforeSetFocusedState.AddHandler(handler);
}
function aspxAddBeforeClearHoverState(handler){
 aspxGetStateController().BeforeClearHoverState.AddHandler(handler);
}
function aspxAddBeforeSetHoverState(handler){
 aspxGetStateController().BeforeSetHoverState.AddHandler(handler);
}
function aspxAddBeforeClearPressedState(handler){
 aspxGetStateController().BeforeClearPressedState.AddHandler(handler);
}
function aspxAddBeforeSetPressedState(handler){
 aspxGetStateController().BeforeSetPressedState.AddHandler(handler);
}
function aspxAddBeforeDisabled(handler){
 aspxGetStateController().BeforeDisabled.AddHandler(handler);
}
function aspxAddBeforeEnabled(handler){
 aspxGetStateController().BeforeEnabled.AddHandler(handler);
}
function aspxAddFocusedItemKeyDown(handler){
 aspxGetStateController().FocusedItemKeyDown.AddHandler(handler);
}
function aspxSetHoverState(element){
 aspxGetStateController().SetCurrentHoverElementBySrcElement(element);
}
function aspxClearHoverState(evt){
 aspxGetStateController().SetCurrentHoverElementBySrcElement(null);
}
function aspxUpdateHoverState(evt){
 aspxGetStateController().OnMouseMove(evt, false);
}
function aspxSetFocusedState(element){
 aspxGetStateController().SetCurrentFocusedElementBySrcElement(element);
}
function aspxClearFocusedState(evt){
 aspxGetStateController().SetCurrentFocusedElementBySrcElement(null);
}
function aspxUpdateFocusedState(evt){
 aspxGetStateController().OnFocusMove(evt);
}
function aspxAssignAccessabilityEventsToChildrenLinks(container){
 var links = _aspxGetChildrenByPartialClassName(container, __aspxAccessibilityMarkerClass);
 for(var i = 0; i < links.length; i++)
  aspxAssignAccessabilityEventsToLink(links[i]);
}
function aspxAssignAccessabilityEventsToLink(link) {
 if (!_aspxElementCssClassContains(link, __aspxAccessibilityMarkerClass))
  return;
 _aspxAttachEventToElement(link, "focus", function(e) { aspxUpdateFocusedState(e); });
 _aspxAttachEventToElement(link, "blur", function(e) { aspxClearFocusedState(e); });
 if(__aspxIE && __aspxBrowserMajorVersion < 7 && link.href == __aspxAccessibilityEmptyUrl)
  _aspxAttachEventToElement(link, "click", function() { return false; });
}
_aspxAttachEventToDocument("mousemove", aspxClassesDocumentMouseMove);
function aspxClassesDocumentMouseMove(evt) {
 if(__aspxClassesScriptParsed && __aspxStateItemsExist)
  aspxGetStateController().OnMouseMove(evt, true);
}
_aspxAttachEventToDocument(ASPxClientTouchUI.touchMouseDownEventName, aspxClassesDocumentMouseDown);
function aspxClassesDocumentMouseDown(evt){
 if(__aspxClassesScriptParsed && __aspxStateItemsExist)
  aspxGetStateController().OnMouseDown(evt);
}
_aspxAttachEventToDocument(ASPxClientTouchUI.touchMouseUpEventName, aspxClassesDocumentMouseUp);
function aspxClassesDocumentMouseUp(evt){
 if(__aspxClassesScriptParsed && __aspxStateItemsExist)
  aspxGetStateController().OnMouseUp(evt);
}
_aspxAttachEventToDocument("mouseover", aspxClassesDocumentMouseOver);
function aspxClassesDocumentMouseOver(evt){
 if(__aspxClassesScriptParsed && __aspxStateItemsExist)
  aspxGetStateController().OnMouseOver(evt);
}
_aspxAttachEventToDocument("keydown", aspxClassesDocumentKeyDown);
function aspxClassesDocumentKeyDown(evt){
 if(__aspxClassesScriptParsed && __aspxStateItemsExist)
  aspxGetStateController().OnKeyDown(evt);
}
_aspxAttachEventToDocument("selectstart", aspxClassesDocumentSelectStart);
function aspxClassesDocumentSelectStart(evt){
 if(__aspxClassesScriptParsed && __aspxStateItemsExist)
  return aspxGetStateController().OnSelectStart(evt); 
}

ASPxClientButton = _aspxCreateClass(ASPxClientControl, {
 constructor: function(name) {
  this.constructor.prototype.constructor.call(this, name);
  this.isASPxClientButton = true;
  this.allowFocus = true;
  this.autoPostBackFunction = null;
  this.causesValidation = true;
  this.checked = false;
  this.clickLocked = false;
  this.groupName = "";
  this.focusElementSelected = false;
  this.pressed = false;
  this.useSubmitBehavior = true;
  this.validationGroup = "";
  this.validationContainerID = null;
  this.validateInvisibleEditors = false;
  this.originalWidth = null;
  this.originalHeight = null;
  this.needUpdateBounds = true;
  this.buttonCell = null;
  this.contentDiv = null;
  this.checkedInput = null;
  this.buttonImage = null;
  this.internalButton = null;
  this.textElement = null; 
  this.textControl = null;
  this.textContainer = null;
  this.isTextEmpty = false;
  this.CheckedChanged = new ASPxClientEvent();
  this.GotFocus = new ASPxClientEvent();
  this.LostFocus = new ASPxClientEvent();
  this.Click = new ASPxClientEvent();
 },
 InlineInitialize: function() {
  var mainElement = this.GetMainElement();
  this.originalWidth = mainElement.style.width;
  this.originalHeight = mainElement.style.height;
  this.needUpdateBounds = __aspxIE && __aspxBrowserVersion < 8 || _aspxGetCurrentStyle(mainElement).display.indexOf("table") === -1;
  if(this.needUpdateBounds)
   mainElement.className = mainElement.className.replace("dxbTSys", "");
  ASPxClientControl.prototype.InlineInitialize.call(this);
  this.InitializeElementIDs();
  this.InitializeEvents();
  this.InitializeEnabled();
  this.InitializeChecked();
  if(this.IsLink())
   this.InitializeLink();
  this.PreventButtonImageDragging();
 },
 InitializeElementIDs: function(){
  var mainElement = this.GetMainElement();
  var contentElement = _aspxGetChildByTagName(mainElement, "DIV", 0);
  if(contentElement) contentElement.id = this.name + "_CD";
  var imageElement = _aspxGetChildByTagName(mainElement, "IMG", 0);
  if(imageElement) imageElement.id = this.name + "Img";
 },
 InitializeEnabled: function(){
  this.SetEnabledInternal(this.clientEnabled, true);
 },
 InitializeChecked: function(){
  this.SetCheckedInternal(this.checked, true);
 },
 InitializeLink: function(){
  var mainElement = this.GetMainElement();
  if(this.enabled)
   mainElement.href = "javascript:;";
  if(!this.allowFocus)
   mainElement.style.outline = 0;
  if(!this.GetTextContainer())
   mainElement.style.fontSize = "0pt";
 },
 InitializeEvents: function(){
  if (!this.isNative && !this.IsLink()) {
   var element = this.GetInternalButton();
   if(element)
    element.onfocus = null;
   var textControl = this.GetTextControl();
   if (textControl) {
    if (__aspxIE)
     _aspxAttachEventToElement(textControl, "mouseup", _aspxClearSelection);
    _aspxPreventElementDragAndSelect(textControl, false);
   }    
  }
  this.onClick = function(evt) {
   var processOnServer = aspxBClick(this.name, evt);
   if(!processOnServer)
    _aspxPreventEvent(evt);
   return processOnServer;
  }.aspxBind(this);
  this.onImageMoseDown = function() { var el = _aspxGetFocusedElement(); if(el) el.blur(); };
  this.onGotFocus = function() { aspxBGotFocus(this.name); }.aspxBind(this);
  this.onLostFocus = function() { aspxBLostFocus(this.name); }.aspxBind(this);
  this.onKeyUp = function(evt) { aspxBKeyUp(evt, this.name); }.aspxBind(this);
  this.onKeyDown = function(evt) { aspxBKeyDown(evt, this.name); }.aspxBind(this);
  if(!this.isNative && !this.IsLink()) {
   this.AttachNativeHandlerToMainElement("focus", "SetFocus");
   this.AttachNativeHandlerToMainElement("click", "DoClick");
  }
 },
 AdjustControlCore: function () {
  if(this.isNative || this.IsLink()) return;
  var buttonImage = this.GetButtonImage();  
  if(buttonImage && buttonImage.offsetHeight === 0 && buttonImage.offsetWidth === 0)
   buttonImage.onload = function() { this.UpdateSize(); }.aspxBind(this);
  else
   this.UpdateSize();
 },
 UpdateSize: function(){
  if(this.needUpdateBounds){
   this.UpdateWidth();
   this.UpdateHeight();
  }
  else
   this.CorrectWrappedText(this.GetContentDiv, "Text", true);
 },
 UpdateHeight: function(){
  if(this.isNative || this.IsLink() || this.originalHeight === null || _aspxIsPercentageSize(this.originalHeight)) return;
  var height;
  var mainElement = this.GetMainElement();
  var borderAndPadding = _aspxGetTopBottomBordersAndPaddingsSummaryValue(mainElement);
  if(!this.originalHeight) {
   mainElement.style.height = "";
   height = mainElement.offsetHeight - borderAndPadding;
  }
  else
   height = (_aspxPxToInt(this.originalHeight) - borderAndPadding);
  if(height){
   if(__aspxIE && __aspxBrowserVersion < 8 && height < 0)
    height = 0;
   mainElement.style.height = height + "px";
   var contentDiv = this.GetContentDiv();
   if(contentDiv && contentDiv.offsetHeight > 0){
    var contentDivCurrentStyle = _aspxGetCurrentStyle(contentDiv);
    var paddingTop = parseInt(contentDivCurrentStyle.paddingTop);
    if(!paddingTop) paddingTop = 0;
    var paddingBottom = parseInt(contentDivCurrentStyle.paddingBottom);
    if(!paddingBottom) paddingBottom = 0;
    var clientHeightDiff = height - contentDiv.offsetHeight;
    var verticalAlign = _aspxGetCurrentStyle(mainElement).verticalAlign;
    if(verticalAlign == "top")
     paddingBottom = paddingBottom + clientHeightDiff;
    else if(verticalAlign == "bottom")
     paddingTop = paddingTop + clientHeightDiff;
    else{
     var halfClientHeightDiff = Math.floor(clientHeightDiff / 2);
     paddingTop = paddingTop + halfClientHeightDiff;
     paddingBottom = paddingBottom + (clientHeightDiff - halfClientHeightDiff);
    }
    contentDiv.style.paddingTop = (paddingTop > 0 ? paddingTop : 0) + "px";
    contentDiv.style.paddingBottom = (paddingBottom > 0 ? paddingBottom : 0) + "px";
   }
  }
 },
 UpdateWidth: function(){
  if(this.isNative || this.IsLink() || this.originalWidth === null) return;
  if(!_aspxIsPercentageSize(this.originalWidth)) {
   var mainElement = this.GetMainElement();
   var borderAndPadding = _aspxGetLeftRightBordersAndPaddingsSummaryValue(mainElement);
   if(__aspxIE && __aspxBrowserVersion < 8){
    mainElement.style.display = "inline";
    mainElement.style.width = "";
    if(mainElement.offsetWidth > 0)
     mainElement.style.width = (mainElement.offsetWidth + borderAndPadding) + "px";
    mainElement.style.display = "";
   }
   else {
    if(this.originalWidth && _aspxIsTextWrapped(this.GetTextContainer()))
     mainElement.style.width = (_aspxPxToInt(this.originalWidth) - borderAndPadding) + "px";
    else
     mainElement.style.width = "";
   }
   var width = mainElement.offsetWidth - borderAndPadding;
   if(this.originalWidth && width < _aspxPxToInt(this.originalWidth) - borderAndPadding) 
    width = _aspxPxToInt(this.originalWidth) - borderAndPadding;
   if(width)
    mainElement.style.width = (width > 0 ? width : 0)  + "px";
  }
  this.CorrectWrappedText(this.GetContentDiv, "Text", true);
 },
 GetAdjustedSizes: function() {
  var sizes = ASPxClientControl.prototype.GetAdjustedSizes.call(this);
  var image = this.GetButtonImage();
  if(image) {
   sizes.imageWidth = image.offsetWidth;
   sizes.imageHeight = image.offsetHeight;
  }
  return sizes;
 },
 PreventButtonImageDragging: function() {
  _aspxPreventImageDragging(this.GetButtonImage());
 },
 AttachNativeHandlerToMainElement: function(handlerName, correspondingMethodName) {
  var mainElement = this.GetMainElement();
  if (!_aspxIsExistsElement(mainElement))
   return;
  mainElement[handlerName] = Function("_aspxBCallButtonMethod('" + this.name + "', '" + correspondingMethodName + "')");
 },
 GetContentDiv: function(){
  if(!_aspxIsExistsElement(this.contentDiv))
   this.contentDiv = this.GetChild("_CD");
  return this.contentDiv;
 },       
 GetButtonCheckedInput: function(){
  if(!_aspxIsExistsElement(this.checkedInput))
   this.checkedInput = _aspxGetElementById(this.name + "_CH");
  return this.checkedInput;
 },  
 GetButtonImage: function(){
  if(!_aspxIsExistsElement(this.buttonImage))
   this.buttonImage = _aspxGetChildByTagName(this.GetMainElement(), "IMG", 0);
  return this.buttonImage;
 },
 GetInternalButton: function() {
  if(!_aspxIsExistsElement(this.internalButton))
   this.internalButton = this.isNative || this.IsLink() ? this.GetMainElement() : _aspxGetChildByTagName(this.GetMainElement(), "INPUT", 0);
  return this.internalButton;
 },
 GetTextContainer: function() {
  if (!this.textContainer) {
   if(this.isNative)
    this.textContainer = this.GetMainElement();
   else{
    var textElement = this.IsLink() ? this.GetMainElement() : this.GetContentDiv();
    this.textContainer = _aspxGetChildByTagName(textElement, "SPAN", 0);
   }
  }
  return this.textContainer;
 },
 GetTextControl: function(){
  if(!_aspxIsExistsElement(this.textControl))
   this.textControl = _aspxGetParentByTagName(this.GetContentDiv(), "DIV");
  if (!_aspxIsExistsElement(this.textControl) || (this.textControl.id == this.name))
   this.textControl = this.GetContentDiv();
  return this.textControl;
 },
 IsLink: function(){
  return this.GetMainElement().tagName === "A";
 },   
 IsHovered: function(){
  var hoverElement = this.GetMainElement();
  return aspxGetStateController().currentHoverItemName == hoverElement.id;
 },   
 SetEnabledInternal: function(enabled, initialization) {
  if(!this.enabled)
   return;
  if(!initialization || !enabled)
   this.ChangeEnabledStateItems(enabled);
  this.ChangeEnabledAttributes(enabled);
 },
 ChangeEnabledAttributes: function(enabled) {
  var element = this.GetInternalButton();
  if(element) {
   element.disabled = !enabled;
   if(this.IsLink()){
    var method = _aspxChangeAttributesMethod(enabled);
    method(this.GetMainElement(), "href");
   }
  }
  this.ChangeEnabledEventsAttributes(_aspxChangeEventsMethod(enabled));
 },
 ChangeEnabledEventsAttributes: function(method) {
  var element = this.GetMainElement();
  method(element, "click", this.onClick);
  if (this.allowFocus){
   if (!this.isNative && !this.IsLink()) 
    element = this.GetInternalButton();
   if(element) {
    method(element, "focus", this.onGotFocus);
    method(element, "blur", this.onLostFocus);
    if (!this.isNative && !this.IsLink()){
     method(element, "keyup", this.onKeyUp);
     method(element, "blur", this.onKeyUp);
     method(element, "keydown", this.onKeyDown);
    }
   }
   if(__aspxFirefox){
    var image = this.GetButtonImage();
    if(image)
     method(image, "mousedown", this.onImageMoseDown); 
   }
  }
 },
 ChangeEnabledStateItems: function(enabled){
  if(this.isNative) return;
  aspxGetStateController().SetElementEnabled(this.GetMainElement(), enabled);
  this.UpdateFocusedStyle();
 },
 RequiredPreventDoublePostback: function(){
  return __aspxFirefox && !this.isNative; 
 },
 OnFocus: function() {
  if(!this.allowFocus)
   return false;
  this.focused = true;
  if(this.isInitialized)
   this.RaiseFocus();
  this.UpdateFocusedStyle();
 },  
 OnLostFocus: function() {
  if(!this.allowFocus)
   return false;
  this.focused = false;
  if(this.isInitialized)
   this.RaiseLostFocus();
  this.UpdateFocusedStyle();
 },
 CauseValidation: function() {
  if (this.causesValidation && typeof(ASPxClientEdit) != "undefined")
   return this.validationContainerID != null ?
    ASPxClientEdit.ValidateEditorsInContainerById(this.validationContainerID, this.validationGroup, this.validateInvisibleEditors) :
    ASPxClientEdit.ValidateGroup(this.validationGroup, this.validateInvisibleEditors);
  else
   return true;
 },
 OnClick: function(evt) {
  if(this.clickLocked) return true;
  if(this.checked && this.groupName != "" && this.GetCheckedGroupList().length > 1) return;
  this.SetFocus();
  var isValid = this.CauseValidation();
  var processOnServer = this.autoPostBack;
  if (this.groupName != "") {
   if(this.GetCheckedGroupList().length == 1)
    this.SetCheckedInternal(!this.checked, false);
   else {
    this.SetCheckedInternal(true, false);
    this.ClearButtonGroupChecked(true);
   }
   processOnServer = this.RaiseCheckedChanged();
   if (processOnServer && isValid)
    this.SendPostBack("CheckedChanged");
  }
  var params = this.RaiseClick();
  if(evt && params.cancelEventAndBubble)
   _aspxPreventEventAndBubble(evt);
  if(params.processOnServer && isValid){
   var requiredPreventDoublePostback = this.RequiredPreventDoublePostback();
   var postponePostback = __aspxAndroidMobilePlatform; 
   if(requiredPreventDoublePostback || postponePostback)
    _aspxSetTimeout("_aspxBCallButtonMethod(\"" + this.name + "\", \"SendPostBack\", \"Click\" );", 0); 
   else
    this.SendPostBack("Click");
   return !requiredPreventDoublePostback;
  }
  return false;
 },
 OnKeyUp: function(evt) {
    if(this.pressed)
   this.SetUnpressed();
 },
 OnKeyDown: function(evt) {
    if(evt.keyCode == ASPxKey.Enter || evt.keyCode == ASPxKey.Space)
     this.SetPressed();
 },  
 GetChecked: function(){
  return this.groupName != "" ? this.GetButtonCheckedInput().value == "1" : false;
 },  
 GetCheckedGroupList: function(){
  var result = [ ];
  aspxGetControlCollection().ForEachControl(function(control) {
   if (ASPxIdent.IsASPxClientButton(control) && (control.groupName == this.groupName) && control.RenderExistsOnPage())
    result.push(control);
  }, this);
  return result;
 },
 ClearButtonGroupChecked: function(raiseCheckedChanged){
  var list = this.GetCheckedGroupList();
  for(var i = 0; i < list.length; i ++){
   if(list[i] != this && list[i].checked) {
    list[i].SetCheckedInternal(false, false);
    if(raiseCheckedChanged)
     list[i].RaiseCheckedChanged();
   }
  }
 },
 ApplyCheckedStyle: function(){
  var stateController = aspxGetStateController();
  if(this.IsHovered()) 
   stateController.SetCurrentHoverElement(null);  
  stateController.SelectElementBySrcElement(this.GetMainElement());
 }, 
 ApplyUncheckedStyle: function(){
  var stateController = aspxGetStateController();
  if(this.IsHovered()) 
   stateController.SetCurrentHoverElement(null);
  stateController.DeselectElementBySrcElement(this.GetMainElement());
 },  
 SetCheckedInternal: function(checked, initialization){
  if(initialization && checked || (this.checked != checked)){
   this.checked = checked;
   var inputElement = this.GetButtonCheckedInput();
   if(inputElement) 
    inputElement.value = checked ? "1" : "0";         
   if(checked)
    this.ApplyCheckedStyle();
   else
    this.ApplyUncheckedStyle();
  }
 },
 ApplyPressedStyle: function(){
  aspxGetStateController().OnMouseDownOnElement(this.GetMainElement());
 },
 ApplyUnpressedStyle: function(){ 
  aspxGetStateController().OnMouseUpOnElement(this.GetMainElement());
 },
 SetPressed: function(){
  this.pressed = true;
  this.ApplyPressedStyle();
 }, 
 SetUnpressed: function(){
  this.pressed = false;
  this.ApplyUnpressedStyle();
 },
 SetFocus: function(){
  if(!this.allowFocus || this.focused)
   return;
  var element = this.GetInternalButton();
  if(element) {
   var hiddenInternalButtonRequiresVisibilityToGetFocused = __aspxWebKitFamily  && !this.isNative  && !this.IsLink();
   if(hiddenInternalButtonRequiresVisibilityToGetFocused)
    ASPxClientButton.MakeHiddenElementFocusable(element);
   if(_aspxIsFocusable(element) && _aspxGetActiveElement() != element)
    element.focus();
   if(hiddenInternalButtonRequiresVisibilityToGetFocused)
    ASPxClientButton.RestoreHiddenElementAppearance(element);
  }
 },
 ApplyFocusedStyle: function(){
  if(this.focusElementSelected) return;
  if(typeof(aspxGetStateController) != "undefined")
   aspxGetStateController().SelectElementBySrcElement(this.GetContentDiv());
  this.focusElementSelected = true;
 },
 ApplyUnfocusedStyle: function(){ 
  if(!this.focusElementSelected) return;
  if(typeof(aspxGetStateController) != "undefined")
   aspxGetStateController().DeselectElementBySrcElement(this.GetContentDiv());
  this.focusElementSelected = false;
 },
 UpdateFocusedStyle: function(){
  if(this.isNative || this.IsLink()) return;
  if(this.enabled && this.clientEnabled && this.allowFocus && this.focused)
   this.ApplyFocusedStyle();
  else
   this.ApplyUnfocusedStyle();
 },
 SendPostBack: function(postBackArg){
  if(!this.enabled || !this.clientEnabled)
   return;
  var arg = postBackArg || "";
  if(this.autoPostBackFunction)
   this.autoPostBackFunction(arg);
  else if(!this.useSubmitBehavior || this.IsLink())
   ASPxClientControl.prototype.SendPostBack.call(this, arg);
  if(this.useSubmitBehavior && !this.isNative) 
   this.ClickInternalButton();
 },
 ClickInternalButton: function(){
  var element = this.GetInternalButton();
  if(element) {
   this.clickLocked = true;
   if (__aspxNetscapeFamily)
    this.CreateUniqueIDCarrier(); 
   _aspxDoElementClick(element);
   if (__aspxNetscapeFamily)
    this.RemoveUniqueIDCarrier(); 
   this.clickLocked = false;
  }
 },
 CreateUniqueIDCarrier: function() {
  var name = this.uniqueID;
  var id = this.GetUniqueIDCarrierID();
  var field = _aspxCreateHiddenField(name, id);
  var form = this.GetParentForm();
  if(form) form.appendChild(field);
 },
 RemoveUniqueIDCarrier: function() {
  var field = document.getElementById(this.GetUniqueIDCarrierID());
  if (field)
   field.parentNode.removeChild(field);
 },
 GetUniqueIDCarrierID: function() {
  return this.uniqueID + "_UIDC";
 },
 DoClick: function(){
  if(!this.enabled || !this.clientEnabled)
   return;
  var button = (this.isNative || this.IsLink()) ? this.GetMainElement() : this.GetInternalButton();
  if(button)
   _aspxDoElementClick(button);
  else 
   this.OnClick();   
 },
 GetChecked: function(){
  return this.checked;
 },
 SetChecked: function(checked){
  this.SetCheckedInternal(checked, false);
  this.ClearButtonGroupChecked(false);
 },
 GetText: function(){
  if(!this.isTextEmpty)
   return this.isNative ? this.GetTextContainer().value : this.GetTextContainer().innerHTML;
  return "";
 },
 SetText: function(text){
  this.isTextEmpty = (text == null || text == "");
  var textContainer = this.GetTextContainer();
  if(textContainer){
   if(this.isNative)
    textContainer.value = (text != null) ? text : "";
   else {
      textContainer.innerHTML = this.isTextEmpty ? "&nbsp;" : text;
    if (this.clientVisible && __aspxIE && __aspxBrowserVersion >= 9) 
     _aspxSetElementDisplay(this.GetMainElement(), true);
   }
   this.UpdateSize();
  }
 },
 GetImageUrl: function(){
  var img = this.GetButtonImage();
  return img ?  img.src : "";
 },
 SetImageUrl: function(url){
  var img = this.GetButtonImage();
  if (img) {
   img.src = url;
   this.UpdateSize();
  }
 },
 SetEnabled: function(enabled){
  if (this.clientEnabled != enabled) {
   if (!enabled && this.focused)
    this.OnLostFocus();
   this.clientEnabled = enabled;
   this.SetEnabledInternal(enabled, false);
  }
 },
 GetEnabled: function(){
  return this.enabled && this.clientEnabled;
 },
 Focus: function(){
  this.SetFocus();
 },
 RaiseCheckedChanged: function(){
  var processOnServer = this.autoPostBack || this.IsServerEventAssigned("CheckedChanged");
  if(!this.CheckedChanged.IsEmpty()){
   var args = new ASPxClientProcessingModeEventArgs(processOnServer);
   this.CheckedChanged.FireEvent(this, args);
   processOnServer = args.processOnServer;
  }
  return processOnServer;
 },
 RaiseFocus: function(){
  if(!this.GotFocus.IsEmpty()){
   var args = new ASPxClientEventArgs();
   this.GotFocus.FireEvent(this, args);
  }
 },
 RaiseLostFocus: function(){
  if(!this.LostFocus.IsEmpty()){
   var args = new ASPxClientEventArgs();
   this.LostFocus.FireEvent(this, args);
  }
 },
 RaiseClick: function() {
  var processOnServer = this.autoPostBack || this.IsServerEventAssigned("Click");
  var cancelEventAndBubble = false;
  if(!this.Click.IsEmpty()) {
   var args = new ASPxClientButtonClickEventArgs(processOnServer, cancelEventAndBubble);
   this.Click.FireEvent(this, args);
   cancelEventAndBubble = args.cancelEventAndBubble;
   processOnServer = args.processOnServer;
  }
  return {
   processOnServer: processOnServer,
   cancelEventAndBubble: cancelEventAndBubble
  };
 }
});
var ASPxClientButtonClickEventArgs = _aspxCreateClass(ASPxClientProcessingModeEventArgs, {
 constructor: function(processOnServer, cancelEventAndBubble) {
  this.constructor.prototype.constructor.call(this, processOnServer);
  this.cancelEventAndBubble = cancelEventAndBubble;
 }
});
ASPxClientButton.Cast = ASPxClientControl.Cast;
ASPxClientButton.MakeHiddenElementFocusable = function(element) {
  element.__dxHiddenElementState = {
   parentDisplay: element.parentNode.style.display,
   height: element.style.height,
   width: element.style.width
  };
  element.parentNode.style.display = "block";
  element.style.height = "1px";
  element.style.width = "1px";
};
ASPxClientButton.RestoreHiddenElementAppearance = function(element) {
 var state = element.__dxHiddenElementState;
 element.parentNode.style.display = state.parentDisplay;
 element.style.height = state.height;
 element.style.width = state.width;
 delete element.__dxHiddenElementState;
};
ASPxIdent.IsASPxClientButton = function(obj) {
 return !!obj.isASPxClientButton;
};
function _aspxBCallButtonMethod(name, methodName, arg) {
 var button = aspxGetControlCollection().Get(name); 
 if (button != null)
  button[methodName](arg);
}
function aspxBGotFocus(name){
 var button = aspxGetControlCollection().Get(name); 
 if(button != null)
  return button.OnFocus();
}
function aspxBLostFocus(name){
 var button = aspxGetControlCollection().Get(name);
 if(button != null) 
  return button.OnLostFocus();
}
function aspxBClick(name, evt){
 var button = aspxGetControlCollection().Get(name); 
 if(button != null)
  return button.OnClick(evt);
}
function aspxBKeyDown(evt,name){
 var button = aspxGetControlCollection().Get(name); 
 if(button != null)
  button.OnKeyDown(evt);
}
function aspxBKeyUp(evt,name){
 var button = aspxGetControlCollection().Get(name); 
 if(button != null)
  button.OnKeyUp(evt);
}

ASPxClientCallbackPanel = _aspxCreateClass(ASPxClientControl, {
 constructor: function (name) {
  this.constructor.prototype.constructor.call(this, name);
  this.touchUIScroller = null;
  this.hideContentOnCallback = true;
  this.isLoadingPanelTextEmpty = false;
 },
 Initialize: function () {
  this.touchUIScroller = ASPxClientTouchUI.makeScrollableIfRequired(this.GetMainElement());
 },
 GetContentElement: function () {
  var element = this.GetMainElement();
  return element && element.tagName == "TABLE" ? element.rows[0].cells[0] : element;
 },
 OnCallback: function (result) {
  _aspxSetInnerHtml(this.GetContentElement(), result);
  if (this.touchUIScroller)
   this.touchUIScroller.ChangeElement(this.GetMainElement());
 },
 ShowLoadingPanel: function () {
  var element = this.GetContentElement();
  var mainElement = (element.tagName == "TD") ? this.GetMainElement() : element;
  if(!this.hideContentOnCallback)
   this.CreateLoadingPanelWithAbsolutePosition(this.GetMainElement().parentNode, mainElement);
  else
   this.CreateLoadingPanelInsideContainer(element, true, true, false);
 },
 ShowLoadingDiv: function () {
  this.CreateLoadingDiv(this.GetMainElement().parentNode, this.GetContentElement());
 },
 GetCallbackAnimationElement: function() {
  return this.GetContentElement();
 },
 PerformCallback: function (parameter) {
  this.CreateCallback(parameter);
 },
 CreateCallback: function (arg, command, callbackInfo) {
  this.ShowLoadingElements();
  ASPxClientControl.prototype.CreateCallback.call(this, arg, command);
 },
 GetLoadingPanelTextLabelID: function () {
  return this.name + "_TL";
 },
 GetLoadingPanelTextLabel: function () {
  return _aspxGetElementById(this.GetLoadingPanelTextLabelID());
 },
 GetLoadingPanelText: function () {
  var textLabel = this.GetLoadingPanelTextLabel();
  if(textLabel && !this.isLoadingPanelTextEmpty)
   return textLabel.innerHTML;
  return "";
 },
 SetLoadingPanelText: function (text) {
  this.isLoadingPanelTextEmpty = text == null || text == "";
  var textLabel = this.GetLoadingPanelTextLabel();
  if(textLabel)
   textLabel.innerHTML = this.isLoadingPanelTextEmpty ? "&nbsp;" : text;
 },
 GetContentHtml: function () {
  return this.GetContentElement().innerHTML;
 },
 SetContentHtml: function (html, useAnimation) {
  this.GetContentElement().innerHTML = html;
  if(useAnimation && typeof(ASPxAnimationHelper) != "undefined")
   ASPxAnimationHelper.fadeIn(this.GetContentElement());
 }
});
ASPxClientCallbackPanel.Cast = ASPxClientControl.Cast;
