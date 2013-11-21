<%@ page import="inspect.Users" %>
<meta name="layout" content="admin">
<script type="text/javascript" src="${resource(dir: 'js',file: 'jquery-1.4.2.js')}"></script>
<script>
    $(document).ready(function(){
        $("#yes").click(function(){
            $("#no").removeAttr("checked");
        });
        $("#no").click(function(){
            $("#yes").removeAttr("checked");
        });
        $("#male").click(function(){
            $("#female").removeAttr("checked");
        });
        $("#female").click(function(){
            $("#male").removeAttr("checked");
        });
    });
</script>
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
    %{--<g:textField name="userpwd" value="${usersInstance?.userpwd}"/>--}%
    <g:passwordField name="userpwd"  value="${usersInstance?.userpwd}" required=""></g:passwordField>
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
    <input type="checkbox" name="usersex" value="男" checked id="male">男        <input type="checkbox" name="usersex" value="女" id="female">女
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'hascard', 'error')} ">
	<label for="hascard">
		<g:message code="users.hascard.label" default="Hascard" />
		
	</label>
    <input type="checkbox" name="hascard" value="是" id="yes">是           <input type="checkbox" name="hascard" value="否" checked id="no">否
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








