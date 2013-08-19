<%@ page import="inspect.TValue" %>
<meta name="layout" content="admin">
<div class="fieldcontain ${hasErrors(bean: TValueInstance, field: 'tvalue', 'error')} ">
	<label for="tvalue">
		<g:message code="TValue.tvalue.label" default="Tvalue" />
		
	</label>
	<g:textField name="tvalue" value="${TValueInstance?.tvalue}"/>
</div>

