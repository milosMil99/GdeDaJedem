using GdeDaJedem.Domain.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GdeDaJedem.Domain;
using GdeDaJedem.Entity;

namespace GdeDaJedem.Controllers
{
    public class RestoranController : Controller
    {

        private GdeDaJedemEntities db = new GdeDaJedemEntities();


        private IRestoranRepository _restoranRepository;
        private ITipRepository _tipRepository;
        private IKomentarRepository _komentarRepository;
        // GET: Restoran

        public RestoranController()
        {
            _restoranRepository = new RestoranRepository();
            _tipRepository = new TipRepository();
            _komentarRepository = new KomentarRepository();
        }

        public ActionResult Pretraga(string search)
        {
            var pretraga = from p in db.Restorans
                           select p;

            if (!String.IsNullOrEmpty(search))
            {
                pretraga = pretraga.Where(s => s.Naziv.Contains(search));
            }

            return View(pretraga.ToList());
        }

        public ActionResult Index(int id)
        {
            ViewBag.Komentari = _komentarRepository.GetByRestoranID(id);
            RestoranBO restoran = _restoranRepository.GetByID(id);
            return View(restoran);
        }
        [HttpGet]
        public ActionResult SviRestorani(List<string> filteri)
        {
            ViewBag.Tipovi = _tipRepository.GetAll();
            if (filteri == null)
            {
                //filteri.Add("Pizza");
                IEnumerable<RestoranBO> restorani = _restoranRepository.GetAll();
                return View(restorani);
            }
            else
            {
                IEnumerable<RestoranBO> restorani1 = null;
                foreach (var item in filteri)
                {
                    restorani1 = _restoranRepository.GetByTip(filteri);

                }
                return View(restorani1);
            }
        }
        [HttpGet]
        public ActionResult PrikazRestorana(string search)
        {
            ViewBag.Tipovi = _tipRepository.GetAll();


            IEnumerable<RestoranBO> restorani = _restoranRepository.GetByNaziv(search);
   

            return View(restorani);
        }

        [HttpPost]
        public ActionResult PrikazRestorana(string adresa, List<string> tipovi)
        {
            ViewBag.Tipovi = _tipRepository.GetAll();
            if(tipovi == null)
            {
                IEnumerable<RestoranBO> restorani = _restoranRepository.GetByAdresa(adresa);
                return View(restorani);
            }
            else if(adresa == null)
            {
                IEnumerable<RestoranBO> restorani = _restoranRepository.GetByTip(tipovi);
                return View(restorani);
            }
            else
            {
                IEnumerable<RestoranBO> restorani = _restoranRepository.GetByTipAndAdresa(adresa, tipovi);
                return View(restorani);
            }
        }
    }
}