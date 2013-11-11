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

public class ExportDeviceCountServlet extends HttpServlet {
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
        java.sql.Date st=d1.executeDateFormat(stime);
        java.sql.Date et=d1.executeDateFormat(endtime);
        String type=request.getParameter("type");
        String reportTemplate1=this.getServletContext().getRealPath("/report/deviceCount.jasper");
        String sql1="select tag.`id` as tagid,tag.`name` as tagname,u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid,count(itr.id) as itrnum " +
                "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and " +
                "itr.dnumber_id=d.id and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' " +
                "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
        String sql11="select tag.`id` as tagid,tag.`name` as tagname,u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid,count(itr.id) as itrnum " +
                "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and " +
                "itr.dnumber_id=d.id and itr.ivalue_id=2 and itr.createtime between ? and ? " +
                "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
        String path=this.getServletContext().getRealPath("/report/") + "/";
        String reportTemplate2=this.getServletContext().getRealPath("/report/deviceCountBydnum.jasper");
        String d=request.getParameter("did");
        String empty="对不起！查询记录不存在！";
        String timeformat="对不起!起始时间超过终止时间!";
        String passtoday="对不起!输入时间超过当天时间";
        Date today=new Date();
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
               d1.exportReportHasSubreport(reportTemplate1, sql1, path, request, response);
            }else{
                out.println(empty);
            }
            }else{
                Long did=Long.parseLong(d);
                String sql2="select tag.`id` as tagid, tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid,count(itr.id) as itrnum " +
                        "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and" +
                        " itr.dnumber_id=d.id  and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"'and itr.dnumber_id="+did+" " +
                        "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
                String sql22="select tag.`id` as tagid, tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid,count(itr.id) as itrnum " +
                        "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and" +
                        " itr.dnumber_id=d.id  and itr.ivalue_id=2 and itr.createtime between ? and ? and itr.dnumber_id=? " +
                        "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
                if(t.judgeHasResultByTid(sql22,st,et,did)){
               d1.exportReportHasSubreport(reportTemplate2, sql2, path, request, response);
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
                  String sql2="select tag.`id` as tagid, tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid,count(itr.id) as itrnum " +
                          "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and" +
                          " itr.dnumber_id=d.id  and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"'and itr.dnumber_id="+did+" " +
                          "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
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
