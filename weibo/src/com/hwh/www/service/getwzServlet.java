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
import java.util.List;

@WebServlet(name = "getwzServlet",urlPatterns = "/getwzServlet")
public class getwzServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");                    //防止中文乱码
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("你好,测试555");
        List<Wenzhang> Wzdata = WenzhangDao.getWz();
        int max=0;
        for(Wenzhang wenzhang:Wzdata)max=wenzhang.getId();
        out.println(max);
        String pagetext = request.getParameter("nowpage");
        out.println(pagetext);
        if(pagetext == null) pagetext="1";
        int nowpage = Integer.parseInt(pagetext);
        if(nowpage<=0)nowpage=1;
        else if(nowpage>max)nowpage=max;
        request.setAttribute("nowpage",String.valueOf(nowpage));
        request.getRequestDispatcher("find.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
