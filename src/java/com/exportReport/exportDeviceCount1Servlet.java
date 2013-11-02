package com.exportReport;
import com.execute.insertToDb;
import net.sf.jasperreports.engine.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
public class exportDeviceCount1Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        exportReport d=new exportReport();
        insertToDb d1=new insertToDb();
        String stime=request.getParameter("stime");
        String endtime=request.getParameter("etime");
        String type = request.getParameter("type");
        java.sql.Date st=d.executeDateFormat(stime);
        java.sql.Date et=d.executeDateFormat(endtime);
        System.out.print(stime);
        System.out.print(endtime);
       /* String searchTemplate="<div class='selectF'>" +
                "</div>选择导出类型:<select id='type'><option value=' '>-----请选择------</option>" +
                "<option value='pdf'>pdf格式</option><option value='html'>html格式</option><option value='excel'>excel格式</option>" +
                "<option value='word'>word格式</option></select>" +
                " <a class='btnbu' id='btnreport'>导出报表</a><span class='r'></span></div><div class='report1'></div>";*/
        String empty="对不起！查询记录不存在！";
        String reportTemplate=this.getServletContext().getRealPath("/report/deviceCount1.jasper");
        String sql="select itr.id,d.devname,d.numbers,count(itr.id)as itrcount,itr.createtime as intime,t.typename as typename " +
                "from inspect_item_rec itr,device d,device_type t where itr.dnumber_id=d.id and itr.ivalue_id=2 and d.type_id=t.id and itr.createtime " +
                "between '"+st+"' and '"+et+"' group by d.devname,itr.createtime order by d.devname,itr.createtime";
        String sql1="select itr.id,d.devname,d.numbers,count(itr.id)as itrcount,itr.createtime as intime,t.typename as typename " +
                "from inspect_item_rec itr,device d,device_type t where itr.dnumber_id=d.id and itr.ivalue_id=2 and d.type_id=t.id and itr.createtime " +
                "between ? and ? group by d.devname,itr.createtime order by d.devname,itr.createtime";
        if(d1.judgeHasResult(sql1,st,et)){
            System.out.print("******");
            if(type==""){
                try{
                    System.out.print("-------");
                    d.exportReport(reportTemplate,sql,request,response);
                }catch(JRException e){
                    e.printStackTrace();
                }
            }else{
                d.exportReportByType(reportTemplate,sql,type,request,response);
            }
        }else{
            out.println(empty);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

}
