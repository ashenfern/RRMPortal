app.controller("widgetCtrl", function ($scope, widgetService) {
    $scope.divBook = false;
    GetAllBooks();
    //To Get all book records  
    function GetAllBooks() {
        debugger;
        var getBookData = widgetService.getBooks();
        getBookData.then(function (book) {
            $scope.books = book.data;
        }, function () {
            alert('Error in getting book records');
        });
    }
});