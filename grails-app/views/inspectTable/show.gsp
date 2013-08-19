
<%@ page import="inspect.InspectTable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'inspectTable.label', default: 'InspectTable')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspectTable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspectTable" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspectTable">
			
				<g:if test="${inspectTableInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="inspectTable.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${inspectTableInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="inspectTable.item.label" default="Item" /></span>
					
						<g:each in="${inspectTableInstance.item}" var="i">
						<span class="property-value" aria-labelledby="item-label"><g:link controller="inspectItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableInstance?.itemrecord}">
				<li class="fieldcontain">
					<span id="itemrecord-label" class="property-label"><g:message code="inspectTable.itemrecord.label" default="Itemrecord" /></span>
					
						<g:each in="${inspectTableInstance.itemrecord}" var="i">
						<span class="property-value" aria-labelledby="itemrecord-label"><g:link controller="inspectItemRecord" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableInstance?.tablerecord}">
				<li class="fieldcontain">
					<span id="tablerecord-label" class="property-label"><g:message code="inspectTable.tablerecord.label" default="Tablerecord" /></span>
					
						<g:each in="${inspectTableInstance.tablerecord}" var="t">
						<span class="property-value" aria-labelledby="tablerecord-label"><g:link controller="inspectTableRecord" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableInstance?.tname}">
				<li class="fieldcontain">
					<span id="tname-label" class="property-label"><g:message code="inspectTable.tname.label" default="Tname" /></span>
					
						<span class="property-value" aria-labelledby="tname-label"><g:fieldValue bean="${inspectTableInstance}" field="tname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectTableInstance?.trole}">
				<li class="fieldcontain">
					<span id="trole-label" class="property-label"><g:message code="inspectTable.trole.label" default="Trole" /></span>
					
						<span class="property-value" aria-labelledby="trole-label"><g:link controller="roles" action="show" id="${inspectTableInstance?.trole?.id}">${inspectTableInstance?.trole?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectTableInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectTableInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
