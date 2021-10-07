<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="pruebarega.Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="row">
       <br />
        <label>Pedidos Realizados</label>
       <br />
        <%if (listaPedidos != null) {%>
        
        <table id="tablaPedidos" style="width:50%;" class="table">
           <thead>
               <tr>
                    <td> Nombre </td>
                    <td style="text-align:center;">Pedido</td>
               </tr>
           </thead>
          <tbody>
         <% foreach (var item in listaPedidos) {  %>
           <tr>
               <td><%=item.NombreUsuario %></td>
                <td>
                    <table style="width:100%;">
                         <tr>
                            <th>Codigo Producto</th>
                            <th>Nombre</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                        </tr>
                         <% foreach (var producto in item.Productos) { %>
                        <tr>
                             <td><%=producto.CodigoProducto%></td>
                             <td><%=producto.Nombre%></td>
                             <td><%=producto.Cantidad%></td>
                             <td><%=producto.Precio%></td>
                        </tr>
                        <%} %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Total :<%=item.Productos.Sum(o => o.Precio) %></td>

                        </tr>
                    </table>
                </td>
           </tr>
        <%} %>
         </tbody>
          <tfoot>
            <tr>
              <td></td>
              <td style="text-align:right;">El total de los pedidos es: <%=totalPedidos%></td>
            </tr>
          </tfoot>
        </table>

        <div class="row">
            <div class="col-md-4">
                <p>El usuario que ha realizado el gasto mayor es : <%=usuarioMaxPedido%> con un total de <%=maxPedido %></p>
                
            </div>
        </div>
        <% }%>
</asp:Content>
