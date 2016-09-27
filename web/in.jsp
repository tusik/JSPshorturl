<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/1
  Time: 19:24
  通过此页面判断传入数据的合法性并向数据库提交数据
  AJAX方式提交
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="sun.misc.BASE64Decoder,sun.misc.BASE64Encoder"%>
<%@ page import="java.util.regex.Matcher" %>
<%@ include file="database.jsp"%>
<%@include file="iplog.jsp"%>
<%
    response.setHeader("Cache-Control","no-store");//HTTP1.1
    response.setHeader("Pragma","no-cache");//HTTP1.0
    response.setDateHeader("Expires",0);//禁止在服务器中缓存
    String target =request.getParameter("value");//接收数据
    if(target==null){
        out.println("illegal");
        return;
    }//判断是否正常的提交防止
    PreparedStatement sql = null;
    PreparedStatement sql2 = null;//数据库预处理操作
    Statement sql1 = null;
    ResultSet tmp=null;
    ResultSet cou=null;
    String ip=request.getRemoteAddr();//取得用户ip
    String code=null;
    Matcher m1 = inStringCheck2.matcher(target.toUpperCase());
    if(!m1.matches()){
        out.print("请按照以下格式输入地址http://code.cat");//判断是否输入的为合法数据
    }else {
        int commond = 1;
        try {
            int count;
            sql = conn.prepareStatement("SELECT id FROM url WHERE target=? ");
            sql.setString(1, target);
            sql1 = conn.createStatement();
            tmp = sql.executeQuery();
            cou = sql1.executeQuery("SELECT id from url where id = (SELECT max(id) FROM url);");
            //获取数据库内最大条目编号
            if (cou.next()) {
                count = Integer.parseInt(cou.getString(1));
                count++;
            } else {
                count = 1;
            }
            code = new BASE64Encoder().encode(Integer.toString(count).getBytes());//base64编码
            if (tmp.next()) {//若数据库为空，编码从1开始
                code = new BASE64Encoder().encode(Integer.toString(tmp.getInt(1)).getBytes());
            } else {
                Statement sqlip = conn.createStatement();
                Statement sqlip1 = conn.createStatement();//创建数据库链接用于处理ip
                if (iplog(ip, sqlip, sqlip1, input_Interval, input_Times)) {//判断该ip提交是否过于频繁
                    sql2 = conn.prepareStatement("INSERT INTO url(target,code,ip) VALUES (?,?,?)");//sql处理
                    sql2.setString(1, target);
                    sql2.setString(2, code);
                    sql2.setString(3, ip);
                    sql2.executeUpdate();
                    commond = 1;
                } else {
                    commond = 0;
                }
            }
            conn.close();
            sql.close();
            sql1.close();
            tmp.close();
            cou.close();
            out.clear();
            response.getWriter().write(code);//模拟数据写回
            // response.sendRedirect("index.jsp?c=" + commond+"&results="+code);
        } catch (SQLException e1) {
            out.print(e1);
        }
    }
%>

