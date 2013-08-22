
<%@ page import="inspect.DeviceType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deviceType.label', default: 'DeviceType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-deviceType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-deviceType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'deviceType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="typename" title="${message(code: 'deviceType.typename.label', default: 'Typename')}" />
					
						<g:sortableColumn property="typenumber" title="${message(code: 'deviceType.typenumber.label', default: 'Typenumber')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${deviceTypeInstanceList}" status="i" var="deviceTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${deviceTypeInstance.id}">${fieldValue(bean: deviceTypeInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: deviceTypeInstance, field: "typename")}</td>
					
						<td>${fieldValue(bean: deviceTypeInstance, field: "typenumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${deviceTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
