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
    public class PostsController : Controller
    {
        private BaeCoachEntities3 db = new BaeCoachEntities3();

        // GET: Posts
        public ActionResult Index()
        {
            var posts = db.Posts.Include(p => p.myUser).Include(p => p.Topic1);
            return View(posts.ToList());
        }

        // GET: Posts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // GET: Posts/Create
        public ActionResult Create()
        {
            ViewBag.FK_UserID = new SelectList(db.myUsers, "UserID", "Name");
            ViewBag.Topic = new SelectList(db.Topics, "TopicID", "TopicName");
            return View();
        }

        // POST: Posts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PostID,PostText,FK_UserID,Topic")] Post post)
        {
           
            if (ModelState.IsValid)
            {
                post.FK_UserID = Convert.ToInt32(Session["userID"]);
                post.Topic = Convert.ToInt32(Session["topicId"]);
                db.Posts.Add(post);
                db.SaveChanges();
                Response newPostID = new Response();
                newPostID.FK_PostID = post.PostID;
                Session["PostId"] = post.PostID;
                return RedirectToAction("Home","BaeCoach");
            }

            
            ViewBag.FK_UserID = new SelectList(db.myUsers, "UserID", "Name", post.FK_UserID);
            ViewBag.Topic = new SelectList(db.Topics, "TopicID", "TopicName", post.Topic);
            return View(post);
        }

        // GET: Posts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_UserID = new SelectList(db.myUsers, "UserID", "Name", post.FK_UserID);
            ViewBag.Topic = new SelectList(db.Topics, "TopicID", "TopicName", post.Topic);
            return View(post);
        }

        // POST: Posts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PostID,PostText,FK_UserID,TopicName,Topic")] Post post)
        {
            if (ModelState.IsValid)
            {
                db.Entry(post).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FK_UserID = new SelectList(db.myUsers, "UserID", "Name", post.FK_UserID);
            ViewBag.Topic = new SelectList(db.Topics, "TopicID", "TopicName", post.Topic);
            return View(post);
        }

        // GET: Posts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // POST: Posts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Post post = db.Posts.Find(id);
            db.Posts.Remove(post);
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
