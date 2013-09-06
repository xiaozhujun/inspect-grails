
<%@ page import="inspect.Roles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'roles.label', default: 'Roles')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-roles" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

                <li><span class="btitle"><g:message code="default.list.label" args="[entityName]" /></span></li>
			</ul>
		</div>
		<div id="list-roles" class="content scaffold-list" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="rolename" title="${message(code: 'roles.rolename.label', default: 'Rolename')}" />

                            <g:sortableColumn property="createtime" title="${message(code: 'roles.createtime.label', default: 'Createtime')}" />
					
                         <th style="margin-left: 50px">操作</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${rolesInstanceList}" status="i" var="rolesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: rolesInstance, field: "rolename")}</td>

						<td><g:link action="show" id="${rolesInstance.id}">${fieldValue(bean: rolesInstance, field: "createtime")}</g:link></td>
					
                         <td>
                             <g:form>
                                 <fieldset class="buttons">
                                     <g:hiddenField name="id" value="${rolesInstance?.id}" />
                                     <g:link class="edit" action="edit" id="${rolesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                     <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                 </fieldset>
                             </g:form>
                         </td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${rolesInstanceTotal}" />
                <div class="nav" role="navigation">
                    <ul>

                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</div>
		</div>
	</body>
</html>
