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
        //List for displaying all topics on topic List
        public static List<Topic> topicSelect = new List<Topic>();
        //list to display selected topic
        public static List<Topic> topicSelected = new List<Topic>();
        BaeCoachEntities1 db = new BaeCoachEntities1();//connection st
        public static string currentUser = "";


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
        public ActionResult UpdateProfile()
        {
            return View();
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