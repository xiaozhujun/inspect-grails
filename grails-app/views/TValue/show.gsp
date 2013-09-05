
<%@ page import="inspect.TValue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'TValue.label', default: 'TValue')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-TValue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-TValue" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list TValue">
			
				%{--<g:if test="${TValueInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="TValue.item.label" default="Item" /></span>
					
						<g:each in="${TValueInstance.item}" var="i">
						<span class="property-value" aria-labelledby="item-label"><g:link controller="inspectItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>--}%
			
				%{--<g:if test="${TValueInstance?.itemrecord}">
				<li class="fieldcontain">
					<span id="itemrecord-label" class="property-label"><g:message code="TValue.itemrecord.label" default="Itemrecord" /></span>
					
						<g:each in="${TValueInstance.itemrecord}" var="i">
						<span class="property-value" aria-labelledby="itemrecord-label"><g:link controller="inspectItemRecord" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>--}%
			
				<g:if test="${TValueInstance?.tvalue}">
				<li class="fieldcontain">
					<span id="tvalue-label" class="property-label"><g:message code="TValue.tvalue.label" default="Tvalue" /></span>
					
						<span class="property-value" aria-labelledby="tvalue-label"><g:fieldValue bean="${TValueInstance}" field="tvalue"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${TValueInstance?.id}" />
					<g:link class="edit" action="edit" id="${TValueInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
