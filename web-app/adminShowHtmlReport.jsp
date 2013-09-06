<%@ page import="com.csei.risk.ReportService" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-27
  Time: 上午7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="styles/report.css" type="text/css">
    <script type="text/javascript">
        function test1() {
            var x = document.getElementById("c").value;
            var type = document.getElementById("type").value;
            var stime = document.getElementById("s").value;
            var tid = document.getElementById("tid").value;
            var etime = document.getElementById("e").value;
            window.location.href = "showreport.jsp?type=" + type + "&stime="+ stime + "&tid=" + tid + "&etime=" + etime + "&ct=" + x;
        }
    </script>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div id="reportContent">
    <div id="reportLeft">
        <jsp:include page="leftmenu.jsp"></jsp:include>
    </div>
    <div id="reportRight">

        <%--<jsp:include page="reportHtml.jsp"></jsp:include>--%>
        <%
            String type=request.getParameter("type");
            String stime=request.getParameter("stime");
            String etime=request.getParameter("etime");
            String ct=request.getParameter("ct");
            String tid=request.getParameter("tid");
        %>
        <input type="hidden" value="<%=ct%>" id="c">
        <input type="hidden" value="<%=type%>" id="type">
        <input type="hidden" value="<%=stime%>" id="s">
        <input type="hidden" value="<%=tid%>" id="tid">
        <input type="hidden" value="<%=etime%>" id="e">
        <div style="margin-left: 940px;cursor: pointer; margin-top:2px;" class="tabItem"><a style="text-decoration: none;" href = "#" onclick="test1()">导出文件</a></div>
        <%
            String reportTemplate = this.getServletConfig().getServletContext().getRealPath(
                    "/report/report2.jasper");
            out.write(ReportService.exportRiskReport(reportTemplate, ct, tid, request.getServletContext().getRealPath("/report/") + "/"));
            out.flush();
        %>
    </div>
</div>
</body>
</html>