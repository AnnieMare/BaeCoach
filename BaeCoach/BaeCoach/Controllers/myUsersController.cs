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
    public class myUsersController : Controller
    {
        private BaeCoachEntities3 db = new BaeCoachEntities3();

        // GET: myUsers
        public ActionResult Index()
        {
            var myUsers = db.myUsers.Include(m => m.Active).Include(m => m.City).Include(m => m.Gender).Include(m => m.RelationshipStatu).Include(m => m.Title).Include(m => m.userLogin);
            return View(myUsers.ToList());
        }

        // GET: myUsers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            myUser myUser = db.myUsers.Find(id);
            if (myUser == null)
            {
                return HttpNotFound();
            }
            return View(myUser);
        }

        // GET: myUsers/Create
        public ActionResult Create()
        {
            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription");
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name");
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription");
            ViewBag.FK_RelationshipStatusIdn = new SelectList(db.RelationshipStatus, "RelationshipStatusID", "RelationshipStatusDescription");
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription");
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username");
            return View();
        }

        // POST: myUsers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserID,Name,Surname,Username,FK_TitleID,FK_GenderID,FK_RelationshipStatusIdn,FK_ActiveID,FK_CityID,LoginID, userLogin.UserPassword")] myUser myUser, string UserPassword)
        {
            userLogin ulogin = new userLogin();
            var hasedValue = ComputeSha256Hash(UserPassword);
            string newHased = hasedValue.Substring(0, 49);
            if (ModelState.IsValid)
            {
                userLogin ul = new userLogin();
                ul.UserPassword = newHased;
                ul.Username = myUser.Username;
                ul.LoginType = false;
               
                db.myUsers.Add(myUser);
                db.userLogins.Add(ul);
                db.SaveChanges();
                return RedirectToAction("TopicSelect", "BaeCoach");
            }

            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription", myUser.FK_ActiveID);
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name", myUser.FK_CityID);
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", myUser.FK_GenderID);
            ViewBag.FK_RelationshipStatusIdn = new SelectList(db.RelationshipStatus, "RelationshipStatusID", "RelationshipStatusDescription", myUser.FK_RelationshipStatusIdn);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", myUser.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", myUser.LoginID);
            return View(myUser);
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

        // GET: myUsers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            myUser myUser = db.myUsers.Find(id);
            if (myUser == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription", myUser.FK_ActiveID);
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name", myUser.FK_CityID);
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", myUser.FK_GenderID);
            ViewBag.FK_RelationshipStatusIdn = new SelectList(db.RelationshipStatus, "RelationshipStatusID", "RelationshipStatusDescription", myUser.FK_RelationshipStatusIdn);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", myUser.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", myUser.LoginID);
            return View(myUser);
        }

        // POST: myUsers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserID,Name,Surname,Username,FK_TitleID,FK_GenderID,FK_RelationshipStatusIdn,FK_ActiveID,FK_CityID,LoginID")] myUser myUser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(myUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FK_ActiveID = new SelectList(db.Actives, "ActiveID", "ActiveDescription", myUser.FK_ActiveID);
            ViewBag.FK_CityID = new SelectList(db.Cities, "Id", "Name", myUser.FK_CityID);
            ViewBag.FK_GenderID = new SelectList(db.Genders, "GenderID", "GenderDescription", myUser.FK_GenderID);
            ViewBag.FK_RelationshipStatusIdn = new SelectList(db.RelationshipStatus, "RelationshipStatusID", "RelationshipStatusDescription", myUser.FK_RelationshipStatusIdn);
            ViewBag.FK_TitleID = new SelectList(db.Titles, "TitleID", "Titledescription", myUser.FK_TitleID);
            ViewBag.LoginID = new SelectList(db.userLogins, "UserLoginID", "Username", myUser.LoginID);
            return View(myUser);
        }

        // GET: myUsers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            myUser myUser = db.myUsers.Find(id);
            if (myUser == null)
            {
                return HttpNotFound();
            }
            return View(myUser);
        }

        // POST: myUsers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            myUser myUser = db.myUsers.Find(id);
            myUser.FK_ActiveID = 2;
            db.SaveChanges();
            Session.Abandon();
            return RedirectToAction("DoLogin","BaeCoach");
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
