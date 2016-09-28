<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="sun.misc.BASE64Decoder" %>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %><%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/22
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Statement getPw;
    boolean loged=false;
    getPw=conn.createStatement();
    ResultSet hasPw=null;
    Cookie[] cookies = null;
    cookies=request.getCookies();
    String name=null;
    String username=null;
    String tmppw=null;
    if(cookies.length-1!=0){
        for(int i=0;i<cookies.length;i++){
            if (cookies[i].getName().equals("username")){
                name=cookies[i].getValue();
                byte[] b=new BASE64Decoder().decodeBuffer(name);
                username=new String(b);
            }else if(cookies[i].getName().equals(
                    new BASE64Encoder().encode((username+ DigestUtils.sha1Hex(SALT)).getBytes()))){
                tmppw=cookies[i].getValue();
                hasPw=getPw.executeQuery("SELECT pw FROM user WHERE username='"+username+"'");
            }
        }
        if(tmppw==null||username==null){
            loged=false;
            getPw.close();
        }else if((hasPw.next())&&DigestUtils.sha512Hex((hasPw.getString(1)+SALT)).equals(tmppw)){
            loged=true;
            getPw.close();
        }else{
            loged=false;
            getPw.close();
        }
    }

%>