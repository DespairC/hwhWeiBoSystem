<%--
  Created by IntelliJ IDEA.
  User: hx25
  Date: 2020/2/12
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>注册</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<center>
    <br/><br/><br/><br/><br/><br/>
    <form action="show.jsp" name="regi" method="post">
        <table align="center" class="table-bordered">
            <tr>
                <h2 class="text-center">用户注册</h2><br/><br/>
                <td><font color="#8b0000"><b>新账号：</b></font></td>
                <td><input name="uname" class="form-control" type="text" size="30"></td>
            </tr>
            <tr>
                <td><font color="#8b0000"><b>新密码：</b></font></td>
                <td><input name="password" class="form-control" type="password" size="30"></td>
            </tr>
            <tr>
                <td><br/></td>
                <td><input type="submit" class="btn btn-success" value="注册" align="center"  style= "height:30px;width:150px "></td>
            </tr>
        </table>
    </form>
</center>>
</body>
</html>
