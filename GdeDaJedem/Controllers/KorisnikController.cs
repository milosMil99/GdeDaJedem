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
    
    public class KorisnikController : Controller
    {
        private IKorisnikRepository _korisnikRepository;
        private ITipRepository _tipRepository;
        private IKomentarRepository _komentarRepository;

        public KorisnikController()
        {
            _korisnikRepository = new KorisnikRepository();
            _tipRepository = new TipRepository();
            _komentarRepository = new KomentarRepository();
        }
        // GET: Korisnik
        
        public ActionResult Index(int id)
        {
            ViewBag.KomentariKorisnika = _komentarRepository.GetByUserID(id);
            KorisnikBO korisnikBO = _korisnikRepository.GetUserByID(id);
            return View(korisnikBO);
        }

        

        public PartialViewResult Login()
        {
            ViewBag.Tipovi = _tipRepository.GetAll();
            return PartialView("View");
        }
        [HttpPost]
        public ActionResult Login(string user, string pass)
        {
            ViewBag.Tipovi = _tipRepository.GetAll();
            
            if (_korisnikRepository.IsValid(user, pass))
            {
                FormsAuthentication.SetAuthCookie(user, false);
                
                KorisnikBO korisnikBO1 = _korisnikRepository.GetUserByName(user);
                ViewBag.KorisnikRola = _korisnikRepository.GetRolesForUser(korisnikBO1.Username);
                return RedirectToAction("Index", "Home", new { model = korisnikBO1});
                //return View(korisnikBO1);
            }
           
            return RedirectToAction("Index", "Home");
            

        }

        
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }//Logout()


        public ActionResult CreateKorisnik()
        {
            return View();
        }


        [HttpPost]
        public ActionResult CreateKorisnik(KorisnikBO korisnikBO)
        {
            _korisnikRepository.Create(korisnikBO);

            KorisnikBO korisnik = _korisnikRepository.GetUserByName(korisnikBO.Username);

            _korisnikRepository.AddRoleToKorisnik(2, korisnik.KorisnikID);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult DeleteKomentar(int KomentarID, int korisnikID)
        {
            _komentarRepository.Delete(KomentarID);
            return RedirectToAction("Index", "Korisnik", new { id=korisnikID});
        }

        [HttpGet]
        public ActionResult UpdateKomentar(int KomentarID)
        {
            KomentarBO komentarBO = _komentarRepository.GetByID(KomentarID);
            return View(komentarBO);
        }

        [HttpPost]
        public ActionResult UpdateKomentar(KomentarBO komentarBO)
        {
            _komentarRepository.Update(komentarBO);

            return RedirectToAction("Index", "Korisnik", new { id = komentarBO.KorisnikID });
        }

    }
}