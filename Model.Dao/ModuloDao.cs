using Model.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class ModuloDao : Repositorio<Modulo>
    {
        private ConexionDB objConexion;
        SqlCommand comando;
        SqlDataReader reader;
        public ModuloDao()
        {
            objConexion = ConexionDB.saberEstado();
        }
        public void create(Modulo objModulo)
        {
            try
            {
                string create = "insert into Seguridad.Modulo(nameModulo,descModulo,dateModulo)values(@nombre,@descripcion,@fecha)";
                comando = new SqlCommand(create, objConexion.getCon());
                comando.Parameters.AddWithValue("@nombre", objModulo.NameModulo);
                comando.Parameters.AddWithValue("@descripcion", objModulo.DescModulo);
                comando.Parameters.AddWithValue("@fecha", objModulo.DateModulo);
                objConexion.getCon().Open();
                int res = comando.ExecuteNonQuery();
            }catch(Exception e)
            {
                throw;
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();                
            }
            
        }

        public void delete(Modulo objModulo)
        {
            try
            {
                string delete = "delete Seguridad.Modulo where idModulo=@codigo";
                comando = new SqlCommand(delete, objConexion.getCon());
                comando.Parameters.AddWithValue("@codigo", objModulo.IdModulo);
                objConexion.getCon().Open();
                int res = comando.ExecuteNonQuery();

            }catch(Exception e)
            {
                throw;
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.getCon().Close();
            }


        }

        public Modulo find(Modulo objModulo)
        {
            try
            {
                string find = "select*from Seguridad.Modulo where idModulo=@codigo";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@codigo", objModulo.IdModulo);
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                if (reader.Read())
                {
                    objModulo.IdModulo = int.Parse(reader["idModulo"].ToString());
                    objModulo.NameModulo = reader["nameModulo"].ToString();
                    objModulo.DescModulo = reader["descModulo"].ToString();
                    objModulo.DateModulo = DateTime.Parse(reader["dateModulo"].ToString());
                }

            }
            catch (Exception e)
            {
                throw;
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.getCon().Close();
            }
            return objModulo;
        }

        public List<Modulo> findAll()
        {
            List<Modulo> listaModulos = new List<Modulo>();
            Modulo objModulo;

            try
            {
                string findAll = "select*from Seguridad.Modulo";
                comando = new SqlCommand(findAll, objConexion.getCon());
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    objModulo = new Modulo();
                    objModulo.IdModulo = int.Parse(reader["idModulo"].ToString());
                    objModulo.NameModulo = reader["nameModulo"].ToString();
                    objModulo.DescModulo = reader["descModulo"].ToString();
                    objModulo.DateModulo = DateTime.Parse(reader["dateModulo"].ToString());
                    listaModulos.Add(objModulo);
                }

            }
            catch (Exception e)
            {
                throw;
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.getCon().Close();
            }
            return listaModulos;
        }

        public void update(Modulo objModulo)
        {
            try
            {
                string create = "update Seguridad.Modulo set nameModulo=@nombre,descModulo=@descripcion,dateModulo=@fecha where idModulo=@codigo";
                comando = new SqlCommand(create, objConexion.getCon());
                comando.Parameters.AddWithValue("@codigo", objModulo.IdModulo);
                comando.Parameters.AddWithValue("@nombre", objModulo.NameModulo);
                comando.Parameters.AddWithValue("@descripcion", objModulo.DescModulo);
                comando.Parameters.AddWithValue("@fecha", objModulo.DateModulo);
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
