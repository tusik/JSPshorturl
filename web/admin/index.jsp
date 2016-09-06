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
</head>
<body>
<form method="post" action="logincheck.jsp">
username:<input type="text" name="username"><br>
password:<input type="text" name="password"><br>
    <input type="submit" value="提交" />
</form>
</body>
</html>
