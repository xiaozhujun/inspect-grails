package com.exportReport;

import model.MyDataSource;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.*;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-16
 * Time: 下午9:25
 * To change this template use File | Settings | File Templates.
 */
public class exportPeopleInfoServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        // 获得报表数据。这里使用ireport的测试数据。
        String stime=request.getParameter("stime");
        String endtime=request.getParameter("etime");
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Date st=null;
        Date et=null;
        try{
            st=format.parse(stime);
            et=format.parse(endtime);
        }catch (ParseException e){
            e.printStackTrace();
        }
        String d=request.getParameter("did");
        String u=request.getParameter("uid");

        MyDataSource ds=new MyDataSource();
        Connection connection=ds.getConnection();
        Map parameters = new HashMap();
        if(d==null&&u==null){
            parameters.put("stime",st);
            parameters.put("etime",et);
            parameters.put("SUBREPORT_DIR",request.getServletContext().getRealPath("/report/") + "/");
        }else if(d!=null&&u==null){
            Long did=Long.parseLong(d);
            parameters.put("stime",st);
            parameters.put("etime",et);
            parameters.put("devid", did);
            parameters.put("SUBREPORT_DIR",request.getServletContext().getRealPath("/report/") + "/");
        }else if(d==null&&u!=null){
            Long uid=Long.parseLong(u);
            parameters.put("stime",st);
            parameters.put("etime",et);
            parameters.put("uid", uid);
            parameters.put("SUBREPORT_DIR",request.getServletContext().getRealPath("/report/") + "/");
        }else if(d!=null&&u!=null){
            Long did=Long.parseLong(d);
            Long uid=Long.parseLong(u);
            parameters.put("stime",st);
            parameters.put("etime",et);
            parameters.put("did", did);
            parameters.put("uid",uid);
            parameters.put("SUBREPORT_DIR",request.getServletContext().getRealPath("/report/") + "/");
        }
        File reportFile=null;
        String type = request.getParameter("type");
        if(d==null&&u==null){
            reportFile= new File(this.getServletConfig().getServletContext().getRealPath(
                    "/report/reportx2.jasper"));
        }else if(d!=null&&u==null){
            reportFile= new File(this.getServletConfig().getServletContext().getRealPath(
                    "/report/peopleInfoBydid.jasper"));
        }else if(d==null&&u!=null){
            reportFile= new File(this.getServletConfig().getServletContext().getRealPath(
                    "/report/peopleInfoByUid.jasper"));
        }else if(d!=null&&u!=null){
            reportFile= new File(this.getServletConfig().getServletContext().getRealPath(
                    "/report/peopleInfoByDUid.jasper"));
        }
        try{
            JasperReport jasperReport = (JasperReport) JRLoader
                    .loadObject(reportFile.getPath());

            ServletOutputStream ouputStream = response.getOutputStream();
            if (type.equals("html")) {

                response.setContentType("text/html");
                JasperPrint jasperPrint = JasperFillManager.fillReport(
                        jasperReport, parameters, connection);
                request.getSession().setAttribute(
                        ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE,
                        jasperPrint);

                // 输出html 用JRHtmlExporter
                JRHtmlExporter exporter = new JRHtmlExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
                // 设置报表图片的地址为"image?image="，因此要给image此地址安排一个servlet来输出图片，详细看web.xml文件。
                exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,
                        "image?image=");
                exporter.exportReport();


//out.clear();
//out=pageContext.pushBody();

            } else if (type.equals("excel")) {

                response.setContentType("application/vnd.ms-excel");

                JasperPrint jasperPrint = JasperFillManager.fillReport(
                        jasperReport, parameters, connection);
//ServletOutputStream ouputStream = response.getOutputStream();
                JRXlsExporter exporter = new JRXlsExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT,
                        jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
                        ouputStream);
                exporter.setParameter(
                        JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,
                        Boolean.TRUE);
                exporter.setParameter(
                        JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,
                        Boolean.FALSE);
                exporter.setParameter(
                        JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,
                        Boolean.FALSE);
                exporter.exportReport();
                ouputStream.flush();
                ouputStream.close();

            } else if (type.equals("pdf")) {
                byte[] bytes = JasperRunManager.runReportToPdf(
                        reportFile.getPath(), parameters, connection);
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outputStream = response.getOutputStream();
                outputStream.write(bytes, 0, bytes.length);
                outputStream.flush();
                outputStream.close();
            } else if (type.equals("word")) {
                response.setContentType("application/msword;charset=utf-8");
                JasperPrint jasperPrint = JasperFillManager.fillReport(
                        jasperReport, parameters, connection);
                ServletOutputStream outputStream = response.getOutputStream();
                JRExporter exporter = new JRRtfExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT,
                        jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
                        response.getOutputStream());
                exporter.exportReport();
                outputStream.flush();
                outputStream.close();

            }
        } catch (JRException ex){
            ex.printStackTrace();
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

}
