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
    public partial class PaginaPasajero : System.Web.UI.Page
    {

        private string usuario,mensaje;
        private int idTicket, idTicketRegreso;
        private Bienvenidos master;
        private Atributos variables;
        private DateTime fechas = DateTime.Now;
        private Validar validacion;
        private Comunicacion registrar;
        private BaseDatosDataContext datos;
        private double valorTotal, valor;

        protected void Page_Load(object sender, EventArgs e)
        {

            datos = new BaseDatosDataContext();
            master = new Bienvenidos();
            variables = new Atributos();
            validacion = new Validar();
            registrar = new Comunicacion();

            try
            {
                if (Session["Usuario"].ToString() != "" && Session["nombreUsuario"].ToString() != "")
                {
                    usuario = Session["Usuario"].ToString();
                    variables.Usuario = Session["nombreUsuario"].ToString();
                    lbl_usuario.Text = variables.Usuario;
                }
            }

            catch (Exception)
            {
                Response.Redirect("Inicio.aspx");
            }

            listarVuelos();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            seleccion();

        }

        //Registra
        private void registro() {

            validar();
            if (confirmarDatos())
            {
                if (validarPeso())
                {

                    calcularValorTotal();
                    if (ddl_ida.SelectedValue == "0")
                    {
                        datos.registrarVoleto(datos.getIdPasajero(variables.Usuario), decimal.Parse(valorTotal.ToString()), false, idTicket, null, double.Parse(txt_pesoIda.Text), ref mensaje);
                        lbl_mensajes.Text = mensaje;                       
                    }
                    else if (ddl_ida.SelectedValue == "1")
                    {
                        datos.registrarVoleto(datos.getIdPasajero(variables.Usuario), decimal.Parse(valorTotal.ToString()), true, idTicket, idTicketRegreso, double.Parse(txt_pesoIda.Text) + double.Parse(txt_pesoRegreso.Text), ref mensaje);
                        lbl_mensajes.Text = mensaje;                     
                    }
                    if (mensaje == "Su voleto se ha generado correctamente")
                    {
                        setDatos();
                        lbl_mensajeFinal.Text = "El valor del voleto es: " + valorTotal + "<br/>El total de sus millas es: " + datos.getMillasPasajero(variables.Usuario).Value;
                    }
                }
            }
        }

        //Selecciona un apción para guardar los datos
        public void seleccion() {
            
            if(ddl_ida.SelectedValue == "0"){
                if (obtenerId()) {
                    registro();
                }            
            }
            else if(ddl_ida.SelectedValue == "1"){
                if (obtenerId() && obtenerIdRegreso())
                {
                    registro();
                }
            }                      
            }      

        // Guarda el peso las millas y los asientos...
        private void setDatos() {

            if(ddl_ida.SelectedValue =="0"){

                datos.setMillas(variables.Usuario, datos.getMillas(idTicket));
                datos.setPesoEquipaje(idTicket, int.Parse(txt_pesoIda.Text));
                datos.setAsientos(idTicket);
            }
            else if (ddl_ida.SelectedValue == "1") {

                datos.setMillas(variables.Usuario, datos.getMillas(idTicket));
                datos.setMillas(variables.Usuario, datos.getMillas(idTicketRegreso));
                datos.setPesoEquipaje(idTicket, int.Parse(txt_pesoIda.Text));
                datos.setPesoEquipaje(idTicketRegreso, int.Parse(txt_pesoRegreso.Text));
                datos.setAsientos(idTicket);
                datos.setAsientos(idTicketRegreso);
            }
        }

        // Obtiene los id de los tickets para operar con ellos...
        private bool obtenerId() {

            if (grd_ida.SelectedRow != null)
            {
                idTicket = int.Parse(grd_ida.Rows[grd_ida.SelectedRow.RowIndex].Cells[9].Text);
                return true;
            }                        
                   
            else
            {
                lbl_mensajes.Text = "Debe seleccionar un vuelo";
                return false;
            } 
        }

        //Se asegura que si el dropdown de ida y resegro esta en si... algún vuelo de regreso este marcado
        private bool obtenerIdRegreso() {

            if (ddl_ida.SelectedValue == "1")
            {
                if (grd_ida.SelectedRow != null && grd_regreso.SelectedRow != null)
                {
                    idTicket = int.Parse(grd_ida.Rows[grd_ida.SelectedRow.RowIndex].Cells[9].Text);
                    idTicketRegreso = int.Parse(grd_regreso.Rows[grd_regreso.SelectedRow.RowIndex].Cells[9].Text);
                    return true;
                }
                else
                {
                    lbl_mensajes.Text = "Debe seleccionar un vuelo de ida y regreso";
                    return false;
                }
            }
            else {
                return false;
            }
        
        }

        //Devuelve verdadero si todos los campos son correctos...
        public bool confirmarDatos() {

            if (!validacion.validarNumero(txt_pesoIda.Text, 3))
            {
                return false;
            }
            if (grd_ida.SelectedRow == null)
            {
                return false;
            }
            if (datos.getAsientos(idTicket).Value<=0)
            {
                return false;
            }

            if (ddl_ida.SelectedValue == "1")
            {
                if (!validacion.validarNumero(txt_pesoRegreso.Text, 3))
                {
                    return false;
                }
                if (grd_regreso.SelectedRow == null)
                {
                    return false;
                }
                if (int.Parse(grd_ida.Rows[grd_ida.SelectedRow.RowIndex].Cells[9].Text) == int.Parse(grd_regreso.Rows[grd_regreso.SelectedRow.RowIndex].Cells[9].Text))
                {
                    return false;
                }
                if (grd_ida.Rows[grd_ida.SelectedRow.RowIndex].Cells[2].Text != grd_regreso.Rows[grd_regreso.SelectedRow.RowIndex].Cells[1].Text && grd_ida.Rows[grd_ida.SelectedRow.RowIndex].Cells[1].Text != grd_regreso.Rows[grd_regreso.SelectedRow.RowIndex].Cells[2].Text)
                {
                    return false;
                }
                if (datos.getFechaViaje(idTicket).Value >= datos.getFechaViaje(idTicketRegreso).Value)
                {
                    return false;
                }

                if (datos.getAsientos(idTicketRegreso).Value <= 0)
                {
                    return false;
                } 

                else {
                    return true;
                }
            }
            else {
                return true;
            }
        }

        //Muestra mensajes de error que se producen al llenar o no llenar campos...
        public void validar() {

            if (!validacion.validarNumero(txt_pesoIda.Text, 3)){
                lbl_validarPesoIda.Text = validacion.MensajeError;
            }
            if (grd_ida.SelectedRow == null)
            {
                lbl_validarIda.Text = "Debe seleccionar un vuelo ";
            }
            else {
                lbl_validarIda.Text = "";
            }

            if (ddl_ida.SelectedValue == "1")
            {           
                if (!validacion.validarNumero(txt_pesoRegreso.Text, 3)){
                    lbl_validarPesoRegreso.Text = validacion.MensajeError;
                }
                if (grd_regreso.SelectedRow == null){

                     lbl_validarRegreso.Text = "Debe seleccionar un vuelo ";
                }
                if (int.Parse(grd_ida.Rows[grd_ida.SelectedRow.RowIndex].Cells[9].Text) == int.Parse(grd_regreso.Rows[grd_regreso.SelectedRow.RowIndex].Cells[9].Text))
                {
                    lbl_mensajes.Text = "No debe seleccionar el mismo vuelo de regreso";
                }

                if (grd_ida.Rows[grd_ida.SelectedRow.RowIndex].Cells[2].Text != grd_regreso.Rows[grd_regreso.SelectedRow.RowIndex].Cells[1].Text || grd_ida.Rows[grd_ida.SelectedRow.RowIndex].Cells[1].Text != grd_regreso.Rows[grd_regreso.SelectedRow.RowIndex].Cells[2].Text)
                {
                    lbl_mensajes.Text = "El trayecto debe ser de ida y regreso";
                }
                if (datos.getFechaViaje(idTicket).Value >= datos.getFechaViaje(idTicketRegreso).Value) {

                    lbl_mensajes.Text = "La fecha de regreso debe ser posterior a la fecha de ida";
                }


            }
        }

        // Valida que el peso no sebrepase la capacidad de la aeronave...
        public bool validarPeso() {

            double peso = 0;
            double pesoRegreso = 0;

            if (obtenerId())
            {
                if (grd_ida.SelectedRow != null && validacion.validarNumero(txt_pesoIda.Text, 3))
                {
                    peso = double.Parse(txt_pesoIda.Text) + datos.getPesoTicket(idTicket).Value;
                    if (peso > datos.getCarga(idTicket).Value)
                    {
                        lbl_validarPesoIda.Text = "El peso de su equipaje excede la capacidad de carga del avión";
                        return false;
                    }
                    else
                    {
                        lbl_validarPesoIda.Text = "";
                        return true;
                    }
                }
                else if (ddl_ida.SelectedValue == "1" && validacion.validarNumero(txt_pesoIda.Text, 3) && validacion.validarNumero(txt_pesoRegreso.Text, 3))
                {
                    peso = double.Parse(txt_pesoIda.Text) + datos.getPesoTicket(idTicket).Value;
                    pesoRegreso = double.Parse(txt_pesoRegreso.Text) + datos.getPesoTicket(idTicketRegreso).Value;

                    if (peso > datos.getCarga(idTicket).Value)
                    {
                        lbl_validarPesoIda.Text = "El peso de su equipaje excede la capacidad de carga del avión";
                        return false;
                    }
                    else if (pesoRegreso > datos.getCarga(idTicketRegreso).Value)
                    {

                        lbl_validarPesoRegreso.Text = "El peso de su equipaje excede la capacidad de carga del avión";
                        return false;
                    }
                    else
                    {
                        lbl_validarPesoIda.Text = "";
                        lbl_validarPesoRegreso.Text = "";
                        return true;
                    }

                }
                else
                {
                    return false;
                }
            }
             else
                {
                    return false;
                }
            }     

        //Calcula el valor total del voleto, si un viaje o es de ida y regreso...
        private void calcularValorTotal()
        {

            if (ddl_ida.SelectedValue == "0")
            {

                valorTotal = calcularValor(idTicket);
            }
            else if (ddl_ida.SelectedValue == "1")
            {

                valorTotal = calcularValor(idTicket) + calcularValor(idTicketRegreso);
            }

        }

        //Calcula el valor de un voleto...
        private double calcularValor(int ticket)
        {

            if (datos.getTemporada(ticket) == "Baja" && datos.getMillasPasajero(variables.Usuario) < 500)
            {
                this.valor = double.Parse(datos.getPrecio(ticket).ToString());
            }
            else if (datos.getTemporada(ticket) == "Alta" && datos.getMillasPasajero(variables.Usuario) < 500)
            {
                this.valor = double.Parse(datos.getPrecio(ticket).ToString()) * 1.20;
            }
            else if (datos.getTemporada(ticket) == "Baja" && datos.getMillasPasajero(variables.Usuario) > 500)
            {

                this.valor = double.Parse(datos.getPrecio(ticket).ToString()) - (double.Parse(datos.getPrecio(ticket).ToString()) * 0.15);
            }

            else if (datos.getTemporada(ticket) == "Alta" && datos.getMillasPasajero(variables.Usuario) > 500)
            {
                this.valor = double.Parse(datos.getPrecio(ticket).ToString()) * 1.20;
                this.valor = valor - (valor * 0.15);
            }
            return this.valor;
        }

        //Lista lo vuelos disponibles, es dicir los que tienen asientos...
        public void listarVuelos()
        {
            var d = datos.vuelosPasajero();
            grd_ida.DataSource = d;
            grd_ida.DataBind();
            var c = datos.vuelosPasajero();
            grd_regreso.DataSource = c;
            grd_regreso.DataBind();

            if (ddl_ida.SelectedValue == "1")
            {
                vistaRegreso.Visible = true;
            }
            else if (ddl_ida.SelectedValue == "0")
            {
                vistaRegreso.Visible = false;
            }

        }

        protected void cerrarSesion(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Inicio.aspx");
        }

        // Habilita la opción de ida y regreso...
        protected void grd_ida_SelectedIndexChanged(object sender, EventArgs e)
        {
               ddl_ida.Enabled = true;
        }

        protected void grd_regreso_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}