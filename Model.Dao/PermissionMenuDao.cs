using Model.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class PermissionMenuDao : Repositorio<PermissionMenu>
    {
        private ConexionDB objConexion;
        private SqlCommand comando;
        private SqlDataReader reader;
        public PermissionMenuDao()
        {
            objConexion = ConexionDB.saberEstado();
        }
        public void create(PermissionMenu obj)
        {
            throw new NotImplementedException();
        }

        public void delete(PermissionMenu obj)
        {
            throw new NotImplementedException();
        }

        public List<PermissionMenu> findAllByIdModuloOrByIdUsuario(Usuario objUsuario,Modulo objModulo)
        {
            List<PermissionMenu> lista=new List<PermissionMenu>();
            PermissionMenu objPermissionMenu;
            try
            {
                int idUsuario = objUsuario.IdUsuario;
                int idModulo = objModulo.IdModulo;

                string find = "SP_GetMenu @idUsuario,@idModulo";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@idUsuario", objUsuario.IdUsuario);
                comando.Parameters.AddWithValue("@idModulo", objModulo.IdModulo);

                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    objPermissionMenu = new PermissionMenu();
                    objPermissionMenu.MenuID = int.Parse(reader["MenuID"].ToString());
                    objPermissionMenu.DisplayName = reader["DisplayName"].ToString();
                    objPermissionMenu.ParentMenuID = int.Parse(reader["ParentMenuID"].ToString());
                    objPermissionMenu.PermissionType = Convert.ToInt32(reader["PermissionType"].ToString());
                    objPermissionMenu.Permission = Convert.ToBoolean(reader["Permission"]);
                   
                    lista.Add(objPermissionMenu);
                }

            }
            catch (SqlException e)
            {
                throw;
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }
            return lista;
        }

        public List<PermissionMenu> findAll()
        {
            throw new NotImplementedException();
        }

        public void update(PermissionMenu obj)
        {
            throw new NotImplementedException();
        }

        public PermissionMenu find(PermissionMenu obj)
        {
            throw new NotImplementedException();
        }
    }
}
