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
   public class UsuarioDao:Repositorio<Usuario>
    {
        private ConexionDB objConexion;
        private SqlCommand comando;
        private SqlDataReader reader;
        public UsuarioDao()
        {
            objConexion = ConexionDB.saberEstado();
        }

        public void create(Usuario objUsuario)
        {

            string SP_CreateUser = "SP_CreateUser";
            comando = new SqlCommand(SP_CreateUser, objConexion.getCon());
            comando.Parameters.AddWithValue("@loginUsuario", objUsuario.LoginUsuario);
            comando.Parameters.AddWithValue("@passUsuario", objUsuario.PassUsuario);
            comando.Parameters.AddWithValue("@emailUsuario", objUsuario.EmailUsuario);
            comando.Parameters.AddWithValue("@pathImgUsuario", objUsuario.PathImgUsuario);
            comando.Parameters.AddWithValue("@nombreUsuario", objUsuario.NombreUsuario);
            comando.CommandType = CommandType.StoredProcedure;
            objConexion.getCon().Open();
            int resp=comando.ExecuteNonQuery();
        }

        public void delete(Usuario objUsuario)
        {
            throw new NotImplementedException();
        }

        public Usuario find(Usuario objUsuario)
        {
            try
            {
                string find = "select*from Seguridad.Usuario where loginUsuario=@login";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@login", objUsuario.LoginUsuario);
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                if (reader.Read())
                {
                    objUsuario.IdUsuario = Convert.ToInt32(reader["idUsuario"].ToString());
                    objUsuario.LoginUsuario = reader["loginUsuario"].ToString();
                    objUsuario.PassUsuario = reader["passUsuario"].ToString();
                    objUsuario.EmailUsuario = reader["emailUsuario"].ToString();
                    objUsuario.NombreUsuario= reader["nombreUsuario"].ToString();

                }
            }
            catch(Exception e)
            {

            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }
            

            return objUsuario;
        }

        public List<Usuario> findAll()
        {
            List<Usuario> listaUsuario = new List<Usuario>();
            try
            {                
                string find = "select*from Seguridad.Usuario";
                comando = new SqlCommand(find, objConexion.getCon());
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    Usuario objUsuario = new Usuario();
                    objUsuario.IdUsuario = Convert.ToInt32(reader["idUsuario"].ToString());
                    objUsuario.LoginUsuario = reader["loginUsuario"].ToString();
                    objUsuario.PassUsuario = reader["passUsuario"].ToString();
                    objUsuario.EmailUsuario = reader["emailUsuario"].ToString();
                    objUsuario.NombreUsuario = reader["nombreUsuario"].ToString();

                    listaUsuario.Add(objUsuario);
                }
                return listaUsuario;
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
            return listaUsuario;
        }

        public void update(Usuario objUsuario)
        {
            throw new NotImplementedException();
        }


        public List<Usuario> findAllById(Usuario obj)
        {
            throw new NotImplementedException();
        }
    }
}
