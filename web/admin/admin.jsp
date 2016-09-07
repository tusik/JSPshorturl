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
</head>
<body>
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
                out.print("welcome"+username);
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
<%
    }else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
