
<%@ page import="inspect.Device" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-device" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-device" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list device">
			
				<g:if test="${deviceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="device.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${deviceInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deviceInstance?.devname}">
				<li class="fieldcontain">
					<span id="devname-label" class="property-label"><g:message code="device.devname.label" default="Devname" /></span>
					<span class="property-value" aria-labelledby="devname-label"><g:fieldValue bean="${deviceInstance}" field="devname"/></span>

				</li>
				</g:if>
			
				<g:if test="${deviceInstance?.itemrecord}">
				<li class="fieldcontain">
					<span id="itemrecord-label" class="property-label"><g:message code="device.itemrecord.label" default="Itemrecord" /></span>
					
						<g:each in="${deviceInstance.itemrecord}" var="i">
						<span class="property-value" aria-labelledby="itemrecord-label"><g:link controller="inspectItemRecord" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${deviceInstance?.numbers}">
				<li class="fieldcontain">
					<span id="numbers-label" class="property-label"><g:message code="device.numbers.label" default="Numbers" /></span>
					
						<span class="property-value" aria-labelledby="numbers-label"><g:fieldValue bean="${deviceInstance}" field="numbers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deviceInstance?.tagrfid}">
				<li class="fieldcontain">
					<span id="tagrfid-label" class="property-label"><g:message code="device.tagrfid.label" default="Tagrfid" /></span>
					
						<g:each in="${deviceInstance.tagrfid}" var="t">
						<span class="property-value" aria-labelledby="tagrfid-label"><g:link controller="inspectTagRfId" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${deviceInstance?.id}" />
					<g:link class="edit" action="edit" id="${deviceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
