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
    public class HomeController : Controller
    {
        GdeDaJedemEntities db = new GdeDaJedemEntities();

        private ITipRepository _tipRepository;
        private IKorisnikRepository _korisnikRepository;
        

        public HomeController()
        { 
            _tipRepository = new TipRepository();
            _korisnikRepository = new KorisnikRepository();
        }
        public ActionResult Index()
        {
            ViewBag.Korisnici = _korisnikRepository.GetAllUsers();
            ViewBag.Tipovi = _tipRepository.GetAll();
            return View();
        }

        



        public JsonResult GetSearchValue(string search)
        {

            List<RestoranBO> allsearch = db.Restorans.Where(x => x.Naziv.Contains(search)).Select(x => new RestoranBO
            {
                restoranID = x.RestoranID,
                Naziv = x.Naziv
            }).ToList();


            return new JsonResult { Data = allsearch, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public JsonResult GetSearchValueOpstina(string search)
        {
            List<OpstinaBO> allsearch1 = db.Opstines.Where(x => x.naziv.StartsWith(search)).Select(x => new OpstinaBO
            {
                OpstinaID = x.opstinaID,
                Naziv = x.naziv

            }).ToList();

            return new JsonResult { Data = allsearch1, JsonRequestBehavior = JsonRequestBehavior.AllowGet };  
        }
        
    }
}