<%@page import="com.springsource.roo.inspect.dao.InspectTableImpl"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="admin">
    <title>Insert title here</title>
    <style type="text/css">
    *{margin:0;padding:0;}
    a{text-decoration:none;}
    .btn_addPic{
        display: block;
        position: relative;
        width: 140px;
        height: 39px;
        overflow: hidden;
        border: 1px solid #EBEBEB;
        background: none repeat scroll 0 0 #F3F3F3;
        color: #999999;
        cursor: pointer;
        text-align: center;
    }
    .btn_addPic span{display: block;line-height: 39px;}
    .btn_addPic em {
        background:url(http://p7.qhimg.com/t014ce592c1a0b2d489.png) 0 0;
        display: inline-block;
        width: 18px;
        height: 18px;
        overflow: hidden;
        margin: 10px 5px 10px 0;
        line-height: 20em;
        vertical-align: middle;
    }
    .btn_addPic:hover em{background-position:-19px 0;}
    .filePrew {
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        width: 140px;
        height: 39px;
        font-size: 100px; /* 增大不同浏览器的可点击区域 */
        opacity: 0; /* 实现的关键点 */
        filter:alpha(opacity=0);/* 兼容IE */
    }
    </style>
</head>
<body>
<center>
    <h1>文件上传成功</h1>
    <!-- <form action="MultipartTestServlet" enctype="multipart/form-data" method="post">
    <a class="btn_addPic" href="javascript:void(0);">
    <span><em>+</em><font color="blank">配置文件上传</font></span> 
     <input type="file" name="myfile" class="filePrew" title="支持xml文件上传" tabindex="3" size="3"/><br/>
    </a>
     <input type="submit" value="上传"/>
    </form> -->


</center>
</body>
</html>