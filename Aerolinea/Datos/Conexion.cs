using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Aerolinea.Datos
{
    public class Conexion
    {

        private SqlConnection conectar;

        public SqlConnection Conectar
        {
            get { return conectar; }
            set { conectar = value; }
        }

        public void conectarBaseDatos()
        {

            conectar = new SqlConnection();
            //conectar.ConnectionString = "Data Source=SENA-PC\\SQLEXPRESS;Initial Catalog=AEROLINEA; Integrated Security=true";
            conectar.ConnectionString = "Data Source=E1KIN\\SQLSERVER;Initial Catalog=AEROLINEA; Integrated Security=true";

            try
            {
                conectar.Open();

            }
            catch (Exception c)
            {
                System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=" + "JavaScript" + ">alert(" + c.Message + ")</SCRIPT>");
            }
        }

        public void desconectar()
        {
            conectar.Close();
        }

    }
}