<%@ Page Title="" Language="C#" MasterPageFile="~/Bienvenidos.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Aerolinea.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	<div class="row">
          <div class="navbar navbar-inverse nav">
                <div class="navbar-inner">
                    <div class="container">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                            class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                        </a><a class="brand" href="Inicio.aspx">Oceanic</a>
                        <div class="nav-collapse collapse">
                            <ul class="nav">
                                <li class="divider-vertical"></li>
                            </ul>
                            <div class="pull-right">
                                <ul class="nav pull-right">
                                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <asp:Label ID="lbl_usuario" runat="server" Text="Invitado"></asp:Label><b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href=""><i class="icon-cog"></i>Ayuda</a></li>
                                           <li class="divider"></li>
                                            <li>
                                                <a href="Inicio.aspx"  ><i class="icon-off"></i>Regresar al Inicio</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		<div class="span4 offset4 well">
            <asp:Label ID="Label1" runat="server" Text="Formulario de Registro"></asp:Label><br/>          
			<form action="" accept-charset="UTF-8">
             <p class="help-block">Identificación: </p>
            <asp:TextBox  CssClass="span4" ID="txt_identificacion" runat="server" placeholder="Ingrese una identificación" Width="265px"></asp:TextBox>
                <asp:Label ID="lbl_validarId"  runat="server" ForeColor="Red"></asp:Label>
            <p class="help-block">Nombre: </p>
            <asp:TextBox  CssClass="span4" ID="txt_nombre" runat="server" placeholder="Ingrese un Nombre" Width="265px"></asp:TextBox>
                <asp:Label ID="lbl_validarNombre"  runat="server" ForeColor="Red"></asp:Label>
             <p class="help-block">Nombre de Usuario: </p>
            <asp:TextBox  CssClass="span4" ID="txt_usuario" runat="server" placeholder="Ingrese Usuario" Width="265px"></asp:TextBox>
            <asp:Label ID="lbl_validarUsuario" runat="server" ForeColor="Red"></asp:Label>
             <p class="help-block">Contraseña: </p>
            <asp:TextBox  CssClass="span4" ID="txt_contrasenia" runat="server" 
                placeholder="Ingrese Contraseña" Width="265px" TextMode="Password"></asp:TextBox>
             <p class="help-block">Reescriba la Contraseña: </p>
            <asp:TextBox  CssClass="span4" ID="txt_repitaContrasenia" runat="server" 
                placeholder="Reescriba la Contraseña" Width="265px" TextMode="Password"></asp:TextBox>
            <asp:Label ID="lbl_validarContrasenias" runat="server" Text="" ForeColor="Red"></asp:Label>
            <asp:Button  CssClass="btn btn-info btn-block" ID="Button1" runat="server" Text="Registrarse" onclick="Button1_Click" />
             <div class="modal-footer">
                <div class="alert alert-info"><asp:Label ID="lbl_mensajes" runat="server" Text=""></asp:Label></div>
            </div>    
			</form>    
		</div>
	</div>
</div>
</asp:Content>
