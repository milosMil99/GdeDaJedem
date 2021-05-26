using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Domain.Repository
{
    public interface IKomentarRepository
    {
        KomentarBO GetByID(int KomentarID);
        List<KomentarBO> GetAll();
        List<KomentarBO> GetByRestoranID(int id);
        List<KomentarBO> GetByUserID(int id);

        void Create(KomentarBO komentarBO);
        void Delete(int id);
        void Update(KomentarBO komentarBO);
    }
}
