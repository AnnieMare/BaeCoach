using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaeCoach.Models;
using BaeCoach.ViewModels;


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

        public ActionResult BaeSignUpPage()
        {
            return View();
        }

        public ActionResult CoachSignUpPage()
        {
            return View();
        }

        public ActionResult TopicSelect()
        {
            return View();
        }
        public ActionResult Home()
        {
            return View();
        }
        public ActionResult UpdateProfile()
        {
            return View();
        }
        public ActionResult CoachUpdateProfile()
        {
            return View();
        }

        public ActionResult UserFeed(/*myUser currentUser*/)
        {
            
            return View(/*currentUser.Interests*/);
        }

        public ActionResult CoachFeed()
        {
            return View();
        }

        public ActionResult CoachReply()
        {
            return View();
        }
    }
}