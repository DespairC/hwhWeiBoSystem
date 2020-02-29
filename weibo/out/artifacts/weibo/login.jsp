<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
    body{
        background-image:url(page/2222.jpg);
        background-size: 100% 100%;
        padding: 0;
        margin: 0;
    }
</style>
<head>
    <title>用户登录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<script language="javascript">
    function login(){
        if(document.loginform.uname.value==""){
            window.alert("账号不能为空！");
            return ;
        }
        if(document.loginform.password.value==""){
            window.alert("密码不能为空！");
            return ;
        }
        loginform.submit();
    }
    function register(){
        document.loginform.method="post";
        document.loginform.target="rightframe";
        document.loginform.action="register.jsp";
        document.loginform.submit();
    }
    function guest() {
        document.loginform.method="post";
        document.loginform.action="find.jsp?account=guest&";
        document.loginform.submit();
    }
</script>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%session.invalidate();%>
<form action="check.jsp" name="loginform" method="post">
    <h1 class="text-danger" align="center" style="color: red">微博1.0</h1>
<table align="center" class="img-rounded" style="background: url(page/001.jpg)">
    <tr>
        <td><font color="blue"><b>账 号：</b></font></td>
        <td><input name="uname" class="form-control" type="text" size="30"> </td>
    </tr>
    <tr>
        <td><font color="blue"><b>密 码：</b></font></td>
        <td><input name="password" class="form-control" type="password" size="30"> </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <input type="button" name="btn1" class="btn btn-danger" value="登  陆" onclick="login()">
            <input type="button" name="btn2" class="btn btn-success" value="注  册" onclick="register()">
            <input type="button" name="btn3" class="btn btn-primary" value="游客登陆" onclick="guest()">
        </td>
    </tr>
</table>
</form>
</body>
</html>