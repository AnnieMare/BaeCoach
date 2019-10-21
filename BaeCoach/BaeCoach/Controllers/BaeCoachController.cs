using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using BaeCoach.Models;
using BaeCoach.ViewModel;
using System.Data.SqlClient;


namespace BaeCoach.Controllers
{
    public class BaeCoachController : Controller
    {
        //List for displaying all topics on topic List
        public static List<Topic> topicSelect = new List<Topic>();
        //list to display selected topic
        public static List<Topic> topicSelected = new List<Topic>();
        public static List<Post> prevPosts = new List<Post>();


        BaeCoachEntities3 db = new BaeCoachEntities3();//connection string
        public static List<myUser> thisBae = new List<myUser>();

        //SQL connection
        SqlConnection myConnection = new SqlConnection("Data Source=.;Initial Catalog=BaeCoach;Integrated Security=True");


        // GET: BaeCoach
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult DoLogin()
        {
            return View();
        }
        public ActionResult LoginAction(string email, string password)
        {
            try
                {
                var hashedPassword = ComputeSha256Hash(password);
                string newHased = hashedPassword.Substring(0, 49);

                userLogin userLogin = db.userLogins.Where(z => z.Username == email && z.UserPassword == newHased).FirstOrDefault();
                myUser user = db.myUsers.Where(c => c.Username == email).FirstOrDefault();
                Coach coach = db.Coaches.Where(c => c.Username == email).FirstOrDefault();

                Session["userID"] = userLogin.UserLoginID;
                Session["type"] = userLogin.LoginType;

                if (user != null)
                {
                    Session["myUsersID"] = user.UserID;
                }
                else
                {
                    Session["myUsersID"] = coach.CoachID;
                }

                if (userLogin != null)
                {
                    return RedirectToAction("TopicSelect", "BaeCoach");
                }
                else
                {
                    ViewBag.Message = "UserName or password is wrong";
                    return View();
                }
            }
            catch(Exception e)
            {
                ViewBag.Message = e.Message;
            }

            return RedirectToAction("DoLogin");
        }

        public ActionResult BaeSignUpPage()
        {
            BaeSignUpViewModel vm = new BaeSignUpViewModel();
            vm.CountryList = db.Countries.ToList();
            vm.RegionList = db.Regions.ToList();
            vm.CityList = db.Cities.ToList();
            vm.TitleList = db.Titles.ToList();
            vm.GenderList = db.Genders.ToList();
            vm.RelationshipStatusList = db.RelationshipStatus.ToList();
            return View(vm);
        }

        
        string ComputeSha256Hash(string rawData)
        {
            //Create a SHA256
            using (SHA256 sha256Hash = SHA256.Create())
            {
                //Compute hash - returns byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                //Convert byte array to a string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }

        }
       

        public ActionResult TopicSelect()
        {
            //Get all topics from database and add to list to pass to the view
            
            topicSelect = db.Topics.ToList();

            return View(topicSelect);
        }
        public ActionResult Home(string Selected)
        {
            try
            {
                //If selected not null add selected topics to list
                if (Selected != null)
                {
                    //add selected ids to array that was passed from the view
                    string[] userSelectedTopic = Selected.Split(',');

                    //loop to add all selected to new list to pass through to the homescreen view
                    for (int i = 0; i < userSelectedTopic.Count(); i++)
                    {
                        int topic = Convert.ToInt32(userSelectedTopic[i]);
                        topicSelected.Add(db.Topics.Where(z => z.TopicID == topic).FirstOrDefault());
                    }

                    TempData["Selected"] = Selected;
                    return View(topicSelected);
                }
                else
                {
                    return RedirectToAction("DoLogin", "BaeCoach");
                }
            }
            catch(Exception e)
            {

            }
            return RedirectToAction("TopicSelect", "BaeCoach");

        }
      

        public ActionResult DoBaeUpdate(int userID, string Name, string Surname, string UserName, string Email, List<City> City, string Title, string Gender, string RelationshipStatus, int activeID, int loginID)
        {
            try
            {
                myConnection.Open();
                SqlCommand myBaeUpdateCommand = new SqlCommand("Update myUser set UserID= '" + userID + "', Name='" + Name + "', Surname= '" + Surname + "', UserName= '" + UserName + "', Email= '" + Email + "', FK_CityID= '" + City + "', FK_TitleID= '" + Title + "', FK_GenderID= '" + Gender + "', FK_RelationshipStatusIdn= '" + RelationshipStatus + "', FK_ActiveID= '" + activeID + "', LoginID= '" + loginID + "", myConnection);
                int rowsAffected = myBaeUpdateCommand.ExecuteNonQuery();
            }
            catch (Exception error)
            {
                ViewBag.Status = error.Message;
            }
            finally
            {
                myConnection.Close();
            }
            return RedirectToAction("Home");
        }
        public ActionResult CoachUpdateProfile()
        {
           
            return View();
        }

        public ActionResult UserFeed()
        {
            int TopicID = Convert.ToInt32(Session["topicId"]);
            Session["TopicName"] = db.Topics.Where(c => c.TopicID == TopicID).Select(t => t.TopicName).FirstOrDefault();

           

            List <Post> prevPosts = db.Posts.Where(x => x.Topic == TopicID).ToList();
            
            return View(prevPosts) ;
        }

        public ActionResult CoachFeed()
        {

            int TopicID = Convert.ToInt32(Session["topicId"]);
            Session["TopicName"] = db.Topics.Where(c => c.TopicID == TopicID).Select(t => t.TopicName).FirstOrDefault();
            prevPosts = db.Posts.Where(x => x.Topic == TopicID).ToList();
            
            return View(prevPosts);
        }

        public ActionResult CoachReply()
        {
            return View();
        }
        public ActionResult UserEntry()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Feed(string topicID, string ImageLink )
        {

            Session["topicId"] = topicID;
            Session["ImageLink"] = ImageLink;
          
            if (Convert.ToBoolean(Session["type"]) == false)
            {
               
                return RedirectToAction("UserFeed", "BaeCoach", new {topicID = topicID});
            }
            else if(Convert.ToBoolean(Session["type"]) == true)
            {
                return RedirectToAction("CoachFeed", "BaeCoach", new { topicID = topicID });
            }
            else
            {
                return RedirectToAction("DoLogin", "BaeCoach");
            }
        }

        public ActionResult Logout()
        {
            Session.Abandon();//clear sessions
            return RedirectToAction("DoLogin");
        }

        public ActionResult checkEdit(string UserID)
        {
            
            if (Convert.ToBoolean(Session["type"]) == false)
            {

                return RedirectToAction("Edit", "myUsers", new { id = UserID });
            }
            else if (Convert.ToBoolean(Session["type"]) == true)
            {
                return RedirectToAction("Edit", "Coaches", new { id = UserID });
            }
            else
            {
                return RedirectToAction("DoLogin", "BaeCoach");
            }

            
        }
    }
}