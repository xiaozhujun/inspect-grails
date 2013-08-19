
<%@ page import="inspect.InspectItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'inspectItem.label', default: 'InspectItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inspectItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

                <li><font size="4" color="white"><g:message code="default.list.label" args="[entityName]" /></font></li>
			</ul>
		</div>
		<div id="list-inspectItem" class="content scaffold-list" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="name" title="${message(code: 'inspectItem.name.label', default: 'Name')}" />

                        <g:sortableColumn property="description" title="${message(code: 'inspectItem.description.label', default: 'Description')}" />

                        <g:sortableColumn property="isInput" title="${message(code: 'inspectItem.isInput.label', default: 'Is Input')}" />

                       <g:sortableColumn property="numbers" title="${message(code: 'inspectItem.numbers.label', default: 'Numbers')}" />

						<g:sortableColumn property="createtime" title="${message(code: 'inspectItem.createtime.label', default: 'Createtime')}" />

                        <th><g:message code="inspectItem.inspecttable.label" default="Inspecttable" /></th>
					

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inspectItemInstanceList}" status="i" var="inspectItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: inspectItemInstance, field: "name")}</td>

                        <td>${fieldValue(bean: inspectItemInstance, field: "description")}</td>

                        <td>${fieldValue(bean: inspectItemInstance, field: "isInput")}</td>

                        <td>${fieldValue(bean: inspectItemInstance, field: "numbers")}</td>

						<td><g:link action="show" id="${inspectItemInstance.id}">${fieldValue(bean: inspectItemInstance, field: "createtime")}</g:link></td>

                        <td>${fieldValue(bean: inspectItemInstance, field: "inspecttable")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inspectItemInstanceTotal}" />
                <div class="nav" role="navigation">
                    <ul>

                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</div>
		</div>
	</body>
</html>
