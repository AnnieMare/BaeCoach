﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BaeCoach.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BaeCoachEntities1 : DbContext
    {
        public BaeCoachEntities1()
            : base("name=BaeCoachEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Active> Actives { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Coach> Coaches { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<Gender> Genders { get; set; }
        public virtual DbSet<Interest> Interests { get; set; }
        public virtual DbSet<myUser> myUsers { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<Profession> Professions { get; set; }
        public virtual DbSet<Region> Regions { get; set; }
        public virtual DbSet<RelationshipStatu> RelationshipStatus { get; set; }
        public virtual DbSet<Response> Responses { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Title> Titles { get; set; }
        public virtual DbSet<Topic> Topics { get; set; }
        public virtual DbSet<University> Universities { get; set; }
        public virtual DbSet<userLogin> userLogins { get; set; }
        public virtual DbSet<Verification> Verifications { get; set; }
    }
}