<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/2
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<!--
JDBC 驱动名及数据库 URL
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
-->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
    String DBUSER = "root";
    String PASSWORD = "password";
    String DBNAME = "surl";
    String uri = "jdbc:mysql://localhost:3306/"+DBNAME+"?useUnicode=true&characterEncoding=utf-8";
    Connection conn = null;
    try{Class.forName("com.mysql.jdbc.Driver").newInstance();}
    catch(Exception e){out.print(e);}
    conn = DriverManager.getConnection(uri, DBUSER , PASSWORD);

%>