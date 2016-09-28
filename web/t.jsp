<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/1
  Time: 11:52
  跳转文件
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ include file="database.jsp"%>
<%
    String code =request.getParameter("c");//参数
    if(code==null){
        response.sendRedirect("index.jsp");
    }else{
        PreparedStatement sql = null;    //数据库预处理操作
        ResultSet rs = null;    //查询要处理结果集
        try{
            sql=conn.prepareStatement( "SELECT target,count FROM url WHERE code=?");//查询是否有目标数据
            sql.setString(1,code);
            rs=sql.executeQuery();
            if(rs.next()){
                String target=rs.getString(1);
                int count=Integer.parseInt(rs.getString(2));
                count++;
                sql=conn.prepareStatement("UPDATE url SET count=? WHERE code=?");//更新点击次数
                sql.setString(1,Integer.toString(count));
                sql.setString(2,code);
                sql.executeUpdate();
                conn.close();
                sql.close();
                rs.close();
                response.sendRedirect(target);
            }else{
                conn.close();
                sql.close();
                rs.close();
                response.sendRedirect("../error.jsp");
            }

        }
        catch(SQLException e1){out.print(e1);}
    }

%>
