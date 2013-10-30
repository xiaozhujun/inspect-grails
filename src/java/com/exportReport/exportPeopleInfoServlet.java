package com.exportReport;
import net.sf.jasperreports.engine.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
public class exportPeopleInfoServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        exportReport d1=new exportReport();
        String stime=request.getParameter("stime");
        String endtime=request.getParameter("etime");
        String type = request.getParameter("type");
        java.sql.Date st=d1.executeDateFormat(stime);
        java.sql.Date et=d1.executeDateFormat(endtime);
        String d=request.getParameter("did");
        String u=request.getParameter("uid");
        String reportTemplate1=this.getServletContext().getRealPath("/report/reportx2.jasper");
        String path=this.getServletContext().getRealPath("/report/") + "/";
        String sql1="select tag.`id` as tagid,tag.`name` as tagname,u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid,count(itr.id) as itrnum " +
                "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and " +
                "itr.dnumber_id=d.id and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' " +
                "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
        String reportTemplate2=this.getServletContext().getRealPath("/report/peopleInfoByUid.jasper");
        String reportTemplate3=this.getServletContext().getRealPath("/report/peopleInfoBydid.jasper");
        String reportTemplate4=this.getServletContext().getRealPath("/report/peopleInfoByDUid.jasper");
        if(type==null){
           try{
               if(d==null&&u==null){
                   System.out.print("0");
                  d1.exportReportHasSubreport(reportTemplate1,sql1,path,request,response);
               }else if(d!=null&&u==null){
                   System.out.print("3");
                   Long did=Long.parseLong(d);
                   String sql3="select tag.`id` as tagid, tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid,count(itr.id) as itrnum " +
                           "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and" +
                           " itr.dnumber_id=d.id  and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"'and itr.dnumber_id="+did+" " +
                           "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
                   d1.exportReportHasSubreport(reportTemplate3,sql3,path,request,response);
               }else if(d==null&&u!=null){
                   System.out.print("2");
                   Long uid=Long.parseLong(u);
                   String sql2="select tag.`id` as tagid, tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`, d.devname,  d.id as devid, count(itr.id) as itrnum " +
                           "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and" +
                           " itr.dnumber_id=d.id and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' and itr.worker_id="+uid+" " +
                           "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
                   d1.exportReportHasSubreport(reportTemplate2,sql2,path,request,response);
               }else if(d!=null&&u!=null){
                   System.out.print("4");
                   Long did=Long.parseLong(d);
                   Long uid=Long.parseLong(u);
                   String sql4="select tag.`id` as tagid, tag.`name` as tagname,u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid, count(itr.id) as itrnum " +
                           "from `inspect_item_rec` itr,  inspect_tag   tag,`inspect_item` it,device d,`users` u " +
                           "where itr.tag_id = tag.id and itr.worker_id = u.id and itr.dnumber_id=d.id " +
                           "and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' and itr.worker_id="+uid+" and itr.dnumber_id="+did+" group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime" ;
                   d1.exportReportHasSubreport(reportTemplate4,sql4,path,request,response);
               }
           }catch (JRException e){
               e.printStackTrace();
           }
       }else{
            if(d==null&&u==null){
                d1.exportReportHasSubreportByType(reportTemplate1,sql1,type,path,request,response);
            }else if(d!=null&&u==null){
                Long did=Long.parseLong(d);
                String sql3="select tag.`id` as tagid, tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid,count(itr.id) as itrnum " +
                        "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and" +
                        " itr.dnumber_id=d.id  and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"'and itr.dnumber_id="+did+" " +
                        "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
                d1.exportReportHasSubreportByType(reportTemplate3,sql3,type,path,request,response);
            }else if(d==null&&u!=null){
                Long uid=Long.parseLong(u);
                String sql2="select tag.`id` as tagid, tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`, d.devname,  d.id as devid, count(itr.id) as itrnum " +
                        "from `inspect_item_rec` itr, inspect_tag   tag,`inspect_item` it, device d,`users` u where itr.tag_id = tag.id and itr.worker_id = u.id and" +
                        " itr.dnumber_id=d.id and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' and itr.worker_id="+uid+" " +
                        "group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime";
                d1.exportReportHasSubreportByType(reportTemplate2,sql2,type,path,request,response);
            }else if(d!=null&&u!=null){
                Long did=Long.parseLong(d);
                Long uid=Long.parseLong(u);
                String sql4="select tag.`id` as tagid, tag.`name` as tagname,u.`id`, u.`username`, itr.`createtime`,d.devname,d.id as devid, count(itr.id) as itrnum " +
                        "from `inspect_item_rec` itr,  inspect_tag   tag,`inspect_item` it,device d,`users` u " +
                        "where itr.tag_id = tag.id and itr.worker_id = u.id and itr.dnumber_id=d.id " +
                        "and itr.ivalue_id=2 and itr.createtime between '"+st+"' and '"+et+"' and itr.worker_id="+uid+" and itr.dnumber_id="+did+" group by tag.name,itr.createtime order by u.username,d.devname,itr.createtime" ;
                d1.exportReportHasSubreportByType(reportTemplate4,sql4,type,path,request,response);
            }
       }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

}
