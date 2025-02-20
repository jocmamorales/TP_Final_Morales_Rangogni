﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ModeloDeNegocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("progamationiiigmail.com", "programacion3"); ///cambiar user y pass de gmail  
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smpt.gmail.com";
        }
        public void armarcorreo(string emailDestino, string nombrePaciente, string fechaTurno, string nombreMedico, string apellidoMedico, string horaTurno)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@clinicamoraprogramacion3.com");
            email.To.Add(emailDestino);
            email.Subject = "<h3>Turno confirmado Clinica Mora<h3>";
            email.IsBodyHtml = true;
            email.Body = "<h3>Confimacion de Turno Clinica Mora<h3> <br>" +
                "Hola "+nombrePaciente +"como estas,<br>" +
                " Queriamos recordarte que el dia"+ fechaTurno +", tenes una visita con el Dr. "+ nombreMedico +" "+ apellidoMedico+ " a " +
                "las" + horaTurno + ".<br>Por favor cualquier duda o cambio avisanos para poder reprogramarlo. <br>Saludos, <br>Administracion Clinica Mora <br> 0800-333-MORA";
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
