<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %><%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/4
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%
    String DBUSER = "root";
    String PASSWORD = "passwd";
    String DBNAME = "surl";
    String uri = "jdbc:mysql://localhost:3306/"+DBNAME+"?useUnicode=true&characterEncoding=utf-8";
    String SALT="";//用户加密盐
    String ADMINPW = "123";
    Pattern inStringCheck1 = Pattern.compile("(.*)(UPDATE|CREATE|DELETE|INSERT)(.*)");
    Pattern inStringCheck2 = Pattern.compile("(HTTP://(.*)|HTTPS://(.*))");

%>