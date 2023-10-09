<%-- 
    Document   : monedero
    Created on : 5 oct. 2023, 21:17:33
    Author     : Equipo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Monedero</title>
    <link rel="stylesheet" type="text/css" href="../CSS/monedero.css">
</head>
<body>
<%
    // Obtener el precio y la cantidad entregada del formulario
    float precio = Float.parseFloat(request.getParameter("precio"));
    float entregado = Float.parseFloat(request.getParameter("entregado")); 
    String respuesta = "";
    float cambio = entregado - precio;
    float quinientos = 500.0f;
    float dividendo;
    int contadorTipo = 0; 

    // Verificar si el número del precio es mayor que el número entregado
    if (precio > entregado) {
        // Caso en el que el precio es mayor que la cantidad entregada (no se hace nada en este caso)
    } else if (precio == entregado) {
        // Caso en el que el precio es igual a la cantidad entregada (no se hace nada en este caso)
    } else {
%>
        <div class="container">
<%
        // Bucle para calcular el cambio con billetes de 500
        while (cambio > 0.01f) {
            if (quinientos <= cambio) {
                int cantidadBilletes = (int) (cambio / quinientos); // Calcular la cantidad de billetes

                // Mostrar la imagen y cantidad de billetes
                %>
                <div class="item">
                    <img src="../img/<%=quinientos%>.png"/>
                    <p>Cantidad: <%=cantidadBilletes%></p>
                </div>
                <%

                cambio -= quinientos * cantidadBilletes; // Restar el valor total de los billetes
            } else {
                String quinientosCadena = Float.toString(quinientos);
                dividendo = quinientosCadena.contains("5") ? 2.5f : 2.0f;

                quinientos = quinientos / dividendo; // Reducir el valor de quinientos
            }
        }
%>
        </div>
<%
    }
    if (respuesta.length() > 0) {
%>
        <h2>Cambio: <%= cambio %></h2>
        <p><%= respuesta %></p>
<%
    }
%>

<p><a href="../monedero.html">Realizar otra operación</p>
</body>
</html>
