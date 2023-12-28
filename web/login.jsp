
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Login Docente</h2>
        <form action="Docente">
            <label>
                Correo:
                <input type="text" name="correo"/>
            </label>
            <label>
                Contraseña:
                <input type="password" name="clave"/>
            </label>
            <input type="hidden" name="op" value="login"/>
            <input type="submit" value="Iniciar Sesion"/>
        </form>
        <%
            if(request.getAttribute("msg") != null) {
                String msg = request.getAttribute("msg").toString();
                %>
                <strong> <%=msg%> </strong>
                <%
            }
        %>
        
        <%
            if(request.getParameter("msgSession") != null) {
                String msgSession = request.getParameter("msgSession").toString();
                %>
                <strong> <%=msgSession%> </strong>
                <%
            }
        %>
    </body>
</html>
