<%@ page import="com.hwh.www.dao.DianzanDao" %>
<%@ page import="com.hwh.www.po.Pinglun" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hwh.www.dao.PinglunDao" %>
<%@ page import="com.hwh.www.dao.UserDao" %>
<%@ page import="com.hwh.www.po.Wenzhang" %>
<%@ page import="com.hwh.www.dao.WenzhangDao" %><%--
  Created by IntelliJ IDEA.
  User: hx25
  Date: 2020/2/23
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="menu.jsp"%>
<html>
<style type="text/css">
    body{
        background-image:url(page/2222.jpg);
        background-size: 100% 100%;
        padding: 0;
        margin: 0;
    }
    .u1 a{
        font-size: large;
        text-align: center;
        color: darkblue;
    }
</style>
<head>
    <title>微博1.0首页</title>
</head>
<body>
<%! String dzbuttonname,npage;%>
<%
    npage=request.getParameter("npage");
%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-1 column">
        </div>
        <div class="col-md-10 column img-rounded" style="background: rgba(0,0,0,0.2)">
            <div class="row clearfix">
                <div class="col-md-2 column">
                    <ul class="nav u1" role="menu">
                        <li><span class="glyphicon glyphicon-home" aria-hidden="true"></span></li>
                        <li><a href="welcome.jsp?npage=<%="搞笑"%>">首页</a></li>
                        <li><a href="welcome.jsp?npage=<%="社会"%>">我的收藏</a></li>
                        <li><a href="welcome.jsp?npage=<%="时尚"%>">我的赞</a></li>
                        <li><a href="welcome.jsp?npage=<%="电影"%>">热门微博</a></li>
                        <li><a href="welcome.jsp?npage=<%="美女"%>">热门视频</a></li>
                        <li><a href="welcome.jsp?npage=<%="体育"%>">最新微博</a></li>
                        <li><a href="welcome.jsp?npage=<%="动漫"%>">朋友圈</a></li>
                    </ul>
                </div>
                <div class="col-md-8 column" style="opacity:1;">

                    <table class="img-rounded" style=";margin-top:10px;background:white;width: 100%">
                        <td align="center">
                            <div style="margin-top: 5px;margin-bottom:5px;font-family: 'Yu Gothic UI'">Welcome!!~Please send something to tell us.</div>
                            <form name="addwz" class="form-inline" action="addwzServlet" method="post">
                                文章名：<input class="img-rounded" type="text" name="wenzhangName" placeholder="请输入文章检索名" style="margin-bottom:5px;width: 60%">
                                <input type="hidden" name="url" value="welcome">
                                <input type="hidden" id="username" name= "username" value=<%=session.getAttribute("uname")%>>
                                <input type="hidden" id="time" name= "time" value="<%=UserDao.getTime()%>">
                                <textarea placeholder="请在这里输入你要发布的内容" id="content" class="img-rounded" style="margin-bottom:5px;height: 70px;width:98%" name="content" ></textarea>
                                主题：
                                <select name="type" class="btn-danger" style="margin-top:5px;width: 100px" >
                                    <option value="搞笑">搞笑</option>
                                    <option value="社会">社会</option>
                                    <option value="时尚">时尚</option>
                                    <option value="电影">电影</option>
                                    <option value="美女">美女</option>
                                    <option value="体育">体育</option>
                                    <option value="动漫">动漫</option>
                                </select>
                                <div style="float: right"><input class="btn btn-success" style="margin-bottom:5px;width: 200px" type="button" value="发布" onclick="judge()">&nbsp;&nbsp;</div>
                            </form>
                        </td>
                    </table>

