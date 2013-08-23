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
<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="device.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="type" name="type.id" from="${inspect.DeviceType.list()}" optionKey="id" required="" value="${deviceInstance?.type?.id}" class="many-to-one"/>--}%
    <select id="type" name="type.id">
        <g:each in="${typelist}" var="p">
            <option  value="${p.typeid}">${p.typename}</option>

        </g:each>

    </select>
</div>

