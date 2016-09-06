# JSPshorturl
Based on JSP &amp; MYSQL

目前长这样XD
![screenshots](https://raw.githubusercontent.com/tusik/JSPshorturl/master/screenshots/20160902224511.png)

## 数据库结构

```mysql
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL ,
  `url` varchar(400) NOT NULL ,
  `count` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
```
###后台（完全功能正在编写..）

地址/index.jsp

用户名：admin

密码:123