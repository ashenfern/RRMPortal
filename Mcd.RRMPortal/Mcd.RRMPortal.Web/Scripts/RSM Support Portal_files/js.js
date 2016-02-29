Type.registerNamespace('Mcd.RSMSP.WebApp.WebServices');
Mcd.RSMSP.WebApp.WebServices.LogoutService=function() {
Mcd.RSMSP.WebApp.WebServices.LogoutService.initializeBase(this);
this._timeout = 0;
this._userContext = null;
this._succeeded = null;
this._failed = null;
}
Mcd.RSMSP.WebApp.WebServices.LogoutService.prototype={
_get_path:function() {
 var p = this.get_path();
 if (p) return p;
 else return Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.get_path();},
LogoutUser:function(succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'LogoutUser',false,{},succeededCallback,failedCallback,userContext); }}
Mcd.RSMSP.WebApp.WebServices.LogoutService.registerClass('Mcd.RSMSP.WebApp.WebServices.LogoutService',Sys.Net.WebServiceProxy);
Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance = new Mcd.RSMSP.WebApp.WebServices.LogoutService();
Mcd.RSMSP.WebApp.WebServices.LogoutService.set_path = function(value) { Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.set_path(value); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.get_path = function() { return Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.get_path(); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.set_timeout = function(value) { Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.set_timeout(value); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.get_timeout = function() { return Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.get_timeout(); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.set_defaultUserContext = function(value) { Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.set_defaultUserContext(value); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.get_defaultUserContext = function() { return Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.get_defaultUserContext(); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.set_defaultSucceededCallback = function(value) { Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.set_defaultSucceededCallback(value); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.get_defaultSucceededCallback = function() { return Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.get_defaultSucceededCallback(); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.set_defaultFailedCallback = function(value) { Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.set_defaultFailedCallback(value); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.get_defaultFailedCallback = function() { return Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.get_defaultFailedCallback(); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.set_enableJsonp = function(value) { Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.set_enableJsonp(value); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.get_enableJsonp = function() { return Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.get_enableJsonp(); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.set_jsonpCallbackParameter = function(value) { Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.set_jsonpCallbackParameter(value); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.get_jsonpCallbackParameter = function() { return Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.get_jsonpCallbackParameter(); }
Mcd.RSMSP.WebApp.WebServices.LogoutService.set_path("/WebServices/LogoutService.asmx");
Mcd.RSMSP.WebApp.WebServices.LogoutService.LogoutUser= function(onSuccess,onFailed,userContext) {Mcd.RSMSP.WebApp.WebServices.LogoutService._staticInstance.LogoutUser(onSuccess,onFailed,userContext); }
