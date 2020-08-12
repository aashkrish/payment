<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new_schema", "root", "aasha");
            String user=request.getParameter("sacc"); 
            String tacc=request.getParameter("tacc");
            PreparedStatement st = con.prepareStatement("select bal from accdet where accno=?");
            st.setString(1,tacc);
            ResultSet rs=st.executeQuery();
            double pm2=0;
            int f=0;
            rs.beforeFirst();
            if(rs.next())
            {
                pm2=(rs.getDouble("bal"));
                f++;    
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
            %>
    </body>
</html>
