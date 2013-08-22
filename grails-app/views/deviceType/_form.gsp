<%@ page import="inspect.DeviceType" %>



<div class="fieldcontain ${hasErrors(bean: deviceTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="deviceType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${deviceTypeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deviceTypeInstance, field: 'devices', 'error')} ">
	<label for="devices">
		<g:message code="deviceType.devices.label" default="Devices" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${deviceTypeInstance?.devices?}" var="d">
    <li><g:link controller="device" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="device" action="create" params="['deviceType.id': deviceTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'device.label', default: 'Device')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: deviceTypeInstance, field: 'typename', 'error')} ">
	<label for="typename">
		<g:message code="deviceType.typename.label" default="Typename" />
		
	</label>
	<g:textField name="typename" value="${deviceTypeInstance?.typename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deviceTypeInstance, field: 'typenumber', 'error')} ">
	<label for="typenumber">
		<g:message code="deviceType.typenumber.label" default="Typenumber" />
		
	</label>
	<g:textField name="typenumber" value="${deviceTypeInstance?.typenumber}"/>
</div>

