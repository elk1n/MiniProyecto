using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Comun;
using Aerolinea.Controlador;
using Aerolinea.Datos;
using Aerolinea.Contrtolador;


namespace Aerolinea
{
    public partial class Registro : System.Web.UI.Page
    {
        Validar validacion;
        Comunicacion registro;

        protected void Page_Load(object sender, EventArgs e)
        {
          
            validacion = new Validar();
            registro = new Comunicacion();

        }
      
        public void validarCampos() {

            validacion.validarCampos(txt_identificacion.Text, txt_nombre.Text, txt_usuario.Text, txt_contrasenia.Text, txt_repitaContrasenia.Text);
            lbl_validarId.Text = validacion.ErrorId;
            lbl_validarNombre.Text = validacion.ErrorNombre;
            lbl_validarUsuario.Text = validacion.ErrorUsuario;
            lbl_validarContrasenias.Text = validacion.ErrorContrasenia;

            if (validacion.ErrorId == "" && validacion.ErrorNombre =="" && validacion.ErrorUsuario =="" && validacion.ErrorContrasenia==""){
               
                registro.registroPasajero(txt_identificacion.Text, txt_nombre.Text, txt_usuario.Text, txt_contrasenia.Text);
                lbl_mensajes.Text = "El pasajero se ha registrado correctamente";
                txt_identificacion.Text = null;
                txt_nombre.Text = null;
                txt_usuario.Text = null;
                
            }
            else{

                lbl_mensajes.Text = "El pasajero no se ha registrado favor intente más tarde";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           validarCampos();
        }
    }
}