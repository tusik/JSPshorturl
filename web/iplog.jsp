<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/17
  Time: 21:31
  此iplog方法用于处理ip，防止提交过于频繁
  未完成！
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public boolean iplog(String ip,Statement sql,Statement sql1,
                         int input_Interval ,int input_Times) throws SQLException, IOException {
        ResultSet rs=null;
        ResultSet time=null;
        rs=sql.executeQuery("SELECT count,date FROM iplog WHERE ip='"+ip+"'");//查询ip记录
        if(rs.next()){//不为空则判断提交频率，并记录进数据库
            time=sql1.executeQuery("SELECT time_to_sec(TIMEDIFF(CURRENT_TIMESTAMP ,'"+rs.getString(2)+"'))");
            time.next();
            int t= Integer.parseInt(time.getString(1));//从mysql获取此次提交的事件和上次提交的事件差
            if(Integer.parseInt(rs.getString(1))<5){
                if((t)>60){
                    int c=rs.getInt(1);
                    c++;
                    sql1.execute("UPDATE iplog SET count='"+c+"'WHERE ip='"+ip+"'");//更新数据库
                    sql1.close();
                    sql.close();//关闭连接
                    return true;
                }else {
                    sql1.close();
                    sql.close();//关闭连接
                    return false;
                }
            }
        }else {//为空则在数据库中为此ip创建一条数据
            sql1.execute("INSERT INTO iplog(ip,count) VALUES ('"+ip+"','1')");
            sql1.close();
            sql.close();//关闭连接
            return true;
        }

        return  true;
    }
%>