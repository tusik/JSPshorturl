# JSPshorturl
Based on JSP &amp; MYSQL

0.0.6界面
![screenshots](https://raw.githubusercontent.com/tusik/JSPshorturl/master/screenshots/0.0.6.png)

0.0.3界面
![screenshots](https://raw.githubusercontent.com/tusik/JSPshorturl/master/screenshots/0.0.3.png)

## 数据库结构

```mysql
TABLE:url
`id` INT(11) NOT NULL  AUTO_INCREMENT,
`code` VARCHAR(100) NOT NULL,
`target` VARCHAR(400) NOT NULL,
`date`timestamp NOT NULL default CURRENT_TIMESTAMP,
`count` INT(10) NOT NULL DEFAULT '0',
 PRIMARY KEY (`id`))
 TABLE:user
 `id` INT(11) NOT NULL AUTO_INCREMENT,
`username` char(20) NOT NULL,
`pw` varchar(255) NOT NULL,
`p` int(10) NOT NULL DEFAULT '1',
PRIMARY KEY (`id`))
```
##后台（完全功能正在编写..）

地址/admin/index.jsp

用户名：admin

密码：config.jsp中修改初始化密码

请自行添加salt

##伪静态

在WEB-INF的urlrewrite.xml文件添加规则

```
<rule>
    <from>/u/(.*)</from>
    <to >/t.jsp?c=$1</to>
</rule>
```