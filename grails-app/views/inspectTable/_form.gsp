<%@ page import="inspect.InspectTable" %>
<meta name="layout" content="admin">
<calendar:resources lang="zh" theme="tiger"/>
<div class="fieldcontain ${hasErrors(bean: inspectTableInstance, field: 'tname', 'error')} ">
    <label for="tname">
        <g:message code="inspectTable.tname.label" default="Tname" />

    </label>
    <g:textField name="tname" value="${inspectTableInstance?.tname}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTableInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="inspectTable.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
    <calendar:datePicker name="createtime" defaultValue="${new Date()}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: inspectTableInstance, field: 'trole', 'error')} required">
	<label for="trole">
		<g:message code="inspectTable.trole.label" default="Trole" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="trole" name="trole.id" from="${inspect.Roles.list()}" optionKey="id" required="" value="${inspectTableInstance?.trole?.id}" class="many-to-one"/>--}%
    <select id="trole" name="trole.id">
        <g:each in="${rlist}" var="p">
            <option  value="${p.rid}">${p.rolename}</option>
        </g:each>
    </select>
</div>

