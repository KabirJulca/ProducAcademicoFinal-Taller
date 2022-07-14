using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace  Model.Entity
{
    public class ModuloPerfil
    {
        private Perfil idPerfil;
        private Modulo idModulo;

        public ModuloPerfil()
        {
        }

        public ModuloPerfil(Perfil idPerfil, Modulo idModulo)
        {
            this.IdPerfil = idPerfil;
            this.IdModulo = idModulo;
        }

        public Modulo IdModulo { get => idModulo; set => idModulo = value; }
        internal Perfil IdPerfil { get => idPerfil; set => idPerfil = value; }
    }
}
