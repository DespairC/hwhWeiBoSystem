<%--
  Created by IntelliJ IDEA.
  User: hx25
  Date: 2020/2/23
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="menu.jsp"%>
<%@ page import="com.hwh.www.dao.UserDao" import="com.hwh.www.dao.WenzhangDao" import="com.hwh.www.dao.PinglunDao"%>
<%@ page import="java.util.List" %>
<%@ page import="com.hwh.www.po.Wenzhang" %>
<%@ page import="com.hwh.www.po.User" %>
<%@ page import="com.hwh.www.po.Pinglun" %>
<%@ page import="com.hwh.www.dao.DianzanDao" %>
<html>
<style type="text/css">
    body{
        background-image:url(page/body_bg.jpg);
        background-size: 100% 100%;
        padding: 0;
        margin: 0;
    }
    .u1 a{
        font-weight: bold;
        font-size: larger;
        text-align: center;
        color: darkred;
    }
</style>
<head>
    <title>微博1.0</title>
</head>
<body>
<%! String dzbuttonname,npage,account;%>
<%
    account = request.getParameter("account");
    npage=request.getParameter("npage");
%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-1 column">
        </div>
        <div class="col-md-10 column img-rounded" style="background: rgba(0,0,0,0.2)">
            <div class="row clearfix">
                <div class="col-md-2 column">
                    <ul class="nav u1">
                        <li><span class="glyphicon glyphicon-apple" aria-hidden="true"></span></li>
                        <li><a href="find.jsp?npage=<%="搞笑"%>&account=<%=account%>">&middot;&nbsp;搞笑</a></li>
                        <li><a href="find.jsp?npage=<%="社会"%>&account=<%=account%>">&middot;&nbsp;社会</a></li>
                        <li><a href="find.jsp?npage=<%="时尚"%>&account=<%=account%>">&middot;&nbsp;时尚</a></li>
                        <li><a href="find.jsp?npage=<%="电影"%>&account=<%=account%>">&middot;&nbsp;电影</a></li>
                        <li><a href="find.jsp?npage=<%="美女"%>&account=<%=account%>">&middot;&nbsp;美女</a></li>
                        <li><a href="find.jsp?npage=<%="体育"%>&account=<%=account%>">&middot;&nbsp;体育</a></li>
                        <li><a href="find.jsp?npage=<%="动漫"%>&account=<%=account%>">&middot;&nbsp;动漫</a></li>
                        <li><a href="#">....&nbsp;更多</a></li>
                    </ul>
                </div>
                <div class="col-md-9 column" style="opacity:1;">
                    <%
                        List<Wenzhang> Wzdate = WenzhangDao.getWz();
                        for(Wenzhang wenzhang:Wzdate){
                            if(wenzhang.getType().equals(npage)){
                                String sname = wenzhang.getUsername();
                                String wenzhangName = wenzhang.getName();
                                //文章
                                out.print("<div class=\"img-rounded\" style=\"margin-top: 10px;background:white;width: 100%\">\n" +
                                        "                <br/><div class= \"row clearfix\">\n" +
                                        "                <div class=\"col-md-1\" align=\"center\"><img style=\"width: 55px;height: 55px\" class=\"img-circle table-bordered\" src=\"page/ico/head1.png\" /></div>\n" +
                                        "                <div class=\"col-md-11\">");
                                if(!"guest".equals(account))
                                    out.print("<a href=\"otheruser.jsp?othername="+ sname +"\" style=\"font-size: medium\">" + sname + "</a>");
                                else
                                    out.print(sname);

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
                                if(!"guest".equals(account))
                                out.print("<td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/dz.jpg\" /><a href=\""+order+"?"+"&pagename=find&npage="+ npage +"&uname="+ (String)session.getAttribute("uname") +
                                        "&textname="+ wenzhangName +"\">"+dzbuttonname+"("+wenzhang.getDianzan()+")</a></td>\n");
                                else
                                    out.print("<td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/dz.jpg\" /><a href=\"#\">"+dzbuttonname+"("+wenzhang.getDianzan()+")</a></td>\n");

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
                                out.print("<input type=\"hidden\" name=\"url\" value=\"find.jsp?\">");
                                out.print("<input type=\"hidden\" name=\"npage\" value=\""+npage+"\">");
                                out.print("<input type=\"hidden\" id=\"name\" name= \"name\" value=\""+ session.getAttribute("uname") + "\">");
                                out.print("<input type=\"hidden\" id=\"time\" name= \"time\" value=\""+ UserDao.getTime() + "\">");
                                out.print("<input type=\"hidden\" id=\"from\" name= \"from\" value=\"" + wenzhangName + "\">");
                                if(!"guest".equals(account))
                                out.print("                                                <textarea placeholder=\"请在这里输入你要评论的内容\" id=\"text1\" class=\"img-rounded\" style=\"height: 50px;width:98%\" name=\"text\" ></textarea>\n" +
                                        "                                                <div style=\"float: right\">\n" +
                                        "                                                    <input class=\"btn btn-danger\" type=\"submit\" value=\"发送\">\n");
                                else out.print("                                                <textarea placeholder=\"请登录后评论\" id=\"text1\" class=\"img-rounded\" style=\"height: 50px;width:98%\" name=\"text\" ></textarea>\n" +
                                        "                                                <div style=\"float: right\">\n" +
                                        "                                                    <a href=\"login.jsp\" class=\"btn btn-danger\">发送</a>\n");

                                out.print("                                                    &nbsp;&nbsp;\n" +
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
                                        if(!"guest".equals(account))
                                            out.print("<div style=\"width: 100%\"><a href=\"otheruser.jsp?othername=" + pinglun.getName() + "\" style=\"font-size: medium\">" + pinglun.getName() + "</a>"+"："+ pinglun.getContent() +"</div>");
                                        else
                                            out.print("<div style=\"width: 100%\">" + pinglun.getName() + "</a>"+"："+ pinglun.getContent() +"</div>");

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




























































<%--<%! int number=0,max_wzid,wzid=1;String from,time;%>--%>
<%--<center>--%>
<%--    <%time=UserDao.getTime();%>--%>
<%--    <%--%>
<%--        String pagetext=(String)request.getAttribute("nowpage");--%>
<%--        if(pagetext != null) wzid=Integer.parseInt(pagetext);--%>
<%--        List<Wenzhang> Wzdata = WenzhangDao.getWz();--%>
<%--        List<Pinglun> data = PinglunDao.getPl();--%>
<%--    %>--%>
<%--<table class="img-rounded" style="height: 100px;width: 1005px;background: white">--%>
<%--    <td id="wzq">--%>
<%--        <%--%>
<%--            for(Wenzhang wenzhang:Wzdata){--%>
<%--                if(wzid == wenzhang.getId()) {--%>
<%--                    from = wenzhang.getName();--%>
<%--                    out.print("<h3 align=\"center\">" + wenzhang.getName() + "&nbsp;&nbsp;&nbsp;&nbsp;" + wenzhang.getUsername() + "<input class=\"btn btn-default\" type=\"button\" value=\"关  注\"></h3>");--%>
<%--                    out.print("<h3>" + wenzhang.getTime() + "<h3>");--%>
<%--                    out.print(wenzhang.getContent());--%>
<%--                    number = wenzhang.getDianzan();--%>
<%--                    break;--%>
<%--                }--%>
<%--            }--%>
<%--        %>--%>
<%--&lt;%&ndash;        <h3 align="center">全玻璃iPhone外壳&nbsp;&nbsp;&nbsp;&nbsp;名字<input type="button" value="关  注"></h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <h3><%=UserDao.getTime()%></h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <p>根据国外媒体报道，苹果一直在研发一款具有环绕式触摸屏的全玻璃iPhone。该专利被称为“带玻璃外壳的电子设备”，美国专利号为20200057525，专利包括该物体的外观图。</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <p>根据这份专利的描述来看，全玻璃iPhone外壳其实是由多块玻璃组成，但看起来更像是一个整体。通过苹果的技术，令其在视觉上和触觉上看起来是无缝的，&ndash;%&gt;--%>
<%--&lt;%&ndash;            这样就很好的解决了批量生产中的工艺问题，毕竟要用一整块玻璃的难度和成本有点高！</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <br/>&ndash;%&gt;--%>
<%--    </td>--%>
<%--</table>--%>
<%--    <br/>--%>
<%--<table class="img-rounded" style="width: 1005px;background: white">--%>
<%--    <td>--%>
<%--        <form name="plq" method="post">--%>
<%--        <input type="button" class="btn btn-default" value="收  藏">--%>
<%--        <input type="button" class="btn btn-default" value="发  送"  onclick="addpl()">--%>
<%--        <input type="button" class="btn btn-default" id="dz" onclick="window.location.href='adddzServlet?number=<%=number+1%>&name=<%=from%>';" value=<%out.print("点赞("+number+")");%>>--%>
<%--        <input type="button" class="btn btn-default" value="转  发">--%>
<%--        <input type="button" class="btn btn-default" value="test">--%>
<%--        <a href="getwzServlet?nowpage=<%=wzid-1%>">上一篇</a>--%>
<%--        <a href="getwzServlet?nowpage=<%=wzid+1%>">下一篇</a>--%>
<%--        <input type="hidden" name="url" value="find">--%>
<%--        <input type="hidden" id="name" name= "name" value=<%=session.getAttribute("uname")%>>--%>
<%--        <input type="hidden" id="time" name= "time" value="<%=UserDao.getTime()%>">   &lt;%&ndash;value会被空格阻断，在后面加""双引号可以解决&ndash;%&gt;--%>
<%--        <input type="hidden" id="from" name= "from" value="<%=from%>">--%>
<%--        <textarea placeholder="请在这里输入你要评论的内容" id="text1" class="img-rounded" style="height: 50px;width: 1000px" name="text" ></textarea>--%>
<%--        </form>--%>
<%--    </td>--%>
<%--</table>--%>
<%--    <br/>--%>
<%--<table class="img-rounded" style="width: 1005px;background: white">--%>
<%--    <td id="plq">--%>
<%--        <div>评论区<br/>--%>
<%--            ---------------------------------<br/>--%>
<%--        </div>--%>
<%--            <%--%>
<%--                for(Pinglun pinglun:data){--%>
<%--                    if(from.equals(pinglun.getFrom())){--%>
<%--                        out.print(pinglun.getTime()+"&nbsp;&nbsp;&nbsp;&nbsp;用户："+pinglun.getName()+"<br/>");--%>
<%--                        out.print(pinglun.getContent()+"<br/>");--%>
<%--                        out.print("---------------------------------<br/>");--%>
<%--                    }--%>
<%--                }--%>
<%--            %>--%>
<%--    </td>--%>
<%--&lt;%&ndash;            2000-01-01 10:14:24&nbsp;&nbsp;&nbsp;&nbsp;用户：admin<br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;            苹果还是好用的啊<br/>&ndash;%&gt;--%>
<%--&lt;%&ndash;            ---------------------------------<br/>&ndash;%&gt;--%>
<%--</table>--%>
<%--</center>--%>
<%--<script type="text/javascript">--%>
<%--    &lt;%&ndash;    document.getElementById("dz").onclick=function(){&ndash;%&gt;--%>
<%--    &lt;%&ndash;    document.getElementById("dz").value = "点赞(" + <%=++number%> + ")";&ndash;%&gt;--%>
<%--    &lt;%&ndash;    document.getElementById("dz").disable= true;&ndash;%&gt;--%>
<%--    &lt;%&ndash;}&ndash;%&gt;--%>
<%--    function addpl() {--%>
<%--        document.plq.action="addplServlet";--%>
<%--        document.plq.submit();--%>
<%--    }--%>
<%--    //     var time = document.getElementById("time").value;--%>
<%--    //     var name = document.getElementById("name").value;--%>
<%--</script>--%>
</body>
</html>
