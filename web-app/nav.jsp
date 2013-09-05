<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <% String path = request.getContextPath();
        String basePase = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<link rel="stylesheet" href="styles/head.css" type="text/css">
<script type="text/javascript" src='js/jquery-1.7.2.min.js'></script>
<link href="<%=basePase%>css/mymenu.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>

</head>
<body>
<div id='titleContainerDiv'>
        <div id="titleDiv">港口起重机械健康监测与预报可视化系统<span id="devNameDiv"></span></div>
    </div>
    <div id='mainHeadDiv'>
    	<div id='headTab' class='tabs'>
            <div class='tabItem' url="integrateManagement.html">港机信息可视化</div>
            <div class='tabItem' onclick="location.href='/inspect'">港机智能点检</div>
            <div class='tabItem'>港机润滑管理</div>
            <div class='tabItem mainselected' url="mechanismForcast/health-forecast.html">机构健康监测</div>
            <div class='tabItem ' url="structForcast/health-forecast.html">结构健康监测</div>
            <div class='tabItem' url="electricalForcast/health-forecast.html">电气健康监测</div>
            <div class='tabItem' onclick="location.href='/riskreport/'">健康诊断预报</div>
            <div class='tabItem' url="risk-management.html">动态风险评估</div>
		 </div>
  	</div>
</body>
</html>