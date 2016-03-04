﻿using Mcd.RRMPortal.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mcd.RRMPortal.Web.Controllers
{
    public class WidgetController : Controller
    {
        //
        // GET: /Widget/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Widget/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Widget/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Widget/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Widget/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Widget/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Widget/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Widget/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: All books
        public JsonResult GetStoreProfiles()
        {
            //using (BookDBEntities contextObj = new BookDBEntities())
            //{
            //    var bookList = contextObj.Book.ToList();
            //    return Json(bookList, JsonRequestBehavior.AllowGet);
            //}
            var list =  new WidgetManager().GetStoreProfiles();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}
