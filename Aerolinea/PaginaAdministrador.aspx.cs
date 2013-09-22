using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Comun;
using Aerolinea.Controlador;
using Aerolinea.Contrtolador;
using Aerolinea.Datos;

namespace Aerolinea
{
    public partial class PaginaAdiministrador : System.Web.UI.Page
    {
        private string usuario, fecha;
        private Bienvenidos master;
        private Atributos variables;
        private DateTime fechas = DateTime.Now;
        private Validar validacion;
        private Comunicacion registrar;
        private BaseDatosDataContext datos;
        private int idAvion, duracionTrayecto, autonomiaAvion, resta;

        protected void Page_Load(object sender, EventArgs e)
        {
            datos = new BaseDatosDataContext();
            master = new Bienvenidos();
            variables = new Atributos();
            validacion = new Validar();
            registrar = new Comunicacion();
                       
            try{
                if (Session["Usuario"].ToString() != "" && Session["nombreUsuario"].ToString() != ""){

                    usuario = Session["Usuario"].ToString();
                    variables.Usuario = Session["nombreUsuario"].ToString();
                    lbl_usuario.Text = variables.Usuario;
                }
            }

            catch (Exception){
                Response.Redirect("Inicio.aspx");
            }

            for (int i = 0; i <= 23; i++)
            {
                if (i.ToString().Length == 1)
                {
                    ddl_hora.Items.Add("0" + i.ToString());
                }
                else
                {
                    ddl_hora.Items.Add(i.ToString());
                }
            }

            for (int i = 0; i <= 59; i++)
            {

                if (i.ToString().Length == 1)
                {
                    ddl_minutos.Items.Add("0" + i.ToString());
                }
                else
                {
                    ddl_minutos.Items.Add(i.ToString());
                }
            }

            listarVuelosRegistro();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            registrarVuelo();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {        
             registrarTicket();
        }
        
        //Registro del vuelo...
        public void registrarVuelo() {

            lbl_error.Text = "";
            validarCampos();
            if (verificarCampos()){
                temporada();
                variables.CodigoVuelo = int.Parse(txt_codigo.Text);
                fecha = calendario_ida.SelectedDate.ToString("yyyy-MM-dd");
                variables.Viaje = DateTime.Parse(calendario_ida.SelectedDate.ToString("yyyy-MM-dd") + " " + ddl_hora.SelectedValue + ":" + ddl_minutos.SelectedValue);
                variables.CodigoAdmin = variables.Usuario;
                registrar.registroVuelo(variables.CodigoVuelo, variables.Viaje, variables.Temporada, variables.CodigoAdmin, ddl_trayecto.SelectedValue);
                lbl_error.Text = registrar.Mensaje;            
            
            }else{               
                lbl_error.Text += "No se ha podido registrar el vuelo<br/>";
            }

        }

        // Registro del ticket...
        public void registrarTicket() {

            mensajesRegistroTickets();
            if (verificarRegistroTicket()) {

                if (restarAutonomia())
                {
                    registrar.registrarTicket(int.Parse(txt_idTicket.Text), int.Parse(ddl_aeronave.SelectedValue), ddl_piloto.SelectedValue, int.Parse(ddl_vuelo.SelectedValue));
                    registrar.sumarHorasVuelo(ddl_piloto.SelectedValue, ddl_vuelo.SelectedItem.ToString());
                    
                    if (registrar.Mensaje == "El ticket se ha registrado correctamente") {
                        datos.setAutonomia(int.Parse(ddl_aeronave.SelectedValue.ToString()), resta);
                    }                                       
                    lbl_errorTicket.Text = registrar.Mensaje;
                }
            }else {
                lbl_errorTicket.Text = registrar.Mensaje;
            }          
        }

        //Devuelve true si no se produjerón errores durante el registro del ticket...
        public bool verificarRegistroTicket() {

            if (!validacion.validarNumero(txt_idTicket.Text, 08)){
                return false;
            }else if (ddl_unidades.SelectedValue == ""){
                return false;
            }else if(ddl_aeronave.SelectedValue == ""){
                return false;
            }
            else if (ddl_piloto.SelectedValue == "")
            {
                return false;
            }
            else if (ddl_vuelo.SelectedValue == "")
            {
                return false;
            }                     
            
            else{
                return true;
            }
        
        }

        // Mustra mensajes de error en el registro del ticket..
        public void mensajesRegistroTickets() {

            if (!validacion.validarNumero(txt_idTicket.Text, 8))
            {
                lbl_validarTicket.Text = validacion.MensajeError;
            }
            if (ddl_unidades.SelectedValue == "")
            {
                lbl_validarUnidad.Text = "Debe seleccionar una unidad";
            }

            if(ddl_aeronave.SelectedValue == ""){
                lbl_errorTicket.Text += "Debe seleccionar una aeronave <br/>";
            }

            if (ddl_piloto.SelectedValue == "")
            {
                lbl_errorTicket.Text += "Debe seleccionar un piloto <br/>";
            }
             if (ddl_vuelo.SelectedValue == "")
            {
                lbl_errorTicket.Text += "Debe seleccionar un vuelo <br/>";
            }       
        }

        // Devuelve true si no se prdujo ningun error y se puede continuar con el registro del vuelo...
        public void validarCampos()
        {
            DateTime fechaIda = new DateTime();
            fechaIda = calendario_ida.SelectedDate;          
            TimeSpan ts = fechaIda - fechas;
            int diferenciaEnDias = ts.Days;

            if (!validacion.validarNumero(txt_codigo.Text, 4))
            {
                lbl_validarId.Text = validacion.MensajeError;
            }

            if (!validacion.validarCalendario(calendario_ida.SelectedDate.ToString("yyyy-MM-dd")))
            {
                lbl_error.Text = validacion.MensajeError;              
            }
            
            if( diferenciaEnDias <= 0){
                
                lbl_error.Text += "La fecha seleccionada no es valida<br/>";
            }
            if (diferenciaEnDias >= 7){

                lbl_error.Text += "No se pueden programar vuelos despues de una semana<br/>";
            }

          }

        //Muestra los mensajes de error en el registro del vuelo...
        public bool verificarCampos() {

            if (!validacion.validarNumero(txt_codigo.Text, 4))
            {
                return false;
            }

            else if (!validacion.validarCalendario(calendario_ida.SelectedDate.ToString("yyyy-MM-dd")))
            {
                return false;
            }

            else  if (int.Parse(calendario_ida.SelectedDate.ToString("dd")) <= fechas.Day)
            {
                return false;
            }

            else if (int.Parse(calendario_ida.SelectedDate.ToString("dd")) > fechas.Day + 7)
            {
                return false;
            }
            else
            {
                return true;
            }
                
        }

        //Resta la autonomia...
        private bool restarAutonomia()
        {

            duracionTrayecto = datos.getDuracion(ddl_vuelo.SelectedItem.ToString()).Value;
            autonomiaAvion = datos.getAutonomia(int.Parse(ddl_aeronave.SelectedValue.ToString())).Value;
            resta = autonomiaAvion - duracionTrayecto;
            if (resta >= 0)
            {
                lbl_errorTicket.Text = "";
                btn_recargar.Visible = false;
                return true;
            }
            else
            {
                lbl_errorTicket.Text = "El combustible se ha agotado debe recargar";
                btn_recargar.Visible = true;
                return false;
            }
        }

        //Realiza la acción de listar los vuelos..
        protected void listarVuelos(object sender, EventArgs e)
        {
            vistaRegistro.Visible = false;
            vistaProgramar.Visible = false;
            vistaReporte.Visible = false;
            vistaVuelos.Visible = true;
            lisatarVuelos();
        }

        // Muestra la vista del registro de vulos y oculta las demas...
        protected void ver(object sender, EventArgs e)
        {
            vistaVuelos.Visible = false;
            vistaProgramar.Visible = false;
            vistaReporte.Visible = false;
            vistaRegistro.Visible = true;
        }

        //Muestra la vista de la programación y oculta las demas...
        protected void vistaProgramacion(object sender, EventArgs e)
        {
            vistaVuelos.Visible = false;
            vistaRegistro.Visible = false;
            vistaReporte.Visible = false; 
            vistaProgramar.Visible = true;
        }

        //Mustra la vista de los reportes y oculta las demas...
        protected void vistaReportes(object sender, EventArgs e)
        {
            vistaVuelos.Visible = false;
            vistaRegistro.Visible = false;
            vistaProgramar.Visible = false;
            vistaReporte.Visible = true;
            string clientesF=null;
            string clientesI = null;
            grd_clientesFrecuentes.DataSource = datos.clientesFrecuentes(ref clientesF);
            grd_clientesFrecuentes.DataBind();
            lbl_clienteFrecuente.Text = clientesF;
            grd_clientesIdaVuelta.DataSource = datos.clientesIdaVuelta(ref clientesI);
            grd_clientesIdaVuelta.DataBind();
            lbl_idaRegreso.Text = clientesI;
            
        }

        // Lista los vuelosl a lo cuales ya se les ha asignado un ticket...
        private void lisatarVuelos() {
            grd_vuelos.DataSource = datos.listarVuelos();
            grd_vuelos.DataBind();       
       }

        //Llena el dropDown del los vuelos (lo que aun no estan asignados a un ticket)..
        private void listarVuelosRegistro() {
            ddl_vuelo.DataSource = datos.listarVuelosRegistro();
            ddl_vuelo.DataTextField = "Trayecto";
            ddl_vuelo.DataValueField = "IdVuelo";
            ddl_vuelo.DataBind();
        }

        // Selecciona la temporada dependiedo de la fecha del sistema..
        private void temporada()
        {
            if (verificarCampos())
            {
                if (fechas.Month == 4 || fechas.Month == 12 || fechas.Month == 1)
                {
                    variables.Temporada = "Alta";
                }
                else
                {
                    variables.Temporada = "Baja";
                }
            }

        }     

        // Mostrar las unididades de la aeronaves...
        protected void ddl_aeronave_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_unidades.Items.Clear();

            for (int i = 1; i <= datos.getUnidades(int.Parse(ddl_aeronave.SelectedValue));i++ )
            {
                ddl_unidades.Items.Add(i.ToString());
            }
        }

        // Mostrar más datos sobre el vuelo...
        protected void ddl_vuelo_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbl_vuelo.Text = ddl_vuelo.SelectedValue;
             
                 var con = (
                        from P in datos.GetTable<VUELOS>()
                        where P.IdVuelo == int.Parse(ddl_vuelo.SelectedValue)
                        select P).Single();
                 {
                     lbl_fechaHora.Text = con.FechaHoraViaje.ToString();
          
                 }

        }

        protected void cerrarSesion(object sender, EventArgs e){
            Session.Abandon();
            Response.Redirect("Inicio.aspx");
        }

        protected void btn_recargar_Click(object sender, EventArgs e)
        {
            idAvion = int.Parse(ddl_aeronave.SelectedValue);
            registrar.restablecerCombustible(idAvion, idAvion);
            btn_recargar.Visible = false;
            lbl_errorTicket.Text = "";
        }

    }
}

