package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.ConexionBD;

@WebServlet(name = "DocenteServlet", urlPatterns = {"/Docente"})
public class DocenteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String op = request.getParameter("op");
        ConexionBD conexion = new ConexionBD();
        HttpSession sesionOk = request.getSession();
        
        if (op.equalsIgnoreCase("login")) {
            String correo = request.getParameter("correo");
            String clave = request.getParameter("clave");
            try {
                PreparedStatement ps = conexion.conexionBD()
                        .prepareStatement("SELECT * FROM docente WHERE correo = ? AND clave = ? ");
                ps.setString(1, correo);
                ps.setString(2, clave);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    //HttpSession sesionOk = request.getSession();
                    sesionOk.setAttribute("nomDoc", rs.getString(2).toString());
                    sesionOk.setAttribute("gradoDoc", rs.getString(5).toString());
                    sesionOk.setAttribute("correoDoc", rs.getString(6).toString());
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                } else {
                    request.setAttribute("msg", "correo o clave incorrectos");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                
            } catch (Exception e) {
                System.out.println("Errir: " + e.getMessage());
            }
        } else if (op.equalsIgnoreCase("cerrar")) {
            //HttpSession sesionOk = request.getSession();
            sesionOk.invalidate();
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
