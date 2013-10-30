package com.exportReport;
import net.sf.jasperreports.engine.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
public class exportDeviceHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        exportReport d1=new exportReport();
        String did=request.getParameter("did");
        String stime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String type = request.getParameter("type");
        java.sql.Date st=d1.executeDateFormat(stime);
        java.sql.Date et=d1.executeDateFormat(endtime);
        String reportTemplate1=this.getServletContext().getRealPath("/report/deviceHistory1.jasper");
        String reportTemplate2=this.getServletContext().getRealPath("/report/deviceHistory2.jasper");
        String sql2="select *,count(id)as itnum from (select itr.id,d.devname,ceiling(datediff(itr.createtime,'"+st+"')/7)  as zhouqi,date_format(DATE_ADD('"+st+"',INTERVAL (7*ceiling(datediff(itr.createtime,'"+st+"')/7))-1 DAY),'%Y-%m-%d') as shijian" +
                " from inspect_item_rec itr,device d  where itr.dnumber_id=d.id and  itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' ) as s group by  zhouqi,devname  order by devname desc,shijian asc";
        if(type==null){
        try{
        if(did==null){
            d1.exportReport(reportTemplate2,sql2,request,response);
        }else{
            Long d=Long.parseLong(did);
            String sql1="select *,count(id)as itnum from (select itr.id,d.devname,ceiling(datediff(itr.createtime,'"+st+"')/7)  as zhouqi,itr.createtime as shijian" +
                    " from inspect_item_rec itr,device d  where itr.dnumber_id=d.id and  itr.ivalue_id=2 and itr.createtime " +
                    "between '"+st+"' and '"+et+"' and itr.dnumber_id="+d+") as s group by devname,zhouqi,shijian";
            d1.exportReport(reportTemplate1,sql1,request,response);
        }
        }catch (JRException e){
                e.printStackTrace();
            }
        }else{
          if(did==null){
              d1.exportReportByType(reportTemplate2,sql2,type,request,response);
          }else{
              Long d=Long.parseLong(did);
              String sql1="select *,count(id)as itnum from (select itr.id,d.devname,ceiling(datediff(itr.createtime,'"+st+"')/7)  as zhouqi,itr.createtime as shijian" +
                      " from inspect_item_rec itr,device d  where itr.dnumber_id=d.id and  itr.ivalue_id=2 and itr.createtime " +
                      "between '"+st+"' and '"+et+"' and itr.dnumber_id="+d+") as s group by devname,zhouqi,shijian";
              d1.exportReportByType(reportTemplate1,sql1,type,request,response);
          }
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