<%--                    <%--%>
<%--                        out.print("<table class=\"img-rounded\" style=\";margin-top:10px;background:white;width: 100%\">\n");--%>
<%--                        out.print("                                                <td><form action=\"addplServlet\" method=\"post\">");--%>
<%--                        out.print("<input type=\"hidden\" name=\"url\" value=\"User\">");--%>
<%--                        out.print("<input type=\"hidden\" id=\"name\" name= \"name\" value=\""+ session.getAttribute("uname") + "\">");--%>
<%--                        out.print("<input type=\"hidden\" id=\"time\" name= \"time\" value=\""+ UserDao.getTime() + "\">");--%>
<%--                        out.print("<input type=\"hidden\" id=\"from\" name= \"from\" value=\"" + "wenzhangName" + "\">");--%>
<%--                        out.print("                                                <textarea placeholder=\"请在这里输入你要评论的内容\" id=\"text1\" class=\"img-rounded\" style=\"height: 70px;width:98%\" name=\"text\" ></textarea>\n" +--%>
<%--                        "                                                <div style=\"float: right\">\n" +--%>
<%--                        "                                                    <input class=\"btn btn-danger\" type=\"submit\" value=\"发送\">\n" +--%>
<%--                        "                                                    &nbsp;&nbsp;\n" +--%>
<%--                        "                                                </div>\n" +--%>
<%--                        "                                                </form></td>\n");--%>
<%--                        out.print("</table>");--%>

