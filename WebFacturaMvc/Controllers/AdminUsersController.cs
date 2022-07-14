using Model.Dao;
using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFacturaMvc.Controllers
{
    public class AdminUsersController : Controller
    {
        private UsuarioDao objUsuarioDAO = new UsuarioDao();
        private RolDao objRolDao = new RolDao();
        // GET: AdminUsers
        public ActionResult Index()
        {
            List<Usuario> listaUsuario = objUsuarioDAO.findAll();
            return View(listaUsuario);
        }

        public ActionResult Create()
        {
            //Get the list of Roles
            ViewBag.RoleId = new SelectList(objRolDao.findAll(), "NameRol", "NameRol");
            return View();
        }
    }
}