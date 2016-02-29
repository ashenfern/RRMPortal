var ASPx = {};
ASPx.SSLSecureBlankUrl = '/DXR.axd?r=1_0-UIW7b';
ASPx.EmptyImageUrl = '/DXR.axd?r=1_15-UIW7b';
var __aspxVersionInfo = 'Version=\'14.1.8.0\', File Version=\'14.1.8.0\', Date Modified=\'7/22/2015 12:58:50 PM\'';
var __aspxStyleSheet = null;
var __aspxInvalidDimension = -10000;
var __aspxInvalidPosition = -10000;
var __aspxAbsoluteLeftPosition = -10000;
var __aspxAbsoluteRightPosition = 10000;
var __aspxMenuZIndex = 21998;
var __aspxPopupControlZIndex = 11998;
var __aspxPopupShadowWidth = 5;
var __aspxPopupShadowHeight = 5;
var __aspxCallbackSeparator = ":";
var __aspxItemIndexSeparator = "i";
var __aspxCallbackResultPrefix = "/*DX*/";
var __aspxItemClassName = "dxi";
var __aspxAccessibilityEmptyUrl = "javascript:;";
var __aspxAccessibilityMarkerClass = "dxalink";
var __aspxEmptyAttributeValue = { };
var __aspxEmptyCachedValue = { };
var __aspxCachedRules = { };
var __aspxStyleCount = 0;
var __aspxStyleNameCache = { };
var __aspxPossibleNumberDecimalSeparators = [",", "."];
var __aspxAdaptiveClass = "dx-adaptive";
var __aspxCultureInfo = {
 twoDigitYearMax: 2029,
 ts: ":",
 ds: "/",
 am: "AM",
 pm: "PM",
 monthNames: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""],
 genMonthNames: null,
 abbrMonthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ""],
 abbrDayNames: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
 dayNames: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
 numDecimalPoint: ".",
 numPrec: 2,
 numGroupSeparator: ",", 
 numGroups: [ 3 ],
 numNegPattern: 1,
 numPosInf: "Infinity", 
 numNegInf: "-Infinity", 
 numNan: "NaN",
 currency: "$",
 currDecimalPoint: ".",
 currPrec: 2,
 currGroupSeparator: ",",
 currGroups: [ 3 ],
 currPosPattern: 0,
 currNegPattern: 0,
 percentPattern: 0,
 shortTime: "h:mm tt",
 longTime: "h:mm:ss tt",
 shortDate: "M/d/yyyy",
 longDate: "dddd, MMMM dd, yyyy",
 monthDay: "MMMM dd",
 yearMonth: "MMMM, yyyy"
};
__aspxCultureInfo.genMonthNames = __aspxCultureInfo.monthNames;
function _aspxGetInvariantDateString(date) {
 if(!date)
  return "01/01/0001";
 var day = date.getDate();
 var month = date.getMonth() + 1;
 var year = date.getFullYear();
 var result = "";
 if(month < 10)
  result += "0";
 result += month.toString() + "/";
 if(day < 10)
  result += "0";
 result += day.toString() + "/";
 if(year < 1000)
  result += "0";
 result += year.toString();
 return result;
}
function _aspxGetInvariantDateTimeString(date) {
 var dateTimeString = _aspxGetInvariantDateString(date);
 var time = {
  h: date.getHours(),
  m: date.getMinutes(),
  s: date.getSeconds()
 };
 for(var key in time) {
  var str = time[key].toString();
  if(str.length < 2)
   str = "0" + str;
  time[key] = str;
 }
 dateTimeString += " " + time.h + ":" + time.m + ":" + time.s;
 var msec = date.getMilliseconds();
 if(msec > 0)
  dateTimeString += "." + msec.toString();
 return dateTimeString;
}
function _aspxExpandTwoDigitYear(value) {
 value += 1900;
 if(value + 99 < __aspxCultureInfo.twoDigitYearMax)
  value += 100;
 return value;  
}
function _aspxToUtcTime(date) {
 var result = new Date();
 result.setTime(date.valueOf() + 60000 * date.getTimezoneOffset());
 return result;
}
function _aspxToLocalTime(date) {
 var result = new Date();
 result.setTime(date.valueOf() - 60000 * date.getTimezoneOffset());
 return result; 
}
function _aspxAreDatesEqualExact(date1, date2) {
 if(date1 == null && date2 == null)
  return true;
 if(date1 == null || date2 == null)
  return false;
 return date1.getTime() == date2.getTime(); 
}
function _aspxFixTimezoneGap(oldDate, newDate) {
 var diff = newDate.getHours() - oldDate.getHours();
 if(diff == 0)
  return;
 var sign = (diff == 1 || diff == -23) ? -1 : 1;
 var trial = new Date(newDate.getTime() + sign * 3600000);
 if(sign > 0 || trial.getDate() == newDate.getDate())
  newDate.setTime(trial.getTime());
}
var ASPxKey = {
 F1     : 112,
 F2     : 113,
 F3     : 114,
 F4     : 115,
 F5     : 116,
 F6     : 117,
 F7     : 118,
 F8     : 119,
 F9     : 120,
 F10    : 121,
 F11    : 122,
 F12    : 123,
 Ctrl   : 17,
 Shift  : 16,
 Alt    : 18,
 Enter  : 13,
 Home   : 36,
 End    : 35,
 Left   : 37,
 Right  : 39,
 Up     : 38,
 Down   : 40,
 PageUp    : 33,
 PageDown  : 34,
 Esc    : 27,
 Space  : 32,
 Tab    : 9,
 Backspace : 8,
 Delete    : 46,
 Insert    : 45,
 ContextMenu  : 93,
 Windows   : 91,
 Decimal   : 110
};
var ASPxCallbackType = {
 Data: "d",
 Common: "c"
};
var ASPxWhiteSpaces = { 
 0x0009: 1, 0x000a: 1, 0x000b: 1, 0x000c: 1, 0x000d: 1, 0x0020: 1, 0x0085: 1, 
 0x00a0: 1, 0x1680: 1, 0x180e: 1, 0x2000: 1, 0x2001: 1, 0x2002: 1, 0x2003: 1, 
 0x2004: 1, 0x2005: 1, 0x2006: 1, 0x2007: 1, 0x2008: 1, 0x2009: 1, 0x200a: 1, 
 0x200b: 1, 0x2028: 1, 0x2029: 1, 0x202f: 1, 0x205f: 1, 0x3000: 1
};
function _aspxFalseFunction() { return false; }
function _aspxGetActiveElement() {
 try{
  return document.activeElement;
 } catch(e) {
 }
 return null;
}
var __aspxUserAgent = navigator.userAgent.toLowerCase();
var __aspxMozilla,
 __aspxIE,
 __aspxFirefox,
 __aspxNetscape,
 __aspxSafari,
 __aspxChrome,
 __aspxOpera,
 __aspxBrowserVersion, 
 __aspxBrowserMajorVersion, 
 __aspxWindowsPlatform,
 __aspxMacOSPlatform,
 __aspxMacOSMobilePlatform,
 __aspxAndroidMobilePlatform,
 __aspxPlaformMajorVersion,
 __aspxWebKitFamily, 
 __aspxNetscapeFamily, 
 __aspxBrowserWithHardwareAcceleration;
function _aspxIndentPlatformMajorVersion(userAgent) {
 var regex = /(?:(?:windows nt|macintosh|mac os|cpu os|cpu iphone os|android|windows phone|linux) )(\d+)(?:[-0-9_.])*/;
 var matches = regex.exec(userAgent);
 if(matches)
  __aspxPlaformMajorVersion = matches[1];
}
function _aspxIdentUserAgent(userAgent, ignoreDocumentMode) {
 var browserTypesOrderedList = [ "Mozilla", "IE", "Firefox", "Netscape", "Safari", "Chrome", "Opera", "Opera10" ];
 var defaultBrowserType = "IE";
 var defaultPlatform = "Win";
 var defaultVersions = { Safari: 2, Chrome: 0.1, Mozilla: 1.9, Netscape: 8, Firefox: 2, Opera: 9, IE: 6 };
 if(!userAgent || userAgent.length == 0) {
  _aspxFillUserAgentInfo(browserTypesOrderedList, defaultBrowserType, defaultVersions[defaultBrowserType], defaultPlatform);
  return;
 }
 userAgent = userAgent.toLowerCase();
 _aspxIndentPlatformMajorVersion(userAgent);
 try {
  var platformIdentStrings = {
   "Windows": "Win",
   "Macintosh": "Mac",
   "Mac OS": "Mac",
   "Mac_PowerPC": "Mac",
   "cpu os": "MacMobile",
   "cpu iphone os": "MacMobile",
   "Android": "Android",
   "!Windows Phone": "WinPhone",
   "!WPDesktop": "WinPhone",
   "!ZuneWP": "WinPhone"
  };
  var tridentIdentStrings = {
   "Trident/5": 9,
   "Trident/6": 10
  };
  var optSlashOrSpace = "(?:/|\\s*)?";
  var version = "(\\d+)(?:\\.((?:\\d+?[1-9])|\\d)0*?)?";
  var optVersion = "(?:" + version + ")?";
  var patterns = {
   Safari: "applewebkit(?:.*?(?:version/" + version + "[\\.\\w\\d]*?(?:\\s+mobile\/\\S*)?\\s+safari))?",
   Chrome: "chrome(?!frame)" + optSlashOrSpace + optVersion,
   Mozilla: "mozilla(?:.*rv:" + optVersion + ".*Gecko)?",
   Netscape: "(?:netscape|navigator)\\d*/?\\s*" + optVersion,
   Firefox: "firefox" + optSlashOrSpace + optVersion,
   Opera: "opera" + optSlashOrSpace + optVersion,
   Opera10: "opera.*\\s*version" + optSlashOrSpace + optVersion,
   IE: "msie\\s*" + optVersion
  };
  var browserType;
  var version = -1;
  for(var i = 0; i < browserTypesOrderedList.length; i++) {
   var browserTypeCandidate = browserTypesOrderedList[i];
   var regExp = new RegExp(patterns[browserTypeCandidate], "i");
   if(regExp.compile)
    regExp.compile(patterns[browserTypeCandidate], "i");
   var matches = regExp.exec(userAgent);
   if(matches && matches.index >= 0) {
    browserType = browserTypeCandidate;
    if(browserType == "Opera10")
     browserType = "Opera";
    var tridentPattern = "trident" + optSlashOrSpace + optVersion;
    version = _aspxGetBrowserVersion(userAgent, matches, tridentPattern, _aspxGetIECompatibleVersionString());
    if(browserType == "Mozilla" && version >= 11)
     browserType = "IE";
   }
  }
  if(!browserType)
   browserType = defaultBrowserType;
  var browserVersionDetected = version != -1;
  if(!browserVersionDetected)
   version = defaultVersions[browserType];
  var platform;
  var minOccurenceIndex = Number.MAX_VALUE;
  for(var identStr in platformIdentStrings) {
   if(!platformIdentStrings.hasOwnProperty(identStr)) continue;
   var importantIdent = identStr.substr(0,1) == "!";
   var occurenceIndex = userAgent.indexOf((importantIdent ? identStr.substr(1) : identStr).toLowerCase());
   if(occurenceIndex >= 0 && (occurenceIndex < minOccurenceIndex || importantIdent)) {
    minOccurenceIndex = importantIdent ? 0 : occurenceIndex;
    platform = platformIdentStrings[identStr];
   }
  }
  if(platform == "WinPhone" && version < 9) {
   for(var identStr in tridentIdentStrings) {
    if(!tridentIdentStrings.hasOwnProperty(identStr)) continue;
    if(userAgent.indexOf(identStr.toLowerCase()) > -1)
     version = tridentIdentStrings[identStr];
   }
  }
  if(!ignoreDocumentMode && browserType == "IE" && version > 7 && document.documentMode < version)
   version = document.documentMode;
  if(platform == "WinPhone")
   version = Math.max(9, version);
  if(!platform)
   platform = defaultPlatform;
  if(platform == platformIdentStrings["cpu os"] && !browserVersionDetected) 
   version = 4;
  _aspxFillUserAgentInfo(browserTypesOrderedList, browserType, version, platform);
 } catch(e) {
  _aspxFillUserAgentInfo(browserTypesOrderedList, defaultBrowserType, defaultVersions[defaultBrowserType], defaultPlatform);
 }
}
function _aspxGetIECompatibleVersionString() {
 if(document.compatible) {
  for(var i = 0; i < document.compatible.length; i++)
   if(document.compatible[i].userAgent === "IE" && document.compatible[i].version)
    return document.compatible[i].version.toLowerCase();
 }
 return "";
}
function _aspxGetBrowserVersion(userAgent, matches, tridentPattern, ieCompatibleVersionString) {
 var version = _aspxGetVersionFromMatches(matches);
 if(ieCompatibleVersionString) {
  var versionFromTrident = _aspxGetVersionFromTrident(userAgent, tridentPattern);
  if(ieCompatibleVersionString === "edge" || parseInt(ieCompatibleVersionString) === versionFromTrident)
   return versionFromTrident;
 }
 return version;
}
function _aspxGetVersionFromTrident(userAgent, tridentPattern) {
 var tridentDiffFromVersion = 4;
 var matches = new RegExp(tridentPattern, "i").exec(userAgent);
 return _aspxGetVersionFromMatches(matches) + tridentDiffFromVersion;
}
function _aspxGetVersionFromMatches(matches) {
 var result = -1;
 var versionStr = "";
 if(matches[1]) {
  versionStr += matches[1];
  if(matches[2])
   versionStr += "." + matches[2];
 }
 if(versionStr != "") {
  result = parseFloat(versionStr);
  if(result == NaN)
   result = -1;
 }
 return result;
}
function _aspxFillUserAgentInfo(browserTypesOrderedList, browserType, version, platform) {
 for(var i = 0; i < browserTypesOrderedList.length; i++) {
  var type = browserTypesOrderedList[i];
  window["__aspx" + type] = type == browserType;
 }
 __aspxBrowserVersion = Math.floor(10.0 * version) / 10.0;
 __aspxBrowserMajorVersion = Math.floor(__aspxBrowserVersion);
 __aspxWindowsPlatform = platform == "Win" || platform == "WinPhone";
 __aspxMacOSPlatform = platform == "Mac";
 __aspxMacOSMobilePlatform = platform == "MacMobile";
 __aspxAndroidMobilePlatform = platform == "Android";
 __aspxWindowsPhonePlatform = platform == "WinPhone";
 __aspxWebKitFamily = __aspxSafari || __aspxChrome;
 __aspxNetscapeFamily = __aspxNetscape || __aspxMozilla || __aspxFirefox;
 __aspxBrowserWithHardwareAcceleration = (__aspxIE && __aspxBrowserMajorVersion >= 9) || (__aspxFirefox && __aspxBrowserMajorVersion >= 4) || (__aspxAndroidMobilePlatform && __aspxChrome) || (__aspxChrome && __aspxBrowserMajorVersion >= 37);
 __aspxWebKitTouchUI = __aspxMacOSMobilePlatform || __aspxAndroidMobilePlatform;
 __aspxMSTouchUI = __aspxIE && __aspxBrowserMajorVersion > 9 && __aspxWindowsPlatform && __aspxUserAgent.toLowerCase().indexOf("touch") >= 0;
 __aspxTouchUI = __aspxWebKitTouchUI || __aspxMSTouchUI;
 __aspxAndroidDefaultBrowser = __aspxAndroidMobilePlatform && !__aspxChrome;
}
_aspxIdentUserAgent(__aspxUserAgent);
ASPx.BlankUrl = __aspxIE
 ? ASPx.SSLSecureBlankUrl
 : (__aspxOpera
  ? "about:blank"
  : "");
