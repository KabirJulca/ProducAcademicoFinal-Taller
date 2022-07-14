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
    public class PerfilDao : Repositorio<Perfil>
    {
        SqlCommand comando;
        SqlDataReader reader;
        ConexionDB objConexion;

        public PerfilDao()
        {
            objConexion = ConexionDB.saberEstado();
        }
        public void create(Perfil objPerfil)
        {
            try
            {
                string create = "SP_CreatePerfil";//nombre de los parametros igual que el procedure en la BD
                comando = new SqlCommand(create, objConexion.getCon());
                comando.Parameters.AddWithValue("@namePerfil", objPerfil.NamePerfil);
                comando.Parameters.AddWithValue("@descPerfil", objPerfil.DescPerfil);
                comando.Parameters.AddWithValue("@datePerfil", objPerfil.DatePerfil);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                int res = comando.ExecuteNonQuery();
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

        public void delete(Perfil objPerfil)
        {
            try
            {
                string delete = "SP_EliminarPerfil";
                comando = new SqlCommand(delete, objConexion.getCon());
                comando.Parameters.AddWithValue("@idPerfil", objPerfil.IdPerfil);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                int res = comando.ExecuteNonQuery();
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

        public Perfil find(Perfil objPerfil)
        {
            try
            {
                string find = "SP_EliminarPerfil";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@idPerfil", objPerfil.IdPerfil);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                if (reader.Read())
                {
                    objPerfil.IdPerfil = int.Parse(reader["idPerfil"].ToString());
                    objPerfil.NamePerfil = reader["namePerfil"].ToString();
                    objPerfil.DescPerfil = reader["descPerfil"].ToString();
                    objPerfil.DatePerfil = DateTime.Parse(reader["datePerfil"].ToString());
                }
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
            
            return objPerfil;
        }

        public List<Perfil> findAll()
        {
            List<Perfil> listaPerfil = new List<Perfil>();
            Perfil objPerfil;
            try
            {
                string findAll = "SP_EliminarPerfil";
                comando = new SqlCommand(findAll, objConexion.getCon());
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    objPerfil = new Perfil();
                    objPerfil.IdPerfil = int.Parse(reader["idPerfil"].ToString());
                    objPerfil.NamePerfil = reader["namePerfil"].ToString();
                    objPerfil.DescPerfil = reader["descPerfil"].ToString();
                    objPerfil.DatePerfil = DateTime.Parse(reader["datePerfil"].ToString());
                    listaPerfil.Add(objPerfil);
                }
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
            
            return listaPerfil;
        }

        public void update(Perfil objPerfil)
        {
            try
            {
                string update = "SP_UpdatePerfil";//nombre de los parametros igual que el procedure en la BD
                comando = new SqlCommand(update, objConexion.getCon());
                comando.Parameters.AddWithValue("@idPerfil", objPerfil.IdPerfil);
                comando.Parameters.AddWithValue("@namePerfil", objPerfil.NamePerfil);
                comando.Parameters.AddWithValue("@descPerfil", objPerfil.DescPerfil);
                comando.Parameters.AddWithValue("@datePerfil", objPerfil.DatePerfil);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                int res = comando.ExecuteNonQuery();
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
    }
}
