using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class Modulo
    {
        private int idModulo;
        private string nameModulo;
        private string descModulo;
        private DateTime dateModulo;
        private List<Menu> listaMenu;
        private List<Perfil> listaPerfil;
        private List<Rol> listaRol;

        public Modulo()
        {
        }

        public Modulo(int idModulo)
        {
            this.IdModulo = idModulo;
        }

        public Modulo(int idModulo, string nameModulo, string descModulo, DateTime dateModulo, List<Menu> listaMenu, List<Perfil> listaPerfil, List<Rol> listaRol)
        {
            this.IdModulo = idModulo;
            this.NameModulo = nameModulo;
            this.DescModulo = descModulo;
            this.DateModulo = dateModulo;
            this.ListaMenu = listaMenu;
            this.ListaPerfil = listaPerfil;
            this.ListaRol = listaRol;
        }

        public int IdModulo { get => idModulo; set => idModulo = value; }
        public string NameModulo { get => nameModulo; set => nameModulo = value; }
        public string DescModulo { get => descModulo; set => descModulo = value; }
        public DateTime DateModulo { get => dateModulo; set => dateModulo = value; }
        public List<Menu> ListaMenu { get => listaMenu; set => listaMenu = value; }
        public List<Perfil> ListaPerfil { get => listaPerfil; set => listaPerfil = value; }
        public List<Rol> ListaRol { get => listaRol; set => listaRol = value; }
    }
}
