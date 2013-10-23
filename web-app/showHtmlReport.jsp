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
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <link rel="stylesheet" href="styles/head.css" type="text/css">
    <link href="styles/tundra.css"
          type="text/css" rel="stylesheet" />
    <link href="styles/standard1.css" media="screen"
          type="text/css" rel="stylesheet" />
    <link href="images/favicon.ico" rel="SHORTCUT ICON" />
    <link href="css/mymenu.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src='js/jquery-1.7.2.min.js'></script>
    <link rel="stylesheet" href="css/result.css">
    <link rel="stylesheet" href="styles/social-buttons.css">
    <% String path = request.getContextPath();
        String basePase = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
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
<div id="wrapper">
    <div style="width: 100%;height: 50px;margin-top: 0px">
        <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div style="width: 221px;float:left">
        <jsp:include page="leftusermenu.jsp"></jsp:include>
    </div>
    <div class="reportright">
        <div class="title">
            <span class="titlefont">点检表详情</span>
        </div>
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
        <div style="margin-left: 1015px;cursor: pointer;margin-top:2px;" ><input type="button" onclick="test1()" class="selectbtn" value="导出文件"></div>
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