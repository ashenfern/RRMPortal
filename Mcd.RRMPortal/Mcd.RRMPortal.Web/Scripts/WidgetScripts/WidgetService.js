app.service("widgetService", function ($http) {

    //get All Books
    this.getBooks = function () {
        return $http.get("Book/GetAllBooks");
    };
});
