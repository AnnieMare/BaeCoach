using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using BaeCoach.Models;

namespace BaeCoach.Controllers
{
    public class CoachesController : Controller
    {
        private BaeCoachEntities3 db = new BaeCoachEntities3();

        // GET: Coaches
        public ActionResult LandingPage()
        {
            return View();
        }
        public ActionResult Index()
        {
            var coaches = db.Coaches.Include(c => c.Active).Include(c => c.City).Include(c => c.ExperienceLevel).Include(c => c.Gender).Include(c => c.Title).Include(c => c.userLogin).Include(c => c.University1);
            return View(coaches.ToList());
        }

        // GET: Coaches/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coach coach = db.Coaches.Find(id);
            if (coach == null)
            {
                return HttpNotFound();
            }
            return View(coach);
        }

        // GET: Coaches/Create
        public ActionResult Create()
        {
            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription");
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name");
            ViewBag.CoachExperience = new SelectList(db.ExperienceLevels, "ExperienceID", "ExperienceDescription");
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription");
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription");
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username");
            ViewBag.University = new SelectList(db.Universities, "UniversityID", "UniversityName");
            return View();
        }

        // POST: Coaches/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CoachID,Name,Surname,Username,FK_TitleID,FK_GenderID,FK_ActiveID,FK_CityID,LoginID,CoachExperience,University,userLogin.UserPassword")] Coach coach, string UserPassword,string username)
        {
            userLogin ulogin = new userLogin();
            var hasedValue = ComputeSha256Hash(UserPassword);
            string newHased = hasedValue.Substring(0, 49);

            if (ModelState.IsValid)
            {
                userLogin ul = new userLogin();
                ul.UserPassword = newHased;
                ul.Username = username;
                ul.LoginType = true;

                coach.FK_ActiveID = 1;
                db.Coaches.Add(coach);
                db.userLogins.Add(ul);
                db.SaveChanges();
                return RedirectToAction("TopicSelect", "BaeCoach");
            }
            string ComputeSha256Hash(string rawData)
            {
                //Create a SHA256
                using (SHA256 sha256Hash = SHA256.Create())
                {
                    //Compute hash - returns byte array
                    byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                    //Convert byte array to a string
                    StringBuilder builder = new StringBuilder();
                    for (int i = 0; i < bytes.Length; i++)
                    {
                        builder.Append(bytes[i].ToString("x2"));
                    }
                    return builder.ToString();
                }

            }

            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription", coach.FK_ActiveID);
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name", coach.FK_CityID);
            ViewBag.CoachExperience = new SelectList(db.ExperienceLevels, "ExperienceID", "ExperienceDescription", coach.CoachExperience);
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", coach.FK_GenderID);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", coach.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", coach.LoginID);
            ViewBag.University = new SelectList(db.Universities, "UniversityID", "UniversityName", coach.University);
            return View(coach);
        }

        // GET: Coaches/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coach coach = db.Coaches.Find(id);
            if (coach == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription", coach.FK_ActiveID);
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name", coach.FK_CityID);
            ViewBag.CoachExperience = new SelectList(db.ExperienceLevels, "ExperienceID", "ExperienceDescription", coach.CoachExperience);
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", coach.FK_GenderID);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", coach.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", coach.LoginID);
            ViewBag.University = new SelectList(db.Universities, "UniversityID", "UniversityName", coach.University);
            return View(coach);
        }

        // POST: Coaches/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CoachID,Name,Surname,Username,FK_TitleID,FK_GenderID,FK_ActiveID,FK_CityID,LoginID,CoachExperience,University")] Coach coach)
        {
            if (ModelState.IsValid)
            {

                db.Entry(coach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription", coach.FK_ActiveID);
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name", coach.FK_CityID);
            ViewBag.CoachExperience = new SelectList(db.ExperienceLevels, "ExperienceID", "ExperienceDescription", coach.CoachExperience);
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", coach.FK_GenderID);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", coach.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", coach.LoginID);
            ViewBag.University = new SelectList(db.Universities, "UniversityID", "UniversityName", coach.University);
            return View(coach);
        }

        // GET: Coaches/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coach coach = db.Coaches.Find(id);
            if (coach == null)
            {
                return HttpNotFound();
            }
            return View(coach);
        }

        // POST: Coaches/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Coach coach = db.Coaches.Find(id);
            coach.FK_ActiveID = 2;
            db.SaveChanges();
            Session.Abandon();
            return RedirectToAction("DoLogin", "BaeCoach");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
