using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class Usuario
    {
        private int idUsuario;
        private string nombreUsuario;
        private string loginUsuario;
        private string passUsuario;
        private string emailUsuario;
        private string pathImgUsuario;
        private List<Rol> listaRoles;
        private List<Perfil> listaPerfil;

        public Usuario()
        {
        }

        public Usuario(int idUsuario)
        {
            this.IdUsuario = idUsuario;
        }

        public Usuario(int idUsuario, string nombreUsuario, string loginUsuario, string passUsuario, string emailUsuario, string pathImgUsuario, List<Rol> listaRoles, List<Perfil> listaPerfil)
        {
            this.IdUsuario = idUsuario;
            this.NombreUsuario = nombreUsuario;
            this.LoginUsuario = loginUsuario;
            this.PassUsuario = passUsuario;
            this.EmailUsuario = emailUsuario;
            this.PathImgUsuario = pathImgUsuario;
            this.ListaRoles = listaRoles;
            this.ListaPerfil = listaPerfil;
        }

        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public string NombreUsuario { get => nombreUsuario; set => nombreUsuario = value; }
        public string LoginUsuario { get => loginUsuario; set => loginUsuario = value; }
        public string PassUsuario { get => passUsuario; set => passUsuario = value; }
        public string EmailUsuario { get => emailUsuario; set => emailUsuario = value; }
        public string PathImgUsuario { get => pathImgUsuario; set => pathImgUsuario = value; }
        public List<Rol> ListaRoles { get => listaRoles; set => listaRoles = value; }
        public List<Perfil> ListaPerfil { get => listaPerfil; set => listaPerfil = value; }
    }
}
