import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ConfirmCancelServlet")
public class ConfirmCancelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketIdStr = request.getParameter("ticketId");
        if(ticketIdStr == null) { 
            response.getWriter().println("Ticket ID missing"); 
            return; 
        }

        try {
            int ticketId = Integer.parseInt(ticketIdStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");

            String sqlAdmin = "UPDATE tickets SET status='Cancelled' WHERE id=?";
            PreparedStatement psAdmin = con.prepareStatement(sqlAdmin);
            psAdmin.setInt(1, ticketId);
            psAdmin.executeUpdate();

            con.close();

        
            response.sendRedirect("Adminticket.jsp");

        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
