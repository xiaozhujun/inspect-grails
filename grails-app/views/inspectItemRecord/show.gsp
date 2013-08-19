
<%@ page import="inspect.InspectItemRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspectItemRecord.label', default: 'InspectItemRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspectItemRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspectItemRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspectItemRecord">
			
				<g:if test="${inspectItemRecordInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="inspectItemRecord.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${inspectItemRecordInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecordInstance?.dnumber}">
				<li class="fieldcontain">
					<span id="dnumber-label" class="property-label"><g:message code="inspectItemRecord.dnumber.label" default="Dnumber" /></span>
					
						<span class="property-value" aria-labelledby="dnumber-label"><g:link controller="device" action="show" id="${inspectItemRecordInstance?.dnumber?.id}">${inspectItemRecordInstance?.dnumber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecordInstance?.inspecttable}">
				<li class="fieldcontain">
					<span id="inspecttable-label" class="property-label"><g:message code="inspectItemRecord.inspecttable.label" default="Inspecttable" /></span>
					
						<span class="property-value" aria-labelledby="inspecttable-label"><g:link controller="inspectTable" action="show" id="${inspectItemRecordInstance?.inspecttable?.id}">${inspectItemRecordInstance?.inspecttable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecordInstance?.inspecttablerec}">
				<li class="fieldcontain">
					<span id="inspecttablerec-label" class="property-label"><g:message code="inspectItemRecord.inspecttablerec.label" default="Inspecttablerec" /></span>
					
						<span class="property-value" aria-labelledby="inspecttablerec-label"><g:link controller="inspectTableRecord" action="show" id="${inspectItemRecordInstance?.inspecttablerec?.id}">${inspectItemRecordInstance?.inspecttablerec?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecordInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="inspectItemRecord.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:link controller="inspectItem" action="show" id="${inspectItemRecordInstance?.item?.id}">${inspectItemRecordInstance?.item?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecordInstance?.ivalue}">
				<li class="fieldcontain">
					<span id="ivalue-label" class="property-label"><g:message code="inspectItemRecord.ivalue.label" default="Ivalue" /></span>
					
						<span class="property-value" aria-labelledby="ivalue-label"><g:link controller="TValue" action="show" id="${inspectItemRecordInstance?.ivalue?.id}">${inspectItemRecordInstance?.ivalue?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecordInstance?.tag}">
				<li class="fieldcontain">
					<span id="tag-label" class="property-label"><g:message code="inspectItemRecord.tag.label" default="Tag" /></span>
					
						<span class="property-value" aria-labelledby="tag-label"><g:link controller="inspectTag" action="show" id="${inspectItemRecordInstance?.tag?.id}">${inspectItemRecordInstance?.tag?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecordInstance?.worker}">
				<li class="fieldcontain">
					<span id="worker-label" class="property-label"><g:message code="inspectItemRecord.worker.label" default="Worker" /></span>
					
						<span class="property-value" aria-labelledby="worker-label"><g:link controller="users" action="show" id="${inspectItemRecordInstance?.worker?.id}">${inspectItemRecordInstance?.worker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectItemRecordInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectItemRecordInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
