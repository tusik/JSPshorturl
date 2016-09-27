<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/2
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%--
JDBC 驱动名及数据库 URL
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
--%>
<%@page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@include file="config.jsp"%>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    }
    catch(Exception e){out.print(e);}
    conn = DriverManager.getConnection(uri, DBUSER , PASSWORD);
    Statement sqlcheck = conn.createStatement();
    ResultSet check;
    check=sqlcheck.executeQuery("SHOW TABLES LIKE 'url'");
    if(check.next()){

    }else {
        try {
            sqlcheck.executeUpdate("CREATE TABLE IF NOT EXISTS `url`(" +
                    "`id` INT(11) NOT NULL  AUTO_INCREMENT," +
                    "`code` VARCHAR(100) NOT NULL," +
                    "`target` VARCHAR(400) NOT NULL," +
                    "`date`timestamp NOT NULL default CURRENT_TIMESTAMP," +
                    "`count` INT(10) NOT NULL DEFAULT '0'," +
                    "    `ip` VARCHAR(20) NOT NULL,"+
                    " PRIMARY KEY (`id`));" );
            sqlcheck.executeUpdate(
                    "CREATE TABLE IF NOT EXISTS `user` (" +
                            "`id` INT(11) NOT NULL AUTO_INCREMENT," +
                            "`username` char(20) NOT NULL," +
                            "`pw` varchar(255) NOT NULL," +
                            "`p` int(10) NOT NULL DEFAULT '1'," +
                            "PRIMARY KEY (`id`))");
            sqlcheck.executeUpdate("INSERT INTO `user` " +
                    "(username,pw,p)" +
                    "VALUES" +
                    "('"+ADMINNAME+"','"+DigestUtils.sha1Hex(ADMINPW+SALT)+"','2')");
            sqlcheck.executeUpdate("CREATE TABLE IF NOT EXISTS `iplog` (" +
                    "    `ip` VARCHAR(20) NOT NULL," +
                    "    `count` INT(10) NOT NULL DEFAULT '0'," +
                    "    `id` INT(11) NOT NULL AUTO_INCREMENT," +
                    "    `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP," +
                    "    PRIMARY KEY (`id`))");
        }catch (SQLException e){out.print(e);}

    }
    check.close();
    sqlcheck.close();
%>