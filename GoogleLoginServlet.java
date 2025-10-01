
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GoogleLoginServlet")
public class GoogleLoginServlet extends HttpServlet {
	 
	   private static final String CLIENT_ID = "726553838124-qu1q8v9e91hjb5vs2mihk5jaaajs6vpk.apps.googleusercontent.com";
	    
	    
	    private static final String REDIRECT_URI = "http://localhost:8080/Mainproject/oauth2callback";
    private static final String SCOPE = "openid email profile";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oauthURL = "https://accounts.google.com/o/oauth2/v2/auth?"
                + "scope=" + SCOPE
                + "&access_type=online"
                + "&include_granted_scopes=true"
                + "&response_type=code"
                + "&state=state_parameter_passthrough_value"
                + "&redirect_uri=" + REDIRECT_URI
                + "&client_id=" + CLIENT_ID;

        response.sendRedirect(oauthURL);
    }
}
