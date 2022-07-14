using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class ModuloMenu
    {
        Modulo idModulo;
        Menu MenuID;

        public ModuloMenu(Modulo idModulo, Menu menuID)
        {
            this.idModulo = idModulo;
            MenuID = menuID;
        }

        public Modulo IdModulo { get => idModulo; set => idModulo = value; }
        public Menu MenuID1 { get => MenuID; set => MenuID = value; }
    }
}
