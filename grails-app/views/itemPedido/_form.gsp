<%@ page import="br.sicogelan.caixa.ItemPedido" %>



<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="itemPedido.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${itemPedidoInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoCardapio', 'error')} required">
	<label for="opcaoCardapio">
		<g:message code="itemPedido.opcaoCardapio.label" default="Opcao Cardapio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="opcaoCardapio" name="opcaoCardapio.id" from="${br.sicogelan.caixa.OpcaoCardapio.list()}" optionKey="id" required="" value="${itemPedidoInstance?.opcaoCardapio?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoUnidadeMedida', 'error')} required">
	<label for="opcaoUnidadeMedida">
		<g:message code="itemPedido.opcaoUnidadeMedida.label" default="Opcao Unidade Medida" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="opcaoUnidadeMedida" name="opcaoUnidadeMedida.id" from="${br.sicogelan.caixa.OpcaoUnidadeMedida.list()}" optionKey="id" required="" value="${itemPedidoInstance?.opcaoUnidadeMedida?.id}" class="many-to-one"/>

</div>

