//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Interest
    {
        public int InterestID { get; set; }
        public Nullable<int> TopicID { get; set; }
        public Nullable<int> UserID { get; set; }
    
        public virtual Topic Topic { get; set; }
        public virtual myUser myUser { get; set; }
    }
}
