<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@ page import="net.sf.jasperreports.j2ee.servlets.ImageServlet" %>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporter" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter" %>
<%@ page import="model.MyDataSource" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-10-12
  Time: 下午9:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%--本jsp主要在于展示输入一定的天数后的人员点检明细--%>
<%
    try {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String devid=request.getParameter("devid");
        String day=request.getParameter("day");
        String user=request.getParameter("uid");
        // 获得报表数据。这里使用ireport的测试数据。
        Long day1=Long.parseLong(day);
        Long did=Long.parseLong(devid);
        Long uid=Long.parseLong(user);
        MyDataSource ds=new MyDataSource();
        Connection connection=ds.getConnection();


        // 载入报表模板，一定要指对路径和文件名
        File reportFile = new File(this.getServletContext().getRealPath(
                "/report/peopleInfoByDUid.jasper"));

        if (!reportFile.exists())
            throw new JRRuntimeException(
                    "File WebappReport.jasper not found. The report design must be compiled first.");

        JasperReport jasperReport = (JasperReport) JRLoader
                .loadObject(reportFile.getPath());

        // 导入报表数据，并生成报表
        Map parameters = new HashMap();
        parameters.put("day", day1);
        parameters.put("did", did);
        parameters.put("uid",uid);
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
    }

    catch (JRException e) {
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