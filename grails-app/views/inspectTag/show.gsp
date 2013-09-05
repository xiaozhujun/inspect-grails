
<%@ page import="inspect.InspectTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'inspectTag.label', default: 'InspectTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspectTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspectTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspectTag">
			
				<g:if test="${inspectTagInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="inspectTag.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${inspectTagInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTagInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="inspectTag.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${inspectTagInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${inspectTagInstance?.itemrecord}">
				<li class="fieldcontain">
					<span id="itemrecord-label" class="property-label"><g:message code="inspectTag.itemrecord.label" default="Itemrecord" /></span>
					
						<g:each in="${inspectTagInstance.itemrecord}" var="i">
						<span class="property-value" aria-labelledby="itemrecord-label"><g:link controller="inspectItemRecord" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTagInstance?.items}">
				<li class="fieldcontain">
					<span id="items-label" class="property-label"><g:message code="inspectTag.items.label" default="Items" /></span>
					
						<g:each in="${inspectTagInstance.items}" var="i">
						<span class="property-value" aria-labelledby="items-label"><g:link controller="inspectItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>--}%
			
				<g:if test="${inspectTagInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="inspectTag.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${inspectTagInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTagInstance?.numbers}">
				<li class="fieldcontain">
					<span id="numbers-label" class="property-label"><g:message code="inspectTag.numbers.label" default="Numbers" /></span>
					
						<span class="property-value" aria-labelledby="numbers-label"><g:fieldValue bean="${inspectTagInstance}" field="numbers"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${inspectTagInstance?.tagrfid}">
				<li class="fieldcontain">
					<span id="tagrfid-label" class="property-label"><g:message code="inspectTag.tagrfid.label" default="Tagrfid" /></span>
					
						<g:each in="${inspectTagInstance.tagrfid}" var="t">
						<span class="property-value" aria-labelledby="tagrfid-label"><g:link controller="inspectTagRfId" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>--}%
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectTagInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectTagInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
