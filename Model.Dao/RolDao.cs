using Model.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class RolDao : Repositorio<Rol>
    {
        private ConexionDB objConexion;
        private SqlCommand comando;
        private SqlDataReader reader;

        public RolDao()
        {
            objConexion = ConexionDB.saberEstado();
        }

        public void create(Rol objRol)
        {
            try
            {
                string create = "SP_CreateRol";
                comando = new SqlCommand(create, objConexion.getCon());
                comando.Parameters.AddWithValue("@nameRol", objRol.NameRol);
                comando.Parameters.AddWithValue("@descRol", objRol.DescRol);
                comando.Parameters.AddWithValue("@dateRol", objRol.DateRol);
                comando.Parameters.AddWithValue("@idModulo", objRol.IdModulo);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                int resp = comando.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw;
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }
           
        }

        public void delete(Rol objRol)
        {
            try
            {
                string delete = "SP_EliminarRol";
                comando = new SqlCommand(delete, objConexion.getCon());
                comando.Parameters.AddWithValue("@idRol", objRol.IdRol);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                int resp = comando.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw;
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }
           
        }

        public Rol find(Rol objRol)
        {
            try
            {
                string find = "SP_BuscarRol";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@idRol", objRol.IdRol);
                comando.CommandType = CommandType.StoredProcedure;

                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                if (reader.Read())
                {
                    objRol.IdRol = Convert.ToInt32(reader["idRol"].ToString());
                    objRol.NameRol = reader["nameRol"].ToString();
                    objRol.DescRol = reader["descRol"].ToString();
                    objRol.DateRol = Convert.ToDateTime(reader["dateRol"]);

                }
                return objRol;
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
            return objRol;
        }

        public List<Rol> findAll()
        {
            List<Rol> listaRoles = new List<Rol>();
            try
            {
                string findAll = "select*from Seguridad.Rol";
                comando = new SqlCommand(findAll, objConexion.getCon());
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    Rol objRol = new Rol();
                    objRol.IdRol = Convert.ToInt32(reader["idRol"].ToString());
                    objRol.NameRol = reader["nameRol"].ToString();
                    objRol.DescRol = reader["descRol"].ToString();
                    objRol.DateRol = Convert.ToDateTime(reader["dateRol"]);
                   
                    listaRoles.Add(objRol);
                }
                return listaRoles;
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
            return listaRoles;

        }

        public void update(Rol objRol)
        {
            try
            {
                string update = "SP_UpdateRol";
                comando = new SqlCommand(update, objConexion.getCon());
                comando.Parameters.AddWithValue("@idRol", objRol.IdRol);
                comando.Parameters.AddWithValue("@nameRol", objRol.NameRol);
                comando.Parameters.AddWithValue("@descRol", objRol.DescRol);
                comando.Parameters.AddWithValue("@dateRol", objRol.DateRol);
                comando.Parameters.AddWithValue("@idModulo", objRol.IdModulo);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                int resp = comando.ExecuteNonQuery();
            }
            catch(Exception e)
            {
                throw;
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }
            
        }
    }
}
