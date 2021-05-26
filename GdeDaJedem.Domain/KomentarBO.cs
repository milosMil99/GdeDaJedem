using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Domain
{
    public class KomentarBO
    {
        public int KomentarID { get; set; }
        public Nullable<double> Ocena { get; set; }
        public string Opis { get; set; }
        public int RestoranID { get; set; }
        public int KorisnikID { get; set; }
    }
}
