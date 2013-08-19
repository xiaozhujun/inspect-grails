
<%@ page import="inspect.InspectTableRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspectTableRecord.label', default: 'InspectTableRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspectTableRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspectTableRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspectTableRecord">
			
				<g:if test="${inspectTableRecordInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="inspectTableRecord.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${inspectTableRecordInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableRecordInstance?.faultcount}">
				<li class="fieldcontain">
					<span id="faultcount-label" class="property-label"><g:message code="inspectTableRecord.faultcount.label" default="Faultcount" /></span>
					
						<span class="property-value" aria-labelledby="faultcount-label"><g:fieldValue bean="${inspectTableRecordInstance}" field="faultcount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableRecordInstance?.inspecttable}">
				<li class="fieldcontain">
					<span id="inspecttable-label" class="property-label"><g:message code="inspectTableRecord.inspecttable.label" default="Inspecttable" /></span>
					
						<span class="property-value" aria-labelledby="inspecttable-label"><g:link controller="inspectTable" action="show" id="${inspectTableRecordInstance?.inspecttable?.id}">${inspectTableRecordInstance?.inspecttable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableRecordInstance?.itemrecord}">
				<li class="fieldcontain">
					<span id="itemrecord-label" class="property-label"><g:message code="inspectTableRecord.itemrecord.label" default="Itemrecord" /></span>
					
						<g:each in="${inspectTableRecordInstance.itemrecord}" var="i">
						<span class="property-value" aria-labelledby="itemrecord-label"><g:link controller="inspectItemRecord" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableRecordInstance?.worker}">
				<li class="fieldcontain">
					<span id="worker-label" class="property-label"><g:message code="inspectTableRecord.worker.label" default="Worker" /></span>
					
						<span class="property-value" aria-labelledby="worker-label"><g:link controller="users" action="show" id="${inspectTableRecordInstance?.worker?.id}">${inspectTableRecordInstance?.worker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectTableRecordInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectTableRecordInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
