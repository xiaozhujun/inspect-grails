
<%@ page import="inspect.DeviceType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'deviceType.label', default: 'DeviceType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-deviceType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-deviceType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list deviceType">
			
				<g:if test="${deviceTypeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="deviceType.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${deviceTypeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deviceTypeInstance?.devices}">
				<li class="fieldcontain">
					<span id="devices-label" class="property-label"><g:message code="deviceType.devices.label" default="Devices" /></span>
					
						<g:each in="${deviceTypeInstance.devices}" var="d">
						<span class="property-value" aria-labelledby="devices-label"><g:link controller="device" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${deviceTypeInstance?.typename}">
				<li class="fieldcontain">
					<span id="typename-label" class="property-label"><g:message code="deviceType.typename.label" default="Typename" /></span>
					
						<span class="property-value" aria-labelledby="typename-label"><g:fieldValue bean="${deviceTypeInstance}" field="typename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deviceTypeInstance?.typenumber}">
				<li class="fieldcontain">
					<span id="typenumber-label" class="property-label"><g:message code="deviceType.typenumber.label" default="Typenumber" /></span>
					
						<span class="property-value" aria-labelledby="typenumber-label"><g:fieldValue bean="${deviceTypeInstance}" field="typenumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${deviceTypeInstance?.id}" />
					<g:link class="edit" action="edit" id="${deviceTypeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
