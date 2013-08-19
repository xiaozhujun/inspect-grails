<%@ page import="inspect.InspectTableRecord" %>



<div class="fieldcontain ${hasErrors(bean: inspectTableRecordInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="inspectTableRecord.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${inspectTableRecordInstance?.createtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inspectTableRecordInstance, field: 'faultcount', 'error')} required">
	<label for="faultcount">
		<g:message code="inspectTableRecord.faultcount.label" default="Faultcount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="faultcount" type="number" value="${inspectTableRecordInstance.faultcount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectTableRecordInstance, field: 'inspecttable', 'error')} required">
	<label for="inspecttable">
		<g:message code="inspectTableRecord.inspecttable.label" default="Inspecttable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="inspecttable" name="inspecttable.id" from="${inspect.InspectTable.list()}" optionKey="id" required="" value="${inspectTableRecordInstance?.inspecttable?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectTableRecordInstance, field: 'itemrecord', 'error')} ">
	<label for="itemrecord">
		<g:message code="inspectTableRecord.itemrecord.label" default="Itemrecord" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${inspectTableRecordInstance?.itemrecord?}" var="i">
    <li><g:link controller="inspectItemRecord" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="inspectItemRecord" action="create" params="['inspectTableRecord.id': inspectTableRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'inspectItemRecord.label', default: 'InspectItemRecord')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: inspectTableRecordInstance, field: 'worker', 'error')} required">
	<label for="worker">
		<g:message code="inspectTableRecord.worker.label" default="Worker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="worker" name="worker.id" from="${inspect.Users.list()}" optionKey="id" required="" value="${inspectTableRecordInstance?.worker?.id}" class="many-to-one"/>
</div>

