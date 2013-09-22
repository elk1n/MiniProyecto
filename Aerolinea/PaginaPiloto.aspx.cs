using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Comun;
using Aerolinea.Contrtolador;
using Aerolinea.Datos;

namespace Aerolinea
{
    public partial class PaginaPiloto : System.Web.UI.Page
    {
        private Atributos variables;
        private string usuario;
        private Comunicacion registro;
        private BaseDatosDataContext datos;

        protected void Page_Load(object sender, EventArgs e)
        {
            variables = new Atributos();
            registro = new Comunicacion();
            datos = new BaseDatosDataContext();


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

            listar();
        }


        private void listar() {

            var c = datos.vuelosPiloto(variables.Usuario);
            grd_piloto.DataSource = c;
            grd_piloto.DataBind();
        }

        protected void cerrarSesion(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Inicio.aspx");
        }

    }
}