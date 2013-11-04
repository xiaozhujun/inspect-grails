package com.cesi.configuresearch;

import com.springsource.roo.inspect.dao.DbImpl;
import model.PageInspectTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-11-4
 * Time: 上午9:05
 * To change this template use File | Settings | File Templates.
 */
public class PeopleConfigureServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String u=request.getParameter("uid");
        String rowcount=request.getParameter("rowcount");
        DbImpl d=new DbImpl();
        List<PageInspectTable> list=d.getUserRoleByUid(Integer.parseInt(u));
        Iterator it=list.iterator();
        while(it.hasNext()){
            PageInspectTable p=(PageInspectTable)it.next();
            out.println(d.getPeopleConfigureTable(Integer.parseInt(rowcount),p));
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request,response);
    }

}
