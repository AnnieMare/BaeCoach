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
    
        public static string currentUser = "";
        BaeCoachEntities1 db = new BaeCoachEntities1();//connection string
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
        [HttpPost]
        public ActionResult DoLogin(string Email, string Password)
        {

            //user email en user password moet in die database gesit word. ALong with others

            var hashedPassword = ComputeSha256Hash(Password);
            Models.userLogin user = db.userLogins.Where(zz => zz.Username == Username && zz.UserPassword == hashedPassword).FirstOrDefault();

            if (user != null)
            { //user viewmodel in folder "ViewModelsCarla" want ek kon nie die ander een vind nie, maak net seker jy verander dit terug
                UserVM userVME = new UserVM();
                userVME.user = user; //weet nie hoekom hierdie n error gooi nie? logincal error?
                userVME.RefreshGUID(db);
                TempData["userVM"] = userVME;
                return View("Login", "Login"); //need to adjust this accordingly
            }
            return View(); //else- it must return with an error message
        
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

        //public ActionResult BaeAdd(string Name, string Surname, string UserName, string Password, string Country, string Region, string City, string Title, string Gender, string RelationshipStatus)
        //{
            //BaeCoachEntities1 db = new BaeCoachEntities1();
            ////BaeSignUpViewModel vm = new BaeSignUpViewModel();
            //myUser user = new myUser();
            //userLogin ulogin = new userLogin();
            //Country country = new Country();
            //Region region = new Region();
            //City city = new City();
            //Title title = new Title();
            //Gender gender = new Gender();
            //RelationshipStatu relationshipStatus = new RelationshipStatu();

            user.Name = Name;
            user.Surname = Surname;
            user.Username = UserName;
            ulogin.UserPassword = ComputeSha256Hash(ulogin.UserPassword);
            country.Name = Country.ToString();
            region.Name = Region.ToString();
            city.Name = City.ToString();
            title.Titledescription = Title;
            gender.GenderDescription = Gender;
            relationshipStatus.RelationshipStatusDescription = RelationshipStatus;

            //user.UserID = user.UserID;
            //user.Name = Name;
            //user.Surname = Surname;
            ////user.Email = Email;
            //user.Username = UserName;
            //ulogin.UserPassword = ComputeSha256Hash(Password);
            //country.Name = Country;
            //region.Name = Region;
            //city.Name = City;
            //title.Titledescription = Title;
            //gender.GenderDescription = gender.GenderID.ToString();
            //relationshipStatus.RelationshipStatusDescription = relationshipStatus.RelationshipStatusID.ToString();


            //db.myUsers.Add(user);
            //db.userLogins.Add(ulogin);
            //db.Countries.Add(country);
            //db.Regions.Add(region);
            //db.Cities.Add(city);
            //db.Titles.Add(title);
            //db.Genders.Add(gender);
            //db.RelationshipStatus.Add(relationshipStatus);

            //db.SaveChanges();
                       
            //return RedirectToAction("TopicSelct", new { userID = user.UserID });


        //}

        
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
        public ActionResult CoachSignUpPage()
        {
            CoachSignUpViewModel vm = new CoachSignUpViewModel();
            vm.CountryList = db.Countries.ToList();
            vm.RegionList = db.Regions.ToList();
            vm.CityList = db.Cities.ToList();
            //vm.TitleList = db.Titles.ToList();
            //vm.GenderList = db.Genders.ToList();
            //vm.StatusList = db.RelationshipStatus.ToList();
            vm.UniversityList = db.Universities.ToList();
            return View(vm);
        }

        public ActionResult CoachAdd( string Name, string Surname, string UserName, string Email, List<Country> Country, List<Region> Region, List<City> City, string Title, string Gender, string RelationshipStatus, List<University> University, DateTime Graduated, string Study)
        {
            BaeCoachEntities1 db = new BaeCoachEntities1();
            Coach coach = new Coach();
            userLogin ulogin = new userLogin();
            Country country = new Country();
            Region region = new Region();
            City city = new City();
            Title title = new Title();
            Gender gender = new Gender();
            RelationshipStatu relationshipStatus = new RelationshipStatu();
            University uni = new University();


            coach.Name = Name;
            coach.Surname = Surname;
            coach.Username = UserName;
            ulogin.UserPassword = ComputeSha256Hash(ulogin.UserPassword);
            country.Name = Country.ToString();
            region.Name = Region.ToString();
            city.Name = City.ToString();
            title.Titledescription = Title;
            gender.GenderDescription = Gender;
            relationshipStatus.RelationshipStatusDescription = RelationshipStatus;
            uni.UniversityName = University.ToString();
          


            db.Coaches.Add(coach);
            db.userLogins.Add(ulogin);
            db.Countries.Add(country);
            db.Regions.Add(region);
            db.Cities.Add(city);
            db.Titles.Add(title);
            db.Genders.Add(gender);
            db.RelationshipStatus.Add(relationshipStatus);

            db.SaveChanges();

            return RedirectToAction("TopicSelct");
        }

        public ActionResult TopicSelect()
        {
            //Get all topics from database and add to list to pass to the view
            topicSelect = db.Topics.ToList();

            return View(topicSelect);
        }
        public ActionResult Home(string Selected)
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
            }

            return View(topicSelected);

        }
        public ActionResult UpdateProfile(int id)
        {
            //myUser updateBaeModel = new myUser();
            //updateBaeModel.myBae = thisBae.Where(p => p. == id).FirstOrDefault();

            //try
            //{
            //    myConnection.Open();
            //    SqlCommand updateCommand = new SqlCommand("Select myUser.UserID, myUser.Name, myUser.Surname, myUser.UserName, myUser.FK_TitleID, myUser.FK_GenderID, myUser.FK_RelationshipStatusIdn, myUser.FK_ActiveID, myUser.FK_CityID, myUser.LoginID, myUser.Email FROM myUser", myConnection);
            //    SqlDataReader baeReader = updateCommand.ExecuteReader();
            //    while (baeReader.Read())
            //    {
            //        BaeSignUpViewModel bae = new BaeSignUpViewModel();
            //        ViewBag.UserID = (int)baeReader["UserID"];
            //        bae.Name = baeReader["Name"].ToString();
            //        bae.Surname = baeReader["Surname"].ToString();
            //        bae.UserName = baeReader["UserName"].ToString();
            //        bae.Title = (int)baeReader["FK_TitleID"];
            //        bae.Gender = (int)baeReader["FK_GenderID"];
            //        bae.StatusID = (int)baeReader["FK_RelationshipStatusIdn"];
            //        bae.ActiveID = (int)baeReader["FK_ActiveID"];
            //        bae.CityID = (int)baeReader["FK_CityID"];
            //        bae.LoginID = (int)baeReader["FK_LoginID"];
            //        bae.Email = baeReader["Email"].ToString();
            //        thisBae.Add(bae);

            //        ViewBag.UserID = bae.UserID;
            //        ViewBag.Name = bae.Name;
            //        ViewBag.Surname = bae.Surname;
            //        ViewBag.Title = bae.Title;
            //        ViewBag.Gender = bae.Gender;
            //        ViewBag.Status = bae.StatusID;
            //        ViewBag.ActiveID = bae.ActiveID;
            //        ViewBag.CityID = bae.CityID;
            //        ViewBag.LoginID = bae.LoginID;
            //        ViewBag.Email = bae.Email;
            //    }
            //}
            //catch (Exception error)
            //{
            //    ViewBag.Status = error.Message;
            //}
            //finally
            //{
            //    myConnection.Close();
            //}
            return View();
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

            return View();
        }

        public ActionResult CoachFeed()
        {
            return View();
        }

        public ActionResult CoachReply()
        {
            return View();
        }
        public ActionResult UserEntry()
        {
            return View();
        }

        public ActionResult Feed()
        {
            //redirect user to the right view
            if (currentUser == "Bae")
            {
                return RedirectToAction("UserFeed", "BaeCoach");
            }
            else
            {
                return RedirectToAction("CoachFeed", "BaeCoach");
            }
        }

    }
}