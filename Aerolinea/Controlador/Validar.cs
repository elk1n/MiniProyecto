using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using Aerolinea.Datos;
using Aerolinea.Contrtolador;

namespace Aerolinea.Controlador
{
    public class Validar
    {
        private string mensajeError, errorId, errorNombre, errorUsuario, errorContrasenia;

        public void validarCampos(String id, String nombre, String usuario, String contrasenia, String confirmar){

            if (!validarNumero(id, 15))
            {
               errorId = MensajeError;
            }
            else
            {
                errorId = "";
            }
            if (!validarCampoTexto(nombre, 50))
            {
                errorNombre = MensajeError;
            }
            else
            {
                errorNombre = "";
            }
            if (!validarCampoTexto(usuario, 20))
            {
                errorUsuario = MensajeError;
            }
            else
            {
                errorUsuario = "";
            }
            if (!validarContrasenias(contrasenia, confirmar, 20))
            {
                errorContrasenia = MensajeError;
            }
            else
            {
                errorContrasenia = "";
            }

        }

        public string ErrorContrasenia
        {
            get { return errorContrasenia; }
            set { errorContrasenia = value; }
        }

        public string ErrorUsuario
        {
            get { return errorUsuario; }
            set { errorUsuario = value; }
        }

        public string ErrorNombre
        {
            get { return errorNombre; }
            set { errorNombre = value; }
        }

        public string ErrorId
        {
            get { return errorId; }
            set { errorId = value; }
        }

        public bool validarCampoTexto(String campoTexto, int numeroCaracteres)
        {

            if (campoTexto == null || campoTexto == "")
            {

                this.mensajeError = "Debe proporcionar un dato para este campo";
                return false;
            }

            else if (campoTexto.Length > numeroCaracteres)
            {

                this.mensajeError = "Máximo " + numeroCaracteres + " caracteres";
                return false;
            }

            else if (campoTexto.Trim() == "")
            {

                this.mensajeError = "No deben ser sólo espacios en blanco";
                return false;
            }

            else
            {
                this.mensajeError = "";
                return true;
            }
        }

        public bool validarContrasenias(String contrasenia, String confirmacion, int numeroCaracteres)
        {

            if (contrasenia == null || contrasenia == "" && confirmacion == null || confirmacion == "")
            {

                this.mensajeError = "Debe registrar una contraseña";
                return false;
            }
            if (contrasenia.CompareTo(confirmacion) != 0)
            {
                this.mensajeError = "Las contraseñas no coinciden";
                return false;
            }

            if (contrasenia.Length > numeroCaracteres)
            {

                this.mensajeError = "Máximo " + numeroCaracteres + " caracteres";
                return false;
            }
            else
            {
                this.mensajeError = "";
                return true;
            }

            {

            }

        }

        public bool validarNumero(String campoTexto, int numeroCaracteres)
        {

            if (campoTexto == null || campoTexto == "")
            {
                this.mensajeError = "Debe proporcionar un dato para este campo";
                return false;
            }
            else if (campoTexto.Length > numeroCaracteres)
            {
                this.mensajeError = "Máximo " + numeroCaracteres + " caracteres";
                return false;
            }

            else if (!Regex.IsMatch(campoTexto, "[0-9]+"))
            {
                this.mensajeError = "No es un número";
                return false;
            }
            else
            {
                this.mensajeError = "";
                return true;
            }

        }

        public bool validarCalendario(String calendario) {

            if (calendario.Equals("0001-01-01"))
            {
                this.mensajeError = "Debe seleccionar una fecha<br/>";
                return false;
            }
            else {
                this.mensajeError = "";
                return true;
            }
        
        }

        public string MensajeError
        {
            get { return mensajeError; }
            set { mensajeError = value; }
        }
    
        }

      
}