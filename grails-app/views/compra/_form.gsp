<%@ page import="br.sicogelan.caixa.Compra" %>



<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'produto', 'error')} required">
<div class="form-group">
	<label for="produto">
		<g:message code="compra.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${br.sicogelan.caixa.Produto.list()}" optionKey="id" required="" value="${compraInstance?.produto?.id}" class="form-control"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'quantidade', 'error')} required">
<div class="form-group">
	<label for="quantidade">
		<g:message code="compra.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" class="form-control" type="number" value="${compraInstance.quantidade}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'quantidadeReal', 'error')} required">
<div class="form-group">
	<label for="quantidadeReal">
		<g:message code="compra.quantidadeReal.label" default="Quantidade Real" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadeReal" class="form-control" value="${fieldValue(bean: compraInstance, field: 'quantidadeReal')}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'observacao', 'error')} required">
<div class="form-group">
	<label for="observacao">
		<g:message code="compra.observacao.label" default="Observacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="observacao" required="" value="${compraInstance?.observacao}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'registroGeral', 'error')} required">
<div class="form-group">
	<label for="registroGeral">
		<g:message code="compra.registroGeral.label" default="Registro Geral" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="registroGeral" name="registroGeral.id" from="${br.sicogelan.comum.RegistroGeral.list()}" optionKey="id" required="" value="${compraInstance?.registroGeral?.id}" class="form-control"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'valor', 'error')} required">
<div class="form-group">
	<label for="valor">
		<g:message code="compra.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" class="form-control" value="${fieldValue(bean: compraInstance, field: 'valor')}" required=""/>
</div>
</div>

