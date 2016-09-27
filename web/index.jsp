<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="database.jsp"%>
<html>
<head>
    <title>shrot URL beta</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <script type="text/javascript" src="js/send.js"></script>
    <script type="text/javascript">
        window.onload = function(){
            var config = {
                vx: 4,
                vy:  4,
                height: 2,
                width: 2,
                count: 100,
                color: "121, 162, 185",
                stroke: "100,200,180",
                dist: 6000,
                e_dist: 20000,
                max_conn: 10
            }
            CanvasParticle(config);
        }
    </script>
    <script type="text/javascript" src="js/canvas-particle.js"></script>
</head>
<body>
<div class="main">
<h1>Short Url <span>beta</span></h1>
<form method="post" onsubmit="return submitbtn_click()">
    <input type="text"  name="url" id="url" class="form-control itxt" placeholder="请带上http头(如http://code.cat)"/>
    <button id="submit" onclick="sendurl()" class="btn btn-default isubmit">提交</button>
    <h3><span id="surl"></span></h3>
    <%--<%
        if(results!=null){
            String url="Http://by.cx/u/";
            url+=results;
            out.print("<h3><a href=\""+url+"\">"+url+"</a></h3>");
        }
    %>--%>
    <p></p>


</form>
</div>
</body>
<footer>
    <p>V0.1.8|<a href="http://code.cat">@Image</a> </p>
</footer>
</html>