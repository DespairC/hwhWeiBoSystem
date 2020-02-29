package com.hwh.www.service;

import com.hwh.www.dao.WenzhangDao;
import com.hwh.www.po.Wenzhang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "addwzServlet",urlPatterns = "/addwzServlet")
public class addwzServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");                    //防止中文乱码
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = request.getParameter("url");
        String username = request.getParameter("username");
        String time = request.getParameter("time");
        String content= request.getParameter("content");
        String type = request.getParameter("type");
        String wenzhangName = request.getParameter("wenzhangName");
//        out.println(username+"|"+time+"|"+type+"|"+wenzhangName+"|"+content);
        WenzhangDao.addWz(wenzhangName,content,type,username,time);
        response.sendRedirect(url+".jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
