app.controller("widgetCtrl", function ($scope, widgetService) {
    $scope.divBook = false;
    GetAllStoreProfiles();
    //To Get all store profile records  
    function GetAllStoreProfiles() {
        debugger;
        var getStoreProfileData = widgetService.getStoreProfiles();
        getStoreProfileData.then(function (storeProfile) {
            $scope.storeProfiles = storeProfile.data;
        }, function () {
            alert('Error in getting Store Profiles');
        });
    }
});