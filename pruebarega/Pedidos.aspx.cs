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
        public decimal maxPedido;
        public string usuarioMaxPedido;
        public decimal totalPedidos;
        protected void Page_Load(object sender, EventArgs e)
        {

            listaPedidos = (List<Pedido>)HttpContext.Current.Session["listaPedidos"];

            //var query = listaPedidos.GroupBy(pet => pet.NombreUsuario);

            var results = listaPedidos.GroupBy(
               p => p.NombreUsuario,
               (key, g) => new
               {
                   Usuario = key,
                   Pedidos = g.Select(o => o.Productos.ToList()).ToList(),
                   sumatorio = g.Select(o => o.Productos.ToList()).Sum(x => x.Sum(y => y.Precio))
               }).ToList();

            var maxObject = results.OrderByDescending(b => b.sumatorio).FirstOrDefault();
            
            usuarioMaxPedido = maxObject.Usuario;
            maxPedido = maxObject.sumatorio;
            totalPedidos = results.Sum(o => o.sumatorio);
            
            //var res = results.Sum(o => o.Pedidos.Sum(p => p.Sum(q => q.Precio)));
            

        }


    }
}