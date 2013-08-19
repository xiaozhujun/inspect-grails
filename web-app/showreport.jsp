<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.engine.export.JRRtfExporter"%>
<%@page import="net.sf.jasperreports.engine.JRExporter"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>
<%@page
	import="net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page
	import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.JRExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRHtmlExporter"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
   
	<%
		String s = request.getParameter("stime");
		String e = request.getParameter("etime");
		String t = request.getParameter("tid");
		String ct = request.getParameter("ct");
		System.out.println(ct+"时间");
		String url = "jdbc:mysql://localhost:3306/inspect2";
		Class.forName("com.mysql.jdbc.Driver");
		Map parameters = new HashMap();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		format.setLenient(false);
		Timestamp ts = new Timestamp(format.parse(ct).getTime());
		long t1 = Long.parseLong(t);
		parameters.put("stime", ts);
		parameters.put("tid", t1);
		Connection connection = DriverManager.getConnection(url, "root",
				"root");

		String type = request.getParameter("type");
		File reportFile = new File(this.getServletConfig().getServletContext().getRealPath(
				"/report/inspectReport.jasper"));
		JasperReport jasperReport = (JasperReport) JRLoader
				.loadObject(reportFile.getPath());

		ServletOutputStream ouputStream = response.getOutputStream();
		if (type.equals("html")) {

			response.setContentType("text/html");
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					jasperReport, parameters, connection);
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
            out.clear();
            out=pageContext.pushBody();

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
	%>
</body>
</html>