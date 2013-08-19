<%@ page import="inspect.InspectTable" %>
<meta name="layout" content="admin">
<div class="fieldcontain ${hasErrors(bean: inspectTableInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="inspectTable.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${inspectTableInstance?.createtime}"  />
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTableInstance, field: 'tname', 'error')} ">
	<label for="tname">
		<g:message code="inspectTable.tname.label" default="Tname" />
		
	</label>
	<g:textField name="tname" value="${inspectTableInstance?.tname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectTableInstance, field: 'trole', 'error')} required">
	<label for="trole">
		<g:message code="inspectTable.trole.label" default="Trole" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="trole" name="trole.id" from="${inspect.Roles.list()}" optionKey="id" required="" value="${inspectTableInstance?.trole?.id}" class="many-to-one"/>
</div>

