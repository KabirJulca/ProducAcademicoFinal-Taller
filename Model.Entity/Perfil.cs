using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class Perfil
    {
        int idPerfil;
        string namePerfil;
        string descPerfil;
        DateTime datePerfil;
        private List<Usuario> listaUsuario;
        private List<Modulo> listaModulo;

        public Perfil()
        {
        }

        public Perfil(int idPerfil)
        {
            this.IdPerfil = idPerfil;
        }

        public Perfil(int idPerfil, string namePerfil, string descPerfil, DateTime datePerfil, List<Usuario> listaUsuario, List<Modulo> listaModulo)
        {
            this.IdPerfil = idPerfil;
            this.NamePerfil = namePerfil;
            this.DescPerfil = descPerfil;
            this.DatePerfil = datePerfil;
            this.ListaUsuario = listaUsuario;
            this.ListaModulo = listaModulo;
        }

        public int IdPerfil { get => idPerfil; set => idPerfil = value; }
        public string NamePerfil { get => namePerfil; set => namePerfil = value; }
        public string DescPerfil { get => descPerfil; set => descPerfil = value; }
        public DateTime DatePerfil { get => datePerfil; set => datePerfil = value; }
        public List<Usuario> ListaUsuario { get => listaUsuario; set => listaUsuario = value; }
        public List<Modulo> ListaModulo { get => listaModulo; set => listaModulo = value; }
    }
}
