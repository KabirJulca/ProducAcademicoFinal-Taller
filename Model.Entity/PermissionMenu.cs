using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class PermissionMenu
    {
        public PermissionMenu()
        {

        }

        public int MenuID { get; set; }
        public string DisplayName { get; set; }
        public int ParentMenuID { get; set; }
        public int PermissionType { get; set; }
        public bool Permission { get; set; }
    }
}
