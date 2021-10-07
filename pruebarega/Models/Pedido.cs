using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pruebarega.Models
{
    public class Pedido
    {
        public List<Item> Productos { get; set; }
        public string NombreUsuario { get; set; }

        public Pedido()
        {
            this.Productos = new List<Item>();
        }
    }
}