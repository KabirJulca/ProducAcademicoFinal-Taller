using Model.Dao;
using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFacturaMvc.Controllers
{
   
    public class HomeController : Controller
    {
        // GET: Home

        public ActionResult Index()
        { 
            return View();
        }
        public ActionResult LoadMenu()
        {
            Usuario objUsuario = (Usuario)Session["objUsuario"];
            string codigo = objUsuario.IdUsuario.ToString();
            objUsuario.IdUsuario = int.Parse(codigo);

            MenuDao objmenuDao = new MenuDao();
            IEnumerable<Menu> lista = objmenuDao.findAllByIdUsuario(objUsuario);
            return View(lista);
        }
        
    }
}