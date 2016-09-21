<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/6
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<html>
<head>
    <title>Manager Panel</title>
    <link href="css/login.css" rel="stylesheet">
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="main">
        <form method="post" action="logincheck.jsp">
            username:<input type="text" name="username"><br>
            password:<input type="password" name="password"><br>
            <button type="submit" class="btn btn-default" >登陆</button>
        </form>
    </div>

</div>

</body>
</html>
