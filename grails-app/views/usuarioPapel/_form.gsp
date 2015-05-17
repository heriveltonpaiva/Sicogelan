<%@ page import="br.sicogelan.seguranca.UsuarioPapel" %>



<div class="fieldcontain ${hasErrors(bean: usuarioPapelInstance, field: 'papel', 'error')} required">
<div class="form-group">
	<label for="papel">
		<g:message code="usuarioPapel.papel.label" default="Papel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="papel" name="papel.id" from="${br.sicogelan.seguranca.Papel.list()}" optionKey="id" required="" value="${usuarioPapelInstance?.papel?.id}" class="form-control"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioPapelInstance, field: 'usuario', 'error')} required">
<div class="form-group">
	<label for="usuario">
		<g:message code="usuarioPapel.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${br.sicogelan.seguranca.Usuario.list()}" optionKey="id" required="" value="${usuarioPapelInstance?.usuario?.id}" class="form-control"/>
</div>
</div>

