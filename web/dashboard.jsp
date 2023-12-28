
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
    String nomDoc = "";
    String gradoDoc = "";
    String correoDoc = "";
    HttpSession sesionOk = request.getSession();
    if(sesionOk.getAttribute("nomDoc")==null){
        %>
        <jsp:forward page="login.jsp">
            <jsp:param name="msgSession" value="Debe loguearse obligatoriamente"/>
        </jsp:forward>    
        <%
    } else {
        nomDoc = (String) sesionOk.getAttribute("nomDoc");
        gradoDoc = (String) sesionOk.getAttribute("gradoDoc");
        correoDoc = (String) sesionOk.getAttribute("correoDoc");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        <link rel="icon" href="assets/Clase.png">
    </head>
    <body>
        <h1>Tablero</h1>
        <h3>Bienvenido: <%= nomDoc %></h3>
        <h5> <%= correoDoc %></h5>
        <strong>Operaciones</strong>
        <ul>
            <% if(gradoDoc.equals("Senior") || gradoDoc.equals("Master")) { %>
                <li><a href="#">Crear un nuevo curso</a></li>
            <% } %>
            <li><a href="#">Editar un curso existente</a></li>
            <% if(gradoDoc.equals("Master")) { %>
                <li><a href="#">Eliminar un curso</a></li>
            <% } %>
            <li><a href="#">Ver las calificaciones de los estudiantes</a></li>
            <% if(gradoDoc.equals("Senior") || gradoDoc.equals("Master")) { %>
                <li><a href="#">Cambiar las calificaciones de los estudiantes</a></li>
            <% } %>
        </ul>
        <a href="Docente?op=cerrar">Cerrar Sesión</a>
    </body>
</html>
