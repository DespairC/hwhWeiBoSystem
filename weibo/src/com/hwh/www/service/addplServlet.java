package com.hwh.www.service;

import com.hwh.www.dao.PinglunDao;
import com.hwh.www.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;


@WebServlet(name = "addplServlet",urlPatterns = "/addplServlet")
public class addplServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");                    //防止中文乱码
        response.setContentType("text/html; charset=UTF-8");
        String othername = request.getParameter("othername");
        String url = request.getParameter("url");
        String npage =request.getParameter("npage");
        String text = request.getParameter("text");
        String name = request.getParameter("name");
        String time = request.getParameter("time");
        String from = request.getParameter("from");
        PinglunDao.addPl(name,text,time,from);
        if(othername==null) {
            if (npage == null) response.sendRedirect(url);
            else response.sendRedirect(url + "npage=" + URLEncoder.encode(npage,"utf-8"));
        }
        else{
            request.setAttribute("othername",othername);
            request.getRequestDispatcher(url).forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
