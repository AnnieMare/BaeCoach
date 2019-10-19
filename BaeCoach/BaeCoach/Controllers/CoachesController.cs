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
        private BaeCoachEntities1 db = new BaeCoachEntities1();

        // GET: Coaches
        public ActionResult Index()
        {
            var coaches = db.Coaches.Include(c => c.Active).Include(c => c.City).Include(c => c.Gender).Include(c => c.Title).Include(c => c.userLogin);
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
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription");
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription");
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username");
            return View();
        }

        // POST: Coaches/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CoachID,Name,Surname,Username,FK_TitleID,FK_GenderID,FK_ActiveID,FK_CityID,LoginID, University")] Coach coach, string UserPassword)
        {
            userLogin ulogin = new userLogin();
            var hasedValue = ComputeSha256Hash(UserPassword);

            if (ModelState.IsValid)
            {
                University uni = new University();
                userLogin ul = new userLogin();
                ul.UserPassword = hasedValue;
                ul.Username = coach.Username;
                ul.LoginType = false; 

                db.userLogins.Add(ul);
                db.Coaches.Add(coach);
                db.SaveChanges();
                return RedirectToAction("TopicSelect", "BaeCoach");
            }

            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription", coach.FK_ActiveID);
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name", coach.FK_CityID);
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", coach.FK_GenderID);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", coach.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", coach.LoginID);
            ViewBag.University = new SelectList(db.Universities, "UniversityID", "UniversityName", coach.University);
            return View(coach);
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
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", coach.FK_GenderID);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", coach.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", coach.LoginID);
            return View(coach);
        }

        // POST: Coaches/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CoachID,Name,Surname,Username,FK_TitleID,FK_GenderID,FK_ActiveID,FK_CityID,LoginID")] Coach coach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(coach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription", coach.FK_ActiveID);
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name", coach.FK_CityID);
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", coach.FK_GenderID);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", coach.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", coach.LoginID);
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
            db.Coaches.Remove(coach);
            db.SaveChanges();
            return RedirectToAction("Index");
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
