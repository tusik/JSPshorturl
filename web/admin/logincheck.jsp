<%@ page import="java.util.Date" %>
<%@ page import="java.net.CookieHandler" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="sun.misc.BASE64Encoder" %>
<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/6
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@include file="../database.jsp"%>
<%
    Cookie[] cookies = null;
    cookies=request.getCookies();
    if(cookies.length-1==0){
        String username =request.getParameter("username");
        String password = request.getParameter("password");
        ResultSet rs;
        Statement sql=conn.createStatement();
        String tmpU =username.toUpperCase();
        String tmpP =password.toUpperCase();
        Matcher m = inStringCheck1.matcher(tmpU);
        Matcher m1 = inStringCheck1.matcher(tmpP);
        if(m.matches()||m1.matches()){
            out.print("非法字符");
        }else{
            try {
                String tmppw=DigestUtils.sha1Hex(password);
                rs=sql.executeQuery("SELECT username,p FROM `user` WHERE pw='"+
                        tmppw+"'");
                if(rs.next()&&rs.getString(1).equals(username)){
                    out.print("login s");
                    Date cTime = new Date(session.getCreationTime());
                    Date lTime = new Date (session.getLastAccessedTime());
                    session.setAttribute("username",username);
                    session.setAttribute("power",rs.getString(2));
                    session.setAttribute("loged","true");
                    Cookie name = new Cookie("username", new BASE64Encoder().encode(username.getBytes()));
                    Cookie pw =
                            new Cookie(new BASE64Encoder().encode((username+DigestUtils.sha1Hex(SALT)).getBytes()),
                            DigestUtils.sha512Hex((tmppw+SALT)));
                    name.setMaxAge(60*60*24);
                    pw.setMaxAge(60*60*24);
                    response.addCookie(name);
                    response.addCookie(pw);
                    response.sendRedirect("admin.jsp");
                }else{
                    out.print("f");
                }
            }catch (SQLException e){out.print(e);}
        }

    }else{
        response.sendRedirect("admin.jsp");
    }


%>