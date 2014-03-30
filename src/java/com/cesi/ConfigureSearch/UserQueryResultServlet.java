package com.cesi.configuresearch;

import com.exportReport.ExportReport;
import com.springsource.roo.inspect.dao.DbImpl;
import model.InspectTableRecord;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-11-1
 * Time: 下午5:55
 * To change this template use File | Settings | File Templates.
 */
public class UserQueryResultServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String s = request.getParameter("s");
        String e =  request.getParameter("e");
        String t =  request.getParameter("t");
        String type =  request.getParameter("type");
        String result="<div id='title2'>查询结果:</div>";
        String tableTemplate="<table border='0'  cellpadding='0' cellspacing='1' bgcolor='#000000' class='querytable'>" +
          "<thead><tr bgcolor='#FFFFFF'><th class='tm'>点检表</th><th>点检人员</th>" +
         " <th class='tm'>点检时间</th><th colspan='2' class='tm'>操作</th></tr></thead><tbody><tr bgcolor='#FFFFFF'>";
        String empty="对不起!查询记录不存在!";
        String timeformat="对不起!起始时间超过终止时间!";
        String passtoday="对不起!输入时间超过当天时间";
        ExportReport d1=new ExportReport();
        Date today=d1.returnTodayAddOneDay(new Date());
        InspectTableRecord r;
        if (s != null && e != null && t != null && type != null) {
            int tid = Integer.parseInt(t);
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            Date d11=null;
            Date d2=null;
            try{
                    d11= sf.parse(s);
                    d2= d1.returnTodayAddOneDay(sf.parse(e));
            }catch (ParseException e1){
                e1.printStackTrace();
            }
            if(d11.getTime()>d2.getTime()){
                out.println(timeformat);
            }else{
                DbImpl d = new DbImpl();
                List<InspectTableRecord> l11 = d.getR(d11, d2, tid);
                if(l11.size()==0){
                    out.println(empty);
                }else {
                    out.println(tableTemplate);
                    Iterator it = l11.iterator();
                    while (it.hasNext()) {
                        r = (InspectTableRecord) it.next();
                        out.print(d.returnUserQueryResultTableString(r));
                    }
                }
            }
         }else if(s==null||e==null){
               out.println("<div id='title1'>请输入查询条件!</div>");
         }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           doPost(request,response);
    }

}
