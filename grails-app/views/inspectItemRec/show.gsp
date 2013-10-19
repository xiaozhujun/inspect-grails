
<%@ page import="inspect.InspectItemRec" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspectItemRec.label', default: 'InspectItemRec')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspectItemRec" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspectItemRec" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspectItemRec">
			
				<g:if test="${inspectItemRecInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="inspectItemRec.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${inspectItemRecInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecInstance?.dnumber_id}">
				<li class="fieldcontain">
					<span id="dnumber_id-label" class="property-label"><g:message code="inspectItemRec.dnumber_id.label" default="Dnumberid" /></span>
					
						<span class="property-value" aria-labelledby="dnumber_id-label"><g:fieldValue bean="${inspectItemRecInstance}" field="dnumber_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecInstance?.inspecttable_id}">
				<li class="fieldcontain">
					<span id="inspecttable_id-label" class="property-label"><g:message code="inspectItemRec.inspecttable_id.label" default="Inspecttableid" /></span>
					
						<span class="property-value" aria-labelledby="inspecttable_id-label"><g:fieldValue bean="${inspectItemRecInstance}" field="inspecttable_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecInstance?.inspecttablerec_id}">
				<li class="fieldcontain">
					<span id="inspecttablerec_id-label" class="property-label"><g:message code="inspectItemRec.inspecttablerec_id.label" default="Inspecttablerecid" /></span>
					
						<span class="property-value" aria-labelledby="inspecttablerec_id-label"><g:fieldValue bean="${inspectItemRecInstance}" field="inspecttablerec_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecInstance?.item_id}">
				<li class="fieldcontain">
					<span id="item_id-label" class="property-label"><g:message code="inspectItemRec.item_id.label" default="Itemid" /></span>
					
						<span class="property-value" aria-labelledby="item_id-label"><g:fieldValue bean="${inspectItemRecInstance}" field="item_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecInstance?.ivalue_id}">
				<li class="fieldcontain">
					<span id="ivalue_id-label" class="property-label"><g:message code="inspectItemRec.ivalue_id.label" default="Ivalueid" /></span>
					
						<span class="property-value" aria-labelledby="ivalue_id-label"><g:fieldValue bean="${inspectItemRecInstance}" field="ivalue_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecInstance?.tag_id}">
				<li class="fieldcontain">
					<span id="tag_id-label" class="property-label"><g:message code="inspectItemRec.tag_id.label" default="Tagid" /></span>
					
						<span class="property-value" aria-labelledby="tag_id-label"><g:fieldValue bean="${inspectItemRecInstance}" field="tag_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectItemRecInstance?.worker_id}">
				<li class="fieldcontain">
					<span id="worker_id-label" class="property-label"><g:message code="inspectItemRec.worker_id.label" default="Workerid" /></span>
					
						<span class="property-value" aria-labelledby="worker_id-label"><g:fieldValue bean="${inspectItemRecInstance}" field="worker_id"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectItemRecInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectItemRecInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
