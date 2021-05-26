using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GdeDaJedem.Domain.Repository
{
    public interface ITipRepository
    {
        IEnumerable<TipBO> GetAll();
        TipBO GetByID(int id);
        TipBO GetByNaziv(string naziv);
        
        IEnumerable<TipBO> GetByRestoranID(int restoranID);

        void Create(TipBO tip);
        void Delete(int id);
        void Update(TipBO tip);
    }
}
