using Model.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class PermissionDao
    {
        private ConexionDB objConexion;
        private SqlCommand comando;
        private SqlDataReader reader;

        public PermissionDao()
        {
            objConexion = ConexionDB.saberEstado();
        }
        public bool Add(Permission objPermission)
        {
            bool cond = false;
            string create = "SP_CreatePermission @moduloId,@menuId";
            try
            {
                comando = new SqlCommand(create, objConexion.getCon());
                comando.Parameters.AddWithValue("@moduloId", objPermission.IdModulo);
                comando.Parameters.AddWithValue("@menuId", objPermission.MenuID);
                objConexion.getCon().Open();
                int res=comando.ExecuteNonQuery();
                if (res==1)
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
       
        public void deleteByModulo(Modulo objModulo)
        {
            string delete = "delete from Seguridad.Permission where idModulo=@moduloId";
            try
            {
                comando = new SqlCommand(delete, objConexion.getCon());
                comando.Parameters.AddWithValue("@moduloId", objModulo.IdModulo);
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

        public Permission find(Permission obj)
        {
            throw new NotImplementedException();
        }


        public List<Permission> findByModuloID(Modulo objModulo)
        {
            List<Permission> lista = new List<Permission>();
            string findAll = "select*from Seguridad.Permission where idModulo=@moduloId";
            try
            {
                comando = new SqlCommand(findAll, objConexion.getCon());
                comando.Parameters.AddWithValue("@moduloId", objModulo.IdModulo);
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    Permission objPermission = new Permission();
                    objPermission.PermissionID = int.Parse(reader["PermissionID"].ToString());
                    objPermission.MenuID = int.Parse(reader["MenuID"].ToString());
                    objPermission.IdModulo = reader["idModulo"].ToString();
                    lista.Add(objPermission);

                }
            }
            catch(Exception e)
            {
                e.Message.ToString();
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }
            return lista;

        }

        public List<Permission> findAll()
        {
            List<Permission> lista = new List<Permission>();
            string findAll = "select*from Seguridad.Permission";
            try
            {
                comando = new SqlCommand(findAll, objConexion.getCon());
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    Permission objPermission = new Permission();
                    objPermission.PermissionID = int.Parse(reader["PermissionID"].ToString());
                    objPermission.MenuID = int.Parse(reader["MenuID"].ToString());
                    objPermission.IdModulo = reader["idModulo"].ToString();
                    lista.Add(objPermission);

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
            return lista;

        }

        public void update(Permission obj)
        {
            throw new NotImplementedException();
        }
    }
}
