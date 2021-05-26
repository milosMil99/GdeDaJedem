using GdeDaJedem.Domain;
using GdeDaJedem.Domain.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Entity
{
    public class RestoranRepository : IRestoranRepository
    {
        GdeDaJedemEntities GdeDaJedemEntities = new GdeDaJedemEntities();

        
        public void Create(RestoranBO restoran)
        {
            Restoran res = new Restoran();
            res.RestoranID = restoran.restoranID;
            res.Naziv = restoran.Naziv;
            res.PIB = restoran.PIB;
            res.Adresa = restoran.Adresa;
            res.Email = restoran.Email;
            res.Telefon = restoran.Telefon;
            res.Opis = restoran.Opis;
            res.Slika = restoran.Slika;
            res.Mapa = restoran.Mapa;
            res.Opstina = restoran.Opstina;
            /*foreach (Opstine opstine in GdeDaJedemEntities.Opstines)
            {
                if (opstine.opstinaID == restoran.Opstina)
                {
                    OpstinaBO opstinaBO = new OpstinaBO();
                    opstinaBO.OpstinaID = opstine.opstinaID;
                    opstinaBO.Naziv = opstine.naziv;
                    res.Opstina = opstine.opstinaID;
                }
            }
            List<TipBO> tipovi = new List<TipBO>();
            foreach (TipoviRestorana tip in GdeDaJedemEntities.TipoviRestoranas)
            {
                if (tip.RestoranID == res.RestoranID)
                {
                    TipBO tipP = new TipBO();
                    tipP.RestoranID = tip.RestoranID;
                    tipP.Naziv = tip.Naziv;

                    tipovi.Add(tipP);
                }
            }
            restoran.Tipovi = tipovi;*/

            GdeDaJedemEntities.Restorans.Add(res);
            GdeDaJedemEntities.SaveChanges();

        }
          
        

        public void Delete(RestoranBO restoran)
        {
            Restoran res = GdeDaJedemEntities.Restorans.FirstOrDefault(x => x.RestoranID ==restoran.restoranID);

            GdeDaJedemEntities.Restorans.Remove(res);
            GdeDaJedemEntities.SaveChanges();

        }

        public IEnumerable<RestoranBO> GetAll()
        {
            List<RestoranBO> restorani = new List<RestoranBO>();

            foreach (Restoran res in GdeDaJedemEntities.Restorans)
            {
                RestoranBO restoran = new RestoranBO();
                restoran.restoranID = res.RestoranID;
                restoran.Naziv = res.Naziv;
                restoran.PIB = res.PIB;
                restoran.Adresa = res.Adresa;
                restoran.Email = res.Email;
                restoran.Telefon = res.Telefon;
                restoran.Opis = res.Opis;
                restoran.Slika = res.Slika;
                restoran.Mapa = res.Mapa;
                foreach (Opstine opstine in GdeDaJedemEntities.Opstines)
                {
                    if (opstine.opstinaID == res.Opstina)
                    {
                        OpstinaBO opstinaBO = new OpstinaBO();
                        opstinaBO.OpstinaID = opstine.opstinaID;
                        opstinaBO.Naziv = opstine.naziv;
                        restoran.NazivOpstine = opstinaBO.Naziv;
                    }
                }
                List<TipBO> tipovi = new List<TipBO>();
                foreach (TipoviRestorana tip in GdeDaJedemEntities.TipoviRestoranas)
                {
                    if (tip.RestoranID == res.RestoranID)
                    {
                        TipBO tipP = new TipBO();
                        tipP.RestoranID = tip.RestoranID;
                        tipP.Naziv = tip.Naziv;

                        tipovi.Add(tipP);
                    }
                }
                restoran.Tipovi = tipovi;

                restorani.Add(restoran);
            }
            return restorani;
        }

        public List<OpstinaBO> GetAllOpstina()
        {
            List<OpstinaBO> opstine = new List<OpstinaBO>();

            foreach(var item in GdeDaJedemEntities.Opstines)
            {
                OpstinaBO opstina = new OpstinaBO();
                opstina.OpstinaID = item.opstinaID;
                opstina.Naziv = item.naziv;

                opstine.Add(opstina);
            }

            return opstine;
        }

        public IEnumerable<RestoranBO> GetByAdresa(string adresa)
        {
            List<RestoranBO> listaResBO = new List<RestoranBO>();
            
            foreach (Restoran res in GdeDaJedemEntities.Restorans)
            {
                RestoranBO resBO = new RestoranBO();
                resBO.restoranID = res.RestoranID;
                resBO.Naziv = res.Naziv;
                resBO.PIB = res.PIB;
                resBO.Adresa = res.Adresa;
                resBO.Email = res.Email;
                resBO.Telefon = res.Telefon;
                resBO.Opis = res.Opis;
                resBO.Slika = res.Slika;
                resBO.Mapa = res.Mapa;
                foreach (Opstine opstine in GdeDaJedemEntities.Opstines)
                {
                    if (opstine.opstinaID == res.Opstina)
                    {
                        OpstinaBO opstinaBO = new OpstinaBO();
                        opstinaBO.OpstinaID = opstine.opstinaID;
                        opstinaBO.Naziv = opstine.naziv;
                        resBO.NazivOpstine = opstinaBO.Naziv;
                    }
                }
                List<TipBO> tipovi = new List<TipBO>();
                foreach (TipoviRestorana tip1 in GdeDaJedemEntities.TipoviRestoranas)
                {
                    if (tip1.RestoranID == res.RestoranID)
                    {
                        TipBO tipP = new TipBO();
                        tipP.RestoranID = tip1.RestoranID;
                        tipP.Naziv = tip1.Naziv;

                        tipovi.Add(tipP);
                    }
                }
                resBO.Tipovi = tipovi;
                if (resBO.NazivOpstine.Contains(adresa))
                {
                    listaResBO.Add(resBO);
                }          
            } 
            return listaResBO;
        }

        public RestoranBO GetByID(int id)
        {
            Restoran res = (Restoran)GdeDaJedemEntities.Restorans.FirstOrDefault(x => x.RestoranID == id);


            RestoranBO restoran = new RestoranBO();
            if (restoran == null) return restoran;
            restoran.restoranID = res.RestoranID;
            restoran.Naziv = res.Naziv;
            restoran.PIB = res.PIB;
            restoran.Adresa = res.Adresa;
            restoran.Telefon = res.Telefon;
            restoran.Email = res.Email;
            restoran.Opis = res.Opis;
            restoran.Slika = res.Slika;
            restoran.Mapa = res.Mapa;
            foreach (Opstine opstine in GdeDaJedemEntities.Opstines)
            {
                if (opstine.opstinaID == res.Opstina)
                {
                    OpstinaBO opstinaBO = new OpstinaBO();
                    opstinaBO.OpstinaID = opstine.opstinaID;
                    opstinaBO.Naziv = opstine.naziv;
                    restoran.NazivOpstine = opstinaBO.Naziv;
                    restoran.Opstina = opstinaBO.OpstinaID;
                }
            }
            List<TipBO> tipovi = new List<TipBO>();
            foreach (TipoviRestorana tip in GdeDaJedemEntities.TipoviRestoranas)
            {
                if (tip.RestoranID == res.RestoranID)
                {
                    TipBO tipP = new TipBO();
                    tipP.RestoranID = tip.RestoranID;
                    tipP.Naziv = tip.Naziv;

                    tipovi.Add(tipP);
                }
            }
            restoran.Tipovi = tipovi;
            return restoran;
        }

        public IEnumerable<RestoranBO> GetByNaziv(string search)
        {
            List<RestoranBO> listaResBO = new List<RestoranBO>();

            List<Restoran> restorani = new List<Restoran>();
            restorani = GdeDaJedemEntities.Restorans.Where(x => x.Naziv.Contains(search)).ToList();

            foreach (Restoran res in restorani)
            {
                RestoranBO resBO = new RestoranBO();
                resBO.restoranID = res.RestoranID;
                resBO.Naziv = res.Naziv;
                resBO.PIB = res.PIB;
                resBO.Adresa = res.Adresa;
                resBO.Email = res.Email;
                resBO.Telefon = res.Telefon;
                resBO.Opis = res.Opis;
                resBO.Slika = res.Slika;
                resBO.Mapa = res.Mapa;
                foreach (Opstine opstine in GdeDaJedemEntities.Opstines)
                {
                    if (opstine.opstinaID == res.Opstina)
                    {
                        OpstinaBO opstinaBO = new OpstinaBO();
                        opstinaBO.OpstinaID = opstine.opstinaID;
                        opstinaBO.Naziv = opstine.naziv;
                        resBO.NazivOpstine = opstinaBO.Naziv;
                    }
                }
                List<TipBO> tipovi = new List<TipBO>();
                foreach (TipoviRestorana tip1 in GdeDaJedemEntities.TipoviRestoranas)
                {
                    if (tip1.RestoranID == res.RestoranID)
                    {
                        TipBO tipP = new TipBO();
                        tipP.RestoranID = tip1.RestoranID;
                        tipP.Naziv = tip1.Naziv;

                        tipovi.Add(tipP);
                    }
                }
                resBO.Tipovi = tipovi;
                listaResBO.Add(resBO);
            }

            return listaResBO;
        }

        public RestoranBO GetByPIB(string pib)
        {
            RestoranBO restoranBO = new RestoranBO();

            Restoran restoran = GdeDaJedemEntities.Restorans.Where(x => x.PIB == pib).FirstOrDefault();

            restoranBO.restoranID = restoran.RestoranID;
            restoranBO.Naziv = restoran.Naziv;
            restoranBO.PIB = restoran.PIB;
            restoranBO.Adresa = restoran.Adresa;
            restoranBO.Telefon = restoran.Telefon;
            restoranBO.Email = restoran.Email;
            restoranBO.Opis = restoran.Opis;
            restoranBO.Slika = restoran.Slika;
            restoranBO.Mapa = restoran.Mapa;
            foreach (Opstine opstine in GdeDaJedemEntities.Opstines)
            {
                if (opstine.opstinaID == restoran.Opstina)
                {
                    OpstinaBO opstinaBO = new OpstinaBO();
                    opstinaBO.OpstinaID = opstine.opstinaID;
                    opstinaBO.Naziv = opstine.naziv;
                    restoranBO.NazivOpstine = opstinaBO.Naziv;
                    restoranBO.Opstina = opstinaBO.OpstinaID;
                }
            }
            List<TipBO> tipovi = new List<TipBO>();
            foreach (TipoviRestorana tip in GdeDaJedemEntities.TipoviRestoranas)
            {
                if (tip.RestoranID == restoran.RestoranID)
                {
                    TipBO tipP = new TipBO();
                    tipP.RestoranID = tip.RestoranID;
                    tipP.Naziv = tip.Naziv;

                    tipovi.Add(tipP);
                }
            }
            restoranBO.Tipovi = tipovi;


            return restoranBO;
        }

        public IEnumerable<RestoranBO> GetByTip(List<string> filteri)
        {
            List<RestoranBO> restorani = new List<RestoranBO>();
            foreach (var item in filteri)
            {
                foreach (Restoran res in GdeDaJedemEntities.Restorans)
                {
                    foreach (var tip in res.TipoviRestoranas)
                    {
                        if (tip.Naziv == item)
                        {
                            RestoranBO resBO = new RestoranBO();
                            resBO.restoranID = res.RestoranID;
                            resBO.Naziv = res.Naziv;
                            resBO.PIB = res.PIB;
                            resBO.Adresa = res.Adresa;
                            resBO.Email = res.Email;
                            resBO.Telefon = res.Telefon;
                            resBO.Opis = res.Opis;
                            resBO.Slika = res.Slika;
                            resBO.Mapa = res.Mapa;
                            foreach (Opstine opstine in GdeDaJedemEntities.Opstines)
                            {
                                if (opstine.opstinaID == res.Opstina)
                                {
                                    OpstinaBO opstinaBO = new OpstinaBO();
                                    opstinaBO.OpstinaID = opstine.opstinaID;
                                    opstinaBO.Naziv = opstine.naziv;
                                    resBO.NazivOpstine = opstinaBO.Naziv;
                                }
                            }
                            List<TipBO> tipovi = new List<TipBO>();
                            foreach (TipoviRestorana tip1 in GdeDaJedemEntities.TipoviRestoranas)
                            {
                                if (tip1.RestoranID == res.RestoranID)
                                {
                                    TipBO tipP = new TipBO();
                                    tipP.RestoranID = tip1.RestoranID;
                                    tipP.Naziv = tip1.Naziv;

                                    tipovi.Add(tipP);
                                }
                            }
                            resBO.Tipovi = tipovi;
                            restorani.Add(resBO);
                        }
                    }
                }
            }
            return restorani;
        }

        public IEnumerable<RestoranBO> GetByTipAndAdresa(string adresa, List<string> tipovi)
        {
            List<RestoranBO> listaResBO = new List<RestoranBO>();

            List<Restoran> restorani = new List<Restoran>();

            List<RestoranBO> listaResBO1 = new List<RestoranBO>();


            foreach (Restoran res in GdeDaJedemEntities.Restorans)
            {
                RestoranBO resBO = new RestoranBO();
                resBO.restoranID = res.RestoranID;
                resBO.Naziv = res.Naziv;
                resBO.PIB = res.PIB;
                resBO.Adresa = res.Adresa;
                resBO.Email = res.Email;
                resBO.Telefon = res.Telefon;
                resBO.Opis = res.Opis;
                resBO.Slika = res.Slika;
                resBO.Mapa = res.Mapa;
                foreach (Opstine opstine in GdeDaJedemEntities.Opstines)
                {
                    if (opstine.opstinaID == res.Opstina)
                    {
                        OpstinaBO opstinaBO = new OpstinaBO();
                        opstinaBO.OpstinaID = opstine.opstinaID;
                        opstinaBO.Naziv = opstine.naziv;
                        resBO.NazivOpstine = opstinaBO.Naziv;
                    }
                }
                List<TipBO> tipovi1 = new List<TipBO>();
                foreach (TipoviRestorana tip1 in GdeDaJedemEntities.TipoviRestoranas)
                {
                    if (tip1.RestoranID == res.RestoranID)
                    {
                        TipBO tipP = new TipBO();
                        tipP.RestoranID = tip1.RestoranID;
                        tipP.Naziv = tip1.Naziv;

                        tipovi1.Add(tipP);
                    }
                }
                resBO.Tipovi = tipovi1;
                listaResBO.Add(resBO);
            }
            listaResBO1 = listaResBO.Where(x => x.NazivOpstine.Contains(adresa)).ToList();

            List<RestoranBO> finalni = new List<RestoranBO>();
            foreach (RestoranBO res in listaResBO1)
            {
                foreach (var item in res.Tipovi)
                {
                    foreach (var tip in tipovi)
                    {
                        if (item.Naziv == tip)
                        {
                            finalni.Add(res);
                        }
                    }
                }
            }

            return finalni;
        }

        public void Update(RestoranBO restoran)
        {
            foreach(var item in GdeDaJedemEntities.Restorans)
            {
                if(item.RestoranID == restoran.restoranID)
                {
                    item.Naziv = restoran.Naziv;
                    item.PIB = restoran.PIB;
                    item.Adresa = restoran.Adresa;
                    item.Email = restoran.Email;
                    item.Telefon = restoran.Telefon;
                    item.Opis = restoran.Opis;
                    item.Slika = restoran.Slika;
                    item.Mapa = restoran.Mapa;
                    item.Opstina = restoran.Opstina;
                }
            }
            
            GdeDaJedemEntities.SaveChanges();
        }
    }
}

