using GdeDaJedem.Domain;
using GdeDaJedem.Domain.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Entity
{
    public class KomentarRepository : IKomentarRepository
    {
        GdeDaJedemEntities GdeDaJedemEntities = new GdeDaJedemEntities();

        public void Create(KomentarBO komentarBO)
        {
            OceneKomentari komentar = new OceneKomentari();

            komentar.KorisnikID = komentarBO.KorisnikID;
            komentar.Ocena = komentarBO.Ocena;
            komentar.Opis = komentarBO.Opis;
            komentar.RestoranID = komentarBO.RestoranID;

            GdeDaJedemEntities.OceneKomentaris.Add(komentar);
            GdeDaJedemEntities.SaveChanges();
        }

        public void Delete(int id)
        {
            OceneKomentari komentar = GdeDaJedemEntities.OceneKomentaris.Where(x => x.KomentarID == id).FirstOrDefault();

            GdeDaJedemEntities.OceneKomentaris.Remove(komentar);
            GdeDaJedemEntities.SaveChanges();
        }

        public List<KomentarBO> GetAll()
        {
            throw new NotImplementedException();
        }

        public KomentarBO GetByID(int KomentarID)
        {
            KomentarBO komentarBO = new KomentarBO();

            OceneKomentari komentar = GdeDaJedemEntities.OceneKomentaris.Where(x => x.KomentarID == KomentarID).FirstOrDefault();

            komentarBO.KomentarID = komentar.KomentarID;
            komentarBO.KorisnikID = komentar.KorisnikID;
            komentarBO.Ocena = komentar.Ocena;
            komentarBO.Opis = komentar.Opis;
            komentarBO.RestoranID = komentar.RestoranID;

            return komentarBO;

        }

        public List<KomentarBO> GetByRestoranID(int id)
        {
            List<KomentarBO> komentari = new List<KomentarBO>();

            foreach(var item in GdeDaJedemEntities.OceneKomentaris)
            {
                if(item.RestoranID == id)
                {
                    KomentarBO komentar = new KomentarBO();
                    komentar.KomentarID = item.KomentarID;
                    komentar.Ocena = item.Ocena;
                    komentar.Opis = item.Opis;
                    komentar.RestoranID = item.RestoranID;
                    komentar.KorisnikID = item.KorisnikID;

                    komentari.Add(komentar);
                }
            }

            return komentari;

        }

        public List<KomentarBO> GetByUserID(int id)
        {
            List<KomentarBO> komentari = new List<KomentarBO>();

            foreach (var item in GdeDaJedemEntities.OceneKomentaris)
            {
                if (item.KorisnikID == id)
                {
                    KomentarBO komentar = new KomentarBO();
                    komentar.KomentarID = item.KomentarID;
                    komentar.Ocena = item.Ocena;
                    komentar.Opis = item.Opis;
                    komentar.RestoranID = item.RestoranID;
                    komentar.KorisnikID = item.KorisnikID;

                    komentari.Add(komentar);
                }
            }

            return komentari;
        }

        public void Update(KomentarBO komentarBO)
        {
            foreach (var item in GdeDaJedemEntities.OceneKomentaris)
            {
                if(item.KomentarID == komentarBO.KomentarID)
                {
                    item.KomentarID = komentarBO.KomentarID;
                    item.Ocena = komentarBO.Ocena;
                    item.Opis = komentarBO.Opis;
                    item.RestoranID = komentarBO.RestoranID;
                    item.KorisnikID = komentarBO.KorisnikID;
                }
            }

            GdeDaJedemEntities.SaveChanges();
        }
    }
}
