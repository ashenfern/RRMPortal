using Mcd.RRMPortal.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mcd.RRMPortal.Web.Controllers
{
    public class BookController : Controller
    {
        // GET: Book
        public ActionResult Index()
        {
            return View();
        }

        // GET: All books
        public JsonResult GetAllBooks()
        {
            using (BookDBEntities contextObj = new BookDBEntities())
            {
                var bookList = contextObj.Book.ToList();
                return Json(bookList, JsonRequestBehavior.AllowGet);
            }
        }
        //GET: Book by Id
        public JsonResult GetBookById(string id)
        {
            using (BookDBEntities contextObj = new BookDBEntities())
            {
                var bookId = Convert.ToInt32(id);
                var getBookById = contextObj.Book.Find(bookId);
                return Json(getBookById, JsonRequestBehavior.AllowGet);
            }
        }
        //Update Book
        public string UpdateBook(Book book)
        {
            if (book != null)
            {
                using (BookDBEntities contextObj = new BookDBEntities())
                {
                    int bookId = Convert.ToInt32(book.Id);
                    Book _book = contextObj.Book.Where(b => b.Id == bookId).FirstOrDefault();
                    _book.Title = book.Title;
                    _book.Author = book.Author;
                    _book.Publisher = book.Publisher;
                    _book.Isbn = book.Isbn;
                    contextObj.SaveChanges();
                    return "Book record updated successfully";
                }
            }
            else
            {
                return "Invalid book record";
            }
        }
        // Add book
        public string AddBook(Book book)
        {
            if (book != null)
            {
                using (BookDBEntities contextObj = new BookDBEntities())
                {
                    contextObj.Book.Add(book);
                    contextObj.SaveChanges();
                    return "Book record added successfully";
                }
            }
            else
            {
                return "Invalid book record";
            }
        }
        // Delete book
        public string DeleteBook(string bookId)
        {

            if (!String.IsNullOrEmpty(bookId))
            {
                try
                {
                    int _bookId = Int32.Parse(bookId);
                    using (BookDBEntities contextObj = new BookDBEntities())
                    {
                        var _book = contextObj.Book.Find(_bookId);
                        contextObj.Book.Remove(_book);
                        contextObj.SaveChanges();
                        return "Selected book record deleted sucessfully";
                    }
                }
                catch (Exception)
                {
                    return "Book details not found";
                }
            }
            else
            {
                return "Invalid operation";
            }
        }
    }

}
