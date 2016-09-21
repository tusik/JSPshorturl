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
<%@include file="iplog.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    PreparedStatement sql = null;    //数据库预处理操作
    PreparedStatement sql2 = null;
    Statement sql1 = null;
    ResultSet tmp=null;
    ResultSet cou=null;
    String ip=request.getRemoteAddr();
    String target =request.getParameter("url");
    String code=null;
    String tmpS =target.toUpperCase();
    Matcher m1 = inStringCheck2.matcher(tmpS);
    if(!m1.matches()){
        out.print("请按照以下格式输入地址http://code.cat");
    }else{
        int commond =1;
        if(target==""){
            response.sendRedirect("index.jsp?c=0");
        }else{
            try {
                int count;
                sql = conn.prepareStatement("SELECT id FROM url WHERE target=? ");
                sql.setString(1,target);
                sql1 =conn.createStatement();
                tmp = sql.executeQuery();
                cou = sql1.executeQuery("SELECT id from url where id = (SELECT max(id) FROM url);");
                if(cou.next()){
                    count = Integer.parseInt(cou.getString(1));
                    count++;
                }else{
                    count=1;
                }
                code = new BASE64Encoder().encode(Integer.toString(count).getBytes());
                if (tmp.next()) {
                    code=new BASE64Encoder().encode(Integer.toString(tmp.getInt(1)).getBytes());
                } else {
                    Statement sqlip=conn.createStatement();
                    Statement sqlip1=conn.createStatement();
                    if(iplog(ip,sqlip,sqlip1,input_Interval,input_Times)){
                        sql2=conn.prepareStatement("INSERT INTO url(target,code,ip) VALUES (?,?,?)");
                        sql2.setString(1,target);
                        sql2.setString(2,code);
                        sql2.setString(3,ip);
                        sql2.executeUpdate();
                        commond = 1;
                    }else {
                        commond=0;
                    }
                }
                conn.close();
                sql.close();
                sql1.close();
                tmp.close();
                cou.close();
                response.sendRedirect("index.jsp?c=" + commond+"&results="+code);
            }
            catch(SQLException e1){out.print(e1);}
        }
    }
%>
</body>
</html>
