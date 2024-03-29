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
    
    public partial class Response
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Response()
        {
            this.Response1 = new HashSet<Response>();
        }
        public static int postID { get; set; }
        public int ResponseID { get; set; }
        public string RespronsText { get; set; }
        public Nullable<int> FK_CoachID { get; set; }
        public Nullable<int> FK_ResponseID { get; set; }
        public Nullable<int> FK_PostID { get; set; }
        public Nullable<int> Topic { get; set; }
    
        public virtual Coach Coach { get; set; }
        public virtual Post Post { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Response> Response1 { get; set; }
        public virtual Response Response2 { get; set; }
        public virtual Topic Topic1 { get; set; }
    }
}
