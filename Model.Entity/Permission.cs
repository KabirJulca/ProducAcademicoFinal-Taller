using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class Permission
    {
        public Permission(int permissionID, string idModulo, int menuID)
        {
            PermissionID = permissionID;
            IdModulo = idModulo;
            MenuID = menuID;
        }

        public Permission()
        {
        }

        public Permission(string idModulo, int menuID)
        {
            IdModulo = idModulo;
            MenuID = menuID;
        }

        public int PermissionID { get; set; }

        public string IdModulo { get; set; }

        public int MenuID { get; set; }

        public virtual Menu Menu { get; set; }
        public virtual Rol Roles { get; set; }

    }
}
