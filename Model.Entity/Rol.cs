using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class Rol
    {
        private int idRol;
        private string nameRol;
        private string descRol;
        private DateTime dateRol;
        private Modulo idModulo;
        private List<Usuario> listaUsuario;

        public Rol()
        {
        }

        public Rol(int idRol)
        {
            this.IdRol = idRol;
        }


        public Rol(int idRol, string nameRol, string descRol, DateTime dateRol, Modulo idModulo, List<Usuario> listaUsuario)
        {
            this.IdRol = idRol;
            this.NameRol = nameRol;
            this.DescRol = descRol;
            this.DateRol = dateRol;
            this.IdModulo = idModulo;
            this.ListaUsuario = listaUsuario;
        }

        public int IdRol { get => idRol; set => idRol = value; }
        public string NameRol { get => nameRol; set => nameRol = value; }
        public string DescRol { get => descRol; set => descRol = value; }
        public DateTime DateRol { get => dateRol; set => dateRol = value; }
        public Modulo IdModulo { get => idModulo; set => idModulo = value; }
        public List<Usuario> ListaUsuario { get => listaUsuario; set => listaUsuario = value; }
    }
}
