<%@ page import="br.sicogelan.comum.RegistroGeral" %>



<div class="fieldcontain ${hasErrors(bean: registroGeralInstance, field: 'permissao', 'error')} required">
	<label for="permissao">
		<g:message code="registroGeral.permissao.label" default="Permissao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="permissao" required="" value="${registroGeralInstance?.permissao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registroGeralInstance, field: 'ip', 'error')} required">
	<label for="ip">
		<g:message code="registroGeral.ip.label" default="Ip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ip" required="" value="${registroGeralInstance?.ip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registroGeralInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="registroGeral.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${br.sicogelan.seguranca.Usuario.list()}" optionKey="id" required="" value="${registroGeralInstance?.usuario?.id}" class="many-to-one"/>

</div>

