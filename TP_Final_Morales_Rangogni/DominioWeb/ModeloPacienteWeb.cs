﻿using AccesoModeloBaseDatos.Dominio;
using System;

namespace TP_Final_Morales_Rangogni.DominioWeb
{
    public class ModeloPacienteWeb
    {
        public int IdPaciente { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string NroDocumento { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public char Sexo { get; set; }
        public DateTime FechaAlta { get; set; }
        public string Estado { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public string Imagen { get; set; }

        public ModeloPacienteWeb(Paciente paciente) { 
            
            IdPaciente=paciente.IdPaciente;
            Nombres=paciente.Nombres;
            Apellidos=paciente.Apellidos;
            NroDocumento=paciente.NroDocumento;
            FechaNacimiento=paciente.FechaAlta;
            Sexo= paciente.Sexo;
            FechaAlta= paciente.FechaAlta;
            Estado = Convert.ToString(paciente.Estado?"true":"false");
            Telefono = paciente.Telefono; 
            Email= paciente.Email;
            Imagen= paciente.Imagen;
        }
    }
   
}