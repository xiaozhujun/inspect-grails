
<%@ page import="inspect.InspectItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'inspectItem.label', default: 'InspectItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspectItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspectItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspectItem">
			
				<g:if test="${inspectItemInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="inspectItem.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${inspectItemInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="inspectItem.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${inspectItemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.inspecttable}">
				<li class="fieldcontain">
					<span id="inspecttable-label" class="property-label"><g:message code="inspectItem.inspecttable.label" default="Inspecttable" /></span>
					
						<span class="property-value" aria-labelledby="inspecttable-label"><g:link controller="inspectTable" action="show" id="${inspectItemInstance?.inspecttable?.id}">${inspectItemInstance?.inspecttable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.isInput}">
				<li class="fieldcontain">
					<span id="isInput-label" class="property-label"><g:message code="inspectItem.isInput.label" default="Is Input" /></span>
					
						<span class="property-value" aria-labelledby="isInput-label"><g:fieldValue bean="${inspectItemInstance}" field="isInput"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.itemrecord}">
				<li class="fieldcontain">
					<span id="itemrecord-label" class="property-label"><g:message code="inspectItem.itemrecord.label" default="Itemrecord" /></span>
					
						<g:each in="${inspectItemInstance.itemrecord}" var="i">
						<span class="property-value" aria-labelledby="itemrecord-label"><g:link controller="inspectItemRecord" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="inspectItem.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${inspectItemInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.numbers}">
				<li class="fieldcontain">
					<span id="numbers-label" class="property-label"><g:message code="inspectItem.numbers.label" default="Numbers" /></span>
					
						<span class="property-value" aria-labelledby="numbers-label"><g:fieldValue bean="${inspectItemInstance}" field="numbers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.tag}">
				<li class="fieldcontain">
					<span id="tag-label" class="property-label"><g:message code="inspectItem.tag.label" default="Tag" /></span>
					
						<span class="property-value" aria-labelledby="tag-label"><g:link controller="inspectTag" action="show" id="${inspectItemInstance?.tag?.id}">${inspectItemInstance?.tag?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.tvalues}">
				<li class="fieldcontain">
					<span id="tvalues-label" class="property-label"><g:message code="inspectItem.tvalues.label" default="Tvalues" /></span>
					
						<g:each in="${inspectItemInstance.tvalues}" var="t">
						<span class="property-value" aria-labelledby="tvalues-label"><g:link controller="TValue" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemInstance?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="inspectItem.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${inspectItemInstance}" field="unit"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
