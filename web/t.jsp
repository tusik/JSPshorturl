<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/1
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="database.jsp"%>
<html>
<head>
    <title>jump</title>
</head>
<body>
<%
    String code =request.getParameter("c");//参数
    Statement sql = null;    //数据库预处理操作
    ResultSet rs = null;    //查询要处理结果集
    try{
        sql=conn.createStatement();
        rs=sql.executeQuery( "SELECT target,count FROM url WHERE code='"+code+"'");
        if(rs.next()){
            String target=rs.getString(1);
            int count=Integer.parseInt(rs.getString(2));
            count++;
            sql.executeUpdate("UPDATE url SET count='"+count+"' WHERE code='"+code+"'");
            response.sendRedirect(target);
        }else{
            out.print("code NOT FOUND!");
        }
        conn.close();
        sql.close();
        rs.close();
    }
    catch(SQLException e1){out.print(e1);}
%>
</body>
</html>
