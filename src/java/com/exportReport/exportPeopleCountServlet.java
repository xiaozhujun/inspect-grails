package com.exportReport;

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
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-16
 * Time: 下午9:11
 * To change this template use File | Settings | File Templates.
 */
public class exportPeopleCountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String day=request.getParameter("day");
        // 获得报表数据。这里使用ireport的测试数据。
        Long day1=Long.parseLong(day);
        String d=request.getParameter("did");
        String url = "jdbc:mysql://localhost:3306/inspect3";
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (ClassNotFoundException e1){
            e1.printStackTrace();
        }
        Map parameters = new HashMap();
        if(d==null){
            parameters.put("day", day1);
        }else{
            Long did=Long.parseLong(d);
            parameters.put("day", day1);
            parameters.put("devid", did);
        }
        Connection connection=null;
        try{
            connection= DriverManager.getConnection(url, "root", "root");
        }catch (SQLException e2){
            e2.printStackTrace();
        }
        File reportFile=null;
        String type = request.getParameter("type");
        if(d==null){
            System.out.print("hahah");
            reportFile= new File(this.getServletConfig().getServletContext().getRealPath(
                    "/report/peopleCount.jasper"));
        }else{
            System.out.print("进来了");
            reportFile= new File(this.getServletConfig().getServletContext().getRealPath(
                    "/report/peopleCount1.jasper"));
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