<%--                    %>--%>


                    <%
                        List<Wenzhang> Wzdate = WenzhangDao.getWz();
                        for(Wenzhang wenzhang:Wzdate){
                                String sname = wenzhang.getUsername();
                                String wenzhangName = wenzhang.getName();
                                //文章
                                out.print("<div class=\"img-rounded\" style=\"margin-top: 10px;background:white;width: 100%\">\n" +
                                        "                <br/><div class= \"row clearfix\">\n" +
                                        "                <div class=\"col-md-1\" align=\"center\"><img style=\"width: 55px;height: 55px\" class=\"img-circle table-bordered\" src=\"page/ico/head1.png\" /></div>\n" +
                                        "                <div class=\"col-md-11\">");
                                out.print("<a href=\"otheruser.jsp?othername="+ sname +"\" style=\"font-size: medium\">" + sname + "</a>");
                                out.print(" <div style=\"font-size:small\">发表时间："+wenzhang.getTime()+"<br/></div>");
                                out.print("<div>"+wenzhang.getContent()+"</div><br/>");

                                //判断是否点赞
                                int dzjudge = DianzanDao.judgeDianz((String)session.getAttribute("uname"),wenzhangName);
                                String order=null;
                                if(dzjudge==1){
                                    dzbuttonname="取消点赞";
                                    order="deldzServlet";
                                }
                                else {
                                    dzbuttonname = "点赞";
                                    order="adddzServlet";
                                }
                                out.print("                </div>\n" +
                                        "                </div>\n" +
                                        "                <table style=\"width:100%\">\n" +
                                        "                    <tr>\n" +
                                        "                        <td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/sc.jpg\" /><a href=\"empty\">收藏</a></td>\n" +
                                        "                        <td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/pl.jpg\" /><a href=\"#" + wenzhang.getName() + "\" type=\"button\" data-toggle=\"collapse\">评论</a>\n");
                                out.print("<td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/dz.jpg\" /><a href=\""+order+"?"+"&pagename=welcome&npage="+ npage +"&uname="+ (String)session.getAttribute("uname") +
                                        "&textname="+ wenzhangName +"\">"+dzbuttonname+"("+wenzhang.getDianzan()+")</a></td>\n");
                                out.print("                        <td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/zf.jpg\" /><a href=\"empty\">转发</a></td>\n" +
                                        "                    </tr>\n" +
                                        "                </table>\n" +
                                        "            </div>");
                                //评论区
                                List<Pinglun> pinglunList = PinglunDao.getPl();
                                out.print("<div id=\""+ wenzhangName +"\" class=\"collapse\">");
                                out.print("                        <table class=\"img-rounded\" id=\"text\" style=\"width: 100%;background: white;\">\n" +
                                        "                            <td id=\"plq\">\n" +
                                        "                                <div>\n" +
                                        "                                    <br/>\n" +
                                        "                                    <div class=\"row clearfix\">\n" +
                                        "                                            <div class=\"col-md-1\"><img class=\"img-rounded\" style=\"vertical-align: center;width: 50px;height: 50px\" src=\"page/ico/head.png\"></div>\n" +
                                        "                                            <div class=\"col-md-11\">\n" +
                                        "                                                <form action=\"addplServlet\" method=\"post\">");
                                out.print("<input type=\"hidden\" name=\"url\" value=\"welcome.jsp\">");
                                out.print("<input type=\"hidden\" id=\"name\" name= \"name\" value=\""+ session.getAttribute("uname") + "\">");
                                out.print("<input type=\"hidden\" id=\"time\" name= \"time\" value=\""+ UserDao.getTime() + "\">");
                                out.print("<input type=\"hidden\" id=\"from\" name= \"from\" value=\"" + wenzhangName + "\">");
                                out.print("                                                <textarea placeholder=\"请在这里输入你要评论的内容\" id=\"text1\" class=\"img-rounded\" style=\"height: 50px;width:98%\" name=\"text\" ></textarea>\n" +
                                        "                                                <div style=\"float: right\">\n" +
                                        "                                                    <input class=\"btn btn-danger\" type=\"submit\" value=\"发送\">\n" +
                                        "                                                    &nbsp;&nbsp;\n" +
                                        "                                                </div>\n" +
                                        "                                                </form>\n" +
                                        "                                            </div>\n" +
                                        "                                    </div>\n" +
                                        "                                </div>\n");
                                int num=0;
                                for(Pinglun pinglun:pinglunList) {
                                    if(wenzhangName.equals(pinglun.getFrom())) {
                                        out.print(" <table class=\"table-bordered\" align=\"center\" style=\"width: 99%\"><td></td></table>\n" +
                                                "                                    <div class=\"row clearfix\">\n" +
                                                "                                        <div class=\"col-md-1\"><img class=\"img-rounded\" style=\"vertical-align: center;width: 50px;height: 50px\" src=\"page/ico/head1.png\"></div>\n" +
                                                "                                        <div class=\"col-md-11\">\n" +
                                                "                                            <div class=\"row clearfix\">\n" +
                                                "                                                <div class=\"col-md-10\">");
                                        out.print("<div style=\"width: 100%\"><a href=\"otheruser.jsp?othername=" + pinglun.getName() + "\" style=\"font-size: medium\">" + pinglun.getName() + "</a>"+"："+ pinglun.getContent() +"</div>");
                                        out.print("<div style=\"font-size: small\">"+ pinglun.getTime() +"</div>");
                                        out.print("                                                </div>\n" +
                                                "                                                <div class=\"col-md-2\">\n" +
                                                "                                                    <div>\n" +
                                                "                                                        <br/><br/>\n" +
                                                "                                                        <a href=\"#\" style=\"font-size: small\">回复</a>|\n" +
                                                "                                                        <img style=\"width: 10px;height: 10px\" src=\"page/ico/dz.jpg\" />\n" +
                                                "                                                        <a href=\"#\" style=\"font-size: small\">点赞</a>\n" +
                                                "                                                    </div>\n" +
                                                "                                                </div>\n" +
                                                "                                            </div>\n" +
                                                "                                            <table class=\"table-bordered img-rounded\" style=\"height:30px;width: 98%;background:whitesmoke \"><td align=\"center\">无人回复（没有开发）</td></table>\n" +
                                                "                                        </div>\n" +
                                                "                                    </div>");
                                        num++;
                                    }
                                    if(num>=3){
                                        break;
                                    }
                                }
                                out.print("                            </td>\n" +
                                        "                        </table>\n" +
                                        "                    </div>");

                        }
                    %>
                    <br/>
                </div>
                <div class="col-md-1 column">
                    <img class="img-rounded" src="page/weibo_renzheng.png">
                </div>
            </div>
        </div>
        <div class="col-md-1 column">
        </div>
    </div>
</div>
<script>
    function judge() {
        if(document.addwz.wenzhangName.value==""){
            window.alert("请输入文章名字");
            return ;
        }
        if(document.addwz.content.value==""){
            window.alert("请输入文章内容");
            return ;
        }
        document.addwz.submit();
    }
</script>
</body>
</html>
