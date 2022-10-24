﻿<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerfilWeb.aspx.cs" Inherits="AccesoModeloBaseDatos.PerfilWeb" Debug="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="header bg-blue">
        <h4 class="left-align">Perfiles</h4>
    </div>
    <div class="body bg-gray">
        <asp:Repeater runat="server" ID="rprPerfiles">
            <ItemTemplate>
                <ul class="collection">
                    <div class="row">
                        <div class="col s2">
                            <li class="collection-item">
                                <asp:Label ID="lblId" runat="server" Text="Id: "><%#Eval("IdPerfil")%></asp:Label>
                                <a href="#!" class="hide" id="alblId"><%#Eval("IdPerfil")%></a>
                            </li>
                        </div>
                        <div class="col s7">
                            <li class="collection-item">
                                <asp:Label ID="lblDesc" runat="server" Text="Descripcion: "><%#Eval("Descripcion")%></asp:Label>
                                <a href="#!" class="hide" id="alblDesc"><%#Eval("Descripcion")%></a>
                            </li>
                        </div>
                        <div class="col s3">
                            <li class="collection-item">
                                <asp:Label runat="server" ID="lblEst" Text="Estado: "><%#Eval("Estado")%></asp:Label>
                                <a href="#!" class="hide" id="alblEst"><%#Eval("Estado")%></a>
                            </li>
                        </div>
                    </div>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <div class="row">
            <div class="col s12 right-align">
                <a class="btn-floating btn waves-effect modal-trigger waves-light purple right-align" onclick="limpiarModal('NUEVO')" href="#modalAdd"><i class="material-icons">add</i></a>
                <a class="btn-floating btn waves-effect modal-trigger waves-light purple right-align" onclick="cargarModal('ACTUALIZA')" href="#modalAdd"><i class="material-icons">border_color</i></a>
                <a class="btn-floating btn waves-effect modal-trigger waves-light purple right-align" onclick="cargarModal('ELIMINA')" href="#modalAdd"><i class="material-icons">delete_forever</i></a>
            </div>
        </div>
        <div>

            <!-- Modal Structure -->
            <div id="modalAdd" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col s7">
                            <asp:TextBox CssClass="form-control" ID="txtDesc" runat="server" placeholder="Descripción"></asp:TextBox>
                        </div>
                        <div class="col s3">
                            <a class="dropdown-trigger btn purple lighten-2" style="margin-top: 10px;" href="#" data-activates="drpdEstado" data-target="drpdEstado">
                                <i class="material-icons right">arrow_drop_down</i>Estado</a>
                            <ul id="drpdEstado" class="dropdown-content">
                                <li id="liTrue" onclick="pasarValor('True')">True</li>
                                <li id="liFalse" onclick="pasarValor('False')">False</li>
                            </ul>
                        </div>
                        <div class="col s2">
                            <asp:TextBox CssClass="form-control" Enabled="false" ID="txtEstNew" runat="server" placeholder="Estado"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col s4 left-align">
                            <asp:Label runat="server" ForeColor="" Font-Bold="true" ID="lblAccion" Text=""></asp:Label>
                        </div>
                        <div class="col s8 right-align">
                            <asp:ImageButton ID="iBtnGraba" CssClass="btn-floating purple" runat="server" OnClick="iBtnGraba_Click" />
                            <asp:ImageButton ID="iBtnCancela" CssClass="btn-floating purple" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="divider"></div>
    </div>
    <script>
        function pasarValor(valorLi) {
            document.getElementById('<%= txtEstNew.ClientID %>').value = valorLi;
        }
        function limpiarModal(mensaje) {
            document.getElementById('<%= txtDesc.ClientID %>').value = "";
            document.getElementById('<%= txtEstNew.ClientID %>').value = "";
            document.getElementById('<%= lblAccion.ClientID %>').textContent = mensaje;
        }
        function cargarModal(mensaje) {
            document.getElementById('<%= lblAccion.ClientID %>').textContent = mensaje;
            let valDesc = document.getElementById('alblDesc').textContent;
            let valEst = document.getElementById('alblEst').textContent;
            document.getElementById('<%= txtDesc.ClientID %>').value = valDesc;
            document.getElementById('<%= txtEstNew.ClientID %>').value = valEst;
        }
    </script>
</asp:Content>
