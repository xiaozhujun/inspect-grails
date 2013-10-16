package com.exportReport;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-16
 * Time: 下午6:13
 * To change this template use File | Settings | File Templates.
 */
public class exportReportServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String s = request.getParameter("stime");
String e = request.getParameter("etime");
String t = request.getParameter("tid");
String ct = request.getParameter("ct");
System.out.println(ct+"时间");
String url = "jdbc:mysql://localhost:3306/inspect3";
try{
        Class.forName("com.mysql.jdbc.Driver");
}catch (ClassNotFoundException e1){
        e1.printStackTrace();
}
        Map parameters = new HashMap();
DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
format.setLenient(false);
Timestamp ts=null;
try{
        ts = new Timestamp(format.parse(ct).getTime());
}catch (ParseException ee){
        ee.printStackTrace();
}
        long t1 = Long.parseLong(t);
parameters.put("stime", ts);
parameters.put("tid", t1);
parameters.put("SUBREPORT_DIR",request.getServletContext().getRealPath("/report/") + "/");
Connection connection=null;
try{
        connection= DriverManager.getConnection(url, "root","root");
}catch (SQLException e2){
        e2.printStackTrace();
}
        String type = request.getParameter("type");
File reportFile = new File(this.getServletConfig().getServletContext().getRealPath(
        "/report/report2.jasper"));
try{
    JasperReport jasperReport = (JasperReport) JRLoader
            .loadObject(reportFile.getPath());

ServletOutputStream ouputStream = response.getOutputStream();
if (type.equals("html")) {

        response.setContentType("text/html");
JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
JRHtmlExporter exporter = new JRHtmlExporter();
exporter.setParameter(
        JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN,
        Boolean.FALSE);
exporter.setParameter(JRExporterParameter.JASPER_PRINT,
        jasperPrint);
exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,
        "UTF-8");
exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
        ouputStream);

exporter.exportReport();

ouputStream.flush();
ouputStream.close();
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
