<%@ page import="inspect.InspectItem" %>
<meta name="layout" content="admin">
<calendar:resources lang="zh" theme="tiger"/>
<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="inspectItem.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${inspectItemInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="inspectItem.description.label" default="Description" />

    </label>
    <g:textField name="description" value="${inspectItemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="inspectItem.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
    <calendar:datePicker name="createtime" defaultValue="${new Date()}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'inspecttable', 'error')} required">
	<label for="inspecttable">
		<g:message code="inspectItem.inspecttable.label" default="Inspecttable" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="inspecttable" name="inspecttable.id" from="${inspect.InspectTable.list()}" optionKey="id" required="" value="${inspectItemInstance?.inspecttable?.id}" class="many-to-one"/>--}%
    <select id="inspecttable" name="inspecttable.id">
        <g:each in="${tlist}" var="p">
            <option  value="${p.id}">${p.tname}</option>

        </g:each>

    </select>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'isInput', 'error')} ">
	<label for="isInput">
		<g:message code="inspectItem.isInput.label" default="Is Input" />
		
	</label>
	<g:textField name="isInput" value="${inspectItemInstance?.isInput}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'numbers', 'error')} ">
	<label for="numbers">
		<g:message code="inspectItem.numbers.label" default="Numbers" />
		
	</label>
	<g:textField name="numbers" value="${inspectItemInstance?.numbers}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'unit', 'error')} ">
    <label for="unit">
        <g:message code="inspectItem.unit.label" default="Unit" />

    </label>
    <g:textField name="unit" value="${inspectItemInstance?.unit}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'tag', 'error')} required">
	<label for="tag">
		<g:message code="inspectItem.tag.label" default="Tag" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="tag" name="tag.id" from="${inspect.InspectTag.list()}" optionKey="id" required="" value="${inspectItemInstance?.tag?.id}" class="many-to-one"/>--}%
    <select id="tag" name="tag.id">
        <g:each in="${taglist}" var="p">
            <option  value="${p.tagid}">${p.tagname}</option>

        </g:each>

    </select>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectItemInstance, field: 'tvalues', 'error')} ">
	<label for="tvalues">
		<g:message code="inspectItem.tvalues.label" default="Tvalues" />
		
	</label>
	%{--<g:select name="tvalues" from="${inspect.TValue.list()}" multiple="multiple" optionKey="id" size="5" value="${inspectItemInstance?.tvalues*.id}" class="many-to-many"/>--}%
    %{--<select id="tvalues" name="tvalues" multiple="multiple">
        <g:each in="${valuelist}" var="p">
            <option  value="${p.vid}">${p.tvalue}</option>

        </g:each>

    </select>--}%
<g:each in="${valuelist}" var="p">
    <input type="checkbox" name="tvalues" value="${p.vid}">${p.tvalue}
</g:each>
</div>



