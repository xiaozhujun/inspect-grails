<%@ page import="inspect.Device" %>



<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'createTime', 'error')} required">
	<label for="createTime">
		<g:message code="device.createTime.label" default="Create Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createTime" precision="day"  value="${deviceInstance?.createTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="device.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${deviceInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="device.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${deviceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'num', 'error')} ">
	<label for="num">
		<g:message code="device.num.label" default="Num" />
		
	</label>
	<g:textField name="num" value="${deviceInstance?.num}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="device.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${deviceInstance?.type}"/>
</div>

