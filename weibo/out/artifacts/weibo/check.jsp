<%--
  Created by IntelliJ IDEA.
  User: hx25
  Date: 2020/2/13
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" import="com.hwh.www.until.DButil"
    import="com.hwh.www.dao.UserDao"%>
<html>
<head>
    <title>检测</title>
</head>
<body>
<center>
        <%
            try{
                request.setCharacterEncoding("utf-8");
                Connection conn = DButil.theSqlConnection();
                Statement statement = conn.createStatement();
                String uname = request.getParameter("uname");
                String pwd = request.getParameter("password");
                String sql="select * from user where uname='"+uname+"'and password='"+pwd+"'";
                ResultSet rs = statement.executeQuery(sql);
                if(rs.next()){
                    session.setAttribute("uname",uname);
                    session.setAttribute("pwd",pwd);
                    response.sendRedirect("welcome.jsp");
                     }
                DButil.closeResource(conn);
            }
            catch(SQLException e){
                e.printStackTrace();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        %>
            <br/>
            <h1>密码错误</h1>
            <a href="login.jsp" style="font-size: 25px">重新登陆</a>
</body>
</html>
