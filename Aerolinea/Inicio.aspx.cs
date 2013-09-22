using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aerolinea.Datos;
using Aerolinea.Contrtolador;
using Aerolinea.Controlador;

namespace Aerolinea
{
    public partial class Inicio : System.Web.UI.Page {

       Comunicacion inicio;
       Validar validar;
       private static string usu, contras;

       protected void Page_Load(object sender, EventArgs e) {

           inicio = new Comunicacion();
           validar = new Validar();
        }

        protected void Button1_Click(object sender, EventArgs e){

            if(ddl_tipoUsuario.SelectedValue == "0"){
                Session["TipoUsuario"] = "Pasajero";
                Response.Redirect("Registro.aspx");
            }else {
                lbl_mensajes.Text = "Debe obtener un nombre de usuario y contraseña de parte del administrador";            
            }
        }

        protected void btn_iniciarSesion_Click(object sender, EventArgs e){
            inicioSesion();
        }

        public void inicioSesion() {

            if (validar.validarCampoTexto(txt_usuario.Text, 20) && validar.validarCampoTexto(txt_contrasenia.Text, 20)){
                if(ddl_tipoUsuario.SelectedValue == "0"){

                    if (inicio.inicioSesionPasajero(txt_usuario.Text, txt_contrasenia.Text)){
 
                        Session["Usuario"] = "pasajero";
                        Session["nombreUsuario"] = txt_usuario.Text;
                        Response.Redirect("PaginaPasajero.aspx");
                    }else{
                        lbl_mensajes.Text = "Nombre de usuario o contraseña incorrecta";
                    }               
                }

                if (ddl_tipoUsuario.SelectedValue == "1") {

                    if (inicio.inicioSesionPiloto(txt_usuario.Text, txt_contrasenia.Text)){
                        Session["Usuario"] = "piloto";
                        Session["nombreUsuario"] = txt_usuario.Text;
                        Response.Redirect("PaginaPiloto.aspx");
                    }else{                      
                        lbl_mensajes.Text = "Nombre de usuario o contraseña incorrecta";
                    }                          
                }

                if (ddl_tipoUsuario.SelectedValue == "2") {

                    if (inicio.inicioSesionAdministrador(txt_usuario.Text, txt_contrasenia.Text)){

                        Session["Usuario"] = "administrador";
                        Session["nombreUsuario"] = txt_usuario.Text;
                        Response.Redirect("PaginaAdministrador.aspx");
                    }else{
                        lbl_mensajes.Text = "Nombre de usuario o contraseña incorrecta";
                    }                   
                }        
            }else {
                lbl_mensajes.Text = "Ingrese un nombre de usuario y una contraseña";
            }
        
        }
    }
}