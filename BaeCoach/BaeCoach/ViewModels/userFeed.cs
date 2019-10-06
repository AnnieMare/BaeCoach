using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaeCoach.Models;
using BaeCoach.ViewModels;
using System.Data.SqlClient;

namespace BaeCoach.ViewModels
{
    public class userFeed
    {
        BaeCoachEntities1 db = new BaeCoachEntities1();

      
        public Topic currentTopic { get; set; }
        public List<Post> prevPosts { get; set; }
        public myUser currentUser { get; set; }
        public Post aPost { get; set; }

        public userFeed PopulateUserFeed(int TopicID, myUser currentUser)
        {
            userFeed uf = new userFeed();
            uf.currentTopic = db.Topics.Where(t => t.TopicID == TopicID).FirstOrDefault();
            uf.prevPosts = db.Posts.Where(p => p.FK_UserID == currentUser.UserID).ToList();
            //uf.aPost = db.Interests.Where(o => o.TopicID == TopicID).Select(db.Posts.Where(o => o.PostID == aPost.PostID).FirstOrDefault();

            return uf;
        }
    }
}