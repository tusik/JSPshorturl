<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/4
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%
    String DBUSER = "root";
    String PASSWORD = "password";
    String DBNAME = "surl";
    String uri = "jdbc:mysql://localhost:3306/"+DBNAME+"?useUnicode=true&characterEncoding=utf-8";
    String SALT="";//用户加密盐
%>