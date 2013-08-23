<%@ page import="inspect.DeviceType" %>
<meta name="layout" content="admin">

<div class="fieldcontain ${hasErrors(bean: deviceTypeInstance, field: 'typename', 'error')} ">
    <label for="typename">
        <g:message code="deviceType.typename.label" default="Typename" />

    </label>
    <g:textField name="typename" value="${deviceTypeInstance?.typename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deviceTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="deviceType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${deviceTypeInstance?.description}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: deviceTypeInstance, field: 'typenumber', 'error')} ">
	<label for="typenumber">
		<g:message code="deviceType.typenumber.label" default="Typenumber" />
		
	</label>
	<g:textField name="typenumber" value="${deviceTypeInstance?.typenumber}"/>
</div>

