using GdeDaJedem.Domain;
using GdeDaJedem.Domain.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Entity
{
    public class KorisnikRepository : IKorisnikRepository
    {
        GdeDaJedemEntities GdeDaJedemEntities = new GdeDaJedemEntities();

        public void AddRoleToKorisnik(int rolaID, int korisnikID)
        {
            KorisnikRola rola = new KorisnikRola();

            rola.KorisnikID = korisnikID;
            rola.RolaID = rolaID;

            GdeDaJedemEntities.KorisnikRolas.Add(rola);
            GdeDaJedemEntities.SaveChanges();
        }

        public void Create(KorisnikBO korisnikBO)
        {
            Korisnik korisnik = new Korisnik();
            korisnik.KorisnikID = korisnikBO.KorisnikID;
            korisnik.Username = korisnikBO.Username;
            korisnik.Ime = korisnikBO.Ime;
            korisnik.Prezime = korisnikBO.Prezime;
            korisnik.Email = korisnikBO.Email;
            korisnik.Password = korisnikBO.Password;
            korisnik.Telefon = korisnikBO.Telefon;

            GdeDaJedemEntities.Korisniks.Add(korisnik);
            GdeDaJedemEntities.SaveChanges();
        }
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
            GdeDaJedemEntities.KorisnikRolas.Attach(korisnikRola);
            GdeDaJedemEntities.KorisnikRolas.Remove(korisnikRola);

            GdeDaJedemEntities.SaveChanges();


            //GdeDaJedemEntities.Entry(korisnikRola).State = System.Data.EntityState.Deleted;

            //GdeDaJedemEntities.KorisnikRolas.Attach(korisnikRola);

        }


        public void Delete(KorisnikBO korisnikBO)
        {
            Korisnik korisnik = GdeDaJedemEntities.Korisniks.FirstOrDefault(x => x.KorisnikID == korisnikBO.KorisnikID);
            

            KorisnikRola korisnikRola = new KorisnikRola();
            foreach (var item in GdeDaJedemEntities.KorisnikRolas)
            {
                if (item.KorisnikID == korisnik.KorisnikID)
                {
                    korisnikRola.KorisnikRolaID = item.KorisnikRolaID;
                    korisnikRola.KorisnikID = item.KorisnikID;
                    korisnikRola.RolaID = item.RolaID;
                }
            }


            GdeDaJedemEntities.Korisniks.Remove(korisnik);
            GdeDaJedemEntities.SaveChanges();

        }

        public List<KorisnikBO> GetAllUsers()
        {
            List<KorisnikBO> korisnici = new List<KorisnikBO>();

            foreach(Korisnik korisnik in GdeDaJedemEntities.Korisniks)
            {
                KorisnikBO KorisnikBO = new KorisnikBO();
                KorisnikBO.KorisnikID  = korisnik.KorisnikID;
                KorisnikBO.Username = korisnik.Username;
                KorisnikBO.Password = korisnik.Password;
                KorisnikBO.Ime = korisnik.Prezime;
                KorisnikBO.Email = korisnik.Email;
                KorisnikBO.Telefon = korisnik.Telefon;

                korisnici.Add(KorisnikBO);
            }
            return korisnici;

        }

        public List<string> GetRolesForUser(string username)
        {
            List<string> roleUsera = new List<string>();

            foreach(var item in GdeDaJedemEntities.KorisnikRolas)
            {
                foreach(var kor in GdeDaJedemEntities.Korisniks)
                {
                    if (item.KorisnikID ==kor.KorisnikID && kor.Username == username)
                    {
                        RolaBO rola = new RolaBO();
                        rola.RolaID = item.RolaID;
                        foreach (var item1 in GdeDaJedemEntities.Rolas)
                        {
                            if (item1.RolaID == item.RolaID)
                            {
                                rola.Naziv = item1.Naziv;
                            }
                        }
                        roleUsera.Add(rola.Naziv);
                    }
                }
                
                
            }
            return roleUsera;

        }

        public KorisnikBO GetUserByID(int korisnikID)
        {
            KorisnikBO korisnikBO = new KorisnikBO();
            foreach (var item in GdeDaJedemEntities.Korisniks.Where(x => x.KorisnikID == korisnikID))
            {
                korisnikBO.KorisnikID = item.KorisnikID;
                korisnikBO.Username = item.Username;
                korisnikBO.Password = item.Password;
                korisnikBO.Email = item.Email;
                korisnikBO.Ime = item.Ime;
                korisnikBO.Prezime = item.Prezime;
                korisnikBO.Telefon = item.Telefon;

                List<KomentarBO> komentari = new List<KomentarBO>();
                foreach(var komentar in GdeDaJedemEntities.OceneKomentaris)
                {
                    KomentarBO komentarBO = new KomentarBO();
                    if(komentar.KorisnikID == item.KorisnikID)
                    {
                        komentarBO.KomentarID = komentar.KomentarID;
                        komentarBO.KorisnikID = komentar.KorisnikID;
                        komentarBO.Opis = komentar.Opis;
                        komentarBO.Ocena = komentar.Ocena;
                        komentarBO.RestoranID = komentar.RestoranID;

                        komentari.Add(komentarBO);
                    }
                }
                korisnikBO.Komentari = komentari;
            }

            return korisnikBO;
        }

        public KorisnikBO GetUserByName(string user)
        {
            KorisnikBO korisnikBO = new KorisnikBO();
            foreach (var item in GdeDaJedemEntities.Korisniks.Where(x=>x.Username==user))
            {
                    
                    korisnikBO.KorisnikID = item.KorisnikID;
                    korisnikBO.Username = item.Username;
                    korisnikBO.Password = item.Password;
                    korisnikBO.Email  =  item.Email;
                    korisnikBO.Ime  =  item.Ime;
                    korisnikBO.Prezime  = item.Prezime;
                    korisnikBO.Telefon = item.Telefon;
            }         

            return korisnikBO;
        }

        public bool IsValid(string user, string pass)
        {
            foreach(Korisnik korisnik in GdeDaJedemEntities.Korisniks)
            {
                if(korisnik.Username == user && korisnik.Password==pass)
                {
                    return true;
                }
            }
            return false;
        }

        public void Update(KorisnikBO korisnikBO)
        {
            throw new NotImplementedException();
        }
    }
}

