# JSPshorturl
Based on JSP & MYSQL

NEED:JDBC https://dev.mysql.com/downloads/connector/j/

0.1.8首页

![screenshots](https://raw.githubusercontent.com/tusik/JSPshorturl/master/screenshots/0.1.8.png)

0.1.5起开始使用AJAX提交数据

0.0.6界面

![screenshots](https://raw.githubusercontent.com/tusik/JSPshorturl/master/screenshots/0.0.6.png)

0.0.3界面
![screenshots](https://raw.githubusercontent.com/tusik/JSPshorturl/master/screenshots/0.0.3.png)

## 安装

​	1.创建数据库

​	2.修改config.jsp中的'DBUSER','PASSWORD','DBNAME','SALT','ADMINNAME','ADMINPW'

​	3.将web内容下的文件上传到服务器

安装完成之后请勿修改SALT

##后台（完全功能正在编写..）

地址/admin/index.jsp

用户名：admin

密码：config.jsp中

##伪静态

在WEB-INF的urlrewrite.xml文件添加规则

```
<rule>
    <from>/u/(.*)</from>
    <to >/t.jsp?c=$1</to>
</rule>
```