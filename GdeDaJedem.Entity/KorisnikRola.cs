//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GdeDaJedem.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class KorisnikRola
    {
        public int KorisnikRolaID { get; set; }
        public int KorisnikID { get; set; }
        public int RolaID { get; set; }
    
        public virtual Korisnik Korisnik { get; set; }
        public virtual Rola Rola { get; set; }
    }
}
