<%@page import="com.csei.risk.ReportService"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.io.File" %>
<%@ page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@ page import="net.sf.jasperreports.j2ee.servlets.ImageServlet" %>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporter" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter" %>
<%@ page import="com.cesi.db.insertDB" %>
<%@ page import="com.cesi.db.dbModel" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Insert title here</title>
</head>
<body>
<%
/*String day=request.getParameter("day");
out.println(day);
out.println("这是showHtmlDeviceHistory");
String reportTemplate = this.getServletConfig().getServletContext().getRealPath(
        "/report/deviceHistory.jasper");
out.write(ReportService.exportdeviceAbnormalCount(reportTemplate, Long.parseLong(day)));
out.flush();*/
    try {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //String day=request.getParameter("day");
        // 获得报表数据。这里使用ireport的测试数据。
        //Long day1=Long.parseLong(day);
        String did=request.getParameter("did");
        String stime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        Long d=Long.parseLong(did);
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Date st=format.parse(stime);
        Date et=format.parse(endtime);
        @SuppressWarnings("static-access")
        String url = "jdbc:mysql://localhost:3306/inspect3";
        Connection connection=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        try{
            connection = DriverManager.getConnection(url, "root", "root");
        }catch (SQLException e){
            e.printStackTrace();
        }
        // 载入报表模板，一定要指对路径和文件名
        File reportFile = new File(this.getServletContext().getRealPath(
                "/report/deviceHistory1.jasper"));

        if (!reportFile.exists())
            throw new JRRuntimeException(
                    "File WebappReport.jasper not found. The report design must be compiled first.");

        JasperReport jasperReport = (JasperReport) JRLoader
                .loadObject(reportFile.getPath());

        // 导入报表数据，并生成报表
        Map parameters = new HashMap();
        parameters.put("devid", d);
        parameters.put("starttime",st);
        parameters.put("endtime",et);
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


%>
</body>
</html>