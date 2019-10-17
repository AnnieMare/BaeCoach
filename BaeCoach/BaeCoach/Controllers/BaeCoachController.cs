using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using BaeCoach.Models;


namespace BaeCoach.Controllers
{
    public class BaeCoachController : Controller
 {
        
        public static List<Topic> topicSelect = new List<Topic>();
        BaeCoachEntities1 db = new BaeCoachEntities1();//connection st

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
            //vm.TitleList = db.Titles.ToList();
            //vm.GenderList = db.Genders.ToList();
            //vm.StatusList = db.RelationshipStatus.ToList();
            return View(vm);
        }

        public ActionResult BaeAdd(string Name, string Surname, string UserName, string Email, List<Country> Country, List<Region> Region, List<City> City, string Title, string Gender, string RelationshipStatus)
        {
            BaeCoachEntities1 db = new BaeCoachEntities1();
            myUser user = new myUser();
            userLogin ulogin = new userLogin();
            Country country = new Country();
            Region region = new Region();
            City city = new City();
            Title title = new Title();
            Gender gender = new Gender();
            RelationshipStatu relationshipStatus = new RelationshipStatu();

            user.Name = Name;
            user.Surname = Surname;
            user.Email = Email;
            user.Username = UserName;
            ulogin.UserPassword = ComputeSha256Hash(ulogin.UserPassword);
            country.Name = Country.ToString();
            region.Name = Region.ToString();
            city.Name = City.ToString();
            title.Titledescription = Title;
            gender.GenderDescription = Gender;
            relationshipStatus.RelationshipStatusDescription = RelationshipStatus;

            db.myUsers.Add(user);
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

        public ActionResult CoachAdd(string Name, string Surname, string UserName, string Email, List<Country> Country, List<Region> Region, List<City> City, string Title, string Gender, string RelationshipStatus, List<University> University, DateTime Graduated, string Study)
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
            coach.Email = Email;
            coach.Username = UserName;
            ulogin.UserPassword = ComputeSha256Hash(ulogin.UserPassword);
            country.Name = Country.ToString();
            region.Name = Region.ToString();
            city.Name = City.ToString();
            title.Titledescription = Title;
            gender.GenderDescription = Gender;
            relationshipStatus.RelationshipStatusDescription = RelationshipStatus;
            uni.UniversityName = University.ToString();
            coach.GraduationDate = Graduated;
            coach.StudyField = Study;


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
            topicSelect = db.Topics.ToList();
            return View(topicSelect);
        }
        public ActionResult Home(string Selected)
        {

            string[] userSelectedTopic = Selected.Split(',');
            List<int> userTopic = new List<int>();
            
            
            for (int i = 0; i < userSelectedTopic.Count(); i++)
            {
                userTopic.Add(Convert.ToInt32(userSelectedTopic[i]));
            }

            Interest userHomeTopic = new Interest();
            userHomeTopic.InterestID = Convert.ToInt32(userTopic);
            db.SaveChanges();






            topicSelect = db.Topics.ToList();
            return View(topicSelect);

        }
        public ActionResult UpdateProfile()
        {
            return View();
        }
        public ActionResult CoachUpdateProfile()
        {
            return View();
        }

        public ActionResult UserFeed(/*myUser currentUser*/)
        {

            return View(/*currentUser.Interests*/);
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

    }
}