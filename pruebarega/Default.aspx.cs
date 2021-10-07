
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Newtonsoft.Json;
using pruebarega.Models;
using System.Web.Script.Serialization;
namespace pruebarega
{
    public partial class _Default : Page
    {

        public static List<Item> listaUsuarios = new List<Item>();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string NombreUsuario = txtNombre.Text;

            
        }

        [WebMethod(EnableSession = true)]
        //public static string addProduct(string CodigoProducto, string Nombre, int Cantidad, decimal Precio)
        public static string addProduct(Item item)
        {
            listaUsuarios.Add(item);
            HttpContext.Current.Session["listaUsuarios"] = listaUsuarios;


            JavaScriptSerializer serializador = new JavaScriptSerializer();
            var result = serializador.Serialize(listaUsuarios);

            return result;       

        }


        [WebMethod(EnableSession = true)]
        //public static string addProduct(string CodigoProducto, string Nombre, int Cantidad, decimal Precio)
        public static string generarPedido(Item item)
        {
            

            return "";

        }       
    }
}