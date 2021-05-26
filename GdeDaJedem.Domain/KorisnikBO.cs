using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Domain
{
    public class KorisnikBO
    {
        [Required(ErrorMessage = "Morate popuniti sva polja!")]
        public int KorisnikID { get; set; }
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Telefon { get; set; }

        public List<KomentarBO> Komentari { get; set; }

    }
}
