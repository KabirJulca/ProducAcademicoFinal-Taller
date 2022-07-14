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
    public class MenuDao : Repositorio<Menu>
    {
        private ConexionDB objConexion;
        private SqlCommand comando;
        private SqlDataReader reader;
        public MenuDao()
        {
            objConexion = ConexionDB.saberEstado();
        }
        public void create(Menu objMenu)
        {
            try
            {
                string create = "SP_CreateMenu";
                comando = new SqlCommand(create, objConexion.getCon());
                comando.Parameters.AddWithValue("@nombre",objMenu.DisplayName);
                comando.Parameters.AddWithValue("@parent", objMenu.ParentMenuID);
                comando.Parameters.AddWithValue("@numOrden", objMenu.OrderNumber);
                comando.Parameters.AddWithValue("@URL", objMenu.MenuURL);
                comando.Parameters.AddWithValue("@menuIcon", objMenu.MenuIcon);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                int resp=comando.ExecuteNonQuery();

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

        public void delete(Menu objMenu)
        {
            try
            {
                string delete = "SP_EliminarMenu @CodigoMenu";
                comando = new SqlCommand(delete, objConexion.getCon());
                comando.Parameters.AddWithValue("@CodigoMenu",objMenu.MenuID);
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
        
        public Menu find(Menu objMenu)
        {
            try
            {
                string find = "SP_BuscarMenu @CodigoMenu";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@CodigoMenu", objMenu.MenuID);
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                if (reader.Read())
                {
                    objMenu.MenuID = int.Parse(reader["MenuID"].ToString());
                    objMenu.DisplayName = reader["DisplayName"].ToString();
                    objMenu.ParentMenuID = int.Parse(reader["ParentMenuID"].ToString());
                    objMenu.OrderNumber =int.Parse(reader["OrderNumber"].ToString());
                    objMenu.MenuURL = reader["MenuURL"].ToString();
                    objMenu.MenuIcon = reader["MenuIcon"].ToString();
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
            return objMenu;
        }
        
        public List<Menu> findAll()
        {
            Menu objMenu;
            List<Menu> listaMenu = new List<Menu>();
            try
            {                
                string findAll = "SP_ListaMenu";
                comando = new SqlCommand(findAll, objConexion.getCon());
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    objMenu = new Menu();
                    objMenu.MenuID = int.Parse(reader["MenuID"].ToString());
                    objMenu.DisplayName = reader["DisplayName"].ToString();
                    objMenu.ParentMenuID = int.Parse(reader["ParentMenuID"].ToString());
                    objMenu.OrderNumber = int.Parse(reader["OrderNumber"].ToString());
                    objMenu.MenuURL = reader["MenuURL"].ToString();
                    objMenu.MenuIcon = reader["MenuIcon"].ToString();
                    listaMenu.Add(objMenu);
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
            return listaMenu;
        }

        public List<Menu> menuEmpty(Menu objMenu)
        {
            List<Menu> listaMenu = new List<Menu>();
            try
            {
                string findAll = "select*from Seguridad.Menu where menuID=@menuID";
                comando = new SqlCommand(findAll, objConexion.getCon());
                comando.Parameters.AddWithValue("@menuID", objMenu.MenuID);
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    objMenu = new Menu();
                    objMenu.MenuID = int.Parse(reader["MenuID"].ToString());
                    objMenu.DisplayName = reader["DisplayName"].ToString();
                    listaMenu.Add(objMenu);
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
            return listaMenu;
        }

        public List<Menu> findAllByIdUsuario(Usuario objUsuario)
        {
            List<Menu> listaMenu = new List<Menu>();
            try
            {
                /*OTRA FORMA DE CONECTAR A UN PROCEDURE EL 
                PARAMETRO TIENE QUE TENER EL MISMO NOMBRE QUE 
                EL DEL STORE PROCEDURE EN LA BD*/
                /*string find = "SP_GetMenu";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@idUser", objUsuario.Codigo);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();*/

                string find = "SP_LoadMenu @idUsuario";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@idUsuario", objUsuario.IdUsuario);
                //comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    Menu objMenu = new Menu();
                    objMenu.MenuID = Convert.ToInt32(reader["MenuID"].ToString());
                    objMenu.DisplayName = reader["DisplayName"].ToString();
                    objMenu.ParentMenuID = Convert.ToInt32(reader["ParentMenuID"].ToString());
                    objMenu.OrderNumber = Convert.ToInt32(reader["OrderNumber"].ToString());
                    objMenu.MenuURL = reader["MenuURL"].ToString();
                    objMenu.MenuIcon = reader["MenuIcon"].ToString();

                    listaMenu.Add(objMenu);
                }
            }
            catch (Exception e)
            {
                e.StackTrace.ToString();
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }


            return listaMenu;
        }

        /*public List<Menu> findAllById(Usuario objUsuario)
        {
            List<Menu> listaMenu = new List<Menu>();
            try
            {
                string find = "select "+
" Seguridad.Usuario.idUsuario, "+
" Seguridad.RolUsuario.idRol, " +
" Seguridad.Rol.nameRol, " +
" Seguridad.Modulo.nameModulo, " +
" Seguridad.Menu.MenuID, " +
" Seguridad.Menu.DisplayName, " +
" Seguridad.Menu.ParentMenuID, " +
" Seguridad.Menu.OrderNumber, " +
" Seguridad.Menu.MenuURL, " +
" Seguridad.Menu.MenuIcon " +
" from Seguridad.RolUsuario " +
" inner join Seguridad.Rol " +
" on  Seguridad.RolUsuario.idRol = Seguridad.Rol.idRol " +
" inner join Seguridad.Modulo " +
" on Seguridad.Modulo.idModulo = Seguridad.Rol.idModulo " +
" inner join Seguridad.ModuloMenu" +
" on Seguridad.ModuloMenu.idModulo = Seguridad.Modulo.idModulo " +
" inner join Seguridad.Menu " +
" on Seguridad.ModuloMenu.MenuID = Seguridad.Menu.MenuID " +
" inner join Seguridad.Usuario " +
" on Seguridad.RolUsuario.idUsuario = Seguridad.Usuario.idUsuario " +

" where Seguridad.Usuario.idUsuario = @idUser";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@idUser", objUsuario.Codigo);
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    Menu objMenu = new Menu();
                    objMenu.MenuID = Convert.ToInt32(reader["MenuID"].ToString());
                    objMenu.DisplayName = reader["DisplayName"].ToString();
                    objMenu.ParentMenuID = Convert.ToInt32(reader["ParentMenuID"].ToString());
                    objMenu.OrderNumber = Convert.ToInt32(reader["OrderNumber"].ToString());
                    objMenu.MenuURL = reader["MenuURL"].ToString();
                    objMenu.MenuIcon = reader["MenuIcon"].ToString();

                    listaMenu.Add(objMenu);
                }
            }
            catch (Exception e)
            {
                e.StackTrace.ToString();
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }


            return listaMenu;
        }*/

        public void update(Menu objMenu)
        {
            try
            {
                string create = "SP_UpdateMenu";
                comando = new SqlCommand(create, objConexion.getCon());
                comando.Parameters.AddWithValue("@idMenu", objMenu.MenuID);
                comando.Parameters.AddWithValue("@nombre", objMenu.DisplayName);
                comando.Parameters.AddWithValue("@parent", objMenu.ParentMenuID);
                comando.Parameters.AddWithValue("@numOrden", objMenu.OrderNumber);
                comando.Parameters.AddWithValue("@URL", objMenu.MenuURL);
                comando.Parameters.AddWithValue("@menuIcon", objMenu.MenuIcon);
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
        public List<Menu> findAllByIdModulo(Modulo objModulo)
        {
            List<Menu> listaMenu = new List<Menu>();
            try
            {
               
                string find = "SP_GetMenuByModulo";
                comando = new SqlCommand(find, objConexion.getCon());
                comando.Parameters.AddWithValue("@idModulo", objModulo.IdModulo);
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getCon().Open();
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    Menu objMenu = new Menu();
                    objMenu.MenuID = Convert.ToInt32(reader["MenuID"].ToString());
                    objMenu.DisplayName = reader["DisplayName"].ToString();
                    objMenu.ParentMenuID = Convert.ToInt32(reader["ParentMenuID"].ToString());
                    objMenu.OrderNumber = Convert.ToInt32(reader["OrderNumber"].ToString());
                    objMenu.MenuURL = reader["MenuURL"].ToString();
                    objMenu.MenuIcon = reader["MenuIcon"].ToString();

                    listaMenu.Add(objMenu);
                }
            }
            catch (Exception e)
            {
                e.StackTrace.ToString();
            }
            finally
            {
                objConexion.getCon().Close();
                objConexion.closeDB();
            }


            return listaMenu;
        }
    }
}
