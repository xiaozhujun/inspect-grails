
<%@ page import="inspect.InspectItemRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspectItemRecord.label', default: 'InspectItemRecord')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inspectItemRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inspectItemRecord" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="createtime" title="${message(code: 'inspectItemRecord.createtime.label', default: 'Createtime')}" />
					
						<th><g:message code="inspectItemRecord.dnumber.label" default="Dnumber" /></th>
					
						<th><g:message code="inspectItemRecord.inspecttable.label" default="Inspecttable" /></th>
					
						<th><g:message code="inspectItemRecord.inspecttablerec.label" default="Inspecttablerec" /></th>
					
						<th><g:message code="inspectItemRecord.item.label" default="Item" /></th>
					
						<th><g:message code="inspectItemRecord.ivalue.label" default="Ivalue" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inspectItemRecordInstanceList}" status="i" var="inspectItemRecordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inspectItemRecordInstance.id}">${fieldValue(bean: inspectItemRecordInstance, field: "createtime")}</g:link></td>
					
						<td>${fieldValue(bean: inspectItemRecordInstance, field: "dnumber")}</td>
					
						<td>${fieldValue(bean: inspectItemRecordInstance, field: "inspecttable")}</td>
					
						<td>${fieldValue(bean: inspectItemRecordInstance, field: "inspecttablerec")}</td>
					
						<td>${fieldValue(bean: inspectItemRecordInstance, field: "item")}</td>
					
						<td>${fieldValue(bean: inspectItemRecordInstance, field: "ivalue")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inspectItemRecordInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
