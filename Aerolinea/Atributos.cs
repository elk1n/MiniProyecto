using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Comun
{
    public class Atributos
    {
        private string identificacion, nombre, usuario, contrasenia, confirmar, temporada, codigoAdmin;
        private int codigoVuelo;
        private DateTime viaje;
        private decimal valor;
        private bool idaVuelta;

        public string Temporada
        {
            get { return temporada; }
            set { temporada = value; }
        }

        public string CodigoAdmin
        {
            get { return codigoAdmin; }
            set { codigoAdmin = value; }
        }
        
        public int CodigoVuelo
        {
            get { return codigoVuelo; }
            set { codigoVuelo = value; }
        }

        public bool IdaVuelta
        {
            get { return idaVuelta; }
            set { idaVuelta = value; }
        }
     
        public DateTime Viaje
        {
            get { return viaje; }
            set { viaje = value; }
        }
        
        public decimal Valor
        {
            get { return valor; }
            set { valor = value; }
        }

        public string Confirmar
        {
            get { return confirmar; }
            set { confirmar = value; }
        }

        public string Contrasenia
        {
            get { return contrasenia; }
            set { contrasenia = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Identificacion
        {
            get { return identificacion; }
            set { identificacion = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
       
    }
}