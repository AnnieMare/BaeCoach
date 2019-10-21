using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaeCoach.Models;


namespace BaeCoach.ViewModelsCarla
{
    public class UserVM
    {
       
        public userLogin user;

        public bool IsLoggedIn(BaeCoachEntities3 db)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var guids = db.myUsers.Where(us => us.LoginID == user.UserLoginID).Count();
            if (guids > 0)
                return true;
            return false;
        }
    
        public bool IsLoggedIn(BaeCoachEntities3 db, int loginID)
        {
            db.Configuration.ProxyCreationEnabled = false;
            //user = db.myUsers.Where(us => us.LoginID == user.L ).FirstOrDefault();
            if (user != null)
                return true;
            return false;
        }

    }
}