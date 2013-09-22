<%@ Page Title="" Language="C#" MasterPageFile="~/Bienvenidos.Master" AutoEventWireup="true"
    CodeBehind="Inicio.aspx.cs" Inherits="Aerolinea.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="span4 offset4">
            <div class="well">
                <asp:Label ID="Label1" runat="server" Text="Iniciar Sesión"></asp:Label>
                <div class="control-group">
                    <label for="country" class="control-label">
                        Tipo de Usuario
                    </label>
                    <div class="controls">
                        <asp:DropDownList ID="ddl_tipoUsuario" runat="server" Width="260px">
                            <asp:ListItem Value="0">Pasajero</asp:ListItem>
                            <asp:ListItem Value="1">Piloto</asp:ListItem>
                            <asp:ListItem Value="2">Administrador</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <form action="" accept-charset="UTF-8">
                <asp:TextBox CssClass="span3" placeholder="Nombre de Usuario" ID="txt_usuario" runat="server"
                    Width="260px"></asp:TextBox><br />
                <asp:TextBox CssClass="span3" placeholder="Contraseña" ID="txt_contrasenia" runat="server"
                    Width="260px" TextMode="Password"></asp:TextBox>
                </form>
                <asp:Button CssClass="btn-info btn" ID="btn_iniciarSesion" runat="server" 
                    Text="Iniciar Sesión" onclick="btn_iniciarSesion_Click" />
            </div>
            <div class="modal-footer">
                Nuevo en Oceanic.com?
                <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Registrarte" onclick="Button1_Click" /><br/><br/>
                <div class="alert alert-info"><asp:Label ID="lbl_mensajes" runat="server" Text=""></asp:Label></div>
            </div>
        </div>
    </div>
</asp:Content>
