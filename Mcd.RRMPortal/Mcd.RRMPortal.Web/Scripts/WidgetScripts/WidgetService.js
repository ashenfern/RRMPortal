app.service("widgetService", function ($http) {

    //get All Books
    this.getStoreProfiles = function () {
        return $http.get("Widget/GetStoreProfiles");
    };
});
