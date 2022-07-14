using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class PerfilUsuario
    {
        private Usuario idUsuario;
        private Perfil idPerfil;

        public PerfilUsuario()
        {
        }

        public PerfilUsuario(Usuario idUsuario, Perfil idPerfil)
        {
            this.IdUsuario = idUsuario;
            this.IdPerfil = idPerfil;
        }

        public Usuario IdUsuario { get => idUsuario; set => idUsuario = value; }
        public Perfil IdPerfil { get => idPerfil; set => idPerfil = value; }
    }
}
