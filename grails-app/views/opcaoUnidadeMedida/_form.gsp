<%@ page import="br.sicogelan.caixa.OpcaoUnidadeMedida" %>



<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'descricao', 'error')} required">
<div class="form-group">
	<label for="descricao">
		<g:message code="opcaoUnidadeMedida.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" cname="descricao" required="" value="${opcaoUnidadeMedidaInstance?.descricao}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'valorAcrescido', 'error')} required">
<div class="form-group">
	<label for="valorAcrescido">
		<g:message code="opcaoUnidadeMedida.valorAcrescido.label" default="Valor Acrescido" />
		<span class="required-indicator">*</span>
	</label>
	<g:field  class="form-control" name="valorAcrescido" value="${fieldValue(bean: opcaoUnidadeMedidaInstance, field: 'valorAcrescido')}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'quantidade', 'error')} required">
<div class="form-group">
	<label for="quantidade">
		<g:message code="opcaoUnidadeMedida.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="quantidade" type="number" value="${opcaoUnidadeMedidaInstance.quantidade}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'quantidadeReal', 'error')} required">
<div class="form-group">
	<label for="quantidadeReal">
		<g:message code="opcaoUnidadeMedida.quantidadeReal.label" default="Quantidade Real" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="quantidadeReal" value="${fieldValue(bean: opcaoUnidadeMedidaInstance, field: 'quantidadeReal')}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'opcaoCardapio', 'error')} required">
<div class="form-group">
	<label for="opcaoCardapio">
		<g:message code="opcaoUnidadeMedida.opcaoCardapio.label" default="Opcao Cardapio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="opcaoCardapio" name="opcaoCardapio.id" from="${br.sicogelan.caixa.OpcaoCardapio.list()}" optionKey="id" required="" value="${opcaoUnidadeMedidaInstance?.opcaoCardapio?.id}" class="form-control"/>
</div>
</div>

