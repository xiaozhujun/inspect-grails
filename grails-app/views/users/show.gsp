
<%@ page import="inspect.Users" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'users.label', default: 'Users')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-users" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-users" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list users">

                <g:if test="${usersInstance?.username}">
                    <li class="fieldcontain">
                        <span id="username-label" class="property-label"><g:message code="users.username.label" default="Username" /></span>

                        <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usersInstance}" field="username"/></span>

                    </li>
                </g:if>
                <g:if test="${usersInstance?.userpwd}">
                    <li class="fieldcontain">
                        <span id="userpwd-label" class="property-label"><g:message code="users.userpwd.label" default="Userpwd" /></span>

                        <span class="property-value" aria-labelledby="userpwd-label"><g:fieldValue bean="${usersInstance}" field="userpwd"/></span>

                    </li>
                </g:if>
                <g:if test="${usersInstance?.userage}">
                    <li class="fieldcontain">
                        <span id="userage-label" class="property-label"><g:message code="users.userage.label" default="Userage" /></span>

                        <span class="property-value" aria-labelledby="userage-label"><g:fieldValue bean="${usersInstance}" field="userage"/></span>

                    </li>
                </g:if>
                <g:if test="${usersInstance?.usersex}">
                    <li class="fieldcontain">
                        <span id="usersex-label" class="property-label"><g:message code="users.usersex.label" default="Usersex" /></span>

                        <span class="property-value" aria-labelledby="usersex-label"><g:fieldValue bean="${usersInstance}" field="usersex"/></span>

                    </li>
                </g:if>
				<g:if test="${usersInstance?.hascard}">
				<li class="fieldcontain">
					<span id="hascard-label" class="property-label"><g:message code="users.hascard.label" default="Hascard" /></span>
					
						<span class="property-value" aria-labelledby="hascard-label"><g:fieldValue bean="${usersInstance}" field="hascard"/></span>
					
				</li>
				</g:if>

				%{--<g:if test="${usersInstance?.itemrecord}">
				<li class="fieldcontain">
					<span id="itemrecord-label" class="property-label"><g:message code="users.itemrecord.label" default="Itemrecord" /></span>

						<g:each in="${usersInstance.itemrecord}" var="i">
						<span class="property-value" aria-labelledby="itemrecord-label"><g:link controller="inspectItemRecord" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${usersInstance?.tablerecord}">
				<li class="fieldcontain">
					<span id="tablerecord-label" class="property-label"><g:message code="users.tablerecord.label" default="Tablerecord" /></span>

						<g:each in="${usersInstance.tablerecord}" var="t">
						<span class="property-value" aria-labelledby="tablerecord-label"><g:link controller="inspectTableRecord" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>--}%
			
				<g:if test="${usersInstance?.urole}">
				<li class="fieldcontain">
					<span id="urole-label" class="property-label"><g:message code="users.urole.label" default="Urole" /></span>

						%{--<span class="property-value" aria-labelledby="urole-label"><g:link controller="roles" action="show" id="${usersInstance?.urole?.id}">${usersInstance?.urole?.encodeAsHTML()}</g:link></span>--}%
                    <span class="property-value" aria-labelledby="urole-label">%{--<g:link controller="roles" action="show" id="${usersInstance?.urole?.id}">--}%${rolename}%{--</g:link>--}%</span>


				</li>
				</g:if>
               %{--<g:if test="${rolename}">
                   所属人员类型:${rolename}
               </g:if>--}%
                <g:if test="${usersInstance?.useraddress}">
				<li class="fieldcontain">
					<span id="useraddress-label" class="property-label"><g:message code="users.useraddress.label" default="Useraddress" /></span>
					
						<span class="property-value" aria-labelledby="useraddress-label"><g:fieldValue bean="${usersInstance}" field="useraddress"/></span>
					
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usersInstance?.id}" />
					<g:link class="edit" action="edit" id="${usersInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
