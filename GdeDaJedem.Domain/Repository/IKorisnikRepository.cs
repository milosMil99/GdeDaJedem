using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Domain.Repository
{
    public interface IKorisnikRepository
    {
        bool IsValid(string user, string pass);

        KorisnikBO GetUserByID(int korisnikID);
        KorisnikBO GetUserByName(string user);
        List<KorisnikBO> GetAllUsers();
        void DeleteRolaKorisnik(int korisnikID);
        List<string> GetRolesForUser(string username);
        void Create(KorisnikBO korisnikBO);
        void AddRoleToKorisnik(int rolaID, int korisnikID);
        void Delete(KorisnikBO korisnikBO);
        void Update(KorisnikBO korisnikBO);
    }
}
