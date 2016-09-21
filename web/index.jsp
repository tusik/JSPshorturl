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
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
</head>
<body>

<%
    int commond;
        String tmp=request.getParameter("c");
    if(tmp!=null)
         commond= Integer.parseInt(tmp);
    else commond=100;
    String results=null;
    results=request.getParameter("results");
%>

<div class="main">
<h1>Short Url <span>beta</span></h1>
<form method="post" action="in.jsp">
    <input type="text" name="url" class="form-control itxt" placeholder="请带上http头(如http://code.cat)"/>
    <button type="submit" class="btn btn-default isubmit">提交</button>
    <%
        if(results!=null){
            String url="Http://by.cx/u/";
            url+=results;
            out.print("<h3><a href=\""+url+"\">"+url+"</a></h3>");
        }
    %>
    <p></p>
    <p>V0.1.0|<a href="http://code.cat">@Image</a> </p>
    <p><%
        if(commond==0)
            out.print("执行失败");
        else if(commond==1)
    %></p>

</form>

</div>
</body>
</html>