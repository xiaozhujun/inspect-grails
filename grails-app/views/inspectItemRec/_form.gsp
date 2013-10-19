<%@ page import="inspect.InspectItemRec" %>



<div class="fieldcontain ${hasErrors(bean: inspectItemRecInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="inspectItemRec.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${inspectItemRecInstance?.createtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecInstance, field: 'dnumber_id', 'error')} required">
	<label for="dnumber_id">
		<g:message code="inspectItemRec.dnumber_id.label" default="Dnumberid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dnumber_id" type="number" value="${inspectItemRecInstance.dnumber_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecInstance, field: 'inspecttable_id', 'error')} required">
	<label for="inspecttable_id">
		<g:message code="inspectItemRec.inspecttable_id.label" default="Inspecttableid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="inspecttable_id" type="number" value="${inspectItemRecInstance.inspecttable_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecInstance, field: 'inspecttablerec_id', 'error')} required">
	<label for="inspecttablerec_id">
		<g:message code="inspectItemRec.inspecttablerec_id.label" default="Inspecttablerecid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="inspecttablerec_id" type="number" value="${inspectItemRecInstance.inspecttablerec_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecInstance, field: 'item_id', 'error')} required">
	<label for="item_id">
		<g:message code="inspectItemRec.item_id.label" default="Itemid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="item_id" type="number" value="${inspectItemRecInstance.item_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecInstance, field: 'ivalue_id', 'error')} required">
	<label for="ivalue_id">
		<g:message code="inspectItemRec.ivalue_id.label" default="Ivalueid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ivalue_id" type="number" value="${inspectItemRecInstance.ivalue_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecInstance, field: 'tag_id', 'error')} required">
	<label for="tag_id">
		<g:message code="inspectItemRec.tag_id.label" default="Tagid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tag_id" type="number" value="${inspectItemRecInstance.tag_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemRecInstance, field: 'worker_id', 'error')} required">
	<label for="worker_id">
		<g:message code="inspectItemRec.worker_id.label" default="Workerid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="worker_id" type="number" value="${inspectItemRecInstance.worker_id}" required=""/>
</div>

