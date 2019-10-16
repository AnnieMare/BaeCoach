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
        BaeCoachEntities1 db = new BaeCoachEntities1();
        public static List<Topic> topicSelect = new List<Topic>();

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
            topicSelect = db.Topics.ToList();
            return View(topicSelect);
        }
        public ActionResult Home(string Selected)
        {

            string[] userSelectedTopic = Selected.Split(',');
            List<int> userTopic = new List<int>();
            
            
            for (int i = 0; i < userSelectedTopic.Count(); i++)
            {
                userTopic.Add(Convert.ToInt32(userSelectedTopic[i]));
            }

            Interest userHomeTopic = new Interest();
            userHomeTopic.InterestID = Convert.ToInt32(userTopic);
            db.SaveChanges();






            topicSelect = db.Topics.ToList();
            return View(topicSelect);

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
        public ActionResult UserEntry()
        {
            return View();
        }
    }
}