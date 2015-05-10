<%@ page import="br.sicogelan.caixa.OpcaoUnidadeMedida" %>



<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="opcaoUnidadeMedida.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${opcaoUnidadeMedidaInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'valorAcrescido', 'error')} required">
	<label for="valorAcrescido">
		<g:message code="opcaoUnidadeMedida.valorAcrescido.label" default="Valor Acrescido" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorAcrescido" value="${fieldValue(bean: opcaoUnidadeMedidaInstance, field: 'valorAcrescido')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="opcaoUnidadeMedida.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${opcaoUnidadeMedidaInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'quantidadeReal', 'error')} required">
	<label for="quantidadeReal">
		<g:message code="opcaoUnidadeMedida.quantidadeReal.label" default="Quantidade Real" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadeReal" value="${fieldValue(bean: opcaoUnidadeMedidaInstance, field: 'quantidadeReal')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: opcaoUnidadeMedidaInstance, field: 'opcaoCardapio', 'error')} required">
	<label for="opcaoCardapio">
		<g:message code="opcaoUnidadeMedida.opcaoCardapio.label" default="Opcao Cardapio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="opcaoCardapio" name="opcaoCardapio.id" from="${br.sicogelan.caixa.OpcaoCardapio.list()}" optionKey="id" required="" value="${opcaoUnidadeMedidaInstance?.opcaoCardapio?.id}" class="many-to-one"/>

</div>

