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

        public CoachFeed populateCoachFeed(int PostID, Coach currentCoach )
        {
            CoachFeed cf = new CoachFeed();
            cf.currentCoach = currentCoach;
            //cf.listPosts = db.Posts.Where()
            return cf;

        }
    }
}