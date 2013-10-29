<%@page import="com.csei.risk.ReportService"%>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--本jsp在于展示利用devname和days搜索人员点检异常总数统计 -->
<%
String d=request.getParameter("did");
Long did=Long.parseLong(d);
    String stime=request.getParameter("stime");
    String endtime=request.getParameter("etime");
    DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    Date st=format.parse(stime);
    Date et=format.parse(endtime);
String reportTemplate = this.getServletContext().getRealPath(
        "/report/peopleCount1.jasper");

out.write(ReportService.exportPeopleCountByDidDays(reportTemplate, did, st, et, this.getServletContext().getRealPath("/report/") + "/"));
out.flush();
%>
</body>
</html>