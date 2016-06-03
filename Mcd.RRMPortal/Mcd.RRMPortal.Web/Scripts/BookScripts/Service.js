app.service("crudAJService", function ($http) {

    //get All Books
    this.getBooks = function () {
        return $http.get("Book/GetAllBooks"); //Web-APi "http://localhost:59095/api/Values"
    };

    // get Book by bookId
    this.getBook = function (bookId) {
        var response = $http({
            method: "post",
            url: "Book/GetBookById",
            params: {
                id: JSON.stringify(bookId)
            }
        });
        return response;
    }

    // Update Book 
    this.updateBook = function (book) {
        var response = $http({
            method: "post",
            url: "Book/UpdateBook",
            data: JSON.stringify(book),
            dataType: "json"
        });
        return response;
    }

    // Add Book
    this.AddBook = function (book) {
        var response = $http({
            method: "post",
            url: "Book/AddBook",  //Web Api "http://localhost:59095/api/Values"
            data: JSON.stringify(book),
            dataType: "json"
        });
        return response;
    }

    //Delete Book
    this.DeleteBook = function (bookId) {
        var response = $http({
            method: "post",
            url: "Book/DeleteBook",
            params: {
                bookId: JSON.stringify(bookId)
            }
        });
        return response;
    }
});