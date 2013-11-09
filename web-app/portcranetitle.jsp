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
    <div id="titleDiv">基于物联网的港口起重机智能点检系统<span id="devNameDiv"></span></div>
</div>
</body>
</html>