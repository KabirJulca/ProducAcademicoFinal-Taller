using Model.Dao;
using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFacturaMvc.Controllers
{
    public class AdminRolesController : Controller
    {
        RolDao objRolDao = new RolDao();

        // GET: AdminRoles
        public ActionResult Index()
        {
            List<Rol> listaRoles = objRolDao.findAll();
            return View(listaRoles);
        }
    }
}