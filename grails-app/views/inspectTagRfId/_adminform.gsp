<%@ page import="inspect.InspectTagRfId" %>
<meta name="layout" content="admin">
<calendar:resources lang="zh" theme="tiger"/>
<div class="fieldcontain ${hasErrors(bean: inspectTagRfIdInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="inspectTagRfId.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${inspectTagRfIdInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTagRfIdInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="inspectTagRfId.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
    <calendar:datePicker name="createtime" defaultValue="${new Date()}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTagRfIdInstance, field: 'device', 'error')} required">
	<label for="device">
		<g:message code="inspectTagRfId.device.label" default="Device" />
		<span class="required-indicator">*</span>
	</label>
    <select id="device" name="device.id">
        <g:each in="${devlist}" var="p">
            <option  value="${p.deviceid}">${p.devname}</option>

        </g:each>

    </select>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTagRfIdInstance, field: 'numbers', 'error')} ">
	<label for="numbers">
		<g:message code="inspectTagRfId.numbers.label" default="Numbers" />
		
	</label>
	<g:textField name="numbers" value="${inspectTagRfIdInstance?.numbers}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectTagRfIdInstance, field: 'tagcag', 'error')} required">
	<label for="tagcag">
		<g:message code="inspectTagRfId.tagcag.label" default="Tagcag" />
		<span class="required-indicator">*</span>
	</label>
    <select id="tagcag" name="tagcag.id">
        <g:each in="${taglist}" var="p">
            <option  value="${p.tagid}">${p.tagname}</option>

        </g:each>

    </select>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTagRfIdInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="inspectTagRfId.description.label" default="Description" />

    </label>
    <g:textArea name="description" value="${inspectTagRfIdInstance?.description}" ></g:textArea>
</div>
