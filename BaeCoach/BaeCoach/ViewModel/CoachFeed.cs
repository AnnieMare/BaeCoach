using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaeCoach.Models;
using BaeCoach.ViewModels;

namespace BaeCoach.ViewModels
{
    public class CoachFeed
    {
        BaeCoachEntities1 db = new BaeCoachEntities1();
        public Coach currentCoach { get; set; }
        public List<Post> listPosts { get; set; }
        public Response coachResponse { get; set; }
        public Topic currentTopic { get; set; }

        public CoachFeed populateCoachFeed(int PostID, Coach currentCoach)
        {
            CoachFeed cf = new CoachFeed();
            listPosts = db.Posts.Where(o => o.TopicName == currentTopic.TopicName).ToList();
            //string PostText = listPosts.Select(x => x.PostText).FirstOrDefault();
            return cf;

        }
    }
}