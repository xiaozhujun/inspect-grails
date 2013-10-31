package com.cesi.report;

import com.execute.insertToDevice;
import model.PageInspectTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-31
 * Time: 下午3:19
 * To change this template use File | Settings | File Templates.
 */
public class generateDeviceServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String[] str=new String(request.getParameter("tableHtml").getBytes("UTF-8")).split(" ");
        int idx1=0;
        int idx2=1;
        int idx3=2;
        int idx4=3;
        int idx5=4;
        int idx6=5;
        int len=str.length/6;
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        for(int i=0;i<len;i++){
            PageInspectTable p=new PageInspectTable();
            p.setTypename(str[idx1]);
            p.setTypeid(Integer.parseInt(str[idx2]));
            p.setDevicenumber(str[idx3]);
            p.setTagname(str[idx4]);
            p.setTagid(Integer.parseInt(str[idx5]));
            p.setTagnumbers(str[idx6]);
            idx1 +=6 ;
            idx2 +=6 ;
            idx3 +=6 ;
            idx4 +=6 ;
            idx5 +=6 ;
            idx6 +=6 ;
            list.add(p);
        }
        insertToDevice e=new insertToDevice();
        String result=e.insertToDevice(list);
        if(result!=""){
            String downFilename = "tags.xml";
            response.setContentType("text/plain");
            response.setHeader("Location",
                    new String(downFilename.getBytes("GBK"), "UTF-8"));
            response.setHeader("Content-Disposition", "attachment; filename="
                    + new String(downFilename.getBytes("gb2312"),"ISO8859-1"));
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(result.getBytes(Charset.forName("UTF-8")));
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
