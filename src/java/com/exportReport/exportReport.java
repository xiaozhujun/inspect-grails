package com.exportReport;

import model.MyDataSource;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.*;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;
import org.h2.value.ValueStringIgnoreCase;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-29
 * Time: 下午9:24
 * To change this template use File | Settings | File Templates.
 */
public class exportReport{
    private static MyDataSource ds=new MyDataSource();
    private static Connection connection=ds.getConnection();
    public void exportReport(String reportTemplate,String sql,HttpServletRequest request,HttpServletResponse response) throws JRException,IOException {
        PrintWriter out=response.getWriter();
        try{
        File reportFile = new File(reportTemplate);
        if (!reportFile.exists())
            throw new JRRuntimeException(
                    "File WebappReport.jasper not found. The report design must be compiled first.");
        JasperReport jasperReport = (JasperReport) JRLoader
                .loadObject(reportFile.getPath());
        Map parameters = new HashMap();
        parameters.put("sql",sql);
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
    }catch (JRException e) {
        e.printStackTrace();
        out.println("<html>");
        out.println("<head>");
        out.println("<body>");
        out.println("JasperReports encountered this error:<br/> "
                + e.getMessage());
        out.println("</body>");
        out.println("</html>");
    }
}
    public void exportReportHasSubreport(String reportTemplate,String sql,String path,HttpServletRequest request,HttpServletResponse response) throws JRException,IOException {
        PrintWriter out=response.getWriter();
        try{
           /* File reportFile = new File(this.getServletContext().getRealPath(
                    "/report/deviceCount.jasper"));*/
            File reportFile = new File(reportTemplate);
            if (!reportFile.exists())
                throw new JRRuntimeException(
                        "File WebappReport.jasper not found. The report design must be compiled first.");
            JasperReport jasperReport = (JasperReport) JRLoader
                    .loadObject(reportFile.getPath());
            Map parameters = new HashMap();
            parameters.put("sql",sql);
            parameters.put("SUBREPORT_DIR",path);
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
        }catch (JRException e) {
            e.printStackTrace();
            out.println("<html>");
            out.println("<head>");
            out.println("<body>");
            out.println("JasperReports encountered this error:<br/> "
                    + e.getMessage());
            out.println("</body>");
            out.println("</html>");
        }
    }
     public void exportReportByType(String reportTemport,String sql,String type,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Map parameters = new HashMap();
        parameters.put("sql",sql);
        File reportFile=null;
        PrintWriter out=response.getWriter();
        reportFile= new File(reportTemport);
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
                        out);
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
    public void exportReportHasSubreportByType(String reportTemport,String sql,String type,String path,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Map parameters = new HashMap();
        parameters.put("sql",sql);
        parameters.put("SUBREPORT_DIR",path);
        File reportFile=null;
        PrintWriter out=response.getWriter();
        reportFile= new File(reportTemport);
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
                JRHtmlExporter exporter = new JRHtmlExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
                // 设置报表图片的地址为"image?image="，因此要给image此地址安排一个servlet来输出图片，详细看web.xml文件。
                exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,
                        "image?image=");
                exporter.exportReport();
            } else if (type.equals("excel")) {
                response.setContentType("application/vnd.ms-excel");
                JasperPrint jasperPrint = JasperFillManager.fillReport(
                        jasperReport, parameters, connection);
                JRXlsExporter exporter = new JRXlsExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT,
                        jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
                        out);
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
    public static String exportRiskReport(String reportTemplate,String sql,String path) throws JRException {
        File reportFile = new File(reportTemplate);
        Map parameters = new HashMap();
        parameters.put("sql",sql);
        parameters.put("SUBREPORT_DIR",path);
        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile.getPath());
        Map map=new HashMap();
        OutputStream outputStream = new ByteArrayOutputStream();
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters,connection );
        JRHtmlExporter exporter = new JRHtmlExporter();
        exporter.setParameter(
                JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN,
                Boolean.FALSE);
        exporter.setParameter(JRExporterParameter.JASPER_PRINT,
                jasperPrint);
        exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,
                "UTF-8");
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
                outputStream);
        exporter.exportReport();
        String result =  outputStream.toString();
        return result;
    }
    public java.sql.Date executeDateFormat(String t1){
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date t=null;
        try{
           Date st=format.parse(t1);
           t=new java.sql.Date(st.getTime());
        }catch (ParseException e){
            e.printStackTrace();
        }
        return t;
    }
}
