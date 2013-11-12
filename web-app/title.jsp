<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-11-11
  Time: 下午7:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div id='titleContainerDiv'>
    <div id="titleDiv">港口起重机械健康监测与预报可视化系统<span id="devNameDiv"></span></div>
</div>
<div id='mainHeadDiv'>
    <div id='headTab' class='tabs'>
        <div class='tabItem' url="integrateManagement.html" onclick="location.href='/main.html?devName=门机#01'">安全技术档案</div>
        <div class='tabItem mainselected' onclick="location.href='/inspect'">港机智能点检</div>
        <div class='tabItem' onclick="location.href='/lubricate'">港机润滑管理</div>
        <div class='tabItem' onclick="location.href='/main.html?devName=门机#01'">机构健康监测</div>
        <div class='tabItem ' url="structForcast/health-forecast.html" onclick="location.href='/main.html?devName=门机#01'">结构健康监测</div>
        <div class='tabItem' url="electricalForcast/health-forecast.html" onclick="location.href='/main.html?devName=门机#01'">电气健康监测</div>
        <div class='tabItem' onclick="location.href='/riskreport/'">健康诊断预报</div>
        <div class='tabItem' url="risk-management.html" onclick="location.href='/main.html?devName=门机#01'">动态风险管理</div>
    </div>
</div>
</body>
</html>