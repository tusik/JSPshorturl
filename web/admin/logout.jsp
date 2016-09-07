<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/7
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie[] cookies = null;
    cookies=request.getCookies();
    if(cookies.length-1!=0){
        for(int i=0;i<cookies.length;i++)
        if(cookies[i].getName().equals("username")){
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
        }
        response.sendRedirect("index.jsp");
    }
%>
