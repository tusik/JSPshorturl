<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="sun.misc.BASE64Decoder" %><%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/7
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../config.jsp"%>
<%
    Cookie[] cookies = null;
    cookies=request.getCookies();
    String username=null;
    if(cookies.length-1!=0){
        for(int i=0;i<cookies.length;i++){
            if(cookies[i].getName().equals("username")){
                cookies[i].setMaxAge(0);
                byte[] b=new BASE64Decoder().decodeBuffer(cookies[i].getValue());
                username=new String(b);
                response.addCookie(cookies[i]);
            } else if(cookies[i].getName().equals(new BASE64Encoder().encode((username+
                    DigestUtils.sha1Hex(SALT)).getBytes()))){
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
            }
        }


        response.sendRedirect("index.jsp");
    }
%>
