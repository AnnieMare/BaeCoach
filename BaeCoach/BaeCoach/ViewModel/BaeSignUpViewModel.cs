using BaeCoach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaeCoach.ViewModel;


namespace BaeCoach.ViewModel
{
    public class BaeSignUpViewModel
    {
        internal BaeSignUpViewModel myBae;

        //Data memebers
        private int mUserID;
        //private string mName;
        //private string mSurname;
        //private string mUserName;
        //private string mEmail;
        //private string mPassword;
        private List<Country> countryList;
        private List<Region> regionList;
        private List<City> cityList;
        private List<Title> titleList;
        private List<Gender> genderList;
        private List<RelationshipStatu> relationshipStatusList;
        //private int mCityID;
        //private int mActiveID;
        //private int mLoginID;


        //Properies
        public int UserID { get => mUserID; set => mUserID = value; }
        //public string Name { get => mName; set => mName = value; }
        //public string Surname { get => mSurname; set => mSurname = value; }
        //public string UserName { get => mUserName; set => mUserName = value; }
        //public string Email { get => mEmail; set => mEmail = value; }
        //public string Password { get => mPassword; set => mPassword = value; }
        public List<Country> CountryList { get => countryList; set => countryList = value; }
        public List<Region> RegionList { get => regionList; set => regionList = value; }
        public List<City> CityList { get => cityList; set => cityList = value; }
        public List<Title> TitleList { get => titleList; set => titleList = value; }
        public List<Gender> GenderList { get => genderList; set => genderList = value; }
        public List<RelationshipStatu> RelationshipStatusList { get => relationshipStatusList; set => relationshipStatusList = value; }
        //public int CityID { get => mCityID; set => mCityID = value; }
        //public int ActiveID { get => mActiveID; set => mActiveID = value; }
        //public int LoginID { get => mLoginID; set => mLoginID = value; }



    }
}