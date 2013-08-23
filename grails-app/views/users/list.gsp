
<%@ page import="inspect.Users" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'users.label', default: 'Users')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-users" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

                <li><font size="4" color="white"><g:message code="default.list.label" args="[entityName]" /></font></li>
			</ul>
		</div>
		<div id="list-users" class="content scaffold-list" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="username" title="${message(code: 'users.username.label', default: 'Username')}" />

                        <g:sortableColumn property="userage" title="${message(code: 'users.userage.label', default: 'Userage')}" />

                        <g:sortableColumn property="userpwd" title="${message(code: 'users.userpwd.label', default: 'Userpwd')}" />

                        <g:sortableColumn property="useraddress" title="${message(code: 'users.useraddress.label', default: 'Useraddress')}" />

						<g:sortableColumn property="hascard" title="${message(code: 'users.hascard.label', default: 'Hascard')}" />
					

					
                       <th colspan="3">操作</th>
		             </tr>
				</thead>
				<tbody>
				<g:each in="${usersInstanceList}" status="i" var="usersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: usersInstance, field: "username")}</td>

                        <td>${fieldValue(bean: usersInstance, field: "userage")}</td>

                        <td>${fieldValue(bean: usersInstance, field: "userpwd")}</td>

                        <td>${fieldValue(bean: usersInstance, field: "useraddress")}</td>

						<td><g:link action="show" id="${usersInstance.id}">${fieldValue(bean: usersInstance, field: "hascard")}</g:link></td>
					

					

					

					

					


                        <td>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${usersInstance?.id}" />
                                    <g:link class="edit" action="edit" id="${usersInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
                        </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usersInstanceTotal}" />
                <div class="nav" role="navigation">
                    <ul>

                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</div>
		</div>
	</body>
</html>
