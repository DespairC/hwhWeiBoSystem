<%--
  Created by IntelliJ IDEA.
  User: hx25
  Date: 2020/2/12
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hwh.www.dao.UserDao" %>
<html>
<style type="text/css">
    body{
        background-image:url(page/2233.jpg);
        background-size: 100% 100%;
        padding: 0;
        margin: 0;
    }
</style>
<head>
    <title>注册信息</title>
</head>
<body>
<center>
        <%
            request.setCharacterEncoding("utf-8");
            String uname = request.getParameter("uname");
            String password = request.getParameter("password");
            UserDao.addUser(uname,password);
        %>
        注册成功，信息如下：<br/>
        账号：<%=uname%><br/>
        密码：<%=password%><br/>
            <a href="login.jsp">点击返回登陆</a>
</body>
</html>
