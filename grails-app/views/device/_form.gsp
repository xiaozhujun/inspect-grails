<%@ page import="inspect.Device" %>
<meta name="layout" content="user">

<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'devname', 'error')} ">
    <label for="devname">
        <g:message code="device.devname.label" default="Devname" />

    </label>
    <g:textField name="devname" value="${deviceInstance?.devname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="device.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${deviceInstance?.description}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'numbers', 'error')} ">
	<label for="numbers">
		<g:message code="device.numbers.label" default="Numbers" />
		
	</label>
	<g:textField name="numbers" value="${deviceInstance?.numbers}"/>
</div>



