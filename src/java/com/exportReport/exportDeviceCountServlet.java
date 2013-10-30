package com.exportReport;
import net.sf.jasperreports.engine.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
public class exportDeviceCountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        exportReport d1=new exportReport();
        String stime=request.getParameter("stime");
        String endtime=request.getParameter("etime");
        java.sql.Date st=d1.executeDateFormat(stime);
        java.sql.Date et=d1.executeDateFormat(endtime);
        String type=request.getParameter("type");
        String reportTemplate1=this.getServletContext().getRealPath("/report/deviceCount.jasper");
        String sql1="select itr.id,d.devname,d.numbers,count(itr.id)as itrcount,itr.createtime as intime,t.typename as typename " +
                "from inspect_item_rec itr,device d,device_type t where itr.dnumber_id=d.id and itr.ivalue_id=2 and d.type_id=t.id and itr.createtime " +
                "between '"+st+"' and '"+et+"' group by d.devname,itr.createtime order by d.devname,itr.createtime";
        String reportTemplate2=this.getServletContext().getRealPath("/report/deviceCountBydnum.jasper");
        String d=request.getParameter("did");
        if(type==null){
            try{
            if(d==null){
               d1.exportReport(reportTemplate1,sql1,request,response);
            }else{
                Long did=Long.parseLong(d);
                String sql2="select itr.id,d.id as did,d.devname,d.numbers,count(itr.id)as itrcount,itr.createtime as intime  " +
                        "from inspect_item_rec itr,device d,inspect_item it where itr.dnumber_id=d.id and itr.item_id=it.id and " +
                        "itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' and itr.dnumber_id="+did+" group by d.devname,itr.createtime order by itr.createtime";
               d1.exportReport(reportTemplate2,sql2,request,response);
            }
            }catch (JRException e){
                e.printStackTrace();
            }
        }else{
              if(d==null){
                 d1.exportReportByType(reportTemplate1,sql1,type,request,response);
              }else{
                  Long did=Long.parseLong(d);
                  String sql2="select itr.id,d.id as did,d.devname,d.numbers,count(itr.id)as itrcount,itr.createtime as intime  " +
                          "from inspect_item_rec itr,device d,inspect_item it where itr.dnumber_id=d.id and itr.item_id=it.id and " +
                          "itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' and itr.dnumber_id="+did+" group by d.devname,itr.createtime order by itr.createtime";
                  d1.exportReportByType(reportTemplate2,sql2,type,request,response);
              }
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
