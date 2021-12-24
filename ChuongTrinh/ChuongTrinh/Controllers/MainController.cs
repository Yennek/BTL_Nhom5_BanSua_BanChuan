using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChuongTrinh.Models;
using PagedList;


namespace ChuongTrinh.Controllers
{
    public class MainController : Controller
    {
        // GET: Main
        // này là controller main client nha là màn Home á
        QuanLyBanHangDB DB = new QuanLyBanHangDB();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Main( int ?page)
        {
            var sp = DB.SanPhams.OrderByDescending(p => p.MaSP);
            int pageNumber = (page ?? 1);
            return View(sp.ToPagedList(pageNumber,10));
        }


    }
}