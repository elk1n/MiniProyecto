<%@ Page Title="" Language="C#" MasterPageFile="~/Bienvenidos.Master" AutoEventWireup="true" CodeBehind="PaginaPasajero.aspx.cs" Inherits="Aerolinea.PaginaPasajero" %>
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
                <asp:MultiView ID="vistaPasajero" runat="server" ActiveViewIndex="0" Visible="True">
                    <asp:View ID="View2" runat="server">
                        <asp:GridView ID="grd_ida" runat="server" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                            onselectedindexchanged="grd_ida_SelectedIndexChanged">

                            <Columns>
                                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />

                        </asp:GridView>
                        <asp:Label ID="lbl_validarIda" runat="server" ForeColor="#CC0000"></asp:Label><br/>

                         <div class="control-group">
                            <label class="lbl_pesoIda" for="password">Peso Equipaje (Kg)</label>
                            <div class="controls">
                               <asp:TextBox ID="txt_pesoIda" runat="server"  CssClass="input-block-level" Width="110px" placeHolder="Peso"></asp:TextBox>
                               </div>
                               <asp:Label ID="lbl_validarPesoIda" runat="server" ForeColor="#CC0000" Text=""></asp:Label>
                               </div>
                                    
                         <div class="control-group">
                            <label class="control-label" for="password">Ida y Regreso</label>
                            <div class="controls">
                                           
                        <asp:DropDownList ID="ddl_ida" runat="server" Width="60px" AutoPostBack="True" 
                                    Enabled="False">
                            <asp:ListItem Value="0">NO</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                        </asp:DropDownList>
                            </div>
                        </div><br/>

              </asp:View>
                </asp:MultiView>
            </asp:Panel>



        <asp:Panel ID="Panel1" runat="server">

            <asp:MultiView ID="vistaRegreso" runat="server"  ActiveViewIndex="0" Visible="False">

                <asp:View ID="View1" runat="server">
                
                        <asp:GridView ID="grd_regreso" runat="server" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                            onselectedindexchanged="grd_regreso_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                               <asp:Label ID="lbl_validarRegreso" runat="server" ForeColor="#CC0000"></asp:Label><br/>



                        <div class="control-group">
                            <asp:Label ID="lbl_pesoRegreso" runat="server" Text="Peso Equipaje (Kg)"></asp:Label><br/><br/>
                            <div class="controls">
                               <asp:TextBox ID="txt_pesoRegreso" runat="server"  CssClass="input-block-level" Width="110px" placeHolder="Peso"></asp:TextBox>
                               </div>
                               <asp:Label ID="lbl_validarPesoRegreso" runat="server" ForeColor="#CC0000"></asp:Label>

                               </div>


                </asp:View>

            </asp:MultiView>

        </asp:Panel>
 <asp:Button ID="Button1" runat="server" Text="Seleccionar Vuelo" OnClick="Button1_Click"
                CssClass="btn btn-info" /><br />
            <br />
            <div class="alert alert-error">
                <asp:Label ID="lbl_mensajes" runat="server" Text=""></asp:Label>
            </div>
            <div class="alert alert-info">
                <asp:Label ID="lbl_mensajeFinal" runat="server" Text=""></asp:Label>
            </div>
</div>
</div>







</asp:Content>
