<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balance</title>
        <style>
        div.image
        {
            width:100%;
            height:100%;
            background:url(money.jpg);
            border:2px solid;
            border-color:#CD853F;
        }
        div.transparentbox
        {
            align-content: center;
            margin : 50px 220px;
            width:800px;
            height:500px;
            background-color:#ffffff;
            border:2px solid;
            border-color:#CD853F;
            opacity:0.8;
            filter:alpha(opacity=60);
        }

        .Login
        {
            padding:20px;
            text-align: center;
        }
        .Sign-Up
        {
            padding:20px;
            text-align: center;
        }
        .center
        {
            padding:20px;
            text-align:center;
            font-family:Times New Roman;
            font-size:20px;
        }
        .but
        {
            padding:20px;
        }
        </style>
    </head>
    <body>
    <div class="image">
    <div class="transparentbox">
    <h1 style = "font-size:50px; font-family:verdana; text-align:center;">Balance<br></h1>
    <a style="font-size:30px;text-align:left;padding:20px">Balance of Mr.${user}<br></a>
    
    <%
        Class.forName("com.mysql.jdbc.Driver"); 
        String url="jdbc:mysql://localhost:3306/new_schema";
        String sqlname="root";
        String sqlpass="aasha";
        String query="select * amount from accdet where accid=?";
        boolean c=false;
        Connection con=DriverManager.getConnection(url,sqlname,sqlpass);
        PreparedStatement st = con.prepareStatement(query);
        String user=(String)session.getAttribute("user");
        st.setString(1,user);
        ResultSet rs=st.executeQuery();
        rs.next();
        long am=Long.parseLong(rs.getString("amount"));
    %>
    <a style="font-size:30px;text-align:left;padding:20px">Rs.<%=am%><br></a>
    <div class="but">
    <form action ="homepage.jsp" method="post"><input type="submit" value="Go to Homepage"></form>
    </div>
    </div>
    </div>
    </body>
</html>