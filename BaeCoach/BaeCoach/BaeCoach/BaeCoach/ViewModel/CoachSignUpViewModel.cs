﻿using BaeCoach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BaeCoach.ViewModel
{
    public class CoachSignUpViewModel
    {
        //Data memebers
        private string mName;
        private string mSurname;
        private string mUserName;
        private string mEmail;
        private string mPassword;
        private List<Country> countryList;
        private List<Region> regionList;
        private List<City> cityList;
        private string title;
        private string gender;
        private string status;
        private List<University> universityList;
        private DateTime mGraduationDate;
        private string mStudyField;

        //Properties
        public string Name { get => mName; set => mName = value; }
        public string Surname { get => mSurname; set => mSurname = value; }
        public string UserName { get => mUserName; set => mUserName = value; }
        public string Email { get => mEmail; set => mEmail = value; }
        public string Password { get => mPassword; set => mPassword = value; }
        public List<Country> CountryList { get => countryList; set => countryList = value; }
        public List<Region> RegionList { get => regionList; set => regionList = value; }
        public List<City> CityList { get => cityList; set => cityList = value; }
        public string Title { get => title; set => title = value; }
        public string Gender { get => gender; set => gender = value; }
        public string Status { get => status; set => status = value; }
        public List<University> UniversityList { get => universityList; set => universityList = value; }
        public DateTime Graduation { get => mGraduationDate; set => mGraduationDate = value; }
        public string StudyField { get => mStudyField; set => mStudyField = value; }
    }
}