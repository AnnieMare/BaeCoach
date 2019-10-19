using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace BaeCoach.ViewModelsCarla
{
    public class UserVM
    {
        //Creates new GUID, checks if it is unique
        //Collects all the GUIDs from the DB, if there's more than 0, it calls this function again
        //GUIDs.count >0 is done untli a unique GUID id found.
        //user's GUID is updated with the unique GUID and a GUID expiry of 50 min.
        public userLogin user;

        public void RefreshGUID(BaeCoachEntities1 db)
        {
            db.Configuration.ProxyCreationEnabled = false;
            user.GUID = Guid.NewGuid().ToString();
            var guids = db.myUsers.Where(us => us.GUID == user.GUID).Count();
            if (guids > 0)
                RefreshGUID(db);
            else
            {
                var u = db.myUsers.Where(uu => uu.FK_ActiveID == user.ID).FirstOrDefault();
                db.Entry(u).CurrentValues.SetVAlues(user);
                db.SaveChanges();
            }
        }
        //checks if user as defined in the class is logged in, checks if GUID is in the DB and expiry time is later than now
        public bool IsLoggedIn(BaeCoachEntities1 db)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var guids = db.myUsers.Where(us => us.GUID == user.GUID).Count();
            if (guids > 0)
                return true;
            return false;
        }
        //function checks if the user is logged in by seeing if the GUID, sent as a parameter is in the DB and the expiry time is later than now.
        //This is an overloaded function where the GUID is sent as a parameter
        public bool IsLoggedIn(BaeCoachEntities1 db, string userGUID)
        {
            db.Configuration.ProxyCreationEnabled = false;
            user = db.myUsers.Where(us => us.GUID == userGUID).FirstOrDefault();
            if (user != null)
                return true;
            return false;
        }

    }
}