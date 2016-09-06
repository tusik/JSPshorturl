<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ include file="database.jsp"%>
<html>
<head>
    <title>shrot URL beta</title>
</head>
<body>

<%
    int commond;
        String tmp=request.getParameter("c");
    if(tmp!=null)
         commond= Integer.parseInt(tmp);
    else commond=100;

%>
<%
    Statement sql = null;    //数据库预处理操作
    ResultSet rs = null;    //查询要处理结果集
    sql=conn.createStatement();
    rs=sql.executeQuery("SELECT * FROM url");
%>
<h1>url</h1>
<form method="post" action="in.jsp">
    url:<input type="text" name="url"/>
    <input type="submit" value="提交" />
    <p><%
        if(commond==0)
            out.print("执行失败");
        else if(commond==1)
            out.print("执行成功");
    %></p>
</form>
<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <th>code</th>
        <th>target</th>
        <th>date</th>
        <th>count</th>
    </tr>
    <%
        while(rs.next()){
            out.print("<tr>");
            out.print("<td>"+rs.getString(1)+"</td>");
            out.print("<td><a href="+"t.jsp?c="+rs.getString(2)+">"+rs.getString(2)+"</a></td>");
            out.print("<td>"+rs.getString(3)+"</td>");
            out.print("<td>"+rs.getString(4)+"</td>");
            out.print("<td>"+rs.getString(5)+"</td>");
            out.print("</tr>");
        }
        sql.close();
        conn.close();
        rs.close();
    %>
</table>

</body>
</html>