using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BaeCoach.Models;

namespace BaeCoach.Controllers
{
    public class ResponsesController : Controller
    {
        private BaeCoachEntities3 db = new BaeCoachEntities3();

        // GET: Responses
        public ActionResult Index()
        {
            var responses = db.Responses.Include(r => r.Coach).Include(r => r.Post).Include(r => r.Response2).Include(r => r.Topic1);
            return View(responses.ToList());
        }

        // GET: Responses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Response response = db.Responses.Find(id);
            if (response == null)
            {
                return HttpNotFound();
            }
            return View(response);
        }

        // GET: Responses/Create
        public ActionResult Create(string PostID)
        {
            ViewBag.FK_CoachID = new SelectList(db.Coaches, "CoachID", "Name");
            ViewBag.FK_PostID = new SelectList(db.Posts, "PostID", "PostText");
            ViewBag.FK_ResponseID = new SelectList(db.Responses, "ResponseID", "RespronsText");
            ViewBag.Topic = new SelectList(db.Topics, "TopicID", "TopicName");
            return View();
        }

        // POST: Responses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ResponseID,RespronsText,FK_CoachID,FK_PostID,FK_ResponseID")] Response response, string topic, string PostID)
        {

            if (ModelState.IsValid)
            {
                //    response.FK_PostID = Convert.ToInt32(Session["PostID"]);
                response.Topic = Convert.ToInt32(Session["TopicId"]);
                db.Responses.Add(response);
                db.SaveChanges();
                return RedirectToAction("CoachFeed","BaeCoach");
            }

            ViewBag.FK_CoachID = new SelectList(db.Coaches, "CoachID", "Name", Session["userID"]);
            ViewBag.FK_PostID = new SelectList(db.Posts, "PostID", "PostText", Session["PostID"]);
            ViewBag.FK_ResponseID = new SelectList(db.Responses, "ResponseID", "RespronsText", response.ResponseID);
            ViewBag.Topic = new SelectList(db.Topics, "TopicID", "TopicName", Session["topicId"]);
            return View(response);
        }

        // GET: Responses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Response response = db.Responses.Find(id);
            if (response == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_CoachID = new SelectList(db.Coaches, "CoachID", "Name", response.FK_CoachID);
            ViewBag.FK_PostID = new SelectList(db.Posts, "PostID", "PostText", response.FK_PostID);
            ViewBag.FK_ResponseID = new SelectList(db.Responses, "ResponseID", "RespronsText", response.FK_ResponseID);
            ViewBag.Topic = new SelectList(db.Topics, "TopicID", "TopicName", response.Topic);
            return View(response);
        }

        // POST: Responses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ResponseID,RespronsText,FK_CoachID,FK_ResponseID,FK_PostID,Topic")] Response response)
        {
            if (ModelState.IsValid)
            {
                db.Entry(response).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FK_CoachID = new SelectList(db.Coaches, "CoachID", "Name", response.FK_CoachID);
            ViewBag.FK_PostID = new SelectList(db.Posts, "PostID", "PostText", response.FK_PostID);
            ViewBag.FK_ResponseID = new SelectList(db.Responses, "ResponseID", "RespronsText", response.FK_ResponseID);
            ViewBag.Topic = new SelectList(db.Topics, "TopicID", "TopicName", response.Topic);
            return View(response);
        }

        // GET: Responses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Response response = db.Responses.Find(id);
            if (response == null)
            {
                return HttpNotFound();
            }
            return View(response);
        }

        // POST: Responses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Response response = db.Responses.Find(id);
            db.Responses.Remove(response);
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
