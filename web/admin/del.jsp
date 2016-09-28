<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/6
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../database.jsp"%>
<%
    Cookie[] cookies = null;
    cookies=request.getCookies();
    if(cookies.length-1!=0){
        String targetID=request.getParameter("id");
        Statement sql;
        int rs;
        sql=conn.createStatement();
        rs=sql.executeUpdate("DELETE FROM `url` WHERE id='"+targetID+"'");
        sql.close();
        if(rs==1){
            response.sendRedirect("admin.jsp?c=1");
        }else {
            response.sendRedirect("admin.jsp?c=0");
        }
    }

%>
