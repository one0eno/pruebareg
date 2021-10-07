using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pruebarega.Models
{
    public class Item
    {
        public string CodigoProducto { get; set; }
        public string Nombre { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
    }
}