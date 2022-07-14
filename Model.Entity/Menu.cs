using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
   public class Menu
    {
        private int menuID;
        private string displayName;
        private int parentMenuID;
        private int orderNumber;
        private string menuURL;
        private string menuIcon;
        public List<Permission> Permission { get; set; }

        public int MenuID { get => menuID; set => menuID = value; }
        public string DisplayName { get => displayName; set => displayName = value; }
        public int ParentMenuID { get => parentMenuID; set => parentMenuID = value; }
        public int OrderNumber { get => orderNumber; set => orderNumber = value; }
        public string MenuURL { get => menuURL; set => menuURL = value; }
        public string MenuIcon { get => menuIcon; set => menuIcon = value; }

        public Menu(int menuID, string displayName, int parentMenuID, int orderNumber, string menuURL, string menuIcon)
        {
            this.MenuID = menuID;
            this.DisplayName = displayName;
            this.ParentMenuID = parentMenuID;
            this.OrderNumber = orderNumber;
            this.MenuURL = menuURL;
            this.MenuIcon = menuIcon;
        }

        public Menu()
        {
        }

        public Menu(int menuID)
        {
            this.MenuID = menuID;
        }

    }
}
