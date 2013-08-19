
<%@ page import="inspect.TValue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'TValue.label', default: 'TValue')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-TValue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>

                <li><font size="4" color="white"><g:message code="default.list.label" args="[entityName]" /></font></li>
			</ul>
		</div>
		<div id="list-TValue" class="content scaffold-list" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tvalue" title="${message(code: 'TValue.tvalue.label', default: 'Tvalue')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${TValueInstanceList}" status="i" var="TValueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${TValueInstance.id}">${fieldValue(bean: TValueInstance, field: "tvalue")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${TValueInstanceTotal}" />
                <div class="nav" role="navigation">
                    <ul>

                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</div>
		</div>
	</body>
</html>
