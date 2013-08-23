
<%@ page import="inspect.InspectTagRfId" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'inspectTagRfId.label', default: 'InspectTagRfId')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inspectTagRfId" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

                <li><font size="4" color="white"><g:message code="default.list.label" args="[entityName]" /></font></li>
			</ul>
		</div>
		<div id="list-inspectTagRfId" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="name" title="${message(code: 'inspectTagRfId.name.label', default: 'Name')}" />

                        <g:sortableColumn property="description" title="${message(code: 'inspectTagRfId.description.label', default: 'Description')}" />

                        <g:sortableColumn property="numbers" title="${message(code: 'inspectTagRfId.numbers.label', default: 'Numbers')}" />

                        <g:sortableColumn property="createtime" title="${message(code: 'inspectTagRfId.createtime.label', default: 'Createtime')}" />
                        <th colspan="3">操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${inspectTagRfIdInstanceList}" status="i" var="inspectTagRfIdInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: inspectTagRfIdInstance, field: "name")}</td>

						<td>${fieldValue(bean: inspectTagRfIdInstance, field: "description")}</td>

						<td>${fieldValue(bean: inspectTagRfIdInstance, field: "numbers")}</td>

                        <td><g:link action="show" id="${inspectTagRfIdInstance.id}">${fieldValue(bean: inspectTagRfIdInstance, field: "createtime")}</g:link></td>
					
                        <td>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${inspectTagRfIdInstance?.id}" />
                                    <g:link class="edit" action="adminedit" id="${inspectTagRfIdInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="delete" action="admindelete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
                        </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inspectTagRfIdInstanceTotal}" />
                <div class="nav" role="navigation">
                    <ul>

                        <li><g:link class="create" action="admincreate"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</div>
		</div>
	</body>
</html>
