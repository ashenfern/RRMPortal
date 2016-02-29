Type.registerNamespace('Mcd.RSMSP.WebApp.WebServices');
Mcd.RSMSP.WebApp.WebServices.LoggingWebService=function() {
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.initializeBase(this);
this._timeout = 0;
this._userContext = null;
this._succeeded = null;
this._failed = null;
}
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.prototype={
_get_path:function() {
 var p = this.get_path();
 if (p) return p;
 else return Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.get_path();},
ClientSideLogging:function(logSource,buttonName,userName,succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'ClientSideLogging',false,{logSource:logSource,buttonName:buttonName,userName:userName},succeededCallback,failedCallback,userContext); },
JsErrorLogging:function(source,description,number,succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'JsErrorLogging',false,{source:source,description:description,number:number},succeededCallback,failedCallback,userContext); },
LogPrmServerError:function(errType,errDesc,errDetails,succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'LogPrmServerError',false,{errType:errType,errDesc:errDesc,errDetails:errDetails},succeededCallback,failedCallback,userContext); },
GetServerTime:function(succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'GetServerTime',false,{},succeededCallback,failedCallback,userContext); }}
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.registerClass('Mcd.RSMSP.WebApp.WebServices.LoggingWebService',Sys.Net.WebServiceProxy);
Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance = new Mcd.RSMSP.WebApp.WebServices.LoggingWebService();
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.set_path = function(value) { Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.set_path(value); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.get_path = function() { return Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.get_path(); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.set_timeout = function(value) { Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.set_timeout(value); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.get_timeout = function() { return Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.get_timeout(); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.set_defaultUserContext = function(value) { Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.set_defaultUserContext(value); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.get_defaultUserContext = function() { return Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.get_defaultUserContext(); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.set_defaultSucceededCallback = function(value) { Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.set_defaultSucceededCallback(value); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.get_defaultSucceededCallback = function() { return Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.get_defaultSucceededCallback(); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.set_defaultFailedCallback = function(value) { Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.set_defaultFailedCallback(value); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.get_defaultFailedCallback = function() { return Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.get_defaultFailedCallback(); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.set_enableJsonp = function(value) { Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.set_enableJsonp(value); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.get_enableJsonp = function() { return Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.get_enableJsonp(); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.set_jsonpCallbackParameter = function(value) { Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.set_jsonpCallbackParameter(value); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.get_jsonpCallbackParameter = function() { return Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.get_jsonpCallbackParameter(); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.set_path("/WebServices/LoggingWebService.asmx");
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.ClientSideLogging= function(logSource,buttonName,userName,onSuccess,onFailed,userContext) {Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.ClientSideLogging(logSource,buttonName,userName,onSuccess,onFailed,userContext); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.JsErrorLogging= function(source,description,number,onSuccess,onFailed,userContext) {Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.JsErrorLogging(source,description,number,onSuccess,onFailed,userContext); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.LogPrmServerError= function(errType,errDesc,errDetails,onSuccess,onFailed,userContext) {Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.LogPrmServerError(errType,errDesc,errDetails,onSuccess,onFailed,userContext); }
Mcd.RSMSP.WebApp.WebServices.LoggingWebService.GetServerTime= function(onSuccess,onFailed,userContext) {Mcd.RSMSP.WebApp.WebServices.LoggingWebService._staticInstance.GetServerTime(onSuccess,onFailed,userContext); }
