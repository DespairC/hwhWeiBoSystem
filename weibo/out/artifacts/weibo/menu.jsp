<%--
  Created by IntelliJ IDEA.
  User: hx25
  Date: 2020/2/22
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
    body{
        font-family: "Microsoft YaHei";
        background-image:url(page/login.jpg);
        background-size: 100% 100%;
        padding: 0;
        margin: 0;
    }
    input{
        font-family: "Microsoft YaHei";
    }
    a{
        font-family: "Microsoft YaHei";
    }
    .na{
        align:center;
        text-align: center;
        display: table;
    }
    .na li:after {
        content: '';
        position: absolute;
        width: 1px;
        height: 40px;
        background-color: lightgray;
        top: 18px;
        right: 0;
    }
</style>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="pagebg" style="background-color: rgb(59, 136, 161);"></div>
<div class="pagemain">
    <div role="navigation" class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button data-target="#bs-example-navbar-collapse-11" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                <span class="sr-only">响应菜单</span> <span class="icon-bar"></span>
                <span class="icon-bar"></span> <span class="icon-bar"></span>
            </button> <a href="#" class="navbar-brand">微博1.0</a>
            </div>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" style="width: 300px" value="肺炎逐渐被人类克服" class="form-control" />
                </div> <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <div style="height: 1px;" id="bs-example-navbar-collapse-11" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <%
                        if(session.getAttribute("uname")!=(null))out.print("<li><a href=\"welcome.jsp\">首页</a></li>");
                    %>
                    <li><a href="find.jsp?npage=社会">发现</a></li>
                    <%
                        if(session.getAttribute("uname")!=(null))out.print("<li><a href=\"empty\" data-toggle=\"dropdown\">"
                                        +session.getAttribute("uname")+"</a>" +
                    "<ul class=\"dropdown-menu\">\n" +
                        " <li><a href=\"User.jsp\">我的微博</a></li> " +
                        " <li><a href=\"User.jsp\">修改密码</a></li> " +
                        " <li><a href=\"login.jsp\">注销</a></li> " +
                        " </ul> " +
                        " </li>");
                        else
                            out.print("                    <li><a href=\"empty\" data-toggle=\"dropdown\">Guest用户</a>\n" +
                                    "                        <ul class=\"dropdown-menu\">\n" +
                                    "                            <li><a href=\"login.jsp\">登录</a></li>\n" +
                                    "                            <li><a href=\"register.jsp\">注册</a></li>\n" +
                                    "                        </ul>\n" +
                                    "                    </li>");

                    %>
<%--                    <li><a href="empty" data-toggle="dropdown"><%=session.getAttribute("uname")%></a>--%>
<%--                        <ul class="dropdown-menu">--%>
<%--                            <li><a href="User.jsp">我的微博</a></li>--%>
<%--                            <li><a href="User.jsp">修改密码</a></li>--%>
<%--                            <li><a href="login.jsp">注销</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
                </ul>
            </div>
        </div>
    </div>
</div>
<br/><br/>
</body>
</html>

