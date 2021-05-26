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
    public class KomentarController : Controller
    {
        IKorisnikRepository _korisnikRepository;
        IKomentarRepository _komentarRepository;
        // GET: Komentar

        public KomentarController()
        {
            _korisnikRepository = new KorisnikRepository();
            _komentarRepository = new KomentarRepository();
        }
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Komentarisi(int restoranID, string user, string ocena, string opis)
        {
            KomentarBO komentarBO = new KomentarBO();

            KorisnikBO korisnik = _korisnikRepository.GetUserByName(user);

            komentarBO.KorisnikID = korisnik.KorisnikID;
            komentarBO.Ocena = Convert.ToDouble(ocena);
            komentarBO.Opis = opis;
            komentarBO.RestoranID = restoranID;

            _komentarRepository.Create(komentarBO);

            return RedirectToAction("Index", "Restoran", new { id = restoranID });
        }
    }
}