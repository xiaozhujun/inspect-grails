<%@ page import="com.exportReport.exportReport" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
            window.location.href = "showReportServlet?type=" + type + "&stime="+ stime + "&tid=" + tid + "&etime=" + etime + "&ct=" + x;
        }
    </script>
</head>
<body>
<div id="wrapper">
    <div style="width: 100%;height: 50px;margin-top: 0px">
        <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div style="width: 221px;float:left">
        <jsp:include page="leftmenu.jsp"></jsp:include>
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
            long t1 = Long.parseLong(tid);
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            format.setLenient(false);
            Timestamp ts = null;
            try {
                ts = new Timestamp(format.parse(ct).getTime());
            } catch (ParseException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
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
            String sql="select tb.`id`,tb.`tname`,tag.`id` as tagid,tag.`name` as tagname, u.`id`, u.`username`, itr.`createtime`," +
                    "d.numbers from`inspect_item_rec` itr,`inspect_table_record` tr,inspect_tag   tag,`inspect_item` it,`inspect_Table` tb,device d,`users` u " +
                    "where itr.createtime = tr.createtime and itr.inspecttable_id= tb.id  and itr.tag_id = tag.id and itr.worker_id = u.id and itr.dnumber_id=d.id" +
                    " and itr.inspecttable_id ="+t1+" and itr.createtime ='"+ts+"' group by tag.name";
            exportReport d=new exportReport();
            String path1=this.getServletContext().getRealPath("/report/") + "/";
            out.write(d.exportRiskReport(reportTemplate,sql, path1));
            out.flush();
        %>
    </div>
</div>





</body>
</html>