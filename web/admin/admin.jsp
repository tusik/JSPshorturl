<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page import="sun.misc.BASE64Decoder" %><%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/6
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Manager Panel</title>
    <link href="css/login.css" rel="stylesheet">
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="main">



<%
    Cookie[] cookies = null;
    cookies=request.getCookies();
    String name=null;
    String username=null;
    if(cookies.length-1!=0){
        for(int i=0;i<cookies.length;i++){
            if (cookies[i].getName().equals("username")){
                name=cookies[i].getValue();
                byte[] b=new BASE64Decoder().decodeBuffer(name);
                username=new String(b);
                out.print("<h1>welcome "+username+"</h1>");
            }
        }
        if(username==null){
            response.sendRedirect("index.jsp");
        }

    }
%>
<%
    if(username!=null){
        String c=request.getParameter("c");
        if( c!=null&&c.equals("1")){
            out.print("删除成功");
        }
%>
<form method="post" action="del.jsp">
    <input type="text" name="id">
    <input type="submit" value="del">
</form>
<p><a href="logout.jsp">退出</a> </p>
<%
    }else {
        response.sendRedirect("index.jsp");
    }
%>
    </div>
</div>
</body>
</html>
