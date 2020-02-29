<%--
  Created by IntelliJ IDEA.
  User: hx25
  Date: 2020/2/13
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="menu.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.hwh.www.po.Wenzhang" %>
<%@ page import="com.hwh.www.po.User" %>
<%@ page import="com.hwh.www.po.Sub" %>
<%@ page import="com.hwh.www.po.Pinglun" %>
<%@ page import="com.hwh.www.dao.*" %>
<html>
<head>
    <title>我的微博</title>
</head>
<body>
<script>
</script>
<%! String dzbuttonname;int subnumber,ownfansnumber,fansnumber,textnumber=0;%>
<%  //读取用户信息
    List<User> userdate = UserDao.loadData();
    subnumber=0;fansnumber=0;textnumber=0;ownfansnumber=0;
    String uname = (String) session.getAttribute("uname");
    if(uname==null)uname=" ";
    for(User user:userdate){
        if(uname.equals(user.getUname())){
            subnumber=user.getSub();
            fansnumber=user.getFans();
            ownfansnumber=fansnumber;
            textnumber=user.getOwntext();
            break;
        }
    }
%>
<div class="container">
    <div class="row clearfix">
    <div class="col-md-1 column"></div>
    <div class="col-md-10 column">
        <table class="img-rounded" style="opacity:0.8;width: 100%;background: url(page/001.jpg)">
            <td>
            <div align="center">
            <img style="width: 100px;height: 100px" class="img-circle table-bordered" src="page/ico/head1.png" /><br/>
            <div style="font-size: xx-large"><%=session.getAttribute("uname")%></div>
            <h4>这个人很懒，什么都没有留下</h4><br/>
            </div>
            </td>
        </table>
        <br/>
        <div class="row clearfix">
        <div class="col-md-3 column">

            <table class="img-rounded" style="margin-top: 10px;background:white;width: 100%">
                <td>
            <ul class="nav navbar-nav navbar-brand na">
                <li><a href="#02" style="font-weight:bold;color: black" data-toggle="tab"><%=subnumber%><br/>关注</a></li>
                <li><a href="#03" style="font-weight:bold;color: black" data-toggle="tab"><%=fansnumber%><br/>粉丝</a></li>
                <li><a href="#01" style="font-weight:bold;color: black" data-toggle="tab"><%=textnumber%><br/>微博</a></li>
            </ul>
                </td>
            </table>

        <table class="img-rounded" style="margin-top: 10px;background:white;width:100%">
            <tr>
            <td><a style="color: black" href="https://www.dota2.com.cn/index.htm">编辑个人资料&nbsp;></a></td>
            </tr>
            <tr>
                <td><a style="color: black" href="https://www.dota2.com.cn/index.htm">给制作者送钱&nbsp;></a></td>
            </tr>
            <tr>
                <td><a style="color: black" href="https://www.dota2.com.cn/index.htm">提出意见&nbsp;></a></td>
            </tr>
        </table>
        </div>
        <div class="col-md-9 column img-rounded">
            <div class="tab-content" id="mytab">
                <div class="tab-pane active" id="01">
                    <%
                        List<Wenzhang> Wzdate = WenzhangDao.getWz();
                        for(Wenzhang wenzhang:Wzdate){
                            if(wenzhang.getUsername().equals((String)session.getAttribute("uname"))){
                                String sname = wenzhang.getUsername();
                                String wenzhangName = wenzhang.getName();
                                //文章
                                out.print("<div class=\"img-rounded\" style=\"margin-top: 10px;background:white;width: 100%\">\n" +
                                        "                <div class= \"row clearfix\">\n" +
                                        "                <div class=\"col-md-1\" align=\"center\"><img style=\"width: 55px;height: 55px\" class=\"img-circle table-bordered\" src=\"page/ico/head1.png\" /></div>\n" +
                                        "                <div class=\"col-md-11\">");
                                out.print("<a href=\"otheruser.jsp?othername="+ sname +"\" style=\"font-size: medium\">" + sname + "</a>");
                                out.print(" <div style=\"font-size:small\">发表时间："+wenzhang.getTime()+"<br/></div>");
                                out.print("<div>"+wenzhang.getContent()+"</div>");

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
                                        "                <table class=\"table-bordered\" style=\"width:100%\">\n" +
                                        "                    <tr>\n" +
                                        "                        <td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/sc.jpg\" /><a href=\"empty\">收藏</a></td>\n" +
                                        "                        <td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/pl.jpg\" /><a href=\"#" + wenzhang.getName() + "\" type=\"button\" data-toggle=\"collapse\">评论</a>\n");
                                out.print("<td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/dz.jpg\" /><a href=\""+order+"?"+"&pagename=User&uname="+ (String)session.getAttribute("uname") +
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
                                out.print("<input type=\"hidden\" name=\"url\" value=\"User.jsp\">");
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
                                    if(pinglun.getFrom().equals(wenzhangName)) {
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
                        }
                    %>

                </div>
                <div class="tab-pane fade" id="02">
                    <div class="img-rounded" style="background: white;">
                        <div><h4>&nbsp;&nbsp;全部关注&nbsp;<%=subnumber%></h4></div>
                        <table class="table-bordered" align="center" style="width: 99%"><td></td></table>
                        <br/>

                        <%
                            List<Sub> subData = SubDao.findSub((String)session.getAttribute("uname"));
                            String nname = null;
                            for(Sub sub:subData){
                                nname = sub.getBesub();
                                out.print("<div class=\"table-bordered\" style=\"width:100%;\">\n" +
                                        "                            <div class= \"row clearfix\">\n" +
                                        "                                <div class=\"col-md-1\" align=\"center\"><img style=\"width: 50px;height: 50px\" class=\"img-circle table-bordered\" src=\"page/ico/head1.png\" /></div>");
                                out.print("<div class=\"col-md-9\"><a href=\"otheruser.jsp?othername="+ nname +"\" style=\"font-size: medium\">" + nname + "</a>");
                                subnumber=0;fansnumber=0;textnumber=0;
                                for(User user:userdate){
                                    if(nname.equals(user.getUname())){
                                        subnumber=user.getSub();
                                        fansnumber=user.getFans();
                                        textnumber=user.getOwntext();
                                        break;
                                    }
                                }
                                out.print("<div>关注："+subnumber+"&nbsp;|&nbsp;粉丝："+fansnumber+"&nbsp;|&nbsp;微博："+textnumber+"</div>");
                                out.print("                                    <div> 地址：广东&nbsp;广州</div>\n" +
                                        "                                    <div></div>\n" +
                                        "                                </div>\n" +
                                        "                                <div class=\"col-md-2\">\n" +
                                        "                                    <br/>\n" +
                                        "                                    <form action=\"delsubServlet\">");
                                out.print("<input type=\"hidden\" name=\"uname\" value=\""+session.getAttribute("uname")+"\">");
                                out.print("<input type=\"hidden\" name=\"besub\" value=\""+ nname +"\">");
                                out.print("                                    <input type=\"submit\" class=\"btn btn-default\" value=\"取消关注\">\n" +
                                        "                                    </form>\n" +
                                        "                                </div>\n" +
                                        "                            </div>\n" +
                                        "                        </div>\n" +
                                        "                        </br>");
                            }

                        %>

                    </div>
                </div>
                <div class="tab-pane fade" id="03">
                    <div class="img-rounded" style="background: white;">
                        <div><h4>&nbsp;&nbsp;全部粉丝&nbsp;<%=ownfansnumber%></h4></div>
                        <table class="table-bordered" align="center" style="width: 99%"><td></td></table>
                        <br/>
                        <%
                            List<Sub> fansData = SubDao.findfans((String)session.getAttribute("uname"));
                            String fname = null;
                            for(Sub sub:fansData){
                                fname = sub.getSub();
                                out.print("<div class=\"table-bordered\" style=\"width:100%;\">\n" +
                                        "                            <div class= \"row clearfix\">\n" +
                                        "                                <div class=\"col-md-1\" align=\"center\"><img style=\"width: 50px;height: 50px\" class=\"img-circle table-bordered\" src=\"page/ico/head1.png\" /></div>");
                                out.print("<div class=\"col-md-11\"><a href=\"otheruser.jsp?othername="+ fname +"\" style=\"font-size: medium\">" + fname + "</a>");
                                subnumber=0;fansnumber=0;textnumber=0;
                                for(User user:userdate){
                                    if(fname.equals(user.getUname())){
                                        subnumber=user.getSub();
                                        fansnumber=user.getFans();
                                        textnumber=user.getOwntext();
                                        break;
                                    }
                                }
                                out.print("<div>关注："+subnumber+"&nbsp;|&nbsp;粉丝："+fansnumber+"&nbsp;|&nbsp;微博："+textnumber+"</div>");
                                out.print("                                    <div> 地址：广东&nbsp;广州</div>\n" +
                                        "                                    <div></div>\n" +
                                        "                                </div>\n" +
                                        "                            </div>\n" +
                                        "                        </div>\n" +
                                        "                        </br>");
                            }

                        %>

<%--                        <div class="table-bordered" style="width:100%;">--%>
<%--                            <div class= "row clearfix">--%>
<%--                                <div class="col-md-1" align="center"><img style="width: 50px;height: 50px" class="img-circle table-bordered" src="page/ico/head1.png" /></div>--%>
<%--                                <div class="col-md-11"><a href="otheruser.jsp?" style="font-size: medium">niubi</a>--%>
<%--                                    <div> 关注：1923&nbsp;|&nbsp;粉丝：1000&nbsp;|&nbsp;微博：10000</div>--%>
<%--                                    <div> 地址：广东&nbsp;广州</div>--%>
<%--                                    <div></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        </br>--%>

                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    <div class="col-md-1"></div>
    </div>
</div>

</body>
</html>
