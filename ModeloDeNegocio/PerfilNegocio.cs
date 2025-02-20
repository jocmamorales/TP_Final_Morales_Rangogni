﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using AccesoModeloBaseDatos.Modelos;
using AccesoModeloBaseDatos.Dominio;

namespace ModeloDeNegocio.Negocio
{
    public enum TiposPerfilesWeb
    {
        Administrador = 1,
        Empleado = 2,
        Medico = 3
    }
    public class PerfilNegocio : Perfil
    {
        private readonly PerfilADO tipoPerfilADO;
        public PerfilNegocio()
        {
            tipoPerfilADO = new PerfilADO(ConexionStringDB.ConexionBase());
        }
        public bool AltaPerfil(string descripcion, bool estado)
        {
            try
            {
                this.IdPerfil = 0;
                this.Descripcion = descripcion;
                this.Estado = estado;

                return tipoPerfilADO.GrabarPerfil(this);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Perfil> Perliles()
        {
            return tipoPerfilADO.ListarPerfiles();
        }
        public bool ModificarPerfil(int id, string descripcion, bool estado)
        {
            try
            {
                this.IdPerfil = id;
                this.Descripcion = descripcion;
                this.Estado = estado;

                return tipoPerfilADO.GrabarPerfil(this);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}