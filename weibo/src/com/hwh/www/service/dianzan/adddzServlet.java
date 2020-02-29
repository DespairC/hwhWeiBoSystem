package com.hwh.www.service.dianzan;

import com.hwh.www.dao.DianzanDao;
import com.hwh.www.dao.UserDao;
import com.hwh.www.dao.WenzhangDao;
import com.hwh.www.po.Wenzhang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

@WebServlet(name = "adddzServlet",urlPatterns = "/adddzServlet")
public class adddzServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");                    //防止中文乱码
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String othername = request.getParameter("othername");
        String pagename = request.getParameter("pagename");
        String npage =request.getParameter("npage");
        String uname = request.getParameter("uname");
        String textname = request.getParameter("textname");
        out.println("1."+othername);
        out.println("2."+pagename);
        out.println("3."+uname);
        out.println("4."+textname);
        DianzanDao.addDz(uname,textname);
        if(othername==null) {
            if (npage == null) response.sendRedirect(pagename + ".jsp");
            else response.sendRedirect(pagename + ".jsp?npage=" + URLEncoder.encode(npage,"utf-8"));
        }
        else{
            request.setAttribute("othername",othername);
            request.getRequestDispatcher(pagename+".jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
