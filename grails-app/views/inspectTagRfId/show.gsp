
<%@ page import="inspect.InspectTagRfId" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'inspectTagRfId.label', default: 'InspectTagRfId')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspectTagRfId" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspectTagRfId" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspectTagRfId">
			
				<g:if test="${inspectTagRfIdInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="inspectTagRfId.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${inspectTagRfIdInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTagRfIdInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="inspectTagRfId.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${inspectTagRfIdInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTagRfIdInstance?.device}">
				<li class="fieldcontain">
					<span id="device-label" class="property-label"><g:message code="inspectTagRfId.device.label" default="Device" /></span>
					
						<span class="property-value" aria-labelledby="device-label"><g:link controller="device" action="show" id="${inspectTagRfIdInstance?.device?.id}">${inspectTagRfIdInstance?.device?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTagRfIdInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="inspectTagRfId.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${inspectTagRfIdInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTagRfIdInstance?.numbers}">
				<li class="fieldcontain">
					<span id="numbers-label" class="property-label"><g:message code="inspectTagRfId.numbers.label" default="Numbers" /></span>
					
						<span class="property-value" aria-labelledby="numbers-label"><g:fieldValue bean="${inspectTagRfIdInstance}" field="numbers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTagRfIdInstance?.tagcag}">
				<li class="fieldcontain">
					<span id="tagcag-label" class="property-label"><g:message code="inspectTagRfId.tagcag.label" default="Tagcag" /></span>
					
						<span class="property-value" aria-labelledby="tagcag-label"><g:link controller="inspectTag" action="show" id="${inspectTagRfIdInstance?.tagcag?.id}">${inspectTagRfIdInstance?.tagcag?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectTagRfIdInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectTagRfIdInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
