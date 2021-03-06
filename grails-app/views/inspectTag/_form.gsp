<%@ page import="inspect.InspectTag" %>
<meta name="layout" content="admin">
<calendar:resources lang="zh" theme="tiger"/>
<div class="fieldcontain ${hasErrors(bean: inspectTagInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="inspectTag.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${inspectTagInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTagInstance, field: 'numbers', 'error')} ">
    <label for="numbers">
        <g:message code="inspectTag.numbers.label" default="Numbers" />

    </label>
    <g:textField name="numbers" value="${inspectTagInstance?.numbers}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTagInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="inspectTag.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
    <calendar:datePicker name="createtime" defaultValue="${new Date()}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTagInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="inspectTag.description.label" default="Description" />

    </label>
    %{--<g:textField name="description" value="${inspectTagInstance?.description}"/>--}%
    <g:textArea name="description" value="${inspectTagInstance?.description}"/>
</div>



