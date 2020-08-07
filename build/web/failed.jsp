
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
        <title>Action Failed</title>
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
.but
{
    padding:20px;
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
.center {
  padding:20px;
  
  text-align:center;
  font-family:Times New Roman;
  font-size:20px;
}
</style>
    </head>
    <body>
    <div class="image">
<div class="transparentbox">
    <h1 style = "font-size:50px; font-family:verdana; text-align:center;">Action Failed<br></h1>
    <div class="but">
        <a style = "font-size:20px">What would you like to do next<br><br></a>
        <form action ="balance.jsp"><input type="submit" value="view balance"><br></form>
    <form action ="homepage.jsp"><input type="submit" value="Go to Homepage"></form>
    </div>
</div>
    </body>
</html>
