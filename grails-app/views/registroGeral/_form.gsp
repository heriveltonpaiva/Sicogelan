<%@ page import="br.sicogelan.comum.RegistroGeral" %>



<div class="fieldcontain ${hasErrors(bean: registroGeralInstance, field: 'permissao', 'error')} required">
<div class="form-group">
	<label for="permissao">
		<g:message code="registroGeral.permissao.label" default="Permissao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="permissao" required="" value="${registroGeralInstance?.permissao}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: registroGeralInstance, field: 'ip', 'error')} required">
<div class="form-group">
	<label for="ip">
		<g:message code="registroGeral.ip.label" default="Ip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="ip" required="" value="${registroGeralInstance?.ip}"/>
</div>
</div>


