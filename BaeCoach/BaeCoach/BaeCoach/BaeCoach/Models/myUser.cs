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
    
    public partial class myUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public myUser()
        {
            this.Posts = new HashSet<Post>();
        }
    
        public int UserID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Username { get; set; }
        public Nullable<int> FK_TitleID { get; set; }
        public Nullable<int> FK_GenderID { get; set; }
        public Nullable<int> FK_RelationshipStatusIdn { get; set; }
        public Nullable<int> FK_ActiveID { get; set; }
        public Nullable<int> FK_CityID { get; set; }
        public Nullable<int> LoginID { get; set; }
    
        public virtual Active Active { get; set; }
        public virtual City City { get; set; }
        public virtual Gender Gender { get; set; }
        public virtual RelationshipStatu RelationshipStatu { get; set; }
        public virtual Title Title { get; set; }
        public virtual userLogin userLogin { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Post> Posts { get; set; }
    }
}
