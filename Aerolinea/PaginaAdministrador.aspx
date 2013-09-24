<%@ Page Title="Administración" Language="C#" MasterPageFile="~/Bienvenidos.Master"
    AutoEventWireup="true" CodeBehind="PaginaAdministrador.aspx.cs" Inherits="Aerolinea.PaginaAdiministrador" %>

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
                                                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="cerrarSesion"><i class="icon-off"></i>Cerrar Sesión</a></asp:LinkButton></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <p class="lead">
                Administrar Vuelos</p>
            <div id="tab" class="btn-group">
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-large btn-info"
                    OnClick="ver">Registrar Vuelos</asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-large btn-info"
                    OnClick="vistaProgramacion">Programar Vuelos</asp:LinkButton>
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-large btn-info"
                    OnClick="listarVuelos">Ver Vuelos</asp:LinkButton>
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-large btn-info"
                    OnClick="vistaReportes">Reportes</asp:LinkButton>
            </div>
            <br />
            <br />
            <br />
            <asp:Panel ID="Panel3" runat="server">
                <asp:MultiView ID="vistaRegistro" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View3" runat="server">
                        <asp:Label ID="Label3" runat="server" Text="Registro de Vuelos" Font-Bold="True"
                            Font-Size="Large"></asp:Label><br />
                        <br />
                        <label>
                            Código del Vuelo</label>
                        <asp:TextBox ID="txt_codigo" runat="server" CssClass="input-xlarge" PlaceHolder="Código del vuelo"
                            Width="140px"></asp:TextBox><br />
                        <asp:Label ID="lbl_validarId" runat="server" ForeColor="#CC0000"></asp:Label>
                        <br />
                        <br />
                        <label>
                            Trayecto</label>
                        <asp:DropDownList ID="ddl_trayecto" runat="server" DataSourceID="Trayecto" DataTextField="IdTrayecto"
                            DataValueField="IdTrayecto">
                        </asp:DropDownList>
                        <asp:LinqDataSource ID="Trayecto" runat="server" ContextTypeName="Aerolinea.Datos.BaseDatosDataContext"
                            EntityTypeName="" Select="new (IdTrayecto)" TableName="TRAYECTOS">
                        </asp:LinqDataSource>
                        <br />
                        <br />
                        <label>
                            Fecha del Viaje</label>
                        <asp:Calendar ID="calendario_ida" runat="server" BackColor="White" BorderColor="#3366CC"
                            BorderWidth="1px" CellPadding="1" CellSpacing="1" DayNameFormat="Shortest" FirstDayOfWeek="Monday"
                            Font-Names="Verdana" Font-Size="Medium" ForeColor="#003399" Height="200px" Width="266px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                                Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                        <br />
                        <label>
                            Hora de Vuelo</label>
                        <asp:Label ID="Label4" runat="server" Text="Horas:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label
                            ID="Label5" runat="server" Text="Minutos:"></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddl_hora" runat="server" Width="80px">
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:DropDownList ID="ddl_minutos" runat="server" Width="80px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" OnClick="Button1_Click"
                            Text="Registrar Nuevo Vuelo" />
                        <br />
                        <br />
                        <div class="alert alert-info">
                            <button class="close" data-dismiss="alert" type="button">
                                ×
                            </button>
                            <strong>Confirmación: </strong>
                            <asp:Label ID="lbl_error" runat="server" Text=""></asp:Label>
                        </div>
                        <br>
                    </asp:View>
                </asp:MultiView>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <asp:MultiView ID="vistaProgramar" runat="server" Visible="False" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:Label ID="Label2" runat="server" Text="Programar Vuelos" Font-Bold="True"></asp:Label><br />
                        <br />
                        <div class="control-group">
                            <label class="control-label" for="username">
                                Código del Ticket</label>
                            <div class="controls">
                                <asp:TextBox ID="txt_idTicket" runat="server" Width="130px" placeHolder="Código Ticket"></asp:TextBox><br />
                                <asp:Label ID="lbl_validarTicket" runat="server" ForeColor="#CC0000" Text=""></asp:Label>
                            </div>
                        </div>
                        <!-- Card Number -->
                        <div class="control-group">
                            <label class="control-label" for="email">Aeronave&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Unidad</label>
                            <div class="controls">
                                <asp:DropDownList ID="ddl_aeronave" runat="server" DataSourceID="Avion" DataTextField="Tipo"
                                    DataValueField="IdAeronave" AutoPostBack="True" 
                                    onselectedindexchanged="ddl_aeronave_SelectedIndexChanged">
                                </asp:DropDownList>&nbsp;&nbsp;&emsp;&nbsp;&nbsp;&emsp;&emsp;

                                <asp:DropDownList ID="ddl_unidades" runat="server" Width="100px" 
                                    AutoPostBack="True">
                                </asp:DropDownList>&nbsp;&emsp;<asp:Label ID="lbl_validarUnidad" runat="server" ForeColor="#CC0000"></asp:Label>
                                <asp:LinqDataSource ID="Avion" runat="server" ContextTypeName="Aerolinea.Datos.BaseDatosDataContext"
                                    EntityTypeName="" Select="new (Tipo, IdAeronave)" TableName="AERONAVES">
                                </asp:LinqDataSource>
                            </div>
                        </div>
                        <!-- Expiry-->
                        <div class="control-group">
                            <label class="control-label" for="password">
                                Piloto</label>
                            <div class="controls">
                                <asp:DropDownList ID="ddl_piloto" runat="server" DataSourceID="Pilotos" DataTextField="Nombre"
                                    DataValueField="Usuario" Width="150px" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="Pilotos" runat="server" ContextTypeName="Aerolinea.Datos.BaseDatosDataContext"
                                    EntityTypeName="" Select="new (Nombre, Usuario)" TableName="PILOTOS">
                                </asp:LinqDataSource>
                            </div>
                        </div>
                        <!-- Save card -->
                        <div class="control-group">Trayecto&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Vuelo&emsp;&emsp;&emsp;&emsp;&emsp;Fecha y Hora<div class="controls">
                                <asp:DropDownList ID="ddl_vuelo" runat="server" Width="150px" AutoPostBack="True" 
                                    onselectedindexchanged="ddl_vuelo_SelectedIndexChanged" 
                                    DataSourceID="SqlDataSource1" DataTextField="Trayecto" DataValueField="IdVuelo">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:AEROLINEAConnectionString %>" 
                                    SelectCommand="listarVuelosRegistro" SelectCommandType="StoredProcedure">
                                </asp:SqlDataSource>
                                &emsp;&emsp;
                            <asp:Label ID="lbl_vuelo" runat="server"  Width="60" Text=""></asp:Label>&emsp;&emsp;&emsp;
                            <asp:Label ID="lbl_fechaHora" runat="server" Width="265px"></asp:Label>
                                
                                <br/><br/>
                            </div>
                        </div>


                        <asp:Button ID="btn_recargar" runat="server" Text="Recargar Combustible" 
                            CssClass="btn btn-warning" onclick="btn_recargar_Click" Visible="False"/><br/><br/>

                        <!-- Submit -->
                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="Button2" runat="server" Text="Registrar" CssClass="btn btn-success"
                                    OnClick="Button2_Click" />
                            </div>
                        </div>
                        <div class="alert alert-info">
                            <button type="button" class="close" data-dismiss="alert">
                                ×</button>
                            <strong>Confirmación: </strong>
                            <asp:Label ID="lbl_errorTicket" runat="server" Text=""></asp:Label>
                           
                        </div>

                    </asp:View>
                </asp:MultiView>
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server">
                <asp:MultiView ID="vistaVuelos" runat="server" ActiveViewIndex="0" Visible="False">
                    <asp:View ID="View2" runat="server">
                        <asp:Label ID="Label1" runat="server" Text="Lista de Vuelos" Font-Bold="True" Font-Size="Large"></asp:Label><br />
                        <br /
                        <asp:GridView ID="grd_vuelos" runat="server" BackColor="White" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3">
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
                    </asp:View>
                </asp:MultiView>
            </asp:Panel>

              <asp:Panel ID="Panel4" runat="server">
                <asp:MultiView ID="vistaReporte" runat="server" ActiveViewIndex="0" Visible="False">
                    <asp:View ID="View4" runat="server">
                        <asp:Label ID="Label6" runat="server" Text="Reportes" Font-Bold="True" Font-Size="Large"></asp:Label><br />
                        <br />
                        <span class="lead">Clientes Frecuentes: </span><asp:Label ID="lbl_clienteFrecuente" runat="server" Text="" Font-Bold="True" Font-Size="Medium"></asp:Label><br /><br />
                        <asp:GridView ID="grd_clientesFrecuentes" runat="server" BackColor="White" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3">
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView><br/><br/>

                         <span class="lead">Clientes que viajan de ida y regreso: </span><asp:Label ID="lbl_idaRegreso" runat="server" Text="" Font-Bold="True" Font-Size="Medium"></asp:Label><br /><br />
                        <asp:GridView ID="grd_clientesIdaVuelta" runat="server" BackColor="White" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="3">
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView><br/><br/>





                    </asp:View>
                </asp:MultiView>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
