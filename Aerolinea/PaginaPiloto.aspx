<%@ Page Title="Pilotos" Language="C#" MasterPageFile="~/Bienvenidos.Master" AutoEventWireup="true" CodeBehind="PaginaPiloto.aspx.cs" Inherits="Aerolinea.PaginaPiloto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">  
    <div class="well">
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
                                        <asp:Label ID="lbl_usuario" runat="server" Text="Usuario"></asp:Label><b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href=""><i class="icon-cog"></i>Configuración</a></li>
                                            <li class="divider"></li>
                                            <li>
                                                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="cerrarSesion"><i class="icon-off"></i>Cerrar Sesión</asp:LinkButton></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <asp:Panel ID="Panel2" runat="server">
                <asp:MultiView ID="vistaPiloto" runat="server" ActiveViewIndex="0" Visible="True">
                    <asp:View ID="View2" runat="server">
                        <asp:GridView ID="grd_piloto" runat="server" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">

                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />

                        </asp:GridView><br />
             </asp:View>
                </asp:MultiView>
            </asp:Panel>


            </div>
            </div>

</asp:Content>
