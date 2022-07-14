using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class CustomPermission
    {
        public CustomPermission(int customPermissionID, string userID, int menuID)
        {
            CustomPermissionID = customPermissionID;
            UserID = userID;
            MenuID = menuID;
        }

        public CustomPermission()
        {
        }

        public CustomPermission(int customPermissionID)
        {
            CustomPermissionID = customPermissionID;
        }

        public CustomPermission(string userID, int menuID)
        {
            UserID = userID;
            MenuID = menuID;
        }

        public int CustomPermissionID { get; set; }

        public string UserID { get; set; }

        public int MenuID { get; set; }

        public virtual Menu Menu { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}