function _aspxArrayInsert(array, element, position){
 if(0 <= position && position < array.length){
  for(var i = array.length; i > position; i --)
   array[i] = array[i - 1];
  array[position] = element;
 }
 else
  array.push(element);
}
function _aspxArrayRemove(array, element){
 var index = _aspxArrayIndexOf(array, element);
 if(index > -1) _aspxArrayRemoveAt(array, index);
}
function _aspxArrayRemoveAt(array, index){
 if(index >= 0  && index < array.length){
  for(var i = index; i < array.length - 1; i++)
   array[i] = array[i + 1];
  array.pop();
 }
}
function _aspxArrayClear(array){
 while(array.length > 0)
  array.pop();
}
function _aspxArrayIndexOf(array, element, comparer) {
 if(!comparer) {
  for(var i = 0; i < array.length; i++) {
   if(array[i] == element)
    return i;
  }
 } else {
  for(var i = 0; i < array.length; i++) {
   if(comparer(array[i], element))
    return i;
  }
 }
 return -1;
}
function _aspxArrayIntegerAscendingSort(array){
 _aspxArrayIntegerSort(array);
}
function _aspxArrayIntegerSort(array, desc) {
 array.sort(function(i1, i2) {
  var res = 0;
  if(i1 > i2)
   res = 1;
  else if(i1 < i2)
   res = -1;
  if(desc)
   res *= -1;
  return res;
 });
}
function _aspxCollectionsUnionToArray(firstCollection, secondCollection) {
 var result = [];
 var firstCollectionLength = firstCollection.length;
 var secondCollectionLength = secondCollection.length;
 for(var i = 0; i <  firstCollectionLength + secondCollectionLength; i++) {
  if(i < firstCollectionLength) 
   result.push(firstCollection[i]);
  else 
   result.push(secondCollection[i - firstCollectionLength]);
 }  
 return result;
}
function _aspxCollectionToArray(collection) {
 var array = [];
 for(var i = 0; i < collection.length; i++)
  array.push(collection[i]);
 return array;
}
function _aspxCreateHashTableFromArray(array) {
 var hash = [];
 for(var i = 0; i < array.length; i++)
  hash[array[i]] = 1;
 return hash;
}
function _aspxCreateIndexHashTableFromArray(array) {
 var hash = [];
 for(var i = 0; i < array.length; i++)
  hash[array[i]] = i;
 return hash;
}
var __aspxDefaultBinarySearchComparer = function(array, index, value) {
 var arrayElement = array[index];
 if(arrayElement == value)
  return 0;
 else
  return arrayElement < value ? -1 : 1;
};
var __aspxNearestLeftBinarySearchComparer = function(array, index, value) { 
 var arrayElement = array[index];
 var leftPoint = arrayElement < value;
 var lastLeftPoint = leftPoint && index == array.length - 1;
 var nearestLeftPoint = lastLeftPoint || (leftPoint && array[index + 1] >= value)
 if(nearestLeftPoint)
  return 0;
 else
  return arrayElement < value ? -1 : 1;
};
function _aspxArrayBinarySearch(array, value, binarySearchComparer, startIndex, length) {
 if(!binarySearchComparer)
  binarySearchComparer = __aspxDefaultBinarySearchComparer;
 if(!_aspxIsExists(startIndex))
  startIndex = 0;
 if(!_aspxIsExists(length))
  length = array.length - startIndex;  
 var endIndex = (startIndex + length) - 1;
 while (startIndex <= endIndex) {
  var middle =  (startIndex + ((endIndex - startIndex) >> 1));
  var compareResult = binarySearchComparer(array, middle, value);
  if (compareResult == 0)
   return middle;
  if (compareResult < 0)
   startIndex = middle + 1;
  else
   endIndex = middle - 1;
 }
 return -(startIndex + 1);
}
function _aspxGetDistinctArray(array) {
 var resultArray = [];
 for(var i = 0; i < array.length; i++) {
  var currentEntry = array[i];
  if(_aspxArrayIndexOf(resultArray, currentEntry) == -1) {
     resultArray.push(currentEntry);
  }
 }
 return resultArray;
}
function _aspxApplyReplacement(text, replecementTable) {
 for(var i = 0; i < replecementTable.length; i++) {
  var replacement = replecementTable[i];
  text = text.replace(replacement[0], replacement[1]);
 }
 return text;
}
function _aspxCompleteReplace(text, regexp, newSubStr) {
 var textPrev;
 do {
  textPrev = text;
  text = text.replace(regexp, newSubStr);
 } while(text != textPrev);
 return text;
}
function _aspxNodeListToArray(nodeList, filter) {
 var result = [];
 for(var i = 0, element; element = nodeList[i]; i++) {
  if(filter && !filter(element))
   continue;
  result.push(element);
 }
 return result;
}
function _aspxEncodeHtml(html) {
 return _aspxApplyReplacement(html, [
  [ /&amp;/g,  '&ampx;'  ], [ /&/g, '&amp;'  ],
  [ /&quot;/g, '&quotx;' ], [ /"/g, '&quot;' ],
  [ /&lt;/g,   '&ltx;'   ], [ /</g, '&lt;'   ],
  [ /&gt;/g,   '&gtx;'   ], [ />/g, '&gt;'   ]
 ]);
}
function _aspxDecodeHtml(html) {
 return _aspxApplyReplacement(html, [
  [ /&gt;/g,   '>' ], [ /&gtx;/g,  '&gt;'   ],
  [ /&lt;/g,   '<' ], [ /&ltx;/g,  '&lt;'   ],
  [ /&quot;/g, '"' ], [ /&quotx;/g,'&quot;' ],
  [ /&amp;/g,  '&' ], [ /&ampx;/g, '&amp;'  ]
 ]);
}
function _aspxParseShortcutString(shortcutString) {
 if(!shortcutString)
  return 0;
 var isCtrlKey = false;
 var isShiftKey = false;
 var isAltKey = false;
 var keyCode = null;
 var shcKeys = shortcutString.toString().split("+");
 if (shcKeys.length > 0) {
  for (var i = 0; i < shcKeys.length; i++) {
   var key = _aspxTrim(shcKeys[i].toUpperCase());
   switch (key) {
    case "CTRL":
     isCtrlKey = true;
     break;
    case "SHIFT":
     isShiftKey = true;
     break;
    case "ALT":
     isAltKey = true;
     break;
    case "F1": keyCode = ASPxKey.F1; break;
    case "F2": keyCode = ASPxKey.F2; break;
    case "F3": keyCode = ASPxKey.F3; break;
    case "F4": keyCode = ASPxKey.F4; break;
    case "F5": keyCode = ASPxKey.F5; break;
    case "F6": keyCode = ASPxKey.F6; break;
    case "F7": keyCode = ASPxKey.F7; break;
    case "F8": keyCode = ASPxKey.F8; break;
    case "F9": keyCode = ASPxKey.F9; break;
    case "F10":   keyCode = ASPxKey.F10; break;
    case "F11":   keyCode = ASPxKey.F11; break;
    case "F12":   keyCode = ASPxKey.F12; break;
    case "ENTER": keyCode = ASPxKey.Enter; break;
    case "HOME":  keyCode = ASPxKey.Home; break;
    case "END":   keyCode = ASPxKey.End; break;
    case "LEFT":  keyCode = ASPxKey.Left; break;
    case "RIGHT": keyCode = ASPxKey.Right; break;
    case "UP": keyCode = ASPxKey.Up; break;
    case "DOWN":  keyCode = ASPxKey.Down; break;
    case "PAGEUP": keyCode = ASPxKey.PageUp; break;
    case "PAGEDOWN": keyCode = ASPxKey.PageDown; break;
    case "SPACE": keyCode = ASPxKey.Space; break;
    case "TAB":   keyCode = ASPxKey.Tab; break;
    case "BACK":  keyCode = ASPxKey.Backspace; break;
    case "CONTEXT": keyCode = ASPxKey.ContextMenu; break;
    case "ESCAPE":
    case "ESC":
     keyCode = ASPxKey.Esc;
     break;
    case "DELETE":
    case "DEL":
     keyCode = ASPxKey.Delete;
     break;
    case "INSERT":
    case "INS":
     keyCode = ASPxKey.Insert;
     break;
    case "PLUS":
     keyCode = "+".charCodeAt(0);
     break;
    default:
     keyCode = key.charCodeAt(0);
     break;
   }
  }
 } else
  alert("Invalid shortcut");
 return _aspxGetShortcutCode(keyCode, isCtrlKey, isShiftKey, isAltKey);
}
function _aspxGetShortcutCode(keyCode, isCtrlKey, isShiftKey, isAltKey) {
 var value = keyCode & 0xFFFF;
 var flags = 0;
 flags |= isCtrlKey ? 1 << 0 : 0;
 flags |= isShiftKey ? 1 << 2 : 0;
 flags |= isAltKey ? 1 << 4 : 0;
 value |= flags << 16;
 return value;
}
function _aspxGetShortcutCodeByEvent(evt) {
 return _aspxGetShortcutCode(_aspxGetKeyCode(evt), evt.ctrlKey, evt.shiftKey, evt.altKey);
}
function _aspxIsPasteShortcut(evt){
 var keyCode = _aspxGetKeyCode(evt);
 if (__aspxNetscapeFamily && evt.which == 0)  
  keyCode = evt.keyCode;
 return (evt.ctrlKey && (keyCode == 118  || (keyCode == 86))) ||
     (evt.shiftKey && !evt.ctrlKey && !evt.altKey &&
     (keyCode == ASPxKey.Insert)) ;
}
var ASPxImageUtils = {
 GetImageSrc: function (image){
  return image.src;
 },
 SetImageSrc: function(image, src){
  image.src = src;
 },
 SetSize: function(image, width, height){
  image.style.width = width + "px";
  image.style.height = height + "px";
 },
 GetSize: function(image, isWidth){
  return (isWidth ? image.offsetWidth : image.offsetHeight);
 }
};
var __aspxVerticalScrollBarWidth;
function _aspxGetVerticalScrollBarWidth() {
 if(typeof(__aspxVerticalScrollBarWidth) == "undefined") {
  var container = document.createElement("DIV");
  container.style.cssText = "position: absolute; top: 0px; left: 0px; visibility: hidden; width: 200px; height: 150px; overflow: hidden";
  document.body.appendChild(container);
  var child = document.createElement("P");
  container.appendChild(child);
  child.style.cssText = "width: 100%; height: 200px;";
  var widthWithoutScrollBar = child.offsetWidth;
  container.style.overflow = "scroll";
  var widthWithScrollBar = child.offsetWidth;
  if(widthWithoutScrollBar == widthWithScrollBar)
   widthWithScrollBar = container.clientWidth;
  __aspxVerticalScrollBarWidth = widthWithoutScrollBar - widthWithScrollBar;
  document.body.removeChild(container);
 }
 return __aspxVerticalScrollBarWidth;
}
function _aspxGetVerticalOverflow(element) {
 if(__aspxIE || __aspxSafari && __aspxBrowserVersion >= 3 || __aspxChrome)
  return element.style.overflowY;
 return element.style.overflow;
}
function _aspxSetVerticalOverflow(element, value) {
 if(__aspxIE || __aspxSafari && __aspxBrowserVersion >= 3 || __aspxChrome)
  element.style.overflowY = value;
 else
  element.style.overflow = value;
}
function _aspxHideScrollBarCore(element, scrollName) {
 if(element.tagName == "IFRAME") {
  if((element.scrolling == "yes") || (element.scrolling == "auto")) {
   _aspxChangeAttribute(element, "scrolling", "no");
   return true;
  }
 }
 else if(element.tagName == "DIV") {
  if((element.style[scrollName] == "scroll") || (element.style[scrollName] == "auto")) {
   _aspxChangeStyleAttribute(element, scrollName, "hidden");
   return true;
  }
 }
 return false;
}
function _aspxRestoreScrollBarCore(element, scrollName) {
 if(element.tagName == "IFRAME")
  return _aspxRestoreAttribute(element, "scrolling");
 else if(element.tagName == "DIV")
  return _aspxRestoreStyleAttribute(element, scrollName);
 return false;
}
function _aspxSetScrollBarVisibilityCore(element, scrollName, isVisible) {
 return isVisible ? _aspxRestoreScrollBarCore(element, scrollName) : _aspxHideScrollBarCore(element, scrollName);
}
function _aspxSetScrollBarVisibility(element, isVisible) {
 if(_aspxSetScrollBarVisibilityCore(element, "overflow", isVisible)) 
  return true;
 var result = _aspxSetScrollBarVisibilityCore(element, "overflowX", isVisible)
  || _aspxSetScrollBarVisibilityCore(element, "overflowY", isVisible);
 return result;
}
function _aspxSetTimeout(callString, timeout){
 return window.setTimeout(callString, timeout);
}
function _aspxClearTimer(timerID){
 if(timerID > -1)
  window.clearTimeout(timerID);
 return -1;
}
function _aspxSetInterval(callString, interval){
 return window.setInterval(callString, interval);
}
function _aspxClearInterval(timerID){
 if(timerID > -1)
  window.clearInterval(timerID);
 return -1;
}
function _aspxSetInnerHtml(element, html) {
 if(__aspxIE) {
  element.innerHTML = "<em>&nbsp;</em>" + html;
  element.removeChild(element.firstChild);
 } else
  element.innerHTML = html;
}
function _aspxGetInnerText(container) {
 if (__aspxSafari && __aspxBrowserMajorVersion <= 5) {
  var filter = _aspxGetHtml2PlainTextFilter();
  filter.innerHTML = container.innerHTML;
  _aspxSetElementDisplay(filter, true);
  var innerText = filter.innerText;
  _aspxSetElementDisplay(filter, false);
  return innerText;
 } else if (__aspxNetscapeFamily || __aspxWebKitFamily) {
  return container.textContent;
 } else
  return container.innerText;
}
var __aspxHtml2PlainTextFilter = null;
function _aspxGetHtml2PlainTextFilter() {
 if (__aspxHtml2PlainTextFilter == null) {
  __aspxHtml2PlainTextFilter = document.createElement("DIV");
  __aspxHtml2PlainTextFilter.style.width = "0";
  __aspxHtml2PlainTextFilter.style.height = "0";
  __aspxHtml2PlainTextFilter.style.overflow = "visible";
  _aspxSetElementDisplay(__aspxHtml2PlainTextFilter, false);
  document.body.appendChild(__aspxHtml2PlainTextFilter);
 }
 return __aspxHtml2PlainTextFilter;
}
function _aspxCreateHiddenField(name, id) {
 var input = document.createElement("INPUT");
 input.setAttribute("type", "hidden");
 if(name)
  input.setAttribute("name", name);
 if(id)
  input.setAttribute("id", id);
 return input;
}
function _aspxCloneObject(srcObject) {
  if(typeof(srcObject) != 'object' || srcObject == null)
 return srcObject;
  var newObject = { };
  for(var i in srcObject) 
 newObject[i] = srcObject[i];
  return newObject;
}
function _aspxIsExists(obj){
 return (typeof(obj) != "undefined") && (obj != null);
}
function _aspxIsFunction(obj){
 return typeof(obj) == "function";
}
function _aspxGetDefinedValue(value, defaultValue){
 return (typeof(value) != "undefined") ? value : defaultValue;
}
function _aspxGetKeyCode(srcEvt) {
 return __aspxNetscapeFamily || __aspxOpera ? srcEvt.which : srcEvt.keyCode;
}
function _aspxPreventElementDrag(element) {
 if(__aspxIE)
  _aspxAttachEventToElement(element, "dragstart", _aspxPreventEvent);
 else
  _aspxAttachEventToElement(element, "mousedown", _aspxPreventEvent);
}
function _aspxPreventElementDragAndSelect(element, skipMouseMove, skipIESelect){
 if(__aspxWebKitFamily)
  _aspxAttachEventToElement(element, "selectstart", _aspxPreventEventAndBubble);
 if(__aspxIE){
  if(!skipIESelect)
   _aspxAttachEventToElement(element, "selectstart", _aspxFalseFunction);
  if(!skipMouseMove)
   _aspxAttachEventToElement(element, "mousemove", _aspxClearSelectionOnMouseMove);
  _aspxAttachEventToElement(element, "dragstart", _aspxPreventDragStart);
 }
}
function _aspxSetElementAsUnselectable(element, isWithChild, recursive) {
 if (element && element.nodeType == 1) {
  element.unselectable = "on";
  if(__aspxNetscapeFamily)
   element.onmousedown = _aspxFalseFunction;
  if((__aspxIE && __aspxBrowserVersion >= 9) || __aspxWebKitFamily)
   _aspxAttachEventToElement(element, "mousedown", _aspxPreventEventAndBubble);
  if(isWithChild === true){
   for(var j = 0; j < element.childNodes.length; j ++)
    _aspxSetElementAsUnselectable(element.childNodes[j], (!!recursive ? true : false), (!!recursive));
  }
 }
}
function _aspxIsPercentageSize(size) {
 return size && size.indexOf('%') != -1;
}
function _aspxClearSelection() {
 try {
  if (window.getSelection) {
   if (__aspxWebKitFamily)
    window.getSelection().collapse();
   else
    window.getSelection().removeAllRanges();
  }
  else if (document.selection) {
   if(document.selection.empty)
    document.selection.empty();
   else if(document.selection.clear)
    document.selection.clear();
  }
 } catch(e) {
 }
}
function _aspxClearSelectionOnMouseMove(evt) {
 if (!__aspxIE || (evt.button != 0)) 
  _aspxClearSelection();
}
function _aspxPreventDragStart(evt) {
 evt = _aspxGetEvent(evt);
 var element = _aspxGetEventSource(evt);
 if (element.releaseCapture)
  element.releaseCapture(); 
 return false;
}
function _aspxSetElementSelectionEnabled(element, value) {
 var userSelectValue = value ? "" : "none";
 var func = value ? _aspxDetachEventFromElement : _aspxAttachEventToElement;
 if(__aspxFirefox)
  element.style.MozUserSelect = userSelectValue;
 else if(__aspxWebKitFamily)
  element.style.webkitUserSelect = userSelectValue;
 else if(__aspxOpera)
  func(element, "mousemove", _aspxClearSelection);
 else {
  func(element, "selectstart", _aspxFalseFunction);
  func(element, "mousemove", _aspxClearSelection);
 }
}
function _aspxGetElementById(id) {
 if(document.getElementById)
  return document.getElementById(id);
 else
  return document.all[id];
}
function _aspxGetInputElementById(id) {
 var elem = _aspxGetElementById(id);
 if(!__aspxIE)
  return elem;
 if(elem) {
  if(elem.id == id)
   return elem;
  else {
   for(var i = 1; i < document.all[id].length; i++) {
    if(document.all[id][i].id == id)
     return document.all[id][i];
   }
  }
 }
 return null;
}
function _aspxGetElementByIdInDocument(documentObj, id) {
 if(documentObj.getElementById)
  return documentObj.getElementById(id);
 else
  return documentObj.all[id];
}
function _aspxGetIsParent(parentElement, element) {
 while(element){
  if(element === parentElement)
   return true;
  if(element.tagName === "BODY")
   return false;
  element = element.parentNode;
 }
 return false;
}
function _aspxGetParentById(element, id) {
 element = element.parentNode;
 while(element){
  if(element.id === id)
   return element;
  element = element.parentNode;
 }
 return null;
}
function _aspxGetParentByTagName(element, tagName) {
 tagName = tagName.toUpperCase();
 while(element) {
  if(element.tagName === "BODY")
   return null;
  if(element.tagName === tagName)
   return element;
  element = element.parentNode;
 }
 return null;
}
function _aspxElementHasCssClass(element, className) {
 try {
  return !!element.className.match("(^|\\s)" + className + "(\\s|$)");
 } catch(e) {
  return false;
 }
}
function _aspxElementCssClassContains(element, className) {
 try {
  return element.className.indexOf(className) != -1;
 } catch(e) {
  return false;
 }
}
function _aspxAddClassNameToElement(element, className){
 if(!_aspxElementHasCssClass(element, className))
  element.className = element.className + " " + className;
}
function _aspxRemoveClassNameFromElement(element, className){
 if(_aspxElementHasCssClass(element, className)) {
  element.className = (" " + element.className + " ").replace(" " + className + " ", " ");
 }
}
function _aspxGetChildNodesByClassName(parent, className) {
 if(parent.querySelectorAll) {
  var children = parent.querySelectorAll('.' + className);
  return _aspxNodeListToArray(children, function(element) { 
   return element.parentNode === parent;
  });
 }
 return _aspxGetChildNodes(parent, function(elem) { return elem.className && _aspxElementHasCssClass(elem, className); });
}
function _aspxGetDescendantNodesByClassName(parent, className) {
 if(parent.querySelectorAll) {
  var children = parent.querySelectorAll('.' + className);
  return _aspxNodeListToArray(children);
 }
 return _aspxGetDescendantNodes(parent, function(elem) { return elem.className && _aspxElementHasCssClass(elem, className); });
}
function _aspxGetParentByClassNameInternal(element, className, selector) {
 while(element != null) {
  if(element.tagName == "BODY")
   return null;
  if(selector(element, className))
   return element;
  element = element.parentNode;
 }
 return null;
}
function _aspxGetParentByPartialClassName(element, className) {
 return _aspxGetParentByClassNameInternal(element, className, _aspxElementCssClassContains);
}
function _aspxGetParentByClassName(element, className) {
 return _aspxGetParentByClassNameInternal(element, className, _aspxElementHasCssClass);
}
function _aspxGetParentByTagNameAndAttributeValue(element, tagName, attrName, attrValue) {
 tagName = tagName.toUpperCase();
 while(element != null) {
  if(element.tagName == "BODY")
   return null;
  if(element.tagName == tagName && element[attrName] == attrValue)
   return element;
  element = element.parentNode;
 }
 return null;
}
function _aspxGetChildById(element, id) {
 if(element.all) {
  var child = element.all[id];
  if (!child) {
   child = element.all(id); 
   if(!child)
    return __aspxIE ? document.getElementById(id) : null; 
  } 
  if(!_aspxIsExists(child.length)) 
   return child;
  else
   return _aspxGetElementById(id);
 }
 else
  return _aspxGetElementById(id);
}
function _aspxGetElementsByTagName(element, tagName) {
 tagName = tagName.toUpperCase();
 if(element) {
  if(element.getElementsByTagName) 
   return element.getElementsByTagName(tagName);
  else if(element.all && element.all.tags !== undefined)
   return __aspxNetscape ? element.all.tags[tagName] : element.all.tags(tagName);
 }
 return null;
}
function _aspxGetChildByTagName(element, tagName, index) {
 if(element != null){    
  var collection = _aspxGetElementsByTagName(element, tagName);
  if(collection != null){
   if(index < collection.length)
    return collection[index];
  }
 }
 return null;
}
function _aspxRetrieveByPredicate(scourceCollection, predicate) {
 var result = [];
 for(var i = 0; i < scourceCollection.length; i++) {
  var element = scourceCollection[i];
  if(!predicate || predicate(element)) 
   result.push(element);
 }
 return result;
}
function _aspxGetChildNodes(parent, predicate) {
 return _aspxRetrieveByPredicate(parent.childNodes, predicate);
}
function _aspxGetChildNodesByTagName(parent, tagName) {
 return _aspxGetChildNodes(parent, function (child) { return child.tagName === tagName; });
}
function _aspxGetDescendantNodes(parent, predicate) {
 var c = parent.all || parent.getElementsByTagName('*');
 return _aspxRetrieveByPredicate(c, predicate);
}
function _aspxGetElementNodes(parent) {
 if(!parent) return null;
 return _aspxGetChildNodes(parent, function(e) { return e.nodeType == 1 })
}
function _aspxGetElementNodesByPredicate(parent, predicate) {
 if(!parent) return null;
 if(!predicate) return _aspxGetElementNodes(parent);
 return _aspxGetChildNodes(parent, function(e) { return e.nodeType == 1 && predicate(e); })
}
function _aspxGetChildTextNode(element, index) {
 if(element != null){
  var collection = [ ];
  _aspxGetChildTextNodeCollection(element, collection);
  if(index < collection.length)
   return collection[index];
 }
 return null;
}
function _aspxGetChildTextNodeCollection(element, collection) {
 for(var i = 0; i < element.childNodes.length; i ++){
  var childNode = element.childNodes[i];
  if(_aspxIsExists(childNode.nodeValue))
   collection.push(childNode);
  _aspxGetChildTextNodeCollection(childNode, collection);
 }
}
function _aspxGetChildrenByPartialClassName(element, className) {
 if(element.querySelectorAll) {
  var list = element.querySelectorAll('*[class*=' + className + ']');
  return _aspxNodeListToArray(list);
 }
 var collection = element.all || element.getElementsByTagName('*');
 var ret = [ ];
 if(collection != null) {
  for(var i = 0; i < collection.length; i ++) {
   if(_aspxElementCssClassContains(collection[i], className))
    ret.push(collection[i]);
  }
 }
 return ret;
}
function _aspxGetParentByPartialId(element, idPart){
 while(element && element.tagName != "BODY") {
  if(element.id && element.id.indexOf(idPart) > -1) 
   return element;
  element = element.parentNode;
 }
 return null;
}
function _aspxGetElementsByPartialId(element, partialName, list) {
 if(element.id && element.id.indexOf(partialName) > -1) {
  list.push(element);
 }
 if(element.childNodes)
 for(var i = 0; i < element.childNodes.length; i ++) {
  _aspxGetElementsByPartialId(element.childNodes[i], partialName, list);
 }
}
function _aspxGetElementDocument(element) {
 return element.document || element.ownerDocument;
}
function _aspxRemoveElement(element) {
 if(element && element.parentNode)
  element.parentNode.removeChild(element);
}
function _aspxReplaceTagName(element, newTagName, cloneChilds) {
 if (element.nodeType != 1)
  return null;
 if (element.nodeName == newTagName)
  return element;
 cloneChilds = cloneChilds !== undefined ? cloneChilds : true;
 var doc = element.ownerDocument;
 var newElem = doc.createElement(newTagName);
 _aspxCopyAllAttributes(element, newElem);
 if(cloneChilds) {
  for (var i = 0; i < element.childNodes.length; i++)
   newElem.appendChild(element.childNodes[i].cloneNode(true));
 }
 else {
  for(var child; child = element.firstChild; )
   newElem.appendChild(child);
 }
 element.parentNode.replaceChild(newElem, element);
 return newElem;
}
function _aspxRemoveOuterTags(element) {
 if (__aspxIE) {
  element.insertAdjacentHTML( 'beforeBegin', element.innerHTML ) ;
  _aspxRemoveElement(element);
 } else {
  var docFragment = element.ownerDocument.createDocumentFragment();
  for (var i = 0; i < element.childNodes.length; i++)
   docFragment.appendChild(element.childNodes[i].cloneNode(true));
  element.parentNode.replaceChild(docFragment, element);
 }
}
function _aspxWrapElementInNewElement(element, newElementTagName) { 
 var wrapElement = null;
 if (__aspxIE) {
  var wrapElement = element.ownerDocument.createElement(newElementTagName);
  wrapElement.appendChild(element.cloneNode(true));
  element.parentNode.insertBefore(wrapElement, element);
  element.parentNode.removeChild(element);
 } else {
  var docFragment = element.ownerDocument.createDocumentFragment();
  wrapElement = element.ownerDocument.createElement(newElementTagName);
  docFragment.appendChild(wrapElement);
  wrapElement.appendChild(element.cloneNode(true));
  element.parentNode.replaceChild(docFragment, element);
 }
 return wrapElement;
}
function _aspxInsertElementAfter(newElement, targetElement) {
 var parentElem = targetElement.parentNode;
 if(parentElem.childNodes[parentElem.childNodes.length - 1] == targetElement)
  parentElem.appendChild(newElement);
 else
  parentElem.insertBefore(newElement, targetElement.nextSibling);
}
function _aspxGetEvent(evt){
 return (typeof(event) != "undefined" && event != null && __aspxIE) ? event : evt; 
}
function _aspxEventPrevented(evt) {
 return evt.defaultPrevented || evt.returnValue === false;
}
function _aspxPreventEvent(evt){
 if (evt.preventDefault)
  evt.preventDefault();
 else
  evt.returnValue = false;
 return false;
}
function _aspxPreventEventAndBubble(evt){
 _aspxPreventEvent(evt);
 if (evt.stopPropagation)
  evt.stopPropagation();
 evt.cancelBubble = true;
 return false;
}
function _aspxCancelBubble(evt){
 evt.cancelBubble = true;
 return false;
}
function _aspxPreventImageDragging(image) {
 if(image) {
  if(__aspxNetscapeFamily)
   image.onmousedown = function(evt) {
    evt.cancelBubble = true;
    return false;
   };
  else
   image.ondragstart = function() {
    return false;
   };
 }
}
function _aspxClientEventRequiresDocScrollCorrection() {
 return __aspxAndroidDefaultBrowser || !(__aspxSafari && __aspxBrowserVersion < 3 || __aspxMacOSMobilePlatform && __aspxBrowserVersion < 5.1);
}
function _aspxGetEventSource(evt){
 if(!_aspxIsExists(evt)) return null; 
 return evt.srcElement ? evt.srcElement : evt.target;
}
function _aspxGetEventX(evt){
 if(ASPxClientTouchUI.isTouchEvent(evt))
  return ASPxClientTouchUI.getEventX(evt);
 return evt.clientX  - _aspxGetIEDocumentClientOffsetInternal(true) + (_aspxClientEventRequiresDocScrollCorrection() ? _aspxGetDocumentScrollLeft() : 0);
}
function _aspxGetEventY(evt){
 if(ASPxClientTouchUI.isTouchEvent(evt))
  return ASPxClientTouchUI.getEventY(evt);
 var oldSafari = __aspxSafari && __aspxBrowserVersion < 3 || __aspxMacOSMobilePlatform && __aspxBrowserVersion < 5.1;
 return evt.clientY - _aspxGetIEDocumentClientOffsetInternal(false) + (_aspxClientEventRequiresDocScrollCorrection() ? _aspxGetDocumentScrollTop() : 0 );
}
function _aspxGetIEDocumentClientOffsetInternal(IsX){
 var clientOffset = 0;
 if(__aspxIE && __aspxBrowserVersion < 8){
  if(document.documentElement)
   clientOffset = IsX ? document.documentElement.clientLeft : document.documentElement.clientTop;
  if(clientOffset == 0 && document.body)
   var clientOffset = IsX ? document.body.clientLeft : document.body.clientTop;
 }
 return clientOffset;
}
function _aspxGetIsLeftButtonPressed(evt){
 if(ASPxClientTouchUI.isTouchEvent(evt)) 
  return true;
 evt = _aspxGetEvent(evt);
 if(!evt) return false;
 if(__aspxIE && __aspxBrowserVersion < 11){
  if(__aspxMSTouchUI)
   return true;
  return evt.button % 2 == 1; 
 }
 else if(__aspxNetscapeFamily || __aspxWebKitFamily || (__aspxIE && __aspxBrowserVersion >= 11))
  return evt.which == 1;
 else if (__aspxOpera)
  return evt.button == 0;  
 return true;  
}
function _aspxGetWheelDelta(evt){
 var ret = __aspxNetscapeFamily ? -evt.detail : evt.wheelDelta;
 if (__aspxOpera && __aspxBrowserVersion < 9)
  ret = -ret;
 return ret;
}
function _aspxDelCookie(name){
 _aspxSetCookieInternal(name, "", new Date(1970, 1, 1));
}
function _aspxGetCookie(name) {
 name = escape(name);
 var cookies = document.cookie.split(';');
 for(var i = 0; i < cookies.length; i++) {
  var cookie = _aspxTrim(cookies[i]);
  if(cookie.indexOf(name + "=") == 0)
   return unescape(cookie.substring(name.length + 1, cookie.length));
  else if(cookie.indexOf(name + ";") == 0 || cookie === name)
   return "";
 }
 return null;
}
function _aspxSetCookie(name, value, expirationDate){
 if(!_aspxIsExists(value)) {
  _aspxDelCookie(name);
  return;
 }
 if(!ASPxIdent.IsDate(expirationDate)) {
  expirationDate = new Date();
  expirationDate.setFullYear(expirationDate.getFullYear() + 1);
 }
 _aspxSetCookieInternal(name, value, expirationDate);
}
function _aspxSetCookieInternal(name, value, date){
 document.cookie = escape(name) + "=" + escape(value.toString()) + "; expires=" + date.toGMTString() + "; path=/";
}
function _aspxSetElementOpacity(element, value) {
  var useOpacityStyle = !__aspxIE || __aspxBrowserVersion > 8;
  if (useOpacityStyle){
   element.style.opacity = value;
  } else {
   if(typeof(element.filters) === "object" && element.filters["DXImageTransform.Microsoft.Alpha"])
    element.filters.item("DXImageTransform.Microsoft.Alpha").Opacity = value*100;
   else
   element.style.filter = "alpha(opacity=" + (value * 100) + ")";
  }
}
function _aspxGetElementOpacity(element) {
 var useOpacityStyle = !__aspxIE || __aspxBrowserVersion > 8;
 if (useOpacityStyle)
  return parseFloat(_aspxGetCurrentStyle(element).opacity);
 else {
  if(typeof(element.filters) === "object" && element.filters["DXImageTransform.Microsoft.Alpha"]){
   return element.filters.item("DXImageTransform.Microsoft.Alpha").Opacity / 100;
  } else {
   var alphaValue = _aspxGetCurrentStyle(element).filter;
   var value = alphaValue.replace("alpha(opacity=", "");
   value = value.replace(")", "");
   return parseInt(value) / 100;
  }
  return 100;
 }
}
function _aspxGetElementDisplay(element){
 return element.style.display != "none";
}
function _aspxSetElementDisplay(element, value) {
 if(!element) return;
 element.style.display = value ? "" : "none";
}
function _aspxGetElementVisibility(element){
 return element.style.visibility != "hidden";
}
function _aspxSetElementVisibility(element, value){
 element.style.visibility = value ? "visible" : "hidden";
}
function _aspxElementIsVisible(element){
 while(element && element.tagName != "BODY") {
  if(!_aspxGetElementDisplay(element) || (!_aspxGetElementVisibility(element) && !_aspxIsExistsAttribute(element, "errorFrame")))
     return false;
  element = element.parentNode;
 }
 return true;
}
function _aspxElementIsDisplayed(element) {
 while(element && element.tagName != "BODY") {
  if(!_aspxGetElementDisplay(element))
     return false;
  element = element.parentNode;
 }
 return true;
}
function _aspxAddStyleSheetLinkToDocument(doc, linkUrl) {
 var newLink = _aspxCreateStyleLink(doc, linkUrl);
 var head = _aspxGetHeadElementOrCreateIfNotExist(doc);
 head.appendChild(newLink);
}
function _aspxGetHeadElementOrCreateIfNotExist(doc) {
 var elements = _aspxGetElementsByTagName(doc, "head");
 var head = null;
 if (elements.length == 0) {
  head = doc.createElement("head");
  head.visibility = "hidden";
  doc.insertBefore(head, doc.body);
 } else
  head = elements[0];
 return head;
}
function _aspxCreateStyleLink(doc, url) {
 var newLink = doc.createElement("link");
 _aspxSetAttribute(newLink, "href", url);
 _aspxSetAttribute(newLink, "type", "text/css");
 _aspxSetAttribute(newLink, "rel", "stylesheet");
 return newLink;
}
function _aspxGetCurrentStyle(element) {
 if(element.currentStyle)
  return element.currentStyle;
 else if(document.defaultView && document.defaultView.getComputedStyle) { 
  var result = document.defaultView.getComputedStyle(element, null);
  if(!result && __aspxFirefox && window.frameElement) {
   var changes = [];
   var curElement = window.frameElement;
   while(!(result = document.defaultView.getComputedStyle(element, null))) {
    changes.push([curElement, curElement.style.display]);
    _aspxSetStyleCore(curElement, "display", "block", true);
    curElement = curElement.tagName == "BODY" ? curElement.ownerDocument.defaultView.frameElement : curElement.parentNode;
   }
   result = _aspxCloneObject(result);
   for(var ch, i = 0; ch = changes[i]; i++)
    _aspxSetStyleCore(ch[0], "display", ch[1]);
  }
  return result;
 }
 return window.getComputedStyle(element, null);
}
function _aspxIsElementRightToLeft(element) {
 return _aspxGetElementDirection(element) == "rtl";
}
function _aspxCreateStyleSheetInDocument(doc) {
 if(doc.createStyleSheet) {
  try {
   return doc.createStyleSheet();
  }
  catch(e) {
   var message = "The CSS link limit (31) has been exceeded. Please enable CSS merging or reduce the number of CSS files on the page. For details, see http://www.devexpress.com/Support/Center/p/K18487.aspx.";
   throw new Error(message);
  }
 }
 else {
  var styleSheet = doc.createElement("STYLE");
  _aspxGetChildByTagName(doc, "HEAD", 0).appendChild(styleSheet);
  return styleSheet.sheet;
 }
}
function _aspxGetCurrentStyleSheet() {
 if(!__aspxStyleSheet)
  __aspxStyleSheet = _aspxCreateStyleSheetInDocument(document);
 return __aspxStyleSheet;
}
function _aspxCreateStyleSheet(){
 return _aspxCreateStyleSheetInDocument(document);
}
function _aspxGetStyleSheetRules(styleSheet){
 try {
  return __aspxIE ? styleSheet.rules : styleSheet.cssRules;
 }
 catch(e) {
  return null;
 }
}
function _aspxGetStyleSheetRule(className){
 if(__aspxCachedRules[className]) {
  if(__aspxCachedRules[className] != __aspxEmptyCachedValue)
   return __aspxCachedRules[className];
  return null;
 }
 for(var i = 0; i < document.styleSheets.length; i ++){
  var styleSheet = document.styleSheets[i];
  var rules = _aspxGetStyleSheetRules(styleSheet);
  if(rules != null){
   for(var j = 0; j < rules.length; j ++){
    if(rules[j].selectorText == "." + className){
     __aspxCachedRules[className] = rules[j];
     return rules[j];
    }
   }
  }
 }
 __aspxCachedRules[className] = __aspxEmptyCachedValue;
 return null;
}
function _aspxCreateImportantStyleRule(styleSheet, cssText, postfix, prefix) {
 styleSheet = styleSheet || _aspxGetCurrentStyleSheet();
 var cacheKey = (postfix ? postfix + "||" : "") + cssText + (prefix ? "||" + prefix : "");
 if(__aspxStyleNameCache[cacheKey])
  return __aspxStyleNameCache[cacheKey];
 prefix = prefix ? prefix + " " : "";
 var className = "dxh" + __aspxStyleCount + (postfix ? postfix : "");
 _aspxAddStyleSheetRule(styleSheet, prefix + "." + className, _aspxCreateImportantCssText(cssText));
 __aspxStyleCount++;
 __aspxStyleNameCache[cacheKey] = className;
 return className; 
}
function _aspxCreateImportantCssText(cssText) {
 var newText = "";
 var attributes = cssText.split(";");
 for(var i = 0; i < attributes.length; i++){
  if(attributes[i] != "")
   newText += attributes[i] + " !important;";
 }
 return newText;
}
function _aspxRemoveStyleSheetRule(styleSheet, index){
 var rules = _aspxGetStyleSheetRules(styleSheet);
 if(rules != null && rules.length > 0 && rules.length >= index){
  if(__aspxIE)
   styleSheet.removeRule(index);
  else   
   styleSheet.deleteRule(index);  
 }    
}
function _aspxAddStyleSheetRule(styleSheet, selector, cssText){
 if(!cssText) return;
 if(__aspxIE)
  styleSheet.addRule(selector, cssText);
 else
  styleSheet.insertRule(selector + " { " + cssText + " }", styleSheet.cssRules.length);
}
function _aspxGetPointerCursor() {
 return "pointer";
}
function _aspxSetPointerCursor(element) {
 if(element.style.cursor == "")
  element.style.cursor = _aspxGetPointerCursor();
}
function _aspxSetElementFloat(element, value) {
 if(_aspxIsExists(element.style.cssFloat))
  element.style.cssFloat = value;
 else if(_aspxIsExists(element.style.styleFloat))
  element.style.styleFloat = value;
 else
  _aspxSetAttribute(element.style, "float", value);
}
function _aspxGetElementFloat(element) {
 var currentStyle = _aspxGetCurrentStyle(element);
 if(_aspxIsExists(currentStyle.cssFloat))
  return currentStyle.cssFloat;
 if(_aspxIsExists(currentStyle.styleFloat))
  return currentStyle.styleFloat;
 return _aspxGetAttribute(currentStyle, "float");
}
function _aspxGetElementDirection(element) {
 return _aspxGetCurrentStyle(element).direction;
}
function _aspxSetElementDirection(element, value) {
 element.style.direction = value;
}
function _aspxAdjustVerticalMarginsInContainer(container) {
 var containerBorderAndPaddings = _aspxGetTopBottomBordersAndPaddingsSummaryValue(container);
 var flowElements = [], floatElements = [], floatTextElements = [];
 var maxHeight = 0, maxFlowHeight = 0;
 for(var i = 0; i < container.childNodes.length; i++) {
  var element = container.childNodes[i];
  if(!element.offsetHeight) continue;
  _aspxClearVerticalMargins(element);
 }
 for(var i = 0; i < container.childNodes.length; i++) {
  var element = container.childNodes[i];
  if(!element.offsetHeight) continue;
  var float = _aspxGetElementFloat(element);
  var isFloat = (float === "left" || float === "right");
  if(isFloat)
   floatElements.push(element)
  else {
   flowElements.push(element);
   if(element.tagName !== "IMG"){
    element.style.verticalAlign = 'baseline'; 
    floatTextElements.push(element);
   }
   if(element.tagName === "DIV")
    _aspxChangeStyleAttribute(element, "float", "left"); 
  }
  if(element.offsetHeight > maxHeight) 
   maxHeight = element.offsetHeight;
  if(!isFloat && element.offsetHeight > maxFlowHeight) 
   maxFlowHeight = element.offsetHeight;
 }
 for(var i = 0; i < flowElements.length; i++) 
  _aspxRestoreStyleAttribute(flowElements[i], "float");
 var containerBorderAndPaddings = _aspxGetTopBottomBordersAndPaddingsSummaryValue(container);
 var containerHeight = container.offsetHeight - containerBorderAndPaddings;
 if(maxHeight == containerHeight) {
  var verticalAlign = _aspxGetCurrentStyle(container).verticalAlign;
  for(var i = 0; i < floatTextElements.length; i++)
   floatTextElements[i].style.verticalAlign = '';
  containerHeight = container.offsetHeight - containerBorderAndPaddings;
  for(var i = 0; i < floatElements.length; i++)
   _aspxAdjustVerticalMarginsCore(floatElements[i], containerHeight, verticalAlign, true);
  for(var i = 0; i < flowElements.length; i++) {
   if(maxFlowHeight != maxHeight)
    _aspxAdjustVerticalMarginsCore(flowElements[i], containerHeight, verticalAlign);
  }
 }
}
function _aspxAdjustVerticalMargins(element) {
 _aspxClearVerticalMargins(element);
 var parentElement = element.parentNode;
 var parentHeight = parentElement.offsetHeight - _aspxGetTopBottomBordersAndPaddingsSummaryValue(parentElement);
 _aspxAdjustVerticalMarginsCore(element, parentHeight, _aspxGetCurrentStyle(parentElement).verticalAlign);
}
function _aspxAdjustVerticalMarginsCore(element, parentHeight, verticalAlign, toBottom) {
 var marginTop;
 if(verticalAlign == "top")
  marginTop = 0;
 else if(verticalAlign == "bottom")
  marginTop = parentHeight - element.offsetHeight;
 else
  marginTop = (parentHeight - element.offsetHeight) / 2;
 if(marginTop !== 0){
  var marginAttr = (toBottom ? Math.ceil(marginTop) : Math.floor(marginTop)) + "px"
  element.style.marginTop = marginAttr;
 }
}
function _aspxClearVerticalMargins(element) {
 element.style.marginTop = "";
 element.style.marginBottom = "";
}
function _aspxAdjustHeightInContainer(container) {
 var height = container.offsetHeight - _aspxGetTopBottomBordersAndPaddingsSummaryValue(container);
 for(var i = 0; i < container.childNodes.length; i++) {
  var element = container.childNodes[i];
  if(!element.offsetHeight) continue;
  _aspxClearHeight(element);
 }
 var elements = [];
 var childrenHeight = 0;
 for(var i = 0; i < container.childNodes.length; i++) {
  var element = container.childNodes[i];
  if(!element.offsetHeight) continue;
  childrenHeight += element.offsetHeight + _aspxGetTopBottomMargins(element);
  elements.push(element);
 }
 if(elements.length > 0 && childrenHeight < height) {
  var correctedHeight = 0;
  for(var i = 0; i < elements.length; i++) {
   var elementHeight = 0;
   if(i < elements.length - 1){
    var elementHeight = Math.floor(height / elements.length);
    correctedHeight += elementHeight;
   }
   else{
    var elementHeight = height - correctedHeight;
    if(elementHeight < 0) elementHeight = 0;
   }
   _aspxAdjustHeightCore(elements[i], elementHeight);
  }
 }
}
function _aspxAdjustHeight(element) {
 _aspxClearHeight(element);
 var parentElement = element.parentNode;
 var height = parentElement.offsetHeight - _aspxGetTopBottomBordersAndPaddingsSummaryValue(parentElement);
 _aspxAdjustHeightCore(element, height);
}
function _aspxAdjustHeightCore(element, height) {
 var height = height - _aspxGetTopBottomBordersAndPaddingsSummaryValue(element);
 element.style.height = height + "px";
}
function _aspxClearHeight(element) {
 element.style.height = "";
}
function _aspxAdjustWrappedTextInContainer(container) {
 if(!container) return;
 var textContainer, leftWidth = 0, rightWidth = 0;
 for(var i = 0; i < container.childNodes.length; i++){
  var child = container.childNodes[i];
  if(child.tagName === "BR")
   return;
  if(!child.tagName)
   continue;
  if(child.tagName !== "IMG"){
   textContainer = child;
   if(_aspxIsTextWrapped(textContainer)){
    textContainer.style.width = "";
    textContainer.style.marginRight = "";
   }
  }
  else {
   if(child.offsetWidth === 0){
    _aspxAttachEventToElement(child, "load", function (evt) {
     _aspxAdjustWrappedTextInContainer(container);
    });
    return;
   }
   var width = child.offsetWidth + _aspxGetLeftRightMargins(child);
   if(textContainer)
    rightWidth += width;
   else
    leftWidth += width;
  }
 }
 var containerWidth = container.offsetWidth - _aspxGetLeftRightBordersAndPaddingsSummaryValue(container);
 if(textContainer && _aspxIsTextWrapped(textContainer) && textContainer.offsetWidth + leftWidth + rightWidth >= containerWidth) {
   if(rightWidth > 0)
   textContainer.style.width = (containerWidth - rightWidth) + "px";
  else if(leftWidth > 0){
   if(_aspxIsElementRightToLeft(container))
    textContainer.style.marginLeft = leftWidth + "px";
   else
    textContainer.style.marginRight = leftWidth + "px";
  }
 }
}
function _aspxIsTextWrapped(element) {
 return element && _aspxGetCurrentStyle(element).whiteSpace !== "nowrap";
}
var _aspxWebKit3TDRealInfo = {
 GetOffsetTop: function(tdElement){
  switch(_aspxGetCurrentStyle(tdElement).verticalAlign){
   case "middle":
    return Math.round(tdElement.offsetTop - (tdElement.offsetHeight - tdElement.clientHeight )/2 + tdElement.clientTop);
   case "bottom":
    return tdElement.offsetTop - tdElement.offsetHeight + tdElement.clientHeight + tdElement.clientTop;
  }
  return tdElement.offsetTop;
 },
 GetClientHeight: function(tdElement){
  var valign = _aspxGetCurrentStyle(tdElement).verticalAlign;
  switch(valign){
   case "middle":
    return tdElement.clientHeight + tdElement.offsetTop * 2;
   case "top":
    return tdElement.offsetHeight - tdElement.clientTop * 2;
   case "bottom":
    return tdElement.clientHeight + tdElement.offsetTop;
  }
  return tdElement.clientHeight;
 }
}
function _aspxGetIsValidPosition(pos){
 return pos != __aspxInvalidPosition && pos != -__aspxInvalidPosition;
}
function _aspxGetAbsoluteX(curEl){
 return _aspxGetAbsolutePositionX(curEl);
}
function _aspxGetAbsoluteY(curEl){
 return _aspxGetAbsolutePositionY(curEl);
}
function _aspxSetAbsoluteX(element, x){
 element.style.left = _aspxPrepareClientPosForElement(x, element, true) + "px";
}
function _aspxSetAbsoluteY(element, y){
 element.style.top = _aspxPrepareClientPosForElement(y, element, false) + "px";
}
function _aspxGetAbsolutePositionX(element){
 if (__aspxIE)
  return _aspxGetAbsolutePositionX_IE(element);
 else if (__aspxFirefox && __aspxBrowserVersion >= 3)
  return _aspxGetAbsolutePositionX_FF3(element);
 else if (__aspxOpera)
  return _aspxGetAbsolutePositionX_Opera(element);
 else if(__aspxNetscapeFamily && (!__aspxFirefox || __aspxBrowserVersion < 3))
  return _aspxGetAbsolutePositionX_NS(element);
 else if(__aspxWebKitFamily)
  return _aspxGetAbsolutePositionX_Safari(element);
 else
  return _aspxGetAbsolutePositionX_Other(element);
}
function _aspxGetAbsolutePositionX_Opera(curEl){
 var isFirstCycle = true;
 var pos = _aspxGetAbsoluteScrollOffset_OperaFF(curEl, true);
 while (curEl != null) {
  pos += curEl.offsetLeft;
  if(!isFirstCycle)
   pos -= curEl.scrollLeft;
  curEl = curEl.offsetParent;
  isFirstCycle = false;
 }
 pos += document.body.scrollLeft;
 return pos;
}
function _aspxGetAbsolutePositionX_IE(element){
 if(element == null || __aspxIE && element.parentNode == null) return 0; 
 return element.getBoundingClientRect().left + _aspxGetDocumentScrollLeft() - _aspxGetIEDocumentClientOffsetInternal(true);
}
function _aspxGetAbsolutePositionX_FF3(element){
 if(element == null) return 0;
 var x = element.getBoundingClientRect().left + _aspxGetDocumentScrollLeft();
 return Math.round(x);
}
function _aspxGetAbsolutePositionX_NS(curEl){
 var pos = _aspxGetAbsoluteScrollOffset_OperaFF(curEl, true);
 var isFirstCycle = true;
 while (curEl != null) {
  pos += curEl.offsetLeft;
  if (!isFirstCycle && curEl.offsetParent != null)
   pos -= curEl.scrollLeft;
  if (!isFirstCycle && __aspxFirefox){
   var style = _aspxGetCurrentStyle(curEl);
   if(curEl.tagName == "DIV" && style.overflow != "visible")
    pos += _aspxPxToInt(style.borderLeftWidth);
  }
  isFirstCycle = false;
  curEl = curEl.offsetParent;
 }
 return pos;
}
function _aspxGetAbsolutePositionX_Safari(curEl){
 var pos = _aspxGetAbsoluteScrollOffset_WebKit(curEl, true);
 var isSafariVerNonLessThan3OrChrome = __aspxSafari && __aspxBrowserVersion >= 3 || __aspxChrome;
 if(curEl != null){
  var isFirstCycle = true;
  if(isSafariVerNonLessThan3OrChrome && curEl.tagName == "TD") {
   pos += curEl.offsetLeft;
   curEl = curEl.offsetParent;
   isFirstCycle = false;
  }
  while (curEl != null) {
   pos += curEl.offsetLeft;
   var style = _aspxGetCurrentStyle(curEl);
   var posDiv = curEl.tagName == "DIV" && (style.position == "absolute" || style.position == "relative");
   if(!isFirstCycle && (curEl.tagName == "TD" || curEl.tagName == "TABLE" || posDiv))
    pos += curEl.clientLeft;
   isFirstCycle = false;
   curEl = curEl.offsetParent;
  }
 }
 return pos;
}
function _aspxGetAbsolutePositionX_Other(curEl){
 var pos = 0;
 var isFirstCycle = true;
 while (curEl != null) {
  pos += curEl.offsetLeft;
  if (!isFirstCycle && curEl.offsetParent != null)
   pos -= curEl.scrollLeft;
  isFirstCycle = false;
  curEl = curEl.offsetParent;
 }
 return pos;
}
function _aspxGetAbsolutePositionY(element){
 if (__aspxIE)
  return _aspxGetAbsolutePositionY_IE(element);
 else if (__aspxFirefox && __aspxBrowserVersion >= 3)
  return _aspxGetAbsolutePositionY_FF3(element);
 else if (__aspxOpera)
  return _aspxGetAbsolutePositionY_Opera(element);
 else if(__aspxNetscapeFamily && (!__aspxFirefox || __aspxBrowserVersion < 3))
  return _aspxGetAbsolutePositionY_NS(element);
 else if(__aspxWebKitFamily)
  return _aspxGetAbsolutePositionY_Safari(element);
 else
  return _aspxGetAbsolutePositionY_Other(element);
}
function _aspxGetAbsolutePositionY_Opera(curEl){
 var isFirstCycle = true;
 if(curEl && curEl.tagName == "TR" && curEl.cells.length > 0)
  curEl = curEl.cells[0];
 var pos = _aspxGetAbsoluteScrollOffset_OperaFF(curEl, false);
 while (curEl != null) {
  pos += curEl.offsetTop;
  if(!isFirstCycle)
   pos -= curEl.scrollTop;
  curEl = curEl.offsetParent;
  isFirstCycle = false;
 }
 pos += document.body.scrollTop;
 return pos;
}
function _aspxGetAbsolutePositionY_IE(element){
 if(element == null || __aspxIE && element.parentNode == null) return 0; 
 return element.getBoundingClientRect().top + _aspxGetDocumentScrollTop() - _aspxGetIEDocumentClientOffsetInternal(false);
}
function _aspxGetAbsolutePositionY_FF3(element){
 if(element == null) return 0;
 var y = element.getBoundingClientRect().top + _aspxGetDocumentScrollTop();
 return Math.round(y);
}
function _aspxGetAbsolutePositionY_NS(curEl){
 var pos = _aspxGetAbsoluteScrollOffset_OperaFF(curEl, false);
 var isFirstCycle = true;
 while (curEl != null) {
  pos += curEl.offsetTop;
  if (!isFirstCycle && curEl.offsetParent != null)
   pos -= curEl.scrollTop;
  if (!isFirstCycle && __aspxFirefox){
   var style = _aspxGetCurrentStyle(curEl);
   if(curEl.tagName == "DIV" && style.overflow != "visible")
    pos += _aspxPxToInt(style.borderTopWidth);
  }
  isFirstCycle = false;
  curEl = curEl.offsetParent;
 }
 return pos;
}
function _aspxGetAbsolutePositionY_Safari(curEl){
 var pos = _aspxGetAbsoluteScrollOffset_WebKit(curEl, false);
 var isSafariVerNonLessThan3OrChrome = __aspxSafari && __aspxBrowserVersion >= 3 || __aspxChrome;
 if(curEl != null){
  var isFirstCycle = true;
  if(isSafariVerNonLessThan3OrChrome && curEl.tagName == "TD") {
   pos += _aspxWebKit3TDRealInfo.GetOffsetTop(curEl);
   curEl = curEl.offsetParent;
   isFirstCycle = false;
  }
  while (curEl != null) {
   pos += curEl.offsetTop;
   var style = _aspxGetCurrentStyle(curEl);
   var posDiv = curEl.tagName == "DIV" && (style.position == "absolute" || style.position == "relative");
   if(!isFirstCycle && (curEl.tagName == "TD" || curEl.tagName == "TABLE" || posDiv))
    pos += curEl.clientTop;
   isFirstCycle = false;
   curEl = curEl.offsetParent;
  }
 }
 return pos;
}
function _aspxGetAbsoluteScrollOffset_OperaFF(curEl, isX) {
 var pos = 0;   
 var isFirstCycle = true;
 while (curEl != null) {
  if(curEl.tagName == "BODY")
   break;
  var style = _aspxGetCurrentStyle(curEl);
  if(style.position == "absolute")
   break;
  if(!isFirstCycle && curEl.tagName == "DIV" && (style.position == "" || style.position == "static"))
   pos -= isX ? curEl.scrollLeft : curEl.scrollTop;
  curEl = curEl.parentNode;
  isFirstCycle = false;
 }
 return pos; 
}
function _aspxGetAbsoluteScrollOffset_WebKit(curEl, isX) {
 var pos = 0;   
 var isFirstCycle = true;
 var step = 0;
 var absoluteWasFoundAtStep = -1;
 var isThereFixedParent = false;
 while (curEl != null) {
  if(curEl.tagName == "BODY")
   break;
  var style = _aspxGetCurrentStyle(curEl);
  var positionIsDefault = style.position == "" || style.position == "static";
  var absoluteWasFoundAtPreviousStep = absoluteWasFoundAtStep >= 0 && absoluteWasFoundAtStep < step;
  if(!isFirstCycle && (curEl.tagName == "DIV" || curEl.tagName == "FORM") && (!positionIsDefault || !absoluteWasFoundAtPreviousStep))
   pos -= isX ? curEl.scrollLeft : curEl.scrollTop;
  if(style.position == "absolute")
   absoluteWasFoundAtStep = step;
  else if(style.position == "relative")
   absoluteWasFoundAtStep = -1;
  else if(style.position == "fixed")
   isThereFixedParent = true;
  curEl = curEl.parentNode;
  isFirstCycle = false;
  step ++;
 }
 if(isThereFixedParent)
  pos += isX ? _aspxGetDocumentScrollLeft() : _aspxGetDocumentScrollTop();
 return pos; 
}
function _aspxGetAbsolutePositionY_Other(curEl){
 var pos = 0;
 var isFirstCycle = true;
 while (curEl != null) {
  pos += curEl.offsetTop;
  if (!isFirstCycle && curEl.offsetParent != null)
   pos -= curEl.scrollTop;
  isFirstCycle = false;
  curEl = curEl.offsetParent;
 }
 return pos;
}
function _aspxCreateElementMoke(element) {
 var div = document.createElement('DIV');
 div.style.top = "0px";
 div.style.left = "0px";
 div.visibility = "hidden";
 div.style.position = _aspxGetCurrentStyle(element).position;
 return div;
}
function _aspxPrepareClientPosElementForOtherParent(pos, element, otherParent, isX) {
 if(element.parentNode == otherParent)
  return _aspxPrepareClientPosForElement(pos, element, isX);
 var elementMoke = _aspxCreateElementMoke(element);
 otherParent.appendChild(elementMoke); 
 var preparedPos = _aspxPrepareClientPosForElement(pos, elementMoke, isX);
 otherParent.removeChild(elementMoke);
 return preparedPos;
}
function _aspxPrepareClientPosForElement(pos, element, isX) {
 pos -= _aspxGetPositionElementOffset(element, isX);
 return pos;
}
function _aspxGetExperimentalPositionOffset(element, isX) {
    var div = _aspxCreateElementMoke(element);
    if (__aspxFirefox && __aspxBrowserVersion >= 10 && div.style.position == "static")
     div.style.position = "absolute";
    element.parentNode.appendChild(div); 
    var realPos = isX ? _aspxGetAbsoluteX(div) : _aspxGetAbsoluteY(div);
    element.parentNode.removeChild(div);
    return realPos;
}
function _aspxTestElementParentsByFunc(element, func) {
 while(element) {  
  var tagName = element.tagName;
  if(tagName == "HTML" || tagName == "BODY" )
   return false;
  if(func(element)) 
   return true;
  element = element.parentNode; 
 }
 return false;   
}
function _aspxGetPositionElementOffset(element, isX) {
 if(__aspxFirefox && __aspxBrowserVersion >= 10){ 
  return _aspxGetExperimentalPositionOffset(element, isX);
 }
 return _aspxGetPositionElementOffsetCore(element, isX);
}
function _aspxGetPositionElementOffsetCore(element, isX) {
 var curEl = element.offsetParent;
 var offset = 0;
 var scroll = 0;
 var isThereFixedParent = false;
 var isFixed = false;
 var hasDisplayTableParent = false;
 var position = "";
 while(curEl != null) {
  var tagName = curEl.tagName;
  if(tagName == "HTML"){
   break;
  }
  if(tagName == "BODY"){
   if(!__aspxOpera && !__aspxChrome){
    var style = _aspxGetCurrentStyle(curEl);
    if(style.position != "" && style.position != "static"){
     offset += _aspxPxToInt(isX ? style.left : style.top);
     offset += _aspxPxToInt(isX ? style.marginLeft : style.marginTop);
    }
   }
   break;
  }
  if(tagName != "TD" && tagName != "TR") {
   var style = _aspxGetCurrentStyle(curEl);
   isFixed = style.position == "fixed";
   if(isFixed) {
    isThereFixedParent = true;
    if(__aspxIE && __aspxBrowserVersion >= 8) {
     return _aspxGetExperimentalPositionOffset(element, isX); 
    }
   }
   hasDisplayTableParent = style.display == "table" && (style.position == "absolute" || style.position == "relative");
   if(hasDisplayTableParent && __aspxIE && __aspxBrowserVersion >= 8)
    return _aspxGetExperimentalPositionOffset(element, isX);
   if (style.position == "absolute" || isFixed || style.position == "relative") {
    offset += isX ? curEl.offsetLeft : curEl.offsetTop;
    offset += _aspxPxToInt(isX ? style.borderLeftWidth : style.borderTopWidth);
   }
   if(style.position == "relative" && !(__aspxIE && __aspxBrowserVersion < 8)) 
    scroll += _aspxGetElementChainScroll(curEl, curEl.offsetParent, isX);
  }
  scroll += isX ? curEl.scrollLeft : curEl.scrollTop;
  curEl = curEl.offsetParent;
 }
 offset -= scroll; 
 if((__aspxIE && __aspxBrowserVersion >= 7 || __aspxFirefox && __aspxBrowserVersion >= 3 || __aspxWebKitFamily) && isThereFixedParent)
  offset += isX ? _aspxGetDocumentScrollLeft() : _aspxGetDocumentScrollTop();
 return offset;
}
function _aspxGetElementChainScroll(startElement, endElement, isX){
 var curEl = startElement.parentNode;
 var scroll = 0;
 while(curEl != endElement){
  scroll += isX ? curEl.scrollLeft : curEl.scrollTop;
  curEl = curEl.parentNode;
 }
 return scroll;
}
function _aspxGetSizeOfText(text, textCss) {
 var testContainer = document.createElement("tester");
 testContainer.style.fontSize = textCss.fontSize;
 testContainer.style.fontFamily = textCss.fontFamily;
 testContainer.style.fontWeight = textCss.fontWeight;
 testContainer.style.letterSpacing = textCss.letterSpacing;
 testContainer.style.lineHeight = textCss.lineHeight;
 testContainer.style.position = "absolute";
 testContainer.style.top = __aspxInvalidPosition + "px";
 testContainer.style.left = __aspxInvalidPosition + "px";
 testContainer.style.width = "auto";
 testContainer.style.whiteSpace = "nowrap";
 testContainer.appendChild(document.createTextNode(text));
 var testElement = document.body.appendChild(testContainer);
 var size = {
  "width": testElement.offsetWidth,
  "height": testElement.offsetHeight
 };
 document.body.removeChild(testElement);
 return size;
}
function _aspxIsValidJSON(JsonString) {
 return !(/[^,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]/.test(JsonString.replace(/"(\\.|[^"\\])*"/g, '')))
}
function _aspxEvalJSON(jsonString, controlName) {
 if(_aspxIsValidJSON(jsonString))
  return eval("(" + jsonString + ")");
 else
  throw new Error(controlName + " received incorrect JSON-data: " + jsonString);
}
function _aspxPointToPixel(points, addPx) {  
 var result = 0;
 try {
  var indexOfPt = points.toLowerCase().indexOf("pt");
  if (indexOfPt > -1)
   result = parseInt(points.substr(0, indexOfPt)) * 96 / 72;
  else
   result = parseInt(points) * 96 / 72;
  if (addPx)
   result = result + "px";
 } catch(e) {}
 return result;
}
function _aspxPixelToPoint(pixels, addPt) { 
 var result = 0;
 try {
  var indexOfPx = pixels.toLowerCase().indexOf("px");
  if (indexOfPx > -1)
   result = parseInt(pixels.substr(0, indexOfPx)) * 72 / 96;
  else
   result = parseInt(pixels) * 72 / 96;
  if (addPt)
   result = result + "pt";
 } catch(e) {}
 return result;         
}
function _aspxPxToInt(px) {
 return _aspxPxToNumber(px, parseInt);
}
function _aspxPxToFloat(px) {
 return _aspxPxToNumber(px, parseFloat);
}
function _aspxPxToNumber(px, parseFunction) {
 var result = 0;
 if (px != null && px != "") {
  try {
   var indexOfPx = px.indexOf("px");
   if (indexOfPx > -1)
    result = parseFunction(px.substr(0, indexOfPx));
  } catch(e) { }
 }
 return result;
}
function _aspxIsNumber(str) {
 return !isNaN(parseFloat(str)) && isFinite(str);
}
function _aspxPercentageToFloat(perc) {
 var result = 0;
 if(perc != null && perc != "") {
  try {
   var indexOfPerc = perc.indexOf("%");
   if(indexOfPerc > -1)
    result = parseFloat(perc.substr(0, indexOfPerc)) / 100;
  } catch(e) { }
 }
 return result;
}
function _aspxGetLeftRightBordersAndPaddingsSummaryValue(element, currentStyle) {
 return _aspxGetLeftRightPaddings(element, currentStyle) + _aspxGetHorizontalBordersWidth(element, currentStyle);
}
function _aspxGetTopBottomBordersAndPaddingsSummaryValue(element, currentStyle) {
 return _aspxGetTopBottomPaddings(element, currentStyle) + _aspxGetVerticalBordersWidth(element, currentStyle);
}
function _aspxGetVerticalBordersWidth(element, style) {
 if(!_aspxIsExists(style))
  style = _aspxGetCurrentStyle(element);
 var res = 0;
 if(style.borderTopStyle != "none")
  res += _aspxPxToFloat(style.borderTopWidth);
 if(style.borderBottomStyle != "none")
  res += _aspxPxToFloat(style.borderBottomWidth);
 return res;
}
function _aspxGetHorizontalBordersWidth(element, style) {
 if(!_aspxIsExists(style))
  style = _aspxGetCurrentStyle(element);
 var res = 0;
 if(style.borderLeftStyle != "none")
  res += _aspxPxToFloat(style.borderLeftWidth);
 if(style.borderRightStyle != "none")
  res += _aspxPxToFloat(style.borderRightWidth);
 return res;
}
function _aspxGetTopBottomPaddings(element, style) {
 var currentStyle = style ? style : _aspxGetCurrentStyle(element);
 return _aspxPxToInt(currentStyle.paddingTop) + _aspxPxToInt(currentStyle.paddingBottom);
}
function _aspxGetLeftRightPaddings(element, style) {
 var currentStyle = style ? style : _aspxGetCurrentStyle(element);
 return _aspxPxToInt(currentStyle.paddingLeft) + _aspxPxToInt(currentStyle.paddingRight);
}
function _aspxGetTopBottomMargins(element, style) {
 var currentStyle = style ? style : _aspxGetCurrentStyle(element);
 return _aspxPxToInt(currentStyle.marginTop) + _aspxPxToInt(currentStyle.marginBottom);
}
function _aspxGetLeftRightMargins(element, style) {
 var currentStyle = style ? style : _aspxGetCurrentStyle(element);
 return _aspxPxToInt(currentStyle.marginLeft) + _aspxPxToInt(currentStyle.marginRight);
}
function _aspxGetCeilOffsetHeight(element) {
 if(__aspxIE && __aspxBrowserVersion > 9)
  return Math.ceil(element.getBoundingClientRect().height);
 return element.offsetHeight;
}
function _aspxGetClearClientWidth(element) {
 return element.offsetWidth - _aspxGetLeftRightBordersAndPaddingsSummaryValue(element);
}
function _aspxGetClearClientHeight(element) {
 return element.offsetHeight - _aspxGetTopBottomBordersAndPaddingsSummaryValue(element);
}
function _aspxSetOffsetWidth(element, widthValue, currentStyle) {
 if(!_aspxIsExists(currentStyle))
  currentStyle = _aspxGetCurrentStyle(element);
 var value = widthValue - _aspxPxToInt(currentStyle.marginLeft) - _aspxPxToInt(currentStyle.marginRight);
  value -= _aspxGetLeftRightBordersAndPaddingsSummaryValue(element, currentStyle);
 if(value > -1)
  element.style.width = value + "px";
}
function _aspxSetOffsetHeight(element, heightValue, currentStyle) {
 if(!_aspxIsExists(currentStyle))
  currentStyle = _aspxGetCurrentStyle(element);
 var value = heightValue - _aspxPxToInt(currentStyle.marginTop) - _aspxPxToInt(currentStyle.marginBottom);
  value -= _aspxGetTopBottomBordersAndPaddingsSummaryValue(element, currentStyle);
 if(value > -1)
  element.style.height = value + "px";
}
function _aspxFindOffsetParent(element) {
 if(__aspxIE && __aspxBrowserVersion < 8)
  return element.offsetParent;
 var currentElement = element.parentNode;
 while(_aspxIsExistsElement(currentElement) && currentElement.tagName != "BODY") {
  if (currentElement.offsetWidth > 0 && currentElement.offsetHeight > 0)
   return currentElement;
  currentElement = currentElement.parentNode;
 }
 return document.body;
}
function _aspxGetDocumentScrollTop(){
 if(__aspxWebKitFamily) {
  if(__aspxMacOSMobilePlatform) 
   return window.pageYOffset;
  else 
   return document.body.scrollTop;
 }
 else
  return document.documentElement.scrollTop;
}
function _aspxSetDocumentScrollTop(scrollTop) {
 if(__aspxWebKitFamily) {
  if(__aspxMacOSMobilePlatform) 
   window.pageYOffset = scrollTop;
  else 
   document.body.scrollTop = scrollTop;
 }
 else
  document.documentElement.scrollTop = scrollTop;
}
function _aspxGetDocumentScrollLeft(){
 if(__aspxIE && __aspxBrowserVersion < 8) {
  var body = document.body || document.documentElement;
  if(_aspxIsElementRightToLeft(body))
   return body.scrollWidth - body.scrollLeft - body.clientWidth;
 }
 if(__aspxWebKitFamily)
  return document.body.scrollLeft;
 return document.documentElement.scrollLeft;
}
function _aspxSetDocumentScrollLeft(scrollLeft) {
 if(__aspxWebKitFamily) {
  if(__aspxMacOSMobilePlatform)
   window.pageXOffset = scrollLeft;
  else 
   document.body.scrollLeft = scrollLeft;
 }
 else
  document.documentElement.scrollLeft = scrollLeft;
}
function _aspxGetDocumentClientWidth(){
 if(document.documentElement.clientWidth == 0)
  return document.body.clientWidth;
 else
  return document.documentElement.clientWidth;
}
function _aspxGetDocumentClientHeight() {
 if (__aspxFirefox && window.innerHeight - document.documentElement.clientHeight > _aspxGetVerticalScrollBarWidth()) {
  return window.innerHeight;
 } else if (__aspxOpera && __aspxBrowserVersion < 9.6 || document.documentElement.clientHeight == 0) {
   return document.body.clientHeight
 }
 return document.documentElement.clientHeight;
}
function _aspxSetStyles(element, styles, makeImportant) {
 if (_aspxIsExists(styles.cssText))
  element.style.cssText = styles.cssText;
 if (_aspxIsExists(styles.className))
  element.className = styles.className;
 for (var property in styles) {
  if(!styles.hasOwnProperty(property))
   continue;
  var value = styles[property];
  switch (property) {
   case "cssText":
   case "className":
    break;
   case "float":
    _aspxSetElementFloat(element, value);
    break;
   case "opacity":
    _aspxSetElementOpacity(element, value);
    break;
   case "zIndex":
    _aspxSetStyleCore(element, property, value, makeImportant);
    break;
   default:
    _aspxSetStyleCore(element, property, value + (typeof (value) == "number" ? "px" : ""), makeImportant);
  }
 }
}
function _aspxSetStyleCore(element, property, value, makeImportant) {
 if(makeImportant) {
  var index = property.search("[A-Z]");
  if(index != -1)
   property = property.replace(property.charAt(index), "-" + property.charAt(index).toLowerCase());
  if(element.style.setProperty)
   element.style.setProperty(property, value, "important");
  else 
   element.style.cssText += ";" + property + ":" + value + "!important";
 }
 else
  element.style[property] = value;
}
function _aspxGetDocumentWidth(){
 var bodyWidth = document.body.offsetWidth;
 var docWidth = (__aspxIE && __aspxBrowserMajorVersion != 7) ? document.documentElement.clientWidth : document.documentElement.offsetWidth;
 var bodyScrollWidth = document.body.scrollWidth;
 var docScrollWidth = document.documentElement.scrollWidth;
 return _aspxGetMaxDimensionOf(bodyWidth, docWidth, bodyScrollWidth, docScrollWidth);
}
function _aspxGetDocumentHeight(){
 var bodyHeight = document.body.offsetHeight;
 var docHeight = (__aspxIE && __aspxBrowserMajorVersion != 7) ? document.documentElement.clientHeight : document.documentElement.offsetHeight;
 var bodyScrollHeight = document.body.scrollHeight;
 var docScrollHeight = document.documentElement.scrollHeight;
 var maxHeight = _aspxGetMaxDimensionOf(bodyHeight, docHeight, bodyScrollHeight, docScrollHeight);
 if(__aspxOpera && __aspxBrowserVersion >= 9.6){
  if(__aspxBrowserVersion < 10)
   maxHeight = _aspxGetMaxDimensionOf(bodyHeight, docHeight, bodyScrollHeight);
  var visibleHeightOfDocument = document.documentElement.clientHeight;
  if(maxHeight > visibleHeightOfDocument)
   maxHeight = _aspxGetMaxDimensionOf(window.outerHeight, maxHeight);
  else
   maxHeight = document.documentElement.clientHeight;
  return maxHeight;
 }
 return maxHeight;
}
function _aspxGetDocumentMaxClientWidth(){
 var bodyWidth = document.body.offsetWidth;
 var docWidth = document.documentElement.offsetWidth;
 var docClientWidth = document.documentElement.clientWidth;
 return _aspxGetMaxDimensionOf(bodyWidth, docWidth, docClientWidth);
}
function _aspxGetDocumentMaxClientHeight(){
 var bodyHeight = document.body.offsetHeight;
 var docHeight = document.documentElement.offsetHeight;
 var docClientHeight = document.documentElement.clientHeight;
 return _aspxGetMaxDimensionOf(bodyHeight, docHeight, docClientHeight);
}
function _aspxGetMaxDimensionOf(){
 var max = __aspxInvalidDimension;
 for (var i = 0; i < arguments.length; i++){
  if(max < arguments[i])
   max = arguments[i];
 }
 return max;
}
function _aspxGetClientLeft(element){
 return _aspxIsExists(element.clientLeft) ? element.clientLeft : (element.offsetWidth - element.clientWidth) / 2;
}
function _aspxGetClientTop(element){
 return _aspxIsExists(element.clientTop) ? element.clientTop : (element.offsetHeight - element.clientHeight) / 2;
}
function _aspxRemoveBorders(element) {
 if(!element)
  return;
 element.style.borderWidth = 0;
 for(var i = 0; i < element.childNodes.length; i++) {
  var child = element.childNodes[i];
  if(child.style)
   child.style.border = "0";
 }
}
function _aspxRemoveBordersAndShadows(el) {
 if(!el || !el.style)
  return;
 el.style.borderWidth = 0;
 if(_aspxIsExists(el.style.boxShadow))
  el.style.boxShadow = "none";
 else if(_aspxIsExists(el.style.MozBoxShadow))
  el.style.MozBoxShadow = "none";
 else if(_aspxIsExists(el.style.webkitBoxShadow))
  el.style.webkitBoxShadow = "none";
}
function _aspxSetBackground(element, background) {
 if(!element)
  return;
 element.style.backgroundColor = background;
 for(var i = 0; i < element.childNodes.length; i++) {
  var child = element.childNodes[i];
  if(child.style)
   child.style.backgroundColor = background;
 }
}
function _aspxDoElementClick(element) {
 try{
  element.click();
 }
 catch(e){ 
 }
}
function _aspxGetCellSpacing(element) {
 var val = parseInt(element.cellSpacing);
 if(!isNaN(val)) return val;
 val = parseInt(_aspxGetCurrentStyle(element).borderSpacing);
 if(!isNaN(val)) return val;
 return 0;
}
function _aspxGetInnerScrollPositions(element) {
 var scrolls = [];
 _aspxGetInnerScrollPositionsCore(element, scrolls);
 return scrolls;
}
function _aspxGetInnerScrollPositionsCore(element, scrolls) {
 for(var child = element.firstChild; child; child = child.nextSibling) {
  var scrollTop = child.scrollTop,
   scrollLeft = child.scrollLeft;
  if(scrollTop > 0 || scrollLeft > 0)
   scrolls.push([child, scrollTop, scrollLeft]);
  _aspxGetInnerScrollPositionsCore(child, scrolls);
 }
}
function _aspxRestoreInnerScrollPositions(scrolls) {
 for(var i = 0, scrollArr; scrollArr = scrolls[i]; i++) {
  if(scrollArr[1] > 0)
   scrollArr[0].scrollTop = scrollArr[1];
  if(scrollArr[2] > 0)
   scrollArr[0].scrollLeft = scrollArr[2];
 }
}
function _aspxGetOuterScrollPosition(element) {
 while(element.tagName !== "BODY") {
  var scrollTop = element.scrollTop,
   scrollLeft = element.scrollLeft;
  if(scrollTop > 0 || scrollLeft > 0) {
   return {
    scrollTop: scrollTop,
    scrollLeft: scrollLeft,
    element: element
   };
  }
  element = element.parentNode;
 }
 return {
  scrollTop: _aspxGetDocumentScrollTop(),
  scrollLeft: _aspxGetDocumentScrollLeft()
 };
}
function _aspxRestoreOuterScrollPosition(scrollInfo) {
 if(scrollInfo.element) {
  if(scrollInfo.scrollTop > 0)
   scrollInfo.element.scrollTop = scrollInfo.scrollTop;
  if(scrollInfo.scrollLeft > 0)
   scrollInfo.element.scrollLeft = scrollInfo.scrollLeft;
 }
 else {
  if(scrollInfo.scrollTop > 0)
   _aspxSetDocumentScrollTop(scrollInfo.scrollTop);
  if(scrollInfo.scrollLeft > 0)
   _aspxSetDocumentScrollLeft(scrollInfo.scrollLeft);
 }
}
function _aspxSetSelection(input, startPos, endPos, scrollToSelection) {
 if(!_aspxIsExistsElement(input))
  return;
 var textLen = input.value.length;
 startPos = _aspxGetDefinedValue(startPos, 0);
 endPos = _aspxGetDefinedValue(endPos, textLen);
 if(startPos < 0)
  startPos = 0;
 if(endPos < 0 || endPos > textLen)
  endPos = textLen;
 if(startPos > endPos)
  startPos = endPos;
 var makeReadOnly = false;
 if(__aspxWebKitFamily && input.readOnly) {
  input.readOnly = false;
  makeReadOnly = true;
 }
 try {
  if (__aspxFirefox && __aspxBrowserVersion >= 8) 
   input.setSelectionRange(startPos, endPos, "backward")
  else if (__aspxIE && __aspxBrowserVersion < 9)  {
   var range = input.createTextRange();
   range.collapse(true);
   range.moveStart("character", startPos);
   range.moveEnd("character", endPos - startPos);
   range.select();
  } else
   input.setSelectionRange(startPos, endPos);
  if(__aspxOpera || __aspxFirefox) 
   input.focus();
 } catch(e) { 
 }
 if(scrollToSelection && input.tagName == 'TEXTAREA') {
  var scrollHeight = input.scrollHeight;
  var approxCaretPos = startPos;
  var scrollTop = Math.max(Math.round(approxCaretPos * scrollHeight / textLen  - input.clientHeight / 2), 0);
  input.scrollTop = scrollTop;
 }
 if(makeReadOnly)
  input.readOnly = true;
}
function _aspxGetSelectionInfo(input) {
 var start, end;
 if(__aspxIE && __aspxBrowserVersion < 9) {
  var range = document.selection.createRange();
  var rangeCopy = range.duplicate();
  range.move('character', -input.value.length);
  range.setEndPoint('EndToStart', rangeCopy);
  start = range.text.length;
  end = start + rangeCopy.text.length;
 } else {
  try {
   start = input.selectionStart;
   end = input.selectionEnd;
  } catch (e) {
  }
 }
 return { startPos: start, endPos: end };
}
function _aspxGetExtSelectionInfo(input) {
 var start = 0, end = 0, textLen = 0;
 if (__aspxIE && __aspxBrowserVersion < 9) {
  var normalizedValue;
  var range, textInputRange, textInputEndRange;
  range = document.selection.createRange();
  if (range && range.parentElement() == input) {
   textLen = input.value.length;
   normalizedValue = input.value.replace(/\r\n/g, "\n");
   textInputRange = input.createTextRange();
   textInputRange.moveToBookmark(range.getBookmark());
   textInputEndRange = input.createTextRange();
   textInputEndRange.collapse(false);
   if (textInputRange.compareEndPoints("StartToEnd", textInputEndRange) > -1) {
    start = textLen;
    end = textLen;
   } else {
    start = normalizedValue.slice(0, start).split("\n").length - textInputRange.moveStart("character", -textLen) -1;
    if (textInputRange.compareEndPoints("EndToEnd", textInputEndRange) > -1)
     end = textLen;
    else
     end = normalizedValue.slice(0, end).split("\n").length - textInputRange.moveEnd("character", -textLen) - 1;    
   }
  }
  return {startPos: start, endPos: end};
 }
 try {
  start = input.selectionStart;
  end = input.selectionEnd;
 } catch (e) {
 }
 return {startPos: start, endPos: end}; 
}
function _aspxSetCaretPosition(input, caretPos) {
 if(typeof caretPos === "undefined" || caretPos < 0)
  caretPos = input.value.length;
 _aspxSetSelection(input, caretPos, caretPos, true);
}
_aspxSetInputSelection = _aspxSetSelectionCore = _aspxSetSelection;
_aspxClearInputSelection = _aspxSetCaretPosition;
function _aspxSetFocus(element, selectAction) {
 function focusCore(element, selectAction){
  try {
    element.focus();
    if(__aspxIE && document.activeElement != element)
     element.focus();
    if(selectAction) {
     var currentSelection = _aspxGetSelectionInfo(element);
     if(currentSelection.startPos == currentSelection.endPos) {
      switch(selectAction) {
       case "start":
        _aspxSetCaretPosition(element, 0);
        break;
       case "all":
        _aspxSetSelection(element);
        break;
      }
     }
    }
   } catch (e) {
  }
 }
 if(ASPxClientUtils.iOSPlatform) 
  focusCore(element, selectAction);
 else {
  window.setTimeout(function() { 
   focusCore(element, selectAction);
  }, 100);
 }
}
function _aspxIsFocusableCore(element, skipContainerVisibilityCheck) {
 var current = element;
 while(current && current.nodeType == 1) {
  if (current == element || !skipContainerVisibilityCheck(current)) {
   if (current.tagName == "BODY")
    return true;
   if (current.disabled || !_aspxGetElementDisplay(current) || !_aspxGetElementVisibility(current))
    return false;
  }
  current = current.parentNode;
 }
 return true;
}
function _aspxIsFocusable(element) {
 return _aspxIsFocusableCore(element, _aspxFalseFunction);
}
function _aspxAttachEventToElement(element, eventName, func, onlyBubbling) {
 if(element.addEventListener)
  element.addEventListener(eventName, func, !onlyBubbling);
 else
  element.attachEvent("on" + eventName, func);
}
function _aspxDetachEventFromElement(element, eventName, func) {
 if(element.removeEventListener)
  element.removeEventListener(eventName, func, true);
 else
  element.detachEvent("on" + eventName, func);
}
function _aspxAttachEventToDocument(eventName, func) {
 var attachingAllowed = ASPxClientTouchUI.onEventAttachingToDocument(eventName, func);
 if(attachingAllowed)
  _aspxAttachEventToDocumentCore(eventName, func);
}
function _aspxAttachEventToDocumentCore(eventName, func) {
 _aspxAttachEventToElement(document, eventName, func);
}
function _aspxDetachEventFromDocument(eventName, func) {
 _aspxDetachEventFromDocumentCore(eventName, func);
 ASPxClientTouchUI.onEventDettachedFromDocument(eventName, func);
}
function _aspxDetachEventFromDocumentCore(eventName, func){
 _aspxDetachEventFromElement(document, eventName, func);
}
function _aspxCreateEventHandlerFunction(funcName, controlName, withHtmlEventArg) {
 if(withHtmlEventArg)
  return function(e) { window[funcName](controlName, e) };
 return function() { window[funcName](controlName) };
}
function _aspxGetMouseWheelEventName(){
 return __aspxNetscapeFamily ? "DOMMouseScroll" : "mousewheel";
}
function _aspxAttachMouseEnterToElement(element, onMouseOverHandler, onMouseOutHandler) {
 _aspxAttachEventToElement(element, "mouseover", function(evt) { _aspxMouseEnterHandler(evt, element, onMouseOverHandler, onMouseOutHandler); });
 _aspxAttachEventToElement(element, "mouseout", function(evt) { _aspxMouseEnterHandler(evt, element, onMouseOverHandler, onMouseOutHandler); });
}
function _aspxMouseEnterHandler(evt, element, onMouseOverHandler, onMouseOutHandler) {
 var isMouseOverExecuted = !!element.dxMouseOverExecuted;
 var isMouseOverEvent = (evt.type == "mouseover");
 if (isMouseOverEvent && isMouseOverExecuted || !isMouseOverEvent && !isMouseOverExecuted)
  return;
 var source = evt.relatedTarget || (isMouseOverEvent ? evt.srcElement : evt.toElement);
 if (!_aspxGetIsParent(element, source)) {
  element.dxMouseOverExecuted = isMouseOverEvent;
  if(isMouseOverEvent)
   onMouseOverHandler(element);
  else
   onMouseOutHandler(element);
 }
 else if (isMouseOverEvent && !isMouseOverExecuted) {
  element.dxMouseOverExecuted = true;
  onMouseOverHandler(element);
 }
}
function _aspxCreateClass(parentClass, properties) {
 var ret = function() {
  if (ret.preparing) 
   return delete(ret.preparing);
  if (ret.constr) {
   this.constructor = ret;
   ret.constr.apply(this, arguments);
  }
 }
 ret.prototype = {};
 if(parentClass) {
  parentClass.preparing = true;
  ret.prototype = new parentClass;
  ret.prototype.constructor = parentClass;
  ret.constr = parentClass;
 }
 if(properties) {
  var constructorName = "constructor";
  for(var name in properties){
   if (name != constructorName) 
    ret.prototype[name] = properties[name];
  }
  if (properties[constructorName] && properties[constructorName] != Object)
   ret.constr = properties[constructorName];
 }
 return ret;
}
function _aspxGetAttribute(obj, attrName){
 if(obj.getAttribute)
  return obj.getAttribute(attrName);
 else if(obj.getPropertyValue)
  return obj.getPropertyValue(attrName);
 return null;
}
function _aspxSetAttribute(obj, attrName, value){
 if(obj.setAttribute) {
  obj.setAttribute(attrName, value);
  if(__aspxIE && attrName.toLowerCase() === "tabindex")
   window.setTimeout(function() {
    if(obj && obj.parentNode)
     obj.parentNode.replaceChild(obj, obj); 
   }, 0);
 }
 else if(obj.setProperty)
  obj.setProperty(attrName, value, "");
}
function _aspxRemoveAttribute(obj, attrName){
 if(obj.removeAttribute)
  obj.removeAttribute(attrName);
 else if(obj.removeProperty)
  obj.removeProperty(attrName);
}
function _aspxIsExistsAttribute(obj, attrName){
 var value = _aspxGetAttribute(obj, attrName);
 return (value != null) && (value !== "");
}
function _aspxSetOrRemoveAttribute(obj, attrName, value) {
 if (!value)
  _aspxRemoveAttribute(obj, attrName);
 else
  _aspxSetAttribute(obj, attrName, value);
}
function _aspxSaveAttribute(obj, attrName, savedObj, savedAttrName){
 if(!_aspxIsExistsAttribute(savedObj, savedAttrName)){
  var oldValue = _aspxIsExistsAttribute(obj, attrName) ? _aspxGetAttribute(obj, attrName) : __aspxEmptyAttributeValue;
  _aspxSetAttribute(savedObj, savedAttrName, oldValue);
 }
}
function _aspxSaveStyleAttribute(obj, attrName){
 _aspxSaveAttribute(obj.style, attrName, obj, "saved" + attrName);
}
function _aspxChangeAttributeExtended(obj, attrName, savedObj, savedAttrName, newValue){
 _aspxSaveAttribute(obj, attrName, savedObj, savedAttrName);
 _aspxSetAttribute(obj, attrName, newValue);
}
function _aspxChangeAttribute(obj, attrName, newValue){
 _aspxChangeAttributeExtended(obj, attrName, obj, "saved" + attrName, newValue);
}
function _aspxChangeStyleAttribute(obj, attrName, newValue){
 _aspxChangeAttributeExtended(obj.style, attrName, obj, "saved" + attrName, newValue);
}
function _aspxResetAttributeExtended(obj, attrName, savedObj, savedAttrName){
 _aspxSaveAttribute(obj, attrName, savedObj, savedAttrName);
 _aspxSetAttribute(obj, attrName, "");
 _aspxRemoveAttribute(obj, attrName);
}
function _aspxResetAttribute(obj, attrName){
 _aspxResetAttributeExtended(obj, attrName, obj, "saved" + attrName);
}
function _aspxResetStyleAttribute(obj, attrName){
 _aspxResetAttributeExtended(obj.style, attrName, obj, "saved" + attrName);
}
function _aspxRestoreAttributeExtended(obj, attrName, savedObj, savedAttrName){
 if(_aspxIsExistsAttribute(savedObj, savedAttrName)){
  var oldValue = _aspxGetAttribute(savedObj, savedAttrName);
  if(oldValue != __aspxEmptyAttributeValue)
   _aspxSetAttribute(obj, attrName, oldValue);
  else
   _aspxRemoveAttribute(obj, attrName);
  _aspxRemoveAttribute(savedObj, savedAttrName);
  return true;
 }
 return false;
}
function _aspxRestoreAttribute(obj, attrName){
 return _aspxRestoreAttributeExtended(obj, attrName, obj, "saved" + attrName);
}
function _aspxRestoreStyleAttribute(obj, attrName){
 return _aspxRestoreAttributeExtended(obj.style, attrName, obj, "saved" + attrName);
}
function _aspxCopyAllAttributes(sourceElem, destElement) {
 var attrs = sourceElem.attributes;
 for (var n = 0; n < attrs.length; n++) {
  var attr = attrs[n];
  if (attr.specified) {
   var attrName = attr.nodeName;
   var attrValue = sourceElem.getAttribute(attrName, 2);
   if (attrValue == null)
    attrValue = attr.nodeValue;
   destElement.setAttribute(attrName, attrValue, 0); 
  }
 }
 if (sourceElem.style.cssText !== '')
  destElement.style.cssText = sourceElem.style.cssText;
}
function _aspxRemoveAllAttributes(element, excludedAttributes) {
 var excludedAttributesHashTable = {};
 if (excludedAttributes)
  excludedAttributesHashTable = _aspxCreateHashTableFromArray(excludedAttributes);
 if (element.attributes) {
  var attrArray = element.attributes;
  for (var i = 0; i < attrArray.length; i++) {
   var attrName = attrArray[i].name;
   if (!_aspxIsExists(excludedAttributesHashTable[attrName.toLowerCase()])) {
    try {
     attrArray.removeNamedItem(attrName);
    } catch (e) { }
   }
  }
 }
}
function _aspxRemoveStyleAttribute(element, attrName) {
 if (element.style) {
  if (__aspxFirefox && element.style[attrName]) 
   element.style[attrName] = "";
  if (element.style.removeAttribute && element.style.removeAttribute != "")
   element.style.removeAttribute(attrName);
  else if (element.style.removeProperty && element.style.removeProperty != "")
   element.style.removeProperty(attrName);
 }
}
function _aspxRemoveAllStyles(element) {
 if (element.style) {
  for(var key in element.style)
   _aspxRemoveStyleAttribute(element, key);
    _aspxRemoveAttribute(element, "style");
 }
}
function _aspxChangeTabIndexAttribute(element){
 var attribute = _aspxGetTabIndexAttribute(); 
 if(_aspxGetAttribute(element, attribute) != -1)
    _aspxChangeAttribute(element, attribute, -1);
}
function _aspxSaveTabIndexAttributeAndReset(element) {
 var attribute = _aspxGetTabIndexAttribute();
 _aspxSaveAttribute(element, attribute, element, "saved" + attribute);
 _aspxSetAttribute(element, attribute, -1);
}
function _aspxRestoreTabIndexAttribute(element){
 var attribute = _aspxGetTabIndexAttribute();
 if(_aspxIsExistsAttribute(element, attribute)) {
  if(_aspxGetAttribute(element, attribute) == -1) {
   if(_aspxIsExistsAttribute(element, "saved" + attribute)){
    var oldValue = _aspxGetAttribute(element, "saved" + attribute);
    if(oldValue != __aspxEmptyAttributeValue)
     _aspxSetAttribute(element, attribute, oldValue);
    else {
     if(__aspxWebKitFamily) 
      _aspxSetAttribute(element, attribute, 0); 
     _aspxRemoveAttribute(element, attribute);   
    }
    _aspxRemoveAttribute(element, "saved" + attribute); 
   }
  }
 }
}
function _aspxGetTabIndexAttribute(){
 return __aspxIE  ? "tabIndex" : "tabindex";
}
function _aspxChangeAttributesMethod(enabled){
 return enabled ? _aspxRestoreAttribute : _aspxResetAttribute;
}
function _aspxInitiallyChangeAttributesMethod(enabled){
 return enabled ? _aspxChangeAttribute : _aspxResetAttribute;
}
function _aspxChangeStyleAttributesMethod(enabled){
 return enabled ? _aspxRestoreStyleAttribute : _aspxResetStyleAttribute;
}
function _aspxInitiallyChangeStyleAttributesMethod(enabled){
 return enabled ? _aspxChangeStyleAttribute : _aspxResetStyleAttribute;
}
function _aspxChangeEventsMethod(enabled){
 return enabled ? _aspxAttachEventToElement : _aspxDetachEventFromElement;
}
function _aspxChangeDocumentEventsMethod(enabled){
 return enabled ? _aspxAttachEventToDocument : _aspxDetachEventFromDocument;
}
function _aspxTrimStart(str) { 
 return _aspxTrimImpl(str, true);
}
function _aspxTrimEnd(str) { 
 return _aspxTrimImpl(str, false, true);
}
function _aspxTrim(str) { 
 return _aspxTrimImpl(str, true, true); 
}
function _aspxTrimImpl(source, trimStart, trimEnd) {
 var len = source.length;
 if(!len)
  return source;
 if(len < 0xBABA1) { 
  var result = source;
  if(trimStart) {
   result = result.replace(/^\s+/, "");
  }
  if(trimEnd) {
   result = result.replace(/\s+$/, "");
  }
  return result;  
 } else {
  var start = 0;
  if(trimEnd) {   
   while(len > 0 && ASPxWhiteSpaces[source.charCodeAt(len - 1)]) {
    len--;
   }
  }
  if(trimStart && len > 0) {
   while(start < len && ASPxWhiteSpaces[source.charCodeAt(start)]) { 
    start++; 
   }   
  }
  return source.substring(start, len);
 }
}
function _aspxInsert(str, subStr, index) { 
 var leftText = str.slice(0, index);
 var rightText = str.slice(index);
 return leftText + subStr + rightText;
}
function _aspxInsertEx(str, subStr, startIndex, endIndex) { 
 var leftText = str.slice(0, startIndex);
 var rightText = str.slice(endIndex);
 return leftText + subStr + rightText;
}
function _aspxNavigateUrl(url, target) {
 var javascriptPrefix = "javascript:";
 if(url == "")
  return;
 else if(url.indexOf(javascriptPrefix) != -1) 
  eval(url.substr(javascriptPrefix.length));
 else {
  try{
   if(target != "")
    _aspxNavigateTo(url, target);
   else
    location.href = url;
  }
  catch(e){
  }
 }
}
function _aspxNavigateByLink(linkElement) {
 _aspxNavigateUrl(_aspxGetAttribute(linkElement, "href"), linkElement.target);
} 
function _aspxNavigateTo(url, target) {
 var lowerCaseTarget = target.toLowerCase();
 if("_top" == lowerCaseTarget)
  top.location.href = url;
 else if("_self" == lowerCaseTarget)
  location.href = url;
 else if("_search" == lowerCaseTarget)
  window.open(url, '_blank');
 else if("_media" == lowerCaseTarget)
  window.open(url, '_blank');
 else if("_parent" == lowerCaseTarget)
  window.parent.location.href = url;
 else if("_blank" == lowerCaseTarget)
  window.open(url, '_blank');
 else {
  var frame = _aspxGetFrame(top.frames, target);
  if(frame != null)
   frame.location.href = url;
  else
   window.open(url, '_blank');
 }
}
function _aspxGetFrame(frames, name) {
 if(frames[name])
  return frames[name];
 for(var i = 0; i < frames.length; i++) {
  try {
   var frame = frames[i];
   if(frame.name == name) 
    return frame; 
   frame = _aspxGetFrame(frame.frames, name);
   if(frame != null)   
    return frame; 
  } catch(e) {
  } 
 }
 return null;
}
function _aspxToHex(d) {
 return (d < 16) ? ("0" + d.toString(16)) : d.toString(16);
}
function _aspxColorToHexadecimal(colorValue) {
 if (typeof(colorValue) == "number") {
  var r = colorValue & 0xFF;
  var g = (colorValue >> 8) & 0xFF;
  var b = (colorValue >> 16) & 0xFF;
  return "#" + _aspxToHex(r) + _aspxToHex(g) + _aspxToHex(b);
 }
 if (colorValue && (colorValue.substr(0, 3).toLowerCase() == "rgb")) {
  var re = /rgb\s*\(\s*([0-9]+)\s*,\s*([0-9]+)\s*,\s*([0-9]+)\s*\)/;
  var regResult = colorValue.toLowerCase().match(re);
  if (regResult) {
   var r = parseInt(regResult[1]);
   var g = parseInt(regResult[2]);
   var b = parseInt(regResult[3]);
   return "#" + _aspxToHex(r) + _aspxToHex(g) + _aspxToHex(b);
  }
  return null;
 } 
 if (colorValue && (colorValue.charAt(0) == "#"))
  return colorValue;
 return null;
}
function _aspxFormatCallbackArg(prefix, arg) {
 if(prefix == null && arg == null)
  return ""; 
 if(prefix == null) prefix = "";
 if(arg == null) arg = "";
 if(arg != null && !_aspxIsExists(arg.length) && _aspxIsExists(arg.value))
  arg = arg.value;
 arg = arg.toString();
 return [prefix, '|', arg.length, '|' , arg].join('');
}
function _aspxFormatCallbackArgs(callbackData) {
 var sb = [ ];
 for(var i = 0; i < callbackData.length; i++)
  sb.push(_aspxFormatCallbackArg(callbackData[i][0], callbackData[i][1]));
 return sb.join("");
}
function _aspxIsValidElement(element) {
 if(!element) 
  return false;
 if(!(__aspxFirefox && __aspxBrowserVersion < 4)) {
  if(element.ownerDocument && element.ownerDocument.body.compareDocumentPosition)
   return element.ownerDocument.body.compareDocumentPosition(element) % 2 === 0;
 }
 if(!__aspxOpera && !(__aspxIE && __aspxBrowserVersion < 9) && element.offsetParent && element.parentNode.tagName)
  return true;
 while(element != null){
  if(element.tagName == "BODY")
   return true;
  element = element.parentNode;
 }
 return false;
}
function _aspxIsValidElements(elements) {
 if (!elements)
  return false; 
 for(var i = 0; i < elements.length; i++) {
  if(elements[i] && !_aspxIsValidElement(elements[i]))
   return false;
 }
 return true;
}
function _aspxIsExistsElement(element) {
 return element && _aspxIsValidElement(element);
}
function _aspxFindParentByTestFunc(element, testFunc){
 if (!testFunc) return null;
 while(element != null && element.tagName != "BODY"){
  if(testFunc(element))
   return element;
  element = element.parentNode;
 }
 return null;
}
function _aspxCorrectJSFloatNumber(number) {
 var ret = 21; 
 var numString = number.toPrecision(21);
 numString = numString.replace("-", ""); 
 var integerDigitsCount = numString.indexOf(__aspxPossibleNumberDecimalSeparators[0]);
 if (integerDigitsCount < 0)
  integerDigitsCount = numString.indexOf(__aspxPossibleNumberDecimalSeparators[1]);
 var floatDigitsCount = numString.length - integerDigitsCount - 1;
 if(floatDigitsCount < 10)
  return number;
 if (integerDigitsCount > 0) {
  ret = integerDigitsCount + 12;
 }
 var toPrecisionNumber = Math.min(ret, 21);
 var newValueString = number.toPrecision(toPrecisionNumber);
 return parseFloat(newValueString, 10);
}
function _aspxToJson(param){
 var paramType = typeof(param);
 if((paramType == "undefined") || (param == null))
  return null;
 if((paramType == "object") && (typeof(param.__toJson) == "function"))
  return param.__toJson();
 if((paramType == "number") || (paramType == "boolean"))
  return param;
 if(param.constructor == Date)
  return _aspxDateToJson(param);
 if(paramType == "string") {
  var result = param.replace(/\\/g, "\\\\");
  result = result.replace(/"/g, "\\\"");
  result = result.replace(/\n/g, "\\n");
  result = result.replace(/</g, "\\u003c");
  result = result.replace(/>/g, "\\u003e");
  return "\"" + result + "\"";
 }
 if(param.constructor == Array){
  var values = [];
  for(var i = 0; i < param.length; i++) {
   var jsonValue = _aspxToJson(param[i]);
   if(jsonValue === null)
    jsonValue = "null";
   values.push(jsonValue);
  }
  return "[" + values.join(",") + "]";
 }
 var exceptKeys = {};
 if(ASPxIdent.IsArray(param.__toJsonExceptKeys))
  exceptKeys = _aspxCreateHashTableFromArray(param.__toJsonExceptKeys);
 exceptKeys["__toJsonExceptKeys"] = 1;
 var values = [];
 for(var key in param){
  if(_aspxIsFunction(param[key]))
   continue;
  if(exceptKeys[key] == 1)
   continue;
  values.push(_aspxToJson(key) + ":" + _aspxToJson(param[key]));
 }
 return "{" + values.join(",") + "}";
}
function _aspxDateToJson(date) {
 var result = [ 
  date.getFullYear(),
  date.getMonth(),
  date.getDate()
 ];
 var time = {
  h: date.getHours(),
  m: date.getMinutes(),
  s: date.getSeconds(),
  ms: date.getMilliseconds()
 };
 if(time.h || time.m || time.s || time.ms)
  result.push(time.h);
 if(time.m || time.s || time.ms)
  result.push(time.m);
 if(time.s || time.ms)
  result.push(time.s);
 if(time.ms)
  result.push(time.ms);
 return "new Date(" + result.join() + ")";
}
function _aspxEmulateDocumentOnMouseDown(evt) {
 _aspxEmulateOnMouseDown(document, evt);
}
function _aspxEmulateOnMouseDown(element, evt) {
 if(__aspxIE && __aspxBrowserVersion < 9)
  element.fireEvent("onmousedown", evt);
 else if(!__aspxWebKitFamily){
  var emulatedEvt = document.createEvent("MouseEvents");
  emulatedEvt.initMouseEvent("mousedown", true, true, window, 0, evt.screenX, evt.screenY, 
   evt.clientX, evt.clientY, evt.ctrlKey, evt.altKey, evt.shiftKey, false, 0, null);
  element.dispatchEvent(emulatedEvt);
 }
}
function _aspxCreateHtmlElementFromString(str) {
 var dummy = document.createElement("DIV");
 dummy.innerHTML = str;
 return dummy.firstChild;
}
function _aspxDelayedFunctionCall(object, functionName) {
 var callTimerIdPropertyName = "delayed" + functionName + "CallTimerId";
 var additionalCallRequiredPropertyName = "delayed" + functionName + "AdditionalCallRequired";
 if(!object[callTimerIdPropertyName] || object[callTimerIdPropertyName] == -1) {
  var timeoutFunction = function() {
   object[functionName]();
   object[callTimerIdPropertyName] = _aspxClearTimer(object[callTimerIdPropertyName]);
   if(object[additionalCallRequiredPropertyName]) {
    object[additionalCallRequiredPropertyName] = false;
    object[callTimerIdPropertyName] = _aspxSetTimeout(timeoutFunction, 0);
   }
  };
  object[callTimerIdPropertyName] = _aspxSetTimeout(timeoutFunction, 0);
 }
 else
  object[additionalCallRequiredPropertyName] = true;
}
function _aspxRestoreElementOriginalWidth(element) {
 if(!_aspxIsExistsElement(element)) 
  return;
 element.style.width = element.dxOrigWidth = _aspxGetElementOriginalWidth(element);
}
function _aspxGetElementOriginalWidth(element) {
 if(!_aspxIsExistsElement(element)) 
  return null;
 var width;
 if(!_aspxIsExists(element.dxOrigWidth)) {
   width = String(element.style.width).length > 0
  ? element.style.width
  : element.offsetWidth + "px";
 } else {
  width = element.dxOrigWidth;
 }
 return width;
}
function _aspxDropElementOriginalWidth(element) {
 if(_aspxIsExists(element.dxOrigWidth))
  element.dxOrigWidth = null;
}
function _aspxPrepareStringForFilter(s){
 s = s.toLowerCase();
 if(__aspxWebKitFamily) {
  return s.replace(new RegExp(__aspxGreekSLFSigmaChar, "g"), __aspxGreekSLSigmaChar);
 }
 return s;
}
function _aspxGetObjectKeys(obj) {
 if(!obj) return [ ];
 if(Object.keys)
  return Object.keys(obj);
 var keys = [ ];
 for(var key in obj) {
  if(obj.hasOwnProperty(key))
   keys.push(key);
 }
 return keys;
}
Function.prototype.aspxBind = function(scope) {
 var func = this;
 return function() {
  return func.apply(scope, arguments);
 };
};
ASPxScrollBarMode = { Hidden: 0, Visible: 1, Auto: 2 };
ASPxColumnResizeMode = { None: 0, Control: 1, NextColumn: 2 };
ASPxSimpleHiddenField = { };
ASPxSimpleHiddenField.Separator = "|";
ASPxSimpleHiddenField.GetBag = function(key, input) {
 if(!key || !input)
  return { "keyIndex": -1 };
 var keyString = key.toString();
 if(keyString.length == 0)
  return { "keyIndex": -1 };
 var value = input.value;
 var keyIndex = value.indexOf(keyString);
 if(keyIndex < 0)
  return { "keyIndex": -1 };
 var sepIndex = value.indexOf(ASPxSimpleHiddenField.Separator, keyIndex + keyString.length);
 var count = Number(value.slice(keyIndex + keyString.length, sepIndex));
 return { 
  "keyIndex": keyIndex,
  "valueIndex": sepIndex + 1,
  "count": count,
  "inputValue": value
 };
};
ASPxSimpleHiddenField.Get = function(key, input) {
 var bag = ASPxSimpleHiddenField.GetBag(key, input);
 if(bag.keyIndex < 0) return;
 return bag.inputValue.substr(bag.valueIndex, bag.count);
};
ASPxSimpleHiddenField.Set = function(key, value, input) {
 var value = _aspxIsExists(value) ? value.toString() : "";
 var newValue = key.toString() + value.length + ASPxSimpleHiddenField.Separator + value;
 var bag = ASPxSimpleHiddenField.GetBag(key, input);
 if(bag.keyIndex < 0) {
  input.value += newValue;
  return;
 }
 var prevValue = bag.inputValue.slice(bag.keyIndex, bag.valueIndex + bag.count);
 input.value = bag.inputValue.replace(prevValue, newValue);
};
(function(){
 window.ASPxMouseScroller = window.ASPxMouseScroller || { };
 ASPxMouseScroller.MinimumOffset = 10;
 ASPxMouseScroller.Create = function(getElement, getScrollXElement, getScrollYElement, needPreventScrolling, vertRecursive, onMouseDown, onMouseMove, onMouseUp) {
  var element = getElement();
  if(!element) 
   return;
  if(!element.dxMouseScroller)
   element.dxMouseScroller = new ASPxMouseScroller.Extender(getElement, getScrollXElement, getScrollYElement, needPreventScrolling, vertRecursive, onMouseDown, onMouseMove, onMouseUp);
  return element.dxMouseScroller;
 }
 ASPxMouseScroller.Extender = function(getElement, getScrollXElement, getScrollYElement, needPreventScrolling, vertRecursive, onMouseDown, onMouseMove, onMouseUp) {
  this.getElement = getElement;
  this.getScrollXElement = getScrollXElement;
  this.getScrollYElement = getScrollYElement;
  this.needPreventScrolling = needPreventScrolling;
  this.vertRecursive = !!vertRecursive;
  this.createHandlers(onMouseDown || function(){ }, onMouseMove || function(){ }, onMouseUp || function(){ });
  this.update()
 };
 ASPxMouseScroller.Extender.prototype = {
  update: function() {
   if(this.element)
    _aspxDetachEventFromElement(this.element, ASPxClientTouchUI.touchMouseDownEventName, this.mouseDownHandler);
   this.element = this.getElement();
   _aspxAttachEventToElement(this.element, ASPxClientTouchUI.touchMouseDownEventName, this.mouseDownHandler);  
   _aspxAttachEventToElement(this.element, "click", this.mouseClickHandler);   
   if(__aspxMSTouchUI && this.element.className.indexOf(ASPxClientTouchUI.msTouchDraggableClassName) < 0)
    this.element.className += " " + ASPxClientTouchUI.msTouchDraggableClassName;
   this.scrollXElement = this.getScrollXElement();
   this.scrollYElement = this.getScrollYElement();
  },
  createHandlers: function(onMouseDown, onMouseMove, onMouseUp) {
   this.onMouseDown = onMouseDown;
   this.onMouseMove = onMouseMove;
   this.onMouseUp = onMouseUp;
   this.mouseDownHandler = function(e) { 
    if(this.needPreventScrolling && this.needPreventScrolling(_aspxGetEventSource(e)))
     return;
    this.scrollableTreeLine = this.GetScrollableElements();
    this.firstX = this.prevX = _aspxGetEventX(e);
    this.firstY = this.prevY = this.GetEventY(e);
    _aspxAttachEventToDocument(ASPxClientTouchUI.touchMouseMoveEventName, this.mouseMoveHandler);
    _aspxAttachEventToDocument(ASPxClientTouchUI.touchMouseUpEventName, this.mouseUpHandler);
    this.onMouseDown(e);
   }.aspxBind(this);
   this.mouseMoveHandler = function(e) {
    if(ASPxClientTouchUI.isGesture)
     return;
    var x = _aspxGetEventX(e);
    var y = this.GetEventY(e);
    var xDiff = this.prevX - x;
    var yDiff = this.prevY - y;
    if(this.vertRecursive) {
     var isTopDirection = yDiff < 0;
     this.scrollYElement = this.GetElementForVertScrolling(isTopDirection, this.prevIsTopDirection, this.scrollYElement);
     this.prevIsTopDirection = isTopDirection;
    }
    if(this.scrollXElement && xDiff != 0)
     this.scrollXElement.scrollLeft += xDiff;
    if(this.scrollYElement && yDiff != 0)
     this.scrollYElement.scrollTop += yDiff;
    this.prevX = x;
    this.prevY = y;
    e.preventDefault();
    this.onMouseMove(e);
   }.aspxBind(this);
   this.mouseUpHandler = function(e) {
    _aspxDetachEventFromDocument(ASPxClientTouchUI.touchMouseMoveEventName, this.mouseMoveHandler);
    _aspxDetachEventFromDocument(ASPxClientTouchUI.touchMouseUpEventName, this.mouseUpHandler);
    this.scrollableTreeLine = [ ];
    this.prevIsTopDirection = null;
    this.onMouseUp(e);
   }.aspxBind(this);
   this.mouseClickHandler = function(e){
    if(this.needPreventScrolling && this.needPreventScrolling(_aspxGetEventSource(e)))
     return;
    var xDiff = this.firstX - _aspxGetEventX(e);
    var yDiff = this.firstY - _aspxGetEventY(e);
    if(xDiff > ASPxMouseScroller.MinimumOffset || yDiff > ASPxMouseScroller.MinimumOffset)
     return _aspxPreventEventAndBubble(e);
   }.aspxBind(this);
  },
  GetEventY: function(e) {
   return _aspxGetEventY(e) - _aspxGetDocumentScrollTop();
  },
  GetScrollableElements: function() {
   var result = [ ];
   var el = this.element;
   while(el && el != document && this.vertRecursive) {
    if(this.CanVertScroll(el) || el.tagName == "HTML")
     result.push(el);
    el = el.parentNode;
   }
   return result;
  },
  CanVertScroll: function(element) {
   var style = _aspxGetCurrentStyle(element);
   return style.overflow == "scroll" || style.overflow == "auto" || style.overflowY == "scroll" || style.overflowY == "auto";
  },
  GetElementForVertScrolling: function(currentIsTop, prevIsTop, prevElement) {
   if(prevElement && currentIsTop === prevIsTop && this.GetVertScrollExcess(prevElement, currentIsTop) > 0)
    return prevElement;
   for(var i = 0; i < this.scrollableTreeLine.length; i++) {
    var element = this.scrollableTreeLine[i];
    var excess = this.GetVertScrollExcess(element, currentIsTop);
    if(excess > 0)
     return element;
   }
   return null;
  },
  GetVertScrollExcess: function(element, isTop) {
   if(isTop)
    return element.scrollTop;
   return element.scrollHeight - element.clientHeight - element.scrollTop;
  }
 }
})();
function _aspxIsInteractiveControl(element, extremeParent) {
 return _aspxArrayIndexOf(["A", "INPUT", "SELECT", "OPTION", "TEXTAREA", "BUTTON", "IFRAME"], element.tagName) > -1;
}
ASPxClientUtils = {};
ASPxClientUtils.agent = __aspxUserAgent;
ASPxClientUtils.opera = __aspxOpera;
ASPxClientUtils.opera9 = __aspxOpera && __aspxBrowserMajorVersion == 9;
ASPxClientUtils.safari = __aspxSafari;
ASPxClientUtils.safari3 = __aspxSafari && __aspxBrowserMajorVersion == 3;
ASPxClientUtils.safariMacOS = __aspxSafari && __aspxMacOSPlatform;
ASPxClientUtils.chrome = __aspxChrome;
ASPxClientUtils.ie = __aspxIE;
;
ASPxClientUtils.ie7 = __aspxIE && __aspxBrowserMajorVersion == 7;
ASPxClientUtils.firefox = __aspxFirefox;
ASPxClientUtils.firefox3 = __aspxFirefox && __aspxBrowserMajorVersion == 3;
ASPxClientUtils.mozilla = __aspxMozilla;
ASPxClientUtils.netscape = __aspxNetscape;
ASPxClientUtils.browserVersion = __aspxBrowserVersion;
ASPxClientUtils.browserMajorVersion = __aspxBrowserMajorVersion;
ASPxClientUtils.macOSPlatform = __aspxMacOSPlatform;
ASPxClientUtils.windowsPlatform = __aspxWindowsPlatform;
ASPxClientUtils.webKitFamily = __aspxWebKitFamily;
ASPxClientUtils.netscapeFamily = __aspxNetscapeFamily;
ASPxClientUtils.touchUI = __aspxTouchUI;
ASPxClientUtils.webKitTouchUI = __aspxWebKitTouchUI;
ASPxClientUtils.msTouchUI = __aspxMSTouchUI;
ASPxClientUtils.iOSPlatform = __aspxMacOSMobilePlatform;
ASPxClientUtils.androidPlatform = __aspxAndroidMobilePlatform;
ASPxClientUtils.ArrayInsert = _aspxArrayInsert;
ASPxClientUtils.ArrayRemove = _aspxArrayRemove;
ASPxClientUtils.ArrayRemoveAt = _aspxArrayRemoveAt;
ASPxClientUtils.ArrayClear = _aspxArrayClear;
ASPxClientUtils.ArrayIndexOf = _aspxArrayIndexOf;
ASPxClientUtils.AttachEventToElement = _aspxAttachEventToElement;
ASPxClientUtils.DetachEventFromElement = _aspxDetachEventFromElement;
ASPxClientUtils.GetEventSource = _aspxGetEventSource;
ASPxClientUtils.GetEventX = _aspxGetEventX;
ASPxClientUtils.GetEventY = _aspxGetEventY;
ASPxClientUtils.GetKeyCode = _aspxGetKeyCode;
ASPxClientUtils.PreventEvent = _aspxPreventEvent;
ASPxClientUtils.PreventEventAndBubble = _aspxPreventEventAndBubble;
ASPxClientUtils.PreventDragStart = _aspxPreventDragStart;
ASPxClientUtils.ClearSelection = _aspxClearSelection;
ASPxClientUtils.IsExists = _aspxIsExists;
ASPxClientUtils.IsFunction = _aspxIsFunction;
ASPxClientUtils.GetAbsoluteX = _aspxGetAbsoluteX;
ASPxClientUtils.GetAbsoluteY = _aspxGetAbsoluteY;
ASPxClientUtils.SetAbsoluteX = _aspxSetAbsoluteX;
ASPxClientUtils.SetAbsoluteY = _aspxSetAbsoluteY;
ASPxClientUtils.GetDocumentScrollTop = _aspxGetDocumentScrollTop;
ASPxClientUtils.GetDocumentScrollLeft = _aspxGetDocumentScrollLeft;
ASPxClientUtils.GetDocumentClientWidth = _aspxGetDocumentClientWidth;
ASPxClientUtils.GetDocumentClientHeight = _aspxGetDocumentClientHeight;
ASPxClientUtils.GetIsParent = _aspxGetIsParent;
ASPxClientUtils.GetParentById = _aspxGetParentById;
ASPxClientUtils.GetParentByTagName = _aspxGetParentByTagName;
ASPxClientUtils.GetParentByClassName = _aspxGetParentByPartialClassName;
ASPxClientUtils.GetChildById = _aspxGetChildById;
ASPxClientUtils.GetChildByTagName = _aspxGetChildByTagName;
ASPxClientUtils.SetCookie = _aspxSetCookie;
ASPxClientUtils.GetCookie = _aspxGetCookie;
ASPxClientUtils.DeleteCookie = _aspxDelCookie;
ASPxClientUtils.GetShortcutCode = _aspxGetShortcutCode; 
ASPxClientUtils.GetShortcutCodeByEvent = _aspxGetShortcutCodeByEvent;
ASPxClientUtils.StringToShortcutCode = _aspxParseShortcutString;
ASPxClientUtils.Trim = _aspxTrim; 
ASPxClientUtils.TrimStart = _aspxTrimStart;
ASPxClientUtils.TrimEnd = _aspxTrimEnd;

