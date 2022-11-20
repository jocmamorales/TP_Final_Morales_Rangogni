﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TurnoWeb.aspx.cs" Inherits="TP_Final_Morales_Rangogni.TurnoWeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentLogin" runat="server">
    <section>
        <div class="tab-bar">
            <a href="#NuevoTurno">NUEVO TURNO</a>
            <a href="#Turnos">TURNOS</a>
        </div>

        <!--SOLAPA NUEVO TURNO-->
        <div class="content">
            <div class="row">
                <div class="input-field left-align col s6">
                    <asp:TextBox ID="txtDni" runat="server" CssClass="validate" placeholder=""></asp:TextBox>
                    <label for="lblDniPac">Nº Documento</label>
                </div>
                <div class="col s1 waves-effect purple waves-light btn-small">                    
                    <i class="material-icons">cached</i>
                    <asp:Button runat="server" ID="btnBuscar" CssClass="col s1 center-block btn-large purple" OnClick="btnBuscar_Click" /> 
                </div>
            </div>
            <!--Nombre -->
            <div class="col s12">
                <div class="row">
                    <div class="input-field col s6">
                        <asp:TextBox ID="txtnombre" runat="server" CssClass="validate" Enabled="false" placeholder=""></asp:TextBox>
                        <label for="lblNombre">Nombre</label>
                    </div>
                    <!--Apellido -->
                    <div class="input-field col s6">
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="validate" Enabled="false" placeholder=""></asp:TextBox>
                        <label for="lblApellido">Apellido</label>
                    </div>

                </div>
            </div>
            <!--Telefono -->
            <div class="col s12">
                <div class="row">
                    <div class="input-field col s6">
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="validate" placeholder=""></asp:TextBox>
                        <label for="lblTelefono">Telefono</label>
                    </div>
                    <!--Email -->
                    <div class="input-field col s6">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="validate" TextMode="Email" placeholder=""></asp:TextBox>
                        <label for="lblEmail">Correo Electronico</label>
                    </div>
                </div>
            </div>

            <div class="col s12">
                <div class="row">
                    <div class="col s4 left-align">
                        <label id="lblEspecialidad" for="ddlEspecialidad">Especialidad</label>
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="dropdown-trigger btn purple white-text" Style="margin-top: 5px" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged" data-activates="ddlEpecialidad" data-target="ddlMedico" />
                    </div>
                    <div class="col s4 left-align">
                        <label id="lblMedico" for="ddlMedico">Especialista</label>
                        <asp:DropDownList ID="ddlMedico" runat="server" CssClass="dropdown-trigger btn purple white-text" AutoPostBack="true" OnSelectedIndexChanged="ddlMedico_SelectedIndexChanged" Style="margin-top: 5px" data-activates="ddlMedico" data-target="ddlTurnos" />
                    </div>
                    <div class="input-field col s3 left-align">
                        <label id="lblFecTurno" for="txtFechaTurno">Fecha del Turno</label>
                        <asp:TextBox ID="txtFechaTurno" runat="server" AutoPostBack="true" CssClass="date-text" ></asp:TextBox>
                    </div>
                    <div class="col s1 waves-effect small waves-light btn-small purple"> 
                        <i class="material-icons left-align">search</i>
                        <asp:Button runat="server" ID="btnVerTurnos" OnClick="btnVerTurnos_Click" CssClass="col s1 right-align btn-large purple" />
                    </div>
                </div>
            </div>
            <div class="col s12">
                <div class="row">
                    <div class="input-field col s1">
                        <asp:TextBox ID="txtCantTurnos" Enabled="false" runat="server" CssClass="validate" ></asp:TextBox>
                        <label for="txtCantTurnos">Total</label>
                    </div>
                    <div class="col s2 left-align">
                        <label id="lblTurno" for="ddlHorasTurnos">Hora</label>
                        <asp:DropDownList ID="ddlHorasTurnos" runat="server" CssClass="dropdown-trigger btn purple white-text" data-activates="ddlHorasTurnos" />
                    </div>
                    <div class="input-field col s9">
                        <asp:TextBox ID="txtObservaciones" runat="server" CssClass="validate" placeholder=""></asp:TextBox>
                        <label for="lblObservaciones">Observaciones</label>
                    </div>
                </div>
            </div>
            <!---MODAL--->

            <div class="row">
                <!-- Modal Trigger -->
                <div class="center-align">
                    <a class=" btn modal-trigger purple white-text" href="#modal1">Guardar</a>
                </div>
                <!-- Modal Structure -->

                <div id="modal1" class="modal">
                    <div class="modal-content">
                        <h4>Detalle Turno</h4>
                        <p>¿Desea guardar el turno?</p>
                    </div>
                    <div class="modal-footer">
                        <asp:Button CssClass="modal-close btn-flat purple white-text" ID="btnAcept" runat="server" OnClick="btnAcept_Click" Text="Aceptar" />
                        <a href="#!" class="modal-close btn-flat purple white-text">Cancelar</a>
                    </div>
                </div>
            </div>
        </div>
        <!--SOLAPA LISTADO DE TURNOS-->
        <div class="content">
            <h2>TURNOS <span><i class="fas fa-carrot"></i></span></h2>
            <p>FALTA CARGAR EL LISTADO</p>

        </div>

        <!--Fin Solapas-->
    </section>

    <script type="text/javascript" src="js/tabfunciones.js"></script>
</asp:Content>
