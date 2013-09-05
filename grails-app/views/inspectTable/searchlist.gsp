
<%@ page import="inspect.InspectTable" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin">
    <g:set var="entityName" value="${message(code: 'inspectTable.label', default: 'InspectTable')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-inspectTable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>

        <li><font size="4" color="white"><g:message code="default.list.label" args="[entityName]" /></font></li>
    </ul>
</div>
<div id="list-inspectTable" class="content scaffold-list" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="tname" title="${message(code: 'inspectTable.tname.label', default: 'Tname')}" />
            <g:sortableColumn property="createtime" title="${message(code: 'inspectTable.createtime.label', default: 'Createtime')}" />
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${inspectTableInstanceList}" status="i" var="inspectTableInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${fieldValue(bean: inspectTableInstance, field: "tname")}</td>

                <td><g:link action="show" id="${inspectTableInstance.id}">${fieldValue(bean: inspectTableInstance, field: "createtime")}</g:link></td>

                <td>
                    <g:form>
                        <fieldset class="buttons">
                            <g:link class="edit" action="generate" id="${inspectTableInstance?.id}"><g:message code="default.button.download.label"  /></g:link>
                            %{--<g:link class="edit" action="download" id="${inspectTableInstance?.id}"><g:message code="default.button.download.label" /></g:link>--}%
                        </fieldset>
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${inspectTableInstanceTotal}" />

    </div>
</div>
</body>
</html>
