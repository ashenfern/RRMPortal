using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mcd.RRMPortal.WebAPI.Models
{
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Publisher { get; set; }
        public string Isbn { get; set; }
        public string Author { get; set; }
    }

}