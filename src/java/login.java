import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class login extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String user = request.getParameter("uname");
        String pass = request.getParameter("pass");
        
        Connection conn = null;
        try {
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "aasha");
           if(conn!= null)
           {
               System.out.println("Connected");
           }
        } catch (Exception e) {
            System.out.println("failed");
        }
    }
    
}
