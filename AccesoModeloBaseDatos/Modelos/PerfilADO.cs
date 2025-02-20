﻿using AccesoModeloBaseDatos.Dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace AccesoModeloBaseDatos.Modelos
{
    public class PerfilADO
    {
        private const string SQL_INSERT_PERFIL = "INSERT INTO Perfiles (descripcion, estado) VALUES (@descripcion, @estado)";
        private const string SQL_SELECT_PERFILES = "SELECT idPerfil, descripcion, estado FROM Perfiles";
        private const string SQL_UPDATE_PERFIL = "UPDATE Perfiles SET descripcion = @descripcion, estado = @estado WHERE idPerfil = @idPerfil";
        private readonly string coneccionDB;
        public PerfilADO(string coneccion)
        {
            coneccionDB = coneccion;
        }
        // Crear Perfil
        public bool GrabarPerfil(Perfil perfil)
        {

            bool response;
            try
            {
                if (perfil.IdPerfil.Equals(0))
                    InsertPerfilDB(perfil);
                else
                    UpdatePerfil(perfil);
                response = true;
            }
            catch (Exception)
            {
                response = false;
            }
            return response;
        }

        private void InsertPerfilDB(Perfil perfil)
        {
            AccesoDatos accesoDatos = new AccesoDatos(coneccionDB);
            using (SqlConnection con = accesoDatos.ConnectToDB())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(SQL_INSERT_PERFIL, con);
                    cmd.Parameters.AddWithValue("@descripcion", perfil.Descripcion);
                    cmd.Parameters.AddWithValue("@estado", perfil.Estado);
                    cmd.CommandType = CommandType.Text;
                    accesoDatos.ExecuteCommand(cmd);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    accesoDatos.CloseConnection();
                }
            }
        }

        private void UpdatePerfil(Perfil perfil)
        {
            AccesoDatos accesoDatos = new AccesoDatos(coneccionDB);
            using (SqlConnection con = accesoDatos.ConnectToDB())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(SQL_UPDATE_PERFIL, con);
                    cmd.Parameters.AddWithValue("@idPerfil", perfil.IdPerfil);
                    cmd.Parameters.AddWithValue("@descripcion", perfil.Descripcion);
                    cmd.Parameters.AddWithValue("@estado", perfil.Estado);
                    cmd.CommandType = CommandType.Text;
                    accesoDatos.ExecuteCommandString(cmd.CommandText);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    accesoDatos.CloseConnection();
                }
            }
        }

        // Listado de Menus pero lo manejamos por medio de la clase PermisoDAO
        public List<Perfil> ListarPerfiles()
        {
            List<Perfil> Lista = new List<Perfil>();
            SqlDataReader dr = null;
            AccesoDatos accesoDatos = new AccesoDatos(coneccionDB);
            try
            {

                using (SqlConnection con = accesoDatos.ConnectToDB())
                {
                    SqlCommand cmd = new SqlCommand(SQL_SELECT_PERFILES, con);
                    cmd.CommandType = CommandType.Text;
                    dr = accesoDatos.SelectDataReaderFromSqlCommand(cmd);

                    while (dr.Read())
                    {
                        Lista.Add(CreateObject(dr));
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                accesoDatos.CloseConnection();
            }

            return Lista;
        }

        private Perfil CreateObject(SqlDataReader dr)
        {
            Perfil objTPerfil = new Perfil();
            objTPerfil.IdPerfil = Convert.ToInt32(dr["idPerfil"].ToString());
            objTPerfil.Descripcion = dr["descripcion"].ToString();
            objTPerfil.Estado = dr["estado"].ToString().Equals("True") ? true : false;

            return objTPerfil;
        }
    }
}
