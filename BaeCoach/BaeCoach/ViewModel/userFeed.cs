using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaeCoach.Models;
using System.Data.SqlClient;

namespace BaeCoach.ViewModel
{
    public class userFeed
    {
        BaeCoachEntities3 db = new BaeCoachEntities3();

      
        public Topic currentTopic { get; set; }
        public List<Post> prevPosts { get; set; }
        public myUser currentUser { get; set; }
        public Post aPost { get; set; }

        public userFeed PopulateUserFeed(int TopicID)
        {
           
            userFeed uf = new userFeed();
            uf.currentTopic = db.Topics.Where(t => t.TopicID == 1).FirstOrDefault();
            
            return uf;
        }
    }
}