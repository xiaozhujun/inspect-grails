<%@ page import="inspect.Device" %>
<meta name="layout" content="admin">

<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'devname', 'error')} ">
    <label for="devname">
        <g:message code="device.devname.label" default="Devname" />

    </label>
    <g:textField name="devname" value="${deviceInstance?.devname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'numbers', 'error')} ">
	<label for="numbers">
		<g:message code="device.numbers.label" default="Numbers" />
		
	</label>
	<g:textField name="numbers" value="${deviceInstance?.numbers}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'type', 'error')} required">
    <label for="type">
        <g:message code="device.type.label" default="Type" />
        <span class="required-indicator">*</span>
    </label>
    <select id="type" name="type.id">
        <g:each in="${typelist}" var="p">
            <option  value="${p.typeid}">${p.typename}</option>

        </g:each>

    </select>
</div>
<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="device.description.label" default="Description" />

    </label>
    <g:textArea name="description" value="${deviceInstance?.description}"></g:textArea>
</div>

