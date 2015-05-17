<%@ page import="br.sicogelan.caixa.Mesa" %>



<div class="fieldcontain ${hasErrors(bean: mesaInstance, field: 'descricao', 'error')} required">
<div class="form-group">
	<label for="descricao">
		<g:message code="mesa.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="descricao" required="" value="${mesaInstance?.descricao}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: mesaInstance, field: 'status', 'error')} required">
<div class="form-group">
	<label for="status">
		<g:message code="mesa.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="status" required="" value="${mesaInstance?.status}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: mesaInstance, field: 'codigo', 'error')} required">
<div class="form-group">
	<label for="codigo">
		<g:message code="mesa.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="codigo" required="" value="${mesaInstance?.codigo}"/>
</div>
</div>

