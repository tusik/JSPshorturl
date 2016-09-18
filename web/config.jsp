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
    String ADMINNAME="admin";//默认管理员用户名
    String ADMINPW = "123";//初始管理员密码
    Pattern inStringCheck1 = Pattern.compile("(.*)(UPDATE|CREATE|DELETE|INSERT)(.*)");//输入防注入检测
    Pattern inStringCheck2 = Pattern.compile("(HTTP://(.*)|HTTPS://(.*))");//url检测
    int input_Interval=5;
    int input_Times=5;
%>