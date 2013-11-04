package com.cesi.report;

import com.execute.InsertToDevice;
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
 * Time: 下午3:19
 * To change this template use File | Settings | File Templates.
 */
public class GenerateDeviceServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        DbImpl d=new DbImpl();
        String[] str=new String(request.getParameter("tableHtml").getBytes("UTF-8")).split(" ");
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        for(int i=0;i<str.length;i++){
            String [] b=str[i].split(",");
            PageInspectTable p=d.getDevTagById(b[0],Integer.parseInt(b[1]));
            list.add(p);
        }
        InsertToDevice e=new InsertToDevice();
        String result=e.insertToDevice(list);
        if(result!=""){
            String downFilename = "tags.xml";
            response.setContentType("text/plain");
            response.setHeader("Location",
                    new String(downFilename.getBytes("GBK"), "UTF-8"));
            response.setHeader("Content-Disposition", "attachment; filename="
                    + new String(downFilename.getBytes("gb2312"),"ISO8859-1"));
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
        doPost(request,response);    //To change body of overridden methods use File | Settings | File Templates.
    }
}
