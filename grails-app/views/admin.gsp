<%--
  Created by IntelliJ IDEA.
  User: xiaozhujun
  Date: 13-8-14
  Time: 下午4:07
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>管理员</title>
  <meta name="layout" content="admin">
    <style>
    #t1{

        width: 1108px;
        height: 121px;
        float: left;
    }
    #title{
        background-color: #999999;
        width:1108px;
        height: 29px;
        float: left;
    }           a
        #title:hover{
                    background-color:#DFE9F6 ;
                }
    p{
        margin-left: 8px;
        margin-top: 2px;
    }
    </style>
</head>
<body>
<% grailsApplication.config.grails.sitemesh.default.layout = "admin" %>
<div id="t1">
    <div id="title"><p>欢迎您使用智能点检功能！</p></div>
    <div id="content">
        <font size="5" style="margin-left: 8px">欢迎来到 起重机点检系统 </font>
        <br>
        <br>
        <span style="margin-left: 10px">本智能点检系统提供了对特种设备——起重机的相关的点检智能管理功能，系统包含了对报表，人员类型，人员，点检表，标签等的管理，可以实现对点检的数据进行智能的管理。</span>
      </div>
</div>

</body>
</html>