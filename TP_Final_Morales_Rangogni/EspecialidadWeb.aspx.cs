﻿using AccesoModeloBaseDatos.Dominio;
using ModeloDeNegocio.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Authentication.ExtendedProtection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_Final_Morales_Rangogni
{
    public partial class EspecialidadWeb : Page
    {
        private EspecialidadNegocio especialidadNegocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarRepetidorEspecialidad();
                BuscarImagenesControles();
            }
        }

        private void BuscarImagenesControles()
        {   
            iBtnGraba.ImageUrl = @"..\Imagenes\save_as_opsz48.jpg";
            iBtnCancela.ImageUrl = @"..\Imagenes\cancel_black_36dp.jpg";
        }

        private void CargarRepetidorEspecialidad()
        {
            try
            {
                especialidadNegocio = new EspecialidadNegocio();
                List<Especialidad> especialidad = especialidadNegocio.Especialidades();
                rprEspecialidad.DataSource = especialidad;                
                rprEspecialidad.DataBind();
                Session.Add("ListaEspecialidad", especialidad);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void AltaEspecialidadWeb()
        {
            if (txtDesc.Text.Trim().Equals(""))
                return;
            especialidadNegocio = new EspecialidadNegocio();
            try
            {
                especialidadNegocio.AltaEspecialidad(txtDesc.Text, chbEst.Checked);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            CargarRepetidorEspecialidad();
        }
        private void ModificarEspeciaalidadWeb()
        {
            if (txtDesc.Text.Trim().Equals(""))
                return;
            especialidadNegocio = new EspecialidadNegocio();
            try
            {
                especialidadNegocio.AltaEspecialidad(txtDesc.Text, true);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            CargarRepetidorEspecialidad();
        }
        private void LimpiarControles()
        {
            txtDesc.Text = "";
        }

        protected void iBtnGraba_Click(object sender, ImageClickEventArgs e)
        {
            AltaEspecialidadWeb();
        }
    }
}