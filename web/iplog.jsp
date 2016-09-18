<%--
  Created by IntelliJ IDEA.
  User: zinc
  Date: 2016/9/17
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public boolean iplog(String ip,Statement sql,Statement sql1,
                         int input_Interval ,int input_Times) throws SQLException, IOException {
        ResultSet rs=null;
        ResultSet time=null;
        rs=sql.executeQuery("SELECT count,date FROM iplog WHERE ip='"+ip+"'");
        if(rs.next()){
            time=sql1.executeQuery("SELECT time_to_sec(TIMEDIFF(CURRENT_TIMESTAMP ,'"+rs.getString(2)+"'))");
            time.next();
            int t= Integer.parseInt(time.getString(1));
            if(Integer.parseInt(rs.getString(1))<5){
                if((t)>60){
                    int c=rs.getInt(1);
                    c++;
                    sql1.execute("UPDATE iplog SET count='"+c+"'WHERE ip='"+ip+"'");
                    return true;
                }else {
                    return false;
                }
            }
        }else {
            sql1.execute("INSERT INTO iplog(ip,count) VALUES ('"+ip+"','1')");
            sql1.close();
            sql.close();
            return true;
        }
        return  false;
    }
%>