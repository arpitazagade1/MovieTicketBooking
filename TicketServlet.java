import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/TicketServlet")
public class TicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("Name");
        String title = (String) session.getAttribute("title");
        String cinema = (String) session.getAttribute("cinema_name");
        String time = (String) session.getAttribute("selectedTime");
        String seats = (String) session.getAttribute("selectedSeats");
        String date = (String) session.getAttribute("date");
        String totalPrice = (String) session.getAttribute("totalPrice");

        if(name == null || title == null || cinema == null || seats == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String cancelRequest = request.getParameter("cancelRequest");
        String ticketIdParam = request.getParameter("ticketId");
        int ticketId = ticketIdParam != null ? Integer.parseInt(ticketIdParam) : 0;
        String ticketStatus = "Booked";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root");

           
            if(ticketId > 0) {
                PreparedStatement psStatus = con.prepareStatement("SELECT status FROM tickets WHERE id=?");
                psStatus.setInt(1, ticketId);
                ResultSet rsStatus = psStatus.executeQuery();
                if(rsStatus.next()) {
                    ticketStatus = rsStatus.getString("status"); 
                }
            } else {
               
                String sqlInsert = "INSERT INTO tickets (name, movie_title, cinema_name, show_date, show_time, seats, total_price, status) VALUES (?,?,?,?,?,?,?,?)";
                PreparedStatement psInsert = con.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);
                psInsert.setString(1, name);
                psInsert.setString(2, title);
                psInsert.setString(3, cinema);
                psInsert.setString(4, date);
                psInsert.setString(5, time);
                psInsert.setString(6, seats);
                psInsert.setString(7, totalPrice);
                psInsert.setString(8, "Booked");
                psInsert.executeUpdate();

                ResultSet keys = psInsert.getGeneratedKeys();
                if(keys.next()) ticketId = keys.getInt(1);
                ticketStatus = "Booked";
            }

            // Handle user cancel request
            if("true".equals(cancelRequest) && "Booked".equals(ticketStatus)) {
                PreparedStatement psCancel = con.prepareStatement("UPDATE tickets SET status='Pending Cancel' WHERE id=?");
                psCancel.setInt(1, ticketId);
                psCancel.executeUpdate();
                ticketStatus = "Pending Cancel";
            }

            con.close();

          
            response.sendRedirect("Ticket.jsp?ticketId=" + ticketId + "&status=" + ticketStatus);

        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
