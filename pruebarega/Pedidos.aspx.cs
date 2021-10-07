using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pruebarega.Models;
namespace pruebarega
{
    public partial class Pedidos : System.Web.UI.Page
    {
        public List<Pedido> listaPedidos = new List<Pedido>();
        public decimal maxPedidos;

        protected void Page_Load(object sender, EventArgs e)
        {

            listaPedidos = (List<Pedido>)HttpContext.Current.Session["listaPedidos"];

        }
    }
}