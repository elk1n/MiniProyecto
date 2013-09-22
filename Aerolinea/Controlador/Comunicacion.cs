using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aerolinea.Datos;
using System.Web.UI.WebControls;
using System.Data.Linq.Mapping;
using System.Data.SqlClient;
using System.Data;
using Comun;

namespace Aerolinea.Contrtolador
{
    public class Comunicacion
    {
        private BaseDatosDataContext datos;

        private Atributos usuarios;
        private Conexion con;
        Bienvenidos master;
        private string usuario, contrasenia, mensaje, mensajeCombustible;
        private int resta, millas;

        public int Millas
        {
            get { return millas; }
            set { millas = value; }
        }

        public int Resta
        {
            get { return resta; }
            set { resta = value; }
        }

        public string Mensaje
        {
            get { return mensaje; }
            set { mensaje = value; }
        }

        public string MensajeCombustible
        {
            get { return mensajeCombustible; }
            set { mensajeCombustible = value; }
        }

        public Comunicacion()
        {
            datos = new BaseDatosDataContext();
            con = new Conexion();
            usuarios = new Atributos();
            master = new Bienvenidos();
        }

        public void getMillas(int ticket) {

            var mill = datos.getMillas(ticket);
            millas = mill.Value;

        }
        public void registroPasajero(String id, String nombre, String usuario, String contrasenia){

            var guardar = datos.registrarPasajero(id, nombre, usuario, contrasenia, null, null); 
        }

        public void registroVuelo(int id, DateTime viaje, String temporada, string admin, string trayecto) {

            var vuelo = datos.registrarVuelo(id, viaje, temporada,admin,trayecto, ref mensaje);
        }

        public void restablecerCombustible(int opcion, int avion) {

            var combus = datos.restablecerAutonomia(opcion, avion, ref mensaje);
        }

        public void registrarTicket(int codigo, int avion, string piloto, int vuelo) {

            var ticket = datos.registrarTicket(codigo, avion, piloto, vuelo, ref mensaje);

        }

        public void sumarHorasVuelo(string piloto, string trayecto) {

            var hora = datos.sumarHorasVuelo(piloto, trayecto);   
        }

        public void listarVuelosPiloto(string piloto) {

            var lista = datos.vuelosPiloto(piloto);
        }

        public void registrarDetalle(int codigoTicket, string idUsuario) {

         //   var detalle = datos.registrarDetalle(codigoTicket, idUsuario);

        }

        public bool inicioSesionPasajero(String usuario, String contrasenia){

            try{
                var con = (
                        from P in datos.GetTable<PASAJEROS>()
                        where P.Usuario == usuario && P.Contrasenia == contrasenia
                        select P).Single();
                {
                    this.usuario = con.Usuario;
                    this.contrasenia = con.Contrasenia;
                }
                if (this.usuario == usuario && this.contrasenia == contrasenia) {                    
                    return true;
                }else{
                    return false;
                }

            }catch (Exception e){
                return false;
            }
        }

        public bool inicioSesionPiloto(String usuario, String contrasenia){

            try{
                var con = (
                          from P in datos.GetTable<PILOTOS>()
                          where P.Usuario == usuario && P.Contrasenia == contrasenia
                          select P).Single();
                {
                    this.usuario = con.Usuario;
                    this.contrasenia = con.Contrasenia;
                }
                if (this.usuario == usuario && this.contrasenia == contrasenia){
                    return true;
                }else{
                    return false;
                }
            }catch (Exception e){
                return false;
            }
        }

        public bool inicioSesionAdministrador(String usuario, String contrasenia)
        {
            try{
                var con = (
                         from P in datos.GetTable<ADMINISTRADOR>()
                         where P.Usuario == usuario && P.Contrasenia == contrasenia
                         select P).Single();
                {
                    this.usuario = con.Usuario;
                    this.contrasenia = con.Contrasenia;
                }
                if (this.usuario == usuario && this.contrasenia == contrasenia)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }catch (Exception e){
                return false;
            }

        }

    }
}