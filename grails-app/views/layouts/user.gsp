<%@ page import="org.codehaus.groovy.grails.commons.GrailsClassUtils" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户管理-<g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'layout.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'menu.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'styles',file:'head.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'styles',file:'standard1.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'css',file:'mymenu.css')}" type="text/css">
    <script type="text/javascript" src='${resource(dir: 'js',file: 'jquery-1.4.2.js')}'></script>
    <g:layoutHead/>
    <r:layoutResources />
    <script>
        $(document).ready(function(){
            $(".deviceCount").click(function(){
                $("#mainContainer").load("../deviceCount.jsp");
            })
        })
    </script>
</head>
<body>
<div id="wrapper">
    <g:include action="title" controller="device"></g:include>
    <div id="container">
        <div id="menuContainer">
            <div class="menuFunc">
                <div class="menuFuncName"><p>历史记录管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem"><span id="d1"><g:link url="/inspect/userqueryresult.jsp">报表查询</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'userupload',controller:'device']">点检上传</g:link></span></div>

                </div>
            </div>
            <div class="menuFunc">
                <div class="menuFuncName"><p>点检管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem" ><span id="d1"><g:link url="[action:'create',controller:'users']">添加员工</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'list',controller:'users']">员工列表</g:link></span></div>
                </div>
            </div>
            <div class="menuFunc">
                <div class="menuFuncName"><p>项目管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem"><span id="d1"><g:link url="[action:'create',controller:'inspectTagRfId']">添加标签</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'create',controller:'device']">添加设备</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'list',controller:'inspectTagRfId']">标签列表</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'list',controller:'device']">设备列表</g:link></span></div>
                </div>
            </div>
            <div class="menuFunc">
                <div class="menuFuncName"><p>报表统计</p></div>
                <div class="menuItemList">
                    <div class="menuItem"><span id="d1"><g:link url="/inspect/deviceCount.jsp">设备异常总数</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="/inspect/deviceInfo.jsp">设备异常明细</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="/inspect/peopleCount.jsp">人员点检异常总数</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="/inspect/peopleInfo.jsp">人员点检异常明细</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="/inspect/deviceHistory.jsp">设备异常趋势分析</g:link></span></div>
                </div>
            </div>
        </div>
        <div id="mainContainer"><g:layoutBody/></div>
    </div>

    <div class="footer" role="contentinfo"></div>
    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    <g:javascript library="application"/>
    <r:layoutResources />
</div>
</body>
</html>
