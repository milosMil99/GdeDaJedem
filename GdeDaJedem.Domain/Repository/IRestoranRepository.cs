using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Domain.Repository
{
    public interface IRestoranRepository
    {
        IEnumerable<RestoranBO> GetAll();
        RestoranBO GetByID(int id);
        RestoranBO GetByPIB(string pib);
        IEnumerable<RestoranBO> GetByNaziv(string naziv);
        IEnumerable<RestoranBO> GetByAdresa(string adresa);
        IEnumerable<RestoranBO> GetByTip(List<string> tipovi);
        IEnumerable<RestoranBO> GetByTipAndAdresa(string adresa, List<string> tipovi);

        void Create(RestoranBO restoran);
        void Delete(RestoranBO restoran);
        void Update(RestoranBO restoran);

        List<OpstinaBO> GetAllOpstina();


    }
}
