using GdeDaJedem.Domain;
using GdeDaJedem.Domain.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Entity
{
    public class TipRepository : ITipRepository
    {
        GdeDaJedemEntities GdeDaJedemEntities = new GdeDaJedemEntities();
        public void Create(TipBO tip)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TipBO> GetAll()
        {
            List<TipBO> tipovi = new List<TipBO>();

            List<TipoviRestorana> tipovi1 = new List<TipoviRestorana>();
            tipovi1 = GdeDaJedemEntities.TipoviRestoranas.GroupBy(x => x.Naziv).Select(x => x.FirstOrDefault()).ToList();

            foreach (TipoviRestorana tip in tipovi1)
            {

                TipBO tipBO = new TipBO
                {
                    TipID = tip.TipId,
                    Naziv = tip.Naziv,
                    RestoranID = tip.RestoranID
                };
                tipovi.Add(tipBO);
            }
            return tipovi;
        }

        public TipBO GetByID(int id)
        {
            throw new NotImplementedException();
        }

        public TipBO GetByNaziv(string naziv)
        {
            TipoviRestorana tipNaziv = new TipoviRestorana();
            tipNaziv = GdeDaJedemEntities.TipoviRestoranas.Where(x => x.Naziv == naziv).FirstOrDefault();

            TipBO tipBO = new TipBO
            {
                TipID = tipNaziv.TipId,
                Naziv = tipNaziv.Naziv,
                RestoranID = tipNaziv.RestoranID
            };

            return tipBO;
        }

        public IEnumerable<TipBO> GetByRestoranID(int restoranID)
        {
            List<TipBO> tipovi = new List<TipBO>();

            foreach (TipoviRestorana tip in GdeDaJedemEntities.TipoviRestoranas)
            {
                if (tip.RestoranID == restoranID)
                {
                    TipBO tipBO = new TipBO
                    {
                        TipID = tip.TipId,
                        Naziv = tip.Naziv,
                        RestoranID = tip.RestoranID
                    };
                    tipovi.Add(tipBO);
                }

            }
            return tipovi;
        }

        public void Update(TipBO tip)
        {
            throw new NotImplementedException();
        }
    }
}