
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

        public static List<Item> listaProductos = new List<Item>();
        public static List<Pedido> listaPedidos = new List<Pedido>();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        { 
        }

        [WebMethod(EnableSession = true)]
        
        public static string addProduct(Item item)
        {
            listaProductos.Add(item);
            HttpContext.Current.Session["listaProductos"] = listaProductos;
            JavaScriptSerializer serializador = new JavaScriptSerializer();
            var result = serializador.Serialize(listaProductos);

            return result;       
        }


        [WebMethod(EnableSession = true)]
        public static string endOrder(Pedido pedido)
        {
            listaPedidos.Add(pedido);
            HttpContext.Current.Session["listaPedidos"] = listaPedidos;

            listaProductos = new List<Item>();
            HttpContext.Current.Session["listaProductos"] = listaProductos;

            return "Ok";

        }       
    }
}