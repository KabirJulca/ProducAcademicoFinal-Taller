using  Model.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class CustomPermissionDao
    {
        private ConexionDB objConexion;
        private SqlCommand comando;
        private SqlDataReader reader;

        public CustomPermissionDao()
        {
            objConexion = ConexionDB.saberEstado();
        }
        public bool Add(CustomPermission objCustomPermission)
        {
            bool cond = false;
            string create = "SP_CreateCustomPermission @usurioId,@menuId";
            try
            {
                comando = new SqlCommand(create, objConexion.getCon());
                comando.Parameters.AddWithValue("@usurioId", objCustomPermission.UserID);
                comando.Parameters.AddWithValue("@menuId", objCustomPermission.MenuID);
                objConexion.getCon().Open();
                int res = comando.ExecuteNonQuery();
                if (res == 1)
                {
                    cond = true;
                }
            }
            catch (Exception e)
            {
                e.Message.ToString();
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }
            return cond;
        }
        public void deleteByUsuarioId(Usuario objUsuario)
        {
            string delete = "delete from Seguridad.CustomPermission where idUsuario=@idUsuario";
            try
            {
                comando = new SqlCommand(delete, objConexion.getCon());
                comando.Parameters.AddWithValue("@idUsuario", objUsuario.IdUsuario);
                objConexion.getCon().Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                e.Message.ToString();
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }

        }


    }
}
