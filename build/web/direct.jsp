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
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new_schema", "root", "aasha");
            
            String query="select bal from acc where accno=?";
            PreparedStatement st = con.prepareStatement(query);
            String tacc=request.getParameter("tacc");
            st.setString(1,tacc);
            ResultSet rs=st.executeQuery();
            long pm2=0;
            int f=0;
            if(rs.next())
            {
                pm2=Long.parseLong(rs.getString("bal"));
                f=1;    
            }
            if(f==0)
            {
                response.sendRedirect("failed.jsp");
            }
            if(f==1)
            {
                String user=(String)session.getAttribute("sacc");
                st.setString(1,user);
                rs=st.executeQuery();
                rs.next();
                long am=Long.parseLong(rs.getString("bal"));
                String m= request.getParameter("amt");
                long m1=Long.parseLong(m);
                if(am>=m1 && !user.equals(tacc))
                {
                    String query3="update acc set bal='"+(pm2+m1+"")+"'where accno='"+tacc+"'";
                    java.sql.Statement st3 = con.createStatement();
                    String query2="update acc set bal='"+(am-m1+"")+"'where accno='"+user+"'";
                    java.sql.Statement st2 = con.createStatement(); 
                    int c2=st2.executeUpdate(query2);
                    int c3=st3.executeUpdate(query3);
                    if((c2>0)   && (c3>0))
                    {
                        response.sendRedirect("successful.jsp");
                    }
                    else
                    {
                    response.sendRedirect("failed.jsp");
                    }
                }
                else
                {
                    response.sendRedirect("failed.jsp");
                }
            }
            %>
    </body>
</html>
