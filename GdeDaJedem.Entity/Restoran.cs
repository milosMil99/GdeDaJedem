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
    
    public partial class Restoran
    {
        public Restoran()
        {
            this.OceneKomentaris = new HashSet<OceneKomentari>();
            this.TipoviRestoranas = new HashSet<TipoviRestorana>();
        }
    
        public int RestoranID { get; set; }
        public string PIB { get; set; }
        public string Naziv { get; set; }
        public string Adresa { get; set; }
        public string Telefon { get; set; }
        public string Email { get; set; }
        public string Opis { get; set; }
        public string Slika { get; set; }
        public string Mapa { get; set; }
        public Nullable<int> Opstina { get; set; }
    
        public virtual ICollection<OceneKomentari> OceneKomentaris { get; set; }
        public virtual Opstine Opstine { get; set; }
        public virtual ICollection<TipoviRestorana> TipoviRestoranas { get; set; }
    }
}
