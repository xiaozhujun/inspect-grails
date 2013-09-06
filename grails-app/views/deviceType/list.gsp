
<%@ page import="inspect.DeviceType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'deviceType.label', default: 'DeviceType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-deviceType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                <li><span class="btitle"><g:message code="default.list.label" args="[entityName]" /></span></li>
			</ul>
		</div>
		<div id="list-deviceType" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="typename" title="${message(code: 'deviceType.typename.label', default: 'Typename')}" />

						<g:sortableColumn property="description" title="${message(code: 'deviceType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="typenumber" title="${message(code: 'deviceType.typenumber.label', default: 'Typenumber')}" />
					     <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${deviceTypeInstanceList}" status="i" var="deviceTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: deviceTypeInstance, field: "typename")}</td>

						<td><g:link action="show" id="${deviceTypeInstance.id}">${fieldValue(bean: deviceTypeInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: deviceTypeInstance, field: "typenumber")}</td>
					     <td>
                             <g:form>
                                 <fieldset class="buttons">
                                     <g:hiddenField name="id" value="${deviceTypeInstance?.id}" />
                                     <g:link class="edit" action="edit" id="${deviceTypeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                     <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                 </fieldset>
                             </g:form>
					     </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${deviceTypeInstanceTotal}" />
                <div class="nav" role="navigation">
                    <ul>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</div>
		</div>
	</body>
</html>
