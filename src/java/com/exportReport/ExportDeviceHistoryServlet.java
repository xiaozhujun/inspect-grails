package com.exportReport;
import com.execute.InsertToDb;
import net.sf.jasperreports.engine.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class ExportDeviceHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        ExportReport d1=new ExportReport();
        InsertToDb t=new InsertToDb();
        String did=request.getParameter("did");
        String stime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String type = request.getParameter("type");
        java.sql.Date st=d1.executeDateFormat(stime);
        java.sql.Date et=d1.executeDateFormat(endtime);
        String empty="对不起！查询记录不存在！";
        String timeformat="对不起!起始时间超过终止时间!";
        String passtoday="对不起!输入时间超过当天时间";
        Date today=d1.returnTodayAddOneDay(new Date());
        String reportTemplate1=this.getServletContext().getRealPath("/report/deviceHistory1.jasper");
        String reportTemplate2=this.getServletContext().getRealPath("/report/deviceHistory2.jasper");
        String sql2="select *,count(id)as itnum from (select itr.id,d.devname,ceiling(datediff(itr.createtime,'"+st+"')/7)  as zhouqi,date_format(DATE_ADD('"+st+"',INTERVAL (7*ceiling(datediff(itr.createtime,'"+st+"')/7))-1 DAY),'%Y-%m-%d') as shijian" +
                " from inspect_item_rec itr,device d  where itr.dnumber_id=d.id and  itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' ) as s group by  zhouqi,devname  order by devname desc,shijian asc";
        String sql22="select *,count(id)as itnum from (select itr.id,d.devname,ceiling(datediff(itr.createtime,? )/7)  as zhouqi,date_format(DATE_ADD(?,INTERVAL (7*ceiling(datediff(itr.createtime,?)/7))-1 DAY),'%Y-%m-%d') as shijian" +
                " from inspect_item_rec itr,device d  where itr.dnumber_id=d.id and  itr.ivalue_id=2 and itr.createtime between ? and ? ) as s group by  zhouqi,devname  order by devname desc,shijian asc";
        if(st.getTime()>today.getTime()||et.getTime()>today.getTime()){
               out.println(passtoday);
        }else{
           if(st.getTime()>et.getTime()){
              out.println(timeformat);
           }else{
        if(type==null){
        try{
        if(did==null){
             if(t.judgeHasResultX(sql22,st,et)){
            d1.exportReport(reportTemplate2,sql2,request,response);
             }else{
                 out.println(empty);
             }
        }else{
            Long d=Long.parseLong(did);
            String sql1="select *,count(id)as itnum from (select itr.id,d.devname,ceiling(datediff(itr.createtime,'"+st+"')/7)  as zhouqi,itr.createtime as shijian" +
                    " from inspect_item_rec itr,device d  where itr.dnumber_id=d.id and  itr.ivalue_id=2 and itr.createtime " +
                    "between '"+st+"' and '"+et+"' and itr.dnumber_id="+d+") as s group by devname,zhouqi,shijian";
            String sql11="select *,count(id)as itnum from (select itr.id,d.devname,ceiling(datediff(itr.createtime,? )/7)  as zhouqi,itr.createtime as shijian" +
                    " from inspect_item_rec itr,device d  where itr.dnumber_id=d.id and  itr.ivalue_id=2 and itr.createtime " +
                    "between ? and ? and itr.dnumber_id=?) as s group by devname,zhouqi,shijian";
            if(t.judgeHasResultByTidX(sql11,st,et,d)){
            d1.exportReport(reportTemplate1,sql1,request,response);
            }else{
                out.println(empty);
            }
        }
        }catch (JRException e){
                e.printStackTrace();
            }
        }else{
          if(did.equals("0")){
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
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
