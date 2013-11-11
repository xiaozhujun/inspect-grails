package com.cesi.report;

import com.execute.InsertToEmploy;
import com.springsource.roo.inspect.dao.DbImpl;
import model.PageInspectTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-31
 * Time: 下午3:52
 * To change this template use File | Settings | File Templates.
 */
public class GenerateEmployeeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String[] str=new String(request.getParameter("str").getBytes("UTF-8")).split(" ");
        DbImpl d=new DbImpl();
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        for(int i=0;i<str.length;i++){
            PageInspectTable p=new PageInspectTable();
            p=d.getUserRoleById(Integer.parseInt(str[i]));
            list.add(p);
        }
        InsertToEmploy e=new InsertToEmploy();
        String result=e.insertToEmploy(list);
        if(result!=""){
            String downFilename = "人员配置.xml";
            response.setContentType("text/plain;charset=utf-8");
            response.setHeader("Location",downFilename);
            response.setHeader("Content-Disposition", "attachment; filename="
                    + new String(downFilename.getBytes("utf-8"),"ISO8859-1"));
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(result.getBytes());
            outputStream.flush();
            outputStream.close();
        }else {
            out.print("生成文件失败！");
        }
        }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              doPost(request,response);
    }

}
