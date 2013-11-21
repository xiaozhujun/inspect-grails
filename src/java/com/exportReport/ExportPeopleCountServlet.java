package com.exportReport;

import com.execute.InsertToDb;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.*;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-16
 * Time: 下午9:11
 * To change this template use File | Settings | File Templates.
 */
public class ExportPeopleCountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        ExportReport d1=new ExportReport();
        InsertToDb t=new InsertToDb();
        String stime=request.getParameter("stime");
        String endtime=request.getParameter("etime");
        String type=request.getParameter("type");
        java.sql.Date st=d1.executeDateFormat(stime);
        java.sql.Date et=d1.executeDateFormat(endtime);
        String d=request.getParameter("did");
        String empty="对不起！查询记录不存在！";
        String timeformat="对不起!起始时间超过终止时间!";
        String passtoday="对不起!输入时间超过当天时间";
        Date today=d1.returnTodayAddOneDay(new Date());
        String reportTemplate1=this.getServletContext().getRealPath("/report/peopleCount.jasper");
        String sql1="select d.id as did,d.devname,u.id as uid,u.username,count(itr.id) as itnumber,itr.createtime as intime " +
                "from inspect_item_rec itr,device d,users u where itr.dnumber_id=d.id  and u.id=itr.worker_id and itr.ivalue_id=2 and " +
                "itr.createtime between '"+st+"' and '"+et+"' " +
                "group by d.devname,itr.createtime order by u.username,d.devname,itr.createtime";
        String sql11="select d.id as did,d.devname,u.id as uid,u.username,count(itr.id) as itnumber,itr.createtime as intime " +
                "from inspect_item_rec itr,device d,users u where itr.dnumber_id=d.id  and u.id=itr.worker_id and itr.ivalue_id=2 and " +
                "itr.createtime between ?  and ? " +
                "group by d.devname,itr.createtime order by u.username,d.devname,itr.createtime";
        String reportTemplate2 = this.getServletContext().getRealPath("/report/peopleCount1.jasper");
        String path=this.getServletContext().getRealPath("/report/") + "/";
        if(st.getTime()>today.getTime()||et.getTime()>today.getTime()){
              out.println(passtoday);
        }else{
            if(st.getTime()>et.getTime()){
                out.println(timeformat);
            }else{
        if(type==null){
            try{
                if(d==null){
                    if(t.judgeHasResult(sql11,st,et)){
                    d1.exportReportHasSubreport(reportTemplate1,sql1,path,request,response);
                    }else{
                        out.println(empty);
                    }
                }else{
                    Long did=Long.parseLong(d);
                    String sql2="select d.id as did,d.devname,u.id as uid,u.username,itr.createtime as intime " +
                            "from inspect_item_rec itr,device d,users u where itr.dnumber_id=d.id  and u.id=itr.worker_id " +
                            "and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' and itr.dnumber_id="+did+" " +
                            "group by itr.createtime order by u.username,d.devname,itr.createtime";
                    String sql22="select d.id as did,d.devname,u.id as uid,u.username,itr.createtime as intime " +
                            "from inspect_item_rec itr,device d,users u where itr.dnumber_id=d.id  and u.id=itr.worker_id " +
                            "and itr.ivalue_id=2 and itr.createtime between ? and ? and itr.dnumber_id=? " +
                            "group by itr.createtime order by u.username,d.devname,itr.createtime";
                    if(t.judgeHasResultByTid(sql22,st,et,did)){
                    d1.exportReportHasSubreport(reportTemplate2,sql2,path,request,response);
                    }else{
                        out.println(empty);
                    }
                }
            }catch (JRException e){
                e.printStackTrace();
            }
         }else{
            if(d==null){
                 d1.exportReportHasSubreportByType(reportTemplate1,sql1,type,path,request,response);
            }else{
                Long did=Long.parseLong(d);
                String sql2="select d.id as did,d.devname,u.id as uid,u.username,itr.createtime as intime " +
                        "from inspect_item_rec itr,device d,users u where itr.dnumber_id=d.id  and u.id=itr.worker_id " +
                        "and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' and itr.dnumber_id="+did+" " +
                        "group by itr.createtime order by u.username,d.devname,itr.createtime";
                d1.exportReportHasSubreportByType(reportTemplate2,sql2,type,path,request,response);
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
