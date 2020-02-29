package com.hwh.www.service.subscribe;

import com.hwh.www.dao.SubDao;
import com.hwh.www.po.Sub;
import com.hwh.www.until.DButil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "delsubServlet",urlPatterns = "/delsubServlet")
public class delsubServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");                    //防止中文乱码
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("uname");
        String besubname = request.getParameter("besub");
        String othername = request.getParameter("othername");
        out.println("用户名："+uname);
        out.println("用户名："+besubname);
        out.println("用户名："+othername);
        if(othername==null){
            SubDao.delSub(uname,besubname);
            response.sendRedirect("User.jsp");
        }
        else {
            SubDao.delSub(uname,othername);
            request.setAttribute("othername",othername);
            request.getRequestDispatcher("otheruser.jsp").forward(request,response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
