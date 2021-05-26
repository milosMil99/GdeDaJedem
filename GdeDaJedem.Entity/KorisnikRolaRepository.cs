using GdeDaJedem.Domain.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Entity
{
    public class KorisnikRolaRepository : IKorisnikRolaRepository
    {
        GdeDaJedemEntities GdeDaJedemEntities = new GdeDaJedemEntities();
        public void DeleteRolaKorisnik(int korisnikID)
        {
            KorisnikRola korisnikRola = new KorisnikRola();
            foreach (var item in GdeDaJedemEntities.KorisnikRolas)
            {
                if (item.KorisnikID == korisnikID)
                {
                    korisnikRola.KorisnikRolaID = item.KorisnikRolaID;
                    korisnikRola.KorisnikID = item.KorisnikID;
                    korisnikRola.RolaID = item.RolaID;
                }
            }
          
                GdeDaJedemEntities.KorisnikRolas.Remove(korisnikRola);

                GdeDaJedemEntities.SaveChanges();
            

            //GdeDaJedemEntities.Entry(korisnikRola).State = System.Data.EntityState.Deleted;

            //GdeDaJedemEntities.KorisnikRolas.Attach(korisnikRola);
           
        }
    }
}
