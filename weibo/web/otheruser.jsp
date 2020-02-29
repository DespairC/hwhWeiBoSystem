<%@ page import="com.hwh.www.po.Wenzhang" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hwh.www.po.Sub" %>
<%@ page import="com.hwh.www.po.User" %>
<%@ page import="com.hwh.www.po.Pinglun" %>
<%@ page import="com.hwh.www.dao.*" %><%--
  Created by IntelliJ IDEA.
  User: hx25
  Date: 2020/2/27
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="menu.jsp"%>
<html>
<head>
    <title>用户页面</title>
</head>
<body>
<%! String othername = null,buttonname,dzbuttonname;int subnumber,ownfasnumber,fansnumber,textnumber;%>
<%  //读取用户信息
    othername = request.getParameter("othername");
    subnumber=0;fansnumber=0;textnumber=0;ownfasnumber=0;
    List<User> userdate = UserDao.loadData();
    if(othername==null)othername="nul";
    if(othername.equals((String)session.getAttribute("uname")))response.sendRedirect("User.jsp");
    for(User user:userdate){
        if(othername.equals(user.getUname())){
            subnumber=user.getSub();
            fansnumber=user.getFans();
            ownfasnumber=fansnumber;
            textnumber=user.getOwntext();
            break;
        }
    }
%>

<%  //判断是否关注
    int judge = SubDao.judgeSub((String)session.getAttribute("uname"),othername);
    if(judge==1)buttonname="取消关注";
    else buttonname = "关注";
%>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="img-rounded" style="width: 100%;">
                <td>
                    <div align="center">
                        <img style="width: 100px;height: 100px" class="img-circle table-bordered" src="page/ico/head1.png" /><br/>
                        <div style="font-size: xx-large"><%=othername%></div>
                        <form name="sub">
                            <input type="hidden" name="othername" value=<%=othername%>>
                            <input type="hidden" name="uname" value=<%=session.getAttribute("uname")%>>
                            <input type="submit" id="subbtn" class="btn btn-default" onclick="subjudge()" value=<%=buttonname%>>
                        </form>
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

                    <table class="img-rounded table-bordered" style="margin-top: 10px;background:white;width:100%;font-size: medium">
                        <tr>
                            <td><h4>内测用户</h4></td>
                        </tr>
                        <tr>
                            <td><h5><img style="width: 15px;height: 15px" src="page/ico/localtion.jpg">&nbsp;&nbsp;广东</h5></td>
                        </tr>
                        <tr>
                            <td><h5><img style="width: 15px;height: 15px" src="page/ico/birthday.jpg">&nbsp;&nbsp;2000年1月1日</h5></td>
                        </tr>
                        <tr>
                            <td><h5><img style="width: 15px;height: 15px" src="page/ico/information.jpg">&nbsp;&nbsp;简介：测试微博1.0专用用户</h5></td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-9 column img-rounded">
                    <div class="tab-content">
                        <div class="tab-pane active" id="01">
                            <%
                                List<Wenzhang> Wzdate = WenzhangDao.getWz();
                                for(Wenzhang wenzhang:Wzdate){
                                    if(wenzhang.getUsername().equals(othername)){
                                        String sname = wenzhang.getUsername();
                                        String wenzhangName = wenzhang.getName();
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
                                        out.print("<td align=\"center\"><img style=\"width: 15px;height: 15px\" src=\"page/ico/dz.jpg\" /><a href=\""+order+"?othername="+ othername +"&pagename=otheruser&uname="+ (String)session.getAttribute("uname") +
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
                                        out.print("<input type=\"hidden\" name=\"url\" value=\"otheruser.jsp\">");
                                        out.print("<input type=\"hidden\" name=\"othername\" value=\""+ othername +"\">");
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
                                <div><h4>&nbsp;&nbsp;他的关注&nbsp;<%=subnumber%></h4></div>
                                <table class="table-bordered" align="center" style="width: 99%"><td></td></table>
                                <br/>

                                <%
                                    List<Sub> subData = SubDao.findSub(othername);
                                    String nname = null;
                                    for(Sub sub:subData){
                                        nname = sub.getBesub();
                                        out.print("<div class=\"table-bordered\" style=\"width:100%;\">\n" +
                                                "                            <div class= \"row clearfix\">\n" +
                                                "                                <div class=\"col-md-1\" align=\"center\"><img style=\"width: 50px;height: 50px\" class=\"img-circle table-bordered\" src=\"page/ico/head1.png\" /></div>");
                                        out.print("<div class=\"col-md-11\"><a href=\"otheruser.jsp?othername="+ nname +"\" style=\"font-size: medium\">" + nname + "</a>");
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
                                                "                            </div>\n" +
                                                "                        </div>\n" +
                                                "                        </br>");
                                    }
                                %>

                            </div>
                        </div>
                        <div class="tab-pane fade" id="03">
                            <div class="img-rounded" style="background: white;">
                                <div><h4>&nbsp;&nbsp;他的粉丝&nbsp;<%=ownfasnumber%></h4></div>
                                <table class="table-bordered" align="center" style="width: 99%"><td></td></table>
                                <br/>
                                <%
                                    List<Sub> fansData = SubDao.findfans(othername);
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

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
<script>
    var subbtnjudge = document.getElementById("subbtn").value;
    function dzjudge() {
        if(dzbtnjudge=="点赞")document.dzform.action="adddzServlet";
        else document.dzform.action="deldzServlet";
        document.dzform.submit();
    }
</script>
</body>
</html>
