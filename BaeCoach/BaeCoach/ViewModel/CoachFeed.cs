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
        BaeCoachEntities3 db = new BaeCoachEntities3();
        public Coach currentCoach { get; set; }
        public List<Post> listPosts { get; set; }
        public Response coachResponse { get; set; }
        public Topic currentTopic { get; set; }

        //public CoachFeed populateCoachFeed(int PostID)
        //{
        //    //CoachFeed cf = new CoachFeed();
        //    //listPosts = db.Posts.Where(o => o.Topic == currentTopic.).ToList();
        //    ////string PostText = listPosts.Select(x => x.PostText).FirstOrDefault();
        //    //return cf;

        //}
    }
}