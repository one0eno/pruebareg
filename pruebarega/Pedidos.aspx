﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="pruebarega.Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="row">

       
        
        <table id="tablaPedidos">
           <thead>
            <td> Nombre </td>
            <td style="text-align:center;">Pedido</td>
           </thead>
          <tbody>
         <% foreach (var item in listaPedidos) { 
                
                
                %>
           <tr>
               <td><%=item.NombreUsuario %></td>
                <td>
                    <table>
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
              
            </tr>
          </tfoot>
        </table>
        
</asp:Content>
