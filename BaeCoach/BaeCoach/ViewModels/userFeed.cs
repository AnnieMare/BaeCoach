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
            //uf.aPost = db.Interests.Where(o => o.TopicID == TopicID).Select(db.Posts.Where(o => o.PostID == aPost.PostID).FirstOrDefault();
            //var postList = db.Posts.Where(o => o.myUser.Interests
            //.Any(p => p.Topic.TopicID == TopicID));
            prevPosts = db.Posts.Where(o => o.TopicName == currentTopic.TopicName).ToList();
            //string PostText = prevPosts.Select(x => x.PostText).FirstOrDefault();
            return uf;
        }
    }
}