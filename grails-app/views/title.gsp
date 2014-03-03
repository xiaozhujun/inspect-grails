<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-11-9
  Time: 下午5:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>武钢450吨桥式起重机健康监测与预报可视化系统</title>
</head>
<body>
<div id='titleContainerDiv'>
    <div id="titleDiv">武钢450吨桥式起重机健康监测与预报可视化系统<span id="devNameDiv"></span></div>
</div>
<div id='mainHeadDiv'>
    <div id='headTab' class='tabs'>
        <div id="safetyMonitor" class='tabItem' onclick="location.href='/metallurgy/main.html?sys=safetyMonitor'">安全监控系统</div>
        <div id="mechannismForcast" class='tabItem'onclick="location.href='/metallurgy/main.html?sys=mechannismForcast'">机构健康监测</div>
        <div id="structForcast" class='tabItem ' onclick="location.href='/metallurgy/main.html?sys=structForcast'">结构健康监测</div>
        <div class='tabItem' onclick="location.href='/riskreport'">健康诊断预报</div>
        <div class='tabItem mainselected' onclick="location.href='/inspect'">智能点检维修</div>
        <div id="integrateManagement" class='tabItem' onclick="location.href='/metallurgy/main.html?sys=integrateManagement'">安全技术档案</div>
    </div>
</div>
</body>
</html>