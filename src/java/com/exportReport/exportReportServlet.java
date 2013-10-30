package com.exportReport;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public class exportReportServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out=response.getWriter();
    exportReport d=new exportReport();
    String s = request.getParameter("stime");
    String e = request.getParameter("etime");
    String t = request.getParameter("tid");
    String ct = request.getParameter("ct");
    DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    format.setLenient(false);
     Timestamp ts=null;
    try{
        ts = new Timestamp(format.parse(ct).getTime());
    }catch (ParseException ee){
        ee.printStackTrace();
    }
        long t1 = Long.parseLong(t);
    String sql="select tb.`id`,tb.`tname`,tag.`id` as tagid,tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`," +
            "d.numbers from`inspect_item_rec` itr,`inspect_table_record` tr,inspect_tag   tag,`inspect_item` it,`inspect_Table` tb,device d,`users` u " +
            "where itr.createtime = tr.createtime and itr.inspecttable_id= tb.id  and itr.tag_id = tag.id and itr.worker_id = u.id and itr.dnumber_id=d.id" +
            " and itr.inspecttable_id ="+t1+" and itr.createtime ='"+ts+"' group by tag.name";
    String path=this.getServletContext().getRealPath("/report/") + "/";
    String type = request.getParameter("type");
    String reportTemplate= this.getServletConfig().getServletContext().getRealPath("/report/report2.jasper");
    d.exportReportHasSubreportByType(reportTemplate,sql,type,path,request,response);
}
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request,response);
}
        }
