using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Domain
{
    public class RestoranBO
    {
        [Required(ErrorMessage = "Pogresan unos!")]
        public int restoranID { get; set; }
        public string PIB { get; set; }
        [Required]
        public string Naziv { get; set; }
        [Required]
        public string Adresa { get; set; }
        public List<TipBO> Tipovi { get; set; }
        public string Telefon { get; set; }
        public string Email { get; set; }
        public string Opis { get; set; }
        public string Slika { get; set; }
        public string Mapa { get; set; }
        [Required]
        public int Opstina { get; set; }
        public string NazivOpstine { get; set; }
    }
}
