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
    <title>管理员管理-<g:layoutTitle default="Grails"/></title>
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
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <g:set var="menuFuncName" value="${GrailsClassUtils.getStaticPropertyValue(c.clazz, "menuName")}"/>
                <g:if test="${menuFuncName!=null && menuFuncName!=""}">
                    <div class="menuFunc">
                        <div class="menuFuncName">${menuFuncName}</div>
                        <g:set var="menuItems" value="${GrailsClassUtils.getStaticPropertyValue(c.clazz, "menuItems")}"/>
                        <g:set var="menuActions" value="${GrailsClassUtils.getStaticPropertyValue(c.clazz, "menuActions")}"/>
                        <div class="menuItemList">
                            <g:each var="menuItem" in="${menuItems}">
                                <div class="menuItem"><g:link controller="${c.logicalPropertyName}" action="${menuActions[menuItems.indexOf(menuItem)]}">${menuItem}</g:link></div>
                            </g:each>
                        </div>
                    </div>
                </g:if>
            </g:each>
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
