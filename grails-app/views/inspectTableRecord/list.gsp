
<%@ page import="inspect.InspectTableRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspectTableRecord.label', default: 'InspectTableRecord')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inspectTableRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inspectTableRecord" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="createtime" title="${message(code: 'inspectTableRecord.createtime.label', default: 'Createtime')}" />
					
						<g:sortableColumn property="faultcount" title="${message(code: 'inspectTableRecord.faultcount.label', default: 'Faultcount')}" />
					
						<th><g:message code="inspectTableRecord.inspecttable.label" default="Inspecttable" /></th>
					
						<th><g:message code="inspectTableRecord.worker.label" default="Worker" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inspectTableRecordInstanceList}" status="i" var="inspectTableRecordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inspectTableRecordInstance.id}">${fieldValue(bean: inspectTableRecordInstance, field: "createtime")}</g:link></td>
					
						<td>${fieldValue(bean: inspectTableRecordInstance, field: "faultcount")}</td>
					
						<td>${fieldValue(bean: inspectTableRecordInstance, field: "inspecttable")}</td>
					
						<td>${fieldValue(bean: inspectTableRecordInstance, field: "worker")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inspectTableRecordInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
