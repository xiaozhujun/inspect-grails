package com.cesi.configuresearch;
import com.exportReport.ExportReport;
import com.springsource.roo.inspect.dao.DbImpl;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.*;
import net.sf.jasperreports.engine.util.JRLoader;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-11-1
 * Time: 下午9:07
 * To change this template use File | Settings | File Templates.
 */
public class ShowHtmlReportServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             request.setCharacterEncoding("UTF-8");
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out=response.getWriter();
             DbImpl d1=new DbImpl();
             String type=request.getParameter("type");
             String stime=request.getParameter("s");
             String etime=request.getParameter("e");
             String itrid=request.getParameter("ct");
             String tid=request.getParameter("tid");
             String str=type+","+tid+","+itrid;
             Long t1 = Long.parseLong(tid);
             Timestamp ts=d1.getCreatetimeFromInspectItemRec(Integer.parseInt(itrid));
             String titleTemplate="<div class='title'><span class='titlefont'>点检表详情</span></div>";
             String btu="<div style='margin-left: 1015px;cursor: pointer;margin-top:2px;' ><a  class='selectbtn'"+
                     " href=exportReportServlet?type="+type+"&stime="+stime+"&tid="+tid+"&etime="+etime+"&ct="+itrid+" class='selectbtn' >导出文件</a></div>";
             out.println(titleTemplate);
             out.println(btu);
             String reportTemplate = this.getServletConfig().getServletContext().getRealPath(
                "/report/report2.jasper");
             String sql="select tb.`id`,tb.`tname`,tag.`id` as tagid,tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`," +
                "d.numbers from`inspect_item_rec` itr,`inspect_table_record` tr,inspect_tag   tag,`inspect_item` it,`inspect_Table` tb,device d,`users` u " +
                "where itr.createtime = tr.createtime and itr.inspecttable_id= tb.id  and itr.tag_id = tag.id and itr.worker_id = u.id and itr.dnumber_id=d.id" +
                " and itr.inspecttable_id ="+t1+" and itr.createtime ='"+ts+"' group by tag.name";
             ExportReport d=new ExportReport();
             String path1=this.getServletContext().getRealPath("/report/") + "/";
           try{
                 d.exportReportHasSubreport(reportTemplate,sql,path1,request,response);
             /*out.write(d.exportRiskReport(reportTemplate,sql, path1));
                System.out.println(d.exportRiskReport(reportTemplate,sql, path1).getBytes("GBK")+"ooooooooo");
             out.flush();*/
             }catch (JRException e){
                 e.printStackTrace();
             }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              doPost(request,response);
    }
}
