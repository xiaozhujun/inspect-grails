package com.cesi.ConfigureSearch;

import com.springsource.roo.inspect.dao.DBImpl;
import model.PageInspectTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-11-1
 * Time: 下午4:37
 * To change this template use File | Settings | File Templates.
 */
public class searchDeviceResultServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String dtype=request.getParameter("dtype");
        String device=request.getParameter("device");
        String tag=request.getParameter("tag");
        String tableTemplate="<form method='post'><table border=1 class='tb1'><thead><tr><th>设备类型</th><th>设备类型编号</th><th>设备编号</th><th>标签区域</th><th>标签号</th><th>标签编号</th><th>操作</th></thead><tbody>";
        String tfootTemplate="</table></form>";
        String empty="对不起，查询记录不存在！";
        DBImpl d=new DBImpl();
        PageInspectTable p=null;
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        if(dtype==""&&device==""&&tag==""){
            out.print("对不起，请输入查询条件！");
        }else{
            if(dtype!=""&&device!=""&&tag!=""){
                int d1=Integer.parseInt(dtype);
                int dd=Integer.parseInt(device);
                int t=Integer.parseInt(tag);
                list=d.getTypeDevTag(d1,dd,t);
                if(list.size()==0){
                    out.println(empty);
                }else{
                out.println(tableTemplate);
                Iterator it1=list.iterator();
                while(it1.hasNext()){
                    p=(PageInspectTable)it1.next();
                    out.println(d.returnDeviceResultString(p));
                }
                out.println(tfootTemplate);
                }
            }else if(device!=""&&tag!=""){
                int dd=Integer.parseInt(device);
                int t=Integer.parseInt(tag);
                list=d.getDevTag(dd,t);
                if(list.size()==0){
                 out.println(empty);
                }else{
                 out.println(tableTemplate);
                Iterator it1=list.iterator();
                while(it1.hasNext()){
                    p=(PageInspectTable)it1.next();
                    out.println(d.returnDeviceResultString(p));
                }
                out.println(tfootTemplate);
                }
            } else if(dtype!=""&&device!=""){
                int d1=Integer.parseInt(dtype);
                int dd=Integer.parseInt(device);
                list=d.getTypeDev(dd,d1);
                if(list.size()==0){
                 out.println(empty);
                }else{
                 out.println(tableTemplate);
                Iterator it1=list.iterator();
                while(it1.hasNext()){
                    p=(PageInspectTable)it1.next();
                out.println(d.returnDeviceResultString(p));
                }
                out.println(tfootTemplate);
                }
            }else if(dtype!=""&&tag!=""){
                int d1=Integer.parseInt(dtype);
                int t=Integer.parseInt(tag);
                list=d.getTypeTag(d1,t);
                if(list.size()==0){
                 out.println(empty);
                }else{
                 out.println(tableTemplate);
                Iterator it1=list.iterator();
                while(it1.hasNext()){
                    p=(PageInspectTable)it1.next();
                    out.println(d.returnDeviceResultString(p));
                }
                out.println(tfootTemplate);
                }
            }else if(dtype!=""){
                int d1=Integer.parseInt(dtype);
                list=d.getType(d1);
                if(list.size()==0){
                    out.println(empty);
                }else{
                    out.println(tableTemplate);
                Iterator it1=list.iterator();
                while(it1.hasNext()){
                    p=(PageInspectTable)it1.next();
                    out.println(d.returnDeviceResultString(p));
                }
                out.println(tfootTemplate);
                }
            }else if(device!=""){
                int d1=Integer.parseInt(device);
                list=d.getDevice(d1);
                if(list.size()==0){
                    out.println(empty);
                }else{
                    out.println(tableTemplate);
                Iterator it1=list.iterator();
                while(it1.hasNext()){
                    p=(PageInspectTable)it1.next();
                 out.println(d.returnDeviceResultString(p));
                }
                out.println(tfootTemplate);
                }
            } else if(tag!=""){
                int d1=Integer.parseInt(tag);
                list=d.getTag(d1);
                if(list.size()==0){
                    out.println(empty);
                }else{
                    out.println(tableTemplate);
                Iterator it1=list.iterator();
                while(it1.hasNext()){
                    p=(PageInspectTable)it1.next();
                    out.println(d.returnDeviceResultString(p));
                 }
                out.println(tfootTemplate);
                }
            }
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
    }
}
