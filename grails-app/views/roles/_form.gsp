<%@ page import="inspect.Roles" %>
<meta name="layout" content="admin">

<div class="fieldcontain ${hasErrors(bean: rolesInstance, field: 'rolename', 'error')} ">
    <label for="rolename">
        <g:message code="roles.rolename.label" default="Rolename" />

    </label>
    <g:textField name="rolename" value="${rolesInstance?.rolename}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: rolesInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="roles.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${rolesInstance?.createtime}"  />
</div>





