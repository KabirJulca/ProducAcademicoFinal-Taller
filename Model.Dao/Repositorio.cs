using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public interface Repositorio<CualquierClase>
    {
        void create(CualquierClase obj);
        void update(CualquierClase obj);
        void delete(CualquierClase obj);
        CualquierClase find(CualquierClase obj);
        List<CualquierClase>findAll();


    }
}
