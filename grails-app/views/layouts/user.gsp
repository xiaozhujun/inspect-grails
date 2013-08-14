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

    <g:layoutHead/>
    <r:layoutResources />
</head>
<body>
<div id="wrapper">
    <div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
    <div id="container">
        <div id="menuContainer">
            <div class="menuFunc">
                <div class="menuFuncName">历史记录管理</div>
                <div class="menuItemList">
                    <div class="menuItem">报表查询</div>
                    <div class="menuItem">点检上传</div>
                </div>
            </div>
            <div class="menuFunc">
                <div class="menuFuncName">点检管理</div>
                <div class="menuItemList">
                    <div class="menuItem">添加员工</div>
                    <div class="menuItem">员工列表</div>
                </div>
            </div>
            <div class="menuFunc">
                <div class="menuFuncName">项目管理</div>
                <div class="menuItemList">
                    <div class="menuItem">添加标签</div>
                    <div class="menuItem">添加设备</div>
                    <div class="menuItem">标签列表</div>
                    <div class="menuItem">设备列表</div>
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
