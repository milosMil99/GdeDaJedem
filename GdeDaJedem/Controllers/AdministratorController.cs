using GdeDaJedem.Domain;
using GdeDaJedem.Domain.Repository;
using GdeDaJedem.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace GdeDaJedem.Controllers
{
    [Authorize]
    public class AdministratorController : Controller
    {
        private IKorisnikRepository _korisnikRepository;
        private IRestoranRepository _restoranRepository;
        private IKomentarRepository _komentarRepository;
        private IKorisnikRolaRepository _korisnikRolaRepository;
        
        public AdministratorController()
        {
            _korisnikRepository = new KorisnikRepository();
            _restoranRepository = new RestoranRepository();
            _komentarRepository = new KomentarRepository();
            _korisnikRolaRepository = new KorisnikRolaRepository();
        }
        // GET: Administrator
        public ActionResult Index()
        {
            return View();
        }


        [Authorize(Roles = "Administrator")]
        public ActionResult AdminPanel()
        {
            IEnumerable<RestoranBO> restorani = _restoranRepository.GetAll();
            List<KorisnikBO> korisnici = _korisnikRepository.GetAllUsers();
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();
            return View(restorani);
        }

        public ActionResult CreateRestoran()
        {
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();
            return PartialView("CreateRestoran");
            
        }

        [HttpPost]
        public ActionResult CreateRestoran(RestoranBO restoran)
        {
            if(ModelState.IsValid)
            {
                _restoranRepository.Create(restoran);
            }
            
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();

            return RedirectToAction("AdminPanel", "Administrator");
        }
        
        public ActionResult UpdateRestoran(int id)
        {
            RestoranBO restoran = _restoranRepository.GetByID(id);
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();
            return View(restoran);
        }

        [HttpPost]
        public ActionResult UpdateRestoran(RestoranBO restoran)
        {
            
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();
            _restoranRepository.Update(restoran);
            return RedirectToAction("AdminPanel", "Administrator");
        }

        public ActionResult DeleteRestoran(int id)
        {
           
            RestoranBO restoran = _restoranRepository.GetByID(id);
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();
            return View(restoran);
        }

        [HttpPost]
        public ActionResult DeleteRestoran(string pib)
        {
            RestoranBO restoran = _restoranRepository.GetByPIB(pib);
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();
            _restoranRepository.Delete(restoran);
            return RedirectToAction("AdminPanel", "Administrator");
        }


        public ActionResult DeleteKorisnik(int id)
        {
            KorisnikBO korisnikBO = _korisnikRepository.GetUserByID(id);
            return View(korisnikBO);
        }


        [HttpPost]
        public ActionResult DeleteKorisnik(string user)
        {
            KorisnikBO korisnikBO = _korisnikRepository.GetUserByName(user);

            _korisnikRepository.DeleteRolaKorisnik(korisnikBO.KorisnikID);


            //_korisnikRepository.Delete(korisnikBO);
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();
            return RedirectToAction("AdminPanel", "Administrator");
        }

        public ActionResult PrikazKomentara(int id)
        {
            List<KomentarBO> komentari = _komentarRepository.GetByRestoranID(id);
            return View(komentari);
        }
        public ActionResult DeleteKomentar(int id)
        {
            _komentarRepository.Delete(id);
            ViewBag.opstine = _restoranRepository.GetAllOpstina().ToList();
            return RedirectToAction("AdminPanel", "Administrator");
           
        }

    }
}