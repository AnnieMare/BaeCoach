using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaeCoach.Controllers
{
    public class BaeCoachController : Controller
    {
        // GET: BaeCoach
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        public ActionResult DoLogin()
        {
            return View();
        }
    }
}