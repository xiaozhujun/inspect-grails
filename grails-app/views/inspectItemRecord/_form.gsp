<%@ page import="inspect.InspectItemRecord" %>



<div class="fieldcontain ${hasErrors(bean: inspectItemRecordInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="inspectItemRecord.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${inspectItemRecordInstance?.createtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecordInstance, field: 'dnumber', 'error')} required">
	<label for="dnumber">
		<g:message code="inspectItemRecord.dnumber.label" default="Dnumber" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dnumber" name="dnumber.id" from="${inspect.Device.list()}" optionKey="id" required="" value="${inspectItemRecordInstance?.dnumber?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecordInstance, field: 'inspecttable', 'error')} required">
	<label for="inspecttable">
		<g:message code="inspectItemRecord.inspecttable.label" default="Inspecttable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="inspecttable" name="inspecttable.id" from="${inspect.InspectTable.list()}" optionKey="id" required="" value="${inspectItemRecordInstance?.inspecttable?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecordInstance, field: 'inspecttablerec', 'error')} required">
	<label for="inspecttablerec">
		<g:message code="inspectItemRecord.inspecttablerec.label" default="Inspecttablerec" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="inspecttablerec" name="inspecttablerec.id" from="${inspect.InspectTableRecord.list()}" optionKey="id" required="" value="${inspectItemRecordInstance?.inspecttablerec?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecordInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="inspectItemRecord.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${inspect.InspectItem.list()}" optionKey="id" required="" value="${inspectItemRecordInstance?.item?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecordInstance, field: 'ivalue', 'error')} required">
	<label for="ivalue">
		<g:message code="inspectItemRecord.ivalue.label" default="Ivalue" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ivalue" name="ivalue.id" from="${inspect.TValue.list()}" optionKey="id" required="" value="${inspectItemRecordInstance?.ivalue?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecordInstance, field: 'tag', 'error')} required">
	<label for="tag">
		<g:message code="inspectItemRecord.tag.label" default="Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tag" name="tag.id" from="${inspect.InspectTag.list()}" optionKey="id" required="" value="${inspectItemRecordInstance?.tag?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecordInstance, field: 'worker', 'error')} required">
	<label for="worker">
		<g:message code="inspectItemRecord.worker.label" default="Worker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="worker" name="worker.id" from="${inspect.Users.list()}" optionKey="id" required="" value="${inspectItemRecordInstance?.worker?.id}" class="many-to-one"/>
</div>

