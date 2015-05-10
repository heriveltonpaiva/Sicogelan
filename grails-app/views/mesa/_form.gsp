<%@ page import="br.sicogelan.caixa.Mesa" %>



<div class="fieldcontain ${hasErrors(bean: mesaInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="mesa.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${mesaInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: mesaInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="mesa.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${mesaInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: mesaInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="mesa.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" required="" value="${mesaInstance?.codigo}"/>

</div>

