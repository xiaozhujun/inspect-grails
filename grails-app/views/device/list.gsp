
<%@ page import="inspect.Device" %>
<!DOCTYPE html>
<html>
	<head>
        <meta name="layout" content="${grailsApplication.config.grails.sitemesh.default.layout}">
		<g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-device" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-device" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="createTime" title="${message(code: 'device.createTime.label', default: 'Create Time')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'device.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'device.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="num" title="${message(code: 'device.num.label', default: 'Num')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'device.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${deviceInstanceList}" status="i" var="deviceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${deviceInstance.id}">${fieldValue(bean: deviceInstance, field: "createTime")}</g:link></td>
					
						<td>${fieldValue(bean: deviceInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: deviceInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: deviceInstance, field: "num")}</td>
					
						<td>${fieldValue(bean: deviceInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${deviceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
