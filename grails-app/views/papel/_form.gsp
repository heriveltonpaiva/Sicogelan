<%@ page import="br.sicogelan.seguranca.Papel" %>



<div class="fieldcontain ${hasErrors(bean: papelInstance, field: 'authority', 'error')} required">
<div class="form-group">
	<label for="authority">
		<g:message code="papel.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="authority" required="" value="${papelInstance?.authority}"/>
</div>
</div>

