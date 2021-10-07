﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pruebarega._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        
    </div>

    <div class="row">
        <div class="col-md-4">
        <label>Nombre</label>
         <br />
        <asp:TextBox ID="txtNombre"  runat="server"></asp:TextBox>
        <br />
         <br />
        <label>CodigoProducto</label>
            <br />
        <asp:TextBox ID="txtCodigoProducto"  runat="server"></asp:TextBox>
        <br />
        <label>Nombre Producto</label>
            <br />
        <asp:TextBox ID="txtNombreProducto"  runat="server"></asp:TextBox>
        <br />
        <label>Cantidad</label>
            <br />
        <asp:TextBox ID="txtCantidad"   runat="server"></asp:TextBox>
        <br />
        <label>Precio</label>
            <br />
        <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
            <br />
        <asp:button runat="server" OnClientClick="addProducto(); return false;" Text="Añadir producto" />
        <asp:button runat="server" OnClientClick="endOrder(); return false;" Text="Terminar Pedido" />
        <a href="/pedidos.aspx">Pedidos</a>
        </div>

    </div>
    <div class="row">

        <table id="tablaproductos">
          <thead>
            <tr>
                <th>Codigo Producto</th>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Precio</th>
            </tr>
          </thead>
          <tbody>
           
          </tbody>
          <tfoot>
           
          </tfoot>
        </table>

       

    </div>

    <script type="text/javascript">

        var listaProductos = [];

        function addProducto() {
            var codigoProducto = document.getElementById("<%=txtCodigoProducto.ClientID%>").value;
            var nombreProducto = document.getElementById("<%=txtNombreProducto.ClientID%>").value;
            var cantidad = document.getElementById("<%=txtCantidad.ClientID%>").value;
            var precio = document.getElementById("<%=txtPrecio.ClientID%>").value;

            var data = {
                item:{
                    CodigoProducto: codigoProducto,
                    Nombre: nombreProducto,
                    Cantidad: cantidad,
                    Precio: precio
                }
            }

            $.ajax({
                url: "Default.aspx/addProduct",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: OnSuccess,
                error: onError
            });
        }

        function OnSuccess(data) {

            var lista =[];

            lista =JSON.parse(data.d);
            listaProductos = lista;

            var body = document.getElementById('tablaproductos').getElementsByTagName('tbody')[0];
           
            $("#tablaproductos tr").remove(); 

            lista.forEach((item, index) => {

                body.insertRow().innerHTML =
                     "<td>" + item.CodigoProducto +"</td>" +
                     "<td>" + item.Nombre + "</td>" +
                     "<td>" + item.Cantidad+ "</td>" +
                     "<td>" + item.Precio + "</td>";
            });
            
        }

        function onError() {
            alert('Se ha producido un error');
        }

        function endOrder(){
            
            
            var nombreUsuario = document.getElementById("<%=txtNombre.ClientID%>").value;

            var data = {
                pedido:{
                    Productos:listaProductos,
                    NombreUsuario:nombreUsuario
                }
            }

            $.ajax({
                url: "Default.aspx/endOrder",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: OnSuccessPedido,
                error: onError
            });
        }

        function OnSuccessPedido(){
           
           document.getElementById("<%=txtCodigoProducto.ClientID%>").value ="";
           document.getElementById("<%=txtNombreProducto.ClientID%>").value ="";
           document.getElementById("<%=txtCantidad.ClientID%>").value="";
           document.getElementById("<%=txtPrecio.ClientID%>").value="";
            
           $("#tablaproductos tr").remove(); 

           
          
        }



        
        
</script>
</asp:Content>




