<%@ page import="inspect.Users" %>
<meta name="layout" content="admin">

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'username', 'error')} ">
    <label for="username">
        <g:message code="users.username.label" default="Username" />

    </label>
    <g:textField name="username" value="${usersInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'userpwd', 'error')} ">
    <label for="userpwd">
        <g:message code="users.userpwd.label" default="Userpwd" />

    </label>
    <g:textField name="userpwd" value="${usersInstance?.userpwd}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'userage', 'error')} required">
    <label for="userage">
        <g:message code="users.userage.label" default="Userage" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="userage" type="number" value="${usersInstance.userage}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'usersex', 'error')} ">
    <label for="usersex">
        <g:message code="users.usersex.label" default="Usersex" />

    </label>
    <g:textField name="usersex" value="${usersInstance?.usersex}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'hascard', 'error')} ">
	<label for="hascard">
		<g:message code="users.hascard.label" default="Hascard" />
		
	</label>
	<g:textField name="hascard" value="${usersInstance?.hascard}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'urole', 'error')} required">
	<label for="urole">
		<g:message code="users.urole.label" default="Urole" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="urole" name="urole.id" from="${inspect.Roles.list()}" optionKey="id" required="" value="${usersInstance?.urole?.id}" class="many-to-one"/>--}%
    <select id="urole" name="urole.id">
        <g:each in="${plist}" var="p">
            <option  value="${p.rid}">${p.rolename}</option>

        </g:each>

    </select>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'useraddress', 'error')} ">
	<label for="useraddress">
		<g:message code="users.useraddress.label" default="Useraddress" />
		
	</label>
	<g:textField name="useraddress" value="${usersInstance?.useraddress}"/>
</div>








