<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/1
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="sun.misc.BASE64Decoder,sun.misc.BASE64Encoder"%>
<%@ page import="java.nio.ByteBuffer" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ include file="database.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Statement sql = null;    //数据库预处理操作
    Statement sql1 = null;
    ResultSet tmp=null;
    ResultSet cou=null;
    String target =request.getParameter("url");
    String code=request.getParameter("code");
    Pattern p = Pattern.compile("(.*)(UPDATE|update|CREATE|create|DELETE|delete|INSERT|insert)(.*)");
    Pattern p1 =Pattern.compile("(http://(.*)|https://(.*))");
    Matcher m = p.matcher(target);
    Matcher m1 = p1.matcher(target);
    if(m.matches()||!m1.matches()){
        out.print("非法字符(请按照以下格式输入地址http://code.cat)");
    }else{
        int commond =1;
        if(target==""){
            response.sendRedirect("index.jsp?c=0");
        }else{
            try {
                sql = conn.createStatement();
                sql1 =conn.createStatement();
                tmp = sql.executeQuery("SELECT id FROM url WHERE target='" + target + "'");
                cou = sql1.executeQuery("select count(id) from url");
                cou.next();
                int count = Integer.parseInt(cou.getString(1));
                code = new BASE64Encoder().encode(Integer.toString(count++).getBytes());
                out.print(code);
                if (tmp.next()) {
                    commond = 0;
                } else {
                    out.print("y");
                    sql.execute("INSERT INTO url(target,code) VALUES ('" + target + "','" + code + "')");
                    commond = 1;
                }
                conn.close();
                sql.close();
                sql1.close();
                tmp.close();
                cou.close();
                response.sendRedirect("index.jsp?c=" + commond);
            }
            catch(SQLException e1){out.print(e1);}
        }

    }

%>
</body>
</html>
