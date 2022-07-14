using Model.Dao;
using Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace WebFacturaMvc.Controllers
{

    public class AccountController : Controller
    {
        // GET: Account
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {        
            return View();
        }

        
        [HttpPost]
        public ActionResult LoginValidaAjax(string txtcorreo,string txtpassword)
        {
            try
            {
                string mensaje = "";
                if(Session["objUsuario"] != null)
                {
                    Usuario objUsuario = (Usuario)Session["objUsuario"];
                    objUsuario.LoginUsuario = txtcorreo;
                    UsuarioDao objUsuarioDao = new UsuarioDao();
                    objUsuarioDao.find(objUsuario);

                    int codigo = Convert.ToInt32(objUsuario.IdUsuario);
                    string clave = objUsuario.PassUsuario;

                    if (codigo > 0)
                    {
                        if (txtpassword == clave)
                        {
                            mensaje = "1";//clave correcta
                            Session["datosUsuario"] = objUsuario.NombreUsuario;

                        }
                        else
                        {
                            mensaje = "2";//clave incorrecta
                        }
                    }
                    else
                    {
                        mensaje = "0";//usuario no existe
                    }
                    return Json(mensaje);
                }
                else
                {
                    Usuario objUsuarioTemp = new Usuario();
                    objUsuarioTemp.LoginUsuario = txtcorreo;

                    UsuarioDao objUsuarioDao = new UsuarioDao();                    
                    Usuario objUsuario = objUsuarioDao.find(objUsuarioTemp);
                    Session["objUsuario"] = objUsuario;

                    int codigoUsuario = Convert.ToInt32(objUsuario.IdUsuario);
                    string clave = objUsuario.PassUsuario;

                    if (codigoUsuario > 0)
                    {
                        if (txtpassword == clave)
                        {
                            mensaje = "1";//clave correcta
                            Session["datosUsuario"] = objUsuario.NombreUsuario;

                        }
                        else
                        {
                            mensaje = "2";//clave incorrecta
                        }
                    }
                    else
                    {
                        mensaje = "0";//usuario no existe
                    }
                    return Json(mensaje);
                }                

            }
            catch (ApplicationException x)
            {
                ViewBag.mensaje = x.Message;
                return RedirectToAction("Index", "Home", new { mensaje = x.Message, identificador = 1 });
            }
            catch (Exception e)
            {

                return RedirectToAction("Index", "Home", new { mensaje = e.Message, identificador = 2 });
            }

        }

        /*
        [HttpPost]
        public ActionResult LoadMenu()
        {
            //LoadMenus();
            return RedirectToAction("Index", "Home");
        }

        public void LoadMenus()
        {
            Usuario objUsuario = (Usuario)Session["objUsuario"];
            string codigo = objUsuario.IdUsuario.ToString();
            objUsuario.IdUsuario =int.Parse(codigo);
            MenuDao objmenuDao = new MenuDao();
            IEnumerable<Menu> lista = objmenuDao.findAllByIdUsuario(objUsuario);
        }*/

        // POST: /Account/LogOff
        [HttpPost]
        public ActionResult LogOff()
        {
            //AuthenticationManager.SignOut();
            return RedirectToAction("Index", "Home");
        }

    }
}