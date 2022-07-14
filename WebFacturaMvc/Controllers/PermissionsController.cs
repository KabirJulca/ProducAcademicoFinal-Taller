using Model.Dao;
using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebFacturaMvc.Controllers
{
    public class PermissionsController : Controller
    {
        PermissionDao objPermissionDao = new PermissionDao();
        CustomPermissionDao objCustomPermissionDao = new CustomPermissionDao();
        ModuloDao objModuloDao = new ModuloDao();
        RolDao objRolDao = new RolDao();
        UsuarioDao objUsuarioDao = new UsuarioDao();
        MenuDao objMenuDao = new MenuDao();
        PermissionMenuDao objPermissionMenuDao = new PermissionMenuDao();
        // GET: Permissions
        public ActionResult Index()
        {
            ViewBag.IdModulo = new SelectList(objModuloDao.findAll(), "IdModulo", "NameModulo");
            ViewBag.IdUsuario = new SelectList(objUsuarioDao.findAll(), "IdUsuario", "EmailUsuario");
            //IEnumerable<PermissionMenu> menus = objPermissionMenuDao.findAllByIdModulo(new Modulo(0));

            //cargar un menu vacio
            ViewBag.Menus = objMenuDao.menuEmpty(new Menu(0));

            var permission = objPermissionDao.findAll();
            return View(permission.ToList());

        }
        [HttpPost]
        public ActionResult Index(string IdModulo, string IdUsuario)
        {
            IEnumerable<PermissionMenu> menus = null;

            //IEnumerable<PermissionMenu> menus = db.Database.SqlQuery<PermissionMenu>("SP_GetMenu @UserId ='" + User.Identity.GetUserId() + "',@RoleId = NULL");
            if (!string.IsNullOrEmpty(IdUsuario))
            {
                int moduloId = 0;
                int usuarioId = int.Parse(IdUsuario);
                menus = null;
                menus = objPermissionMenuDao.findAllByIdModuloOrByIdUsuario(new Usuario(usuarioId), new Modulo(moduloId));

            }
            if (!string.IsNullOrEmpty(IdModulo))
            {
                int moduloId = int.Parse(IdModulo);
                int usuarioId = 0;
                menus = null;
                menus = objPermissionMenuDao.findAllByIdModuloOrByIdUsuario(new Usuario(usuarioId),new Modulo(moduloId));

            }

            ViewBag.IdModulo = new SelectList(objModuloDao.findAll(), "IdModulo", "NameModulo");
            ViewBag.IdUsuario = new SelectList(objUsuarioDao.findAll(), "IdUsuario", "EmailUsuario");

            ViewBag.Menus = menus.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult SavePermission(string query, string qtype)
        {
            string fquery = "{\"PERMISSION\":" + query + "}";

            if (qtype == "r")
            {
                /*DELETING ROWS*/
                var data = Newtonsoft.Json.Linq.JObject.Parse(fquery);
                String moduloId = Convert.ToString(data["PERMISSION"][0]["IdModulo"]);
                               
                objPermissionDao.deleteByModulo(new Modulo(int.Parse(moduloId)));
                
                int MenuId;
                string IdModulo;
                bool res = false;
                for (int i = 0; i < data["PERMISSION"].Count(); i++)
                {
                    MenuId = (int)data["PERMISSION"][i]["MenuID"];
                    IdModulo = (string)data["PERMISSION"][i]["IdModulo"];
                    res=objPermissionDao.Add(new Permission(IdModulo, MenuId));
                }
                try
                {
                    if (res)
                    {
                        TempData["ResultMessage"] = "Los datos se guardaron correctamente";
                        TempData["ResultType"] = "S";
                    }
                    
                }
                catch (Exception ex)
                {

                    TempData["ResultMessage"] = "Error al guardar los datos! " + ex.Message;
                    TempData["ResultType"] = "E";
                }
            }

            if (qtype == "u")
            {
                /*DELETING ROWS*/
                var data = Newtonsoft.Json.Linq.JObject.Parse(fquery);
                String userId = Convert.ToString(data["PERMISSION"][0]["IdUsuario"]);

                objCustomPermissionDao.deleteByUsuarioId(new Usuario(int.Parse(userId)));

                bool res = false;
                int MenuId;
                string idUsuario;
                for (int i = 0; i < data["PERMISSION"].Count(); i++)
                {
                    MenuId = (int)data["PERMISSION"][i]["MenuID"];
                    idUsuario = (String)data["PERMISSION"][i]["IdUsuario"];
                    res=objCustomPermissionDao.Add(new CustomPermission (idUsuario, MenuId));
                }
                try
                {
                    if (res)
                    {
                        TempData["ResultMessage"] = "Los datos se guardaron correctamente";
                        TempData["ResultType"] = "S";
                    }
                }
                catch (Exception ex)
                {

                    TempData["ResultMessage"] = "Error al guardar los datos! " + ex.Message;
                    TempData["ResultType"] = "E";
                }

            }


            return RedirectToAction("Index");
        }


    }
}