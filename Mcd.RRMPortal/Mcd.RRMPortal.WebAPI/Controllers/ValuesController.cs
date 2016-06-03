using Mcd.RRMPortal.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

namespace Mcd.RRMPortal.WebAPI.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post(Book value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }

        public List<Book> GetAllBooks()
        {
            List<Book> bookList = new List<Book>()
                {
                    new Book(){Id = 1, Author = "aa", Isbn = "21ssdfds" , Publisher = "sfsdf", Title = "dsafasf"},
                    new Book(){Id = 2, Author = "aa", Isbn = "21ssdfds" , Publisher = "sfsdf", Title = "dsafasf"}
                };

            return bookList;
        }

        public HttpResponseMessage Options()
        {
            var response = new HttpResponseMessage();
            response.StatusCode = HttpStatusCode.OK;
            return response;
        }
    }
}