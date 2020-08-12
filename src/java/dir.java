/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
public class dir extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
                try{
            /* TODO output your page here. You may use following sample code. */
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new_schema", "root", "aasha");
            String user=request.getParameter("sacc"); 
            String tacc=request.getParameter("tacc");
            PreparedStatement st = con.prepareStatement("select bal from accdet where accno=?");
            st.setString(1,tacc);
            ResultSet rs=st.executeQuery();
            double pm2=0;
            int f=0;
            if(rs.next())
            {
                pm2=(rs.getDouble("bal"));
                f=1;    
            }  
            if(f==0)
            {
                response.sendRedirect("fail.html");
            }
            else
            {
                
                st.setString(1,user);
                rs=st.executeQuery();
                rs.next();
                long am=rs.getInt("bal");
                String m= request.getParameter("amt");
                long m1=Long.parseLong(m);
                if(am>=m1 && !user.equals(tacc))
                {
                    PreparedStatement st1 = con.prepareStatement("update accdet set bal=? where accno=?");
                    st1.setDouble(1, (pm2+m1));
                    st1.setString(2, tacc);
                    int c2=st1.executeUpdate();
                    st1.setDouble(1, (am-m1));
                    st1.setString(2, user);
                    int c3=st1.executeUpdate();
                    //out.println(c2 +" "+ c3);
                    if((c2>0)   && (c3>0))
                    {
                        response.sendRedirect("succ.html");
                    }
                    else
                    {
                        response.sendRedirect("fail.html");
                    }
                }
                else
                {
                    response.sendRedirect("fail.html");
                }
            }
        }
        catch(SQLException ex)
        {
            
            //PrintWriter out = response.getWriter();
            out.println("QL   "+ex);
        }
    }
}
