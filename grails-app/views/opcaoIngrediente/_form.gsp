<%@ page import="br.sicogelan.caixa.OpcaoIngrediente" %>



<div class="fieldcontain ${hasErrors(bean: opcaoIngredienteInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="opcaoIngrediente.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${opcaoIngredienteInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: opcaoIngredienteInstance, field: 'quantidade_real', 'error')} required">
	<label for="quantidade_real">
		<g:message code="opcaoIngrediente.quantidade_real.label" default="Quantidadereal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade_real" value="${fieldValue(bean: opcaoIngredienteInstance, field: 'quantidade_real')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: opcaoIngredienteInstance, field: 'opcaoCardapio', 'error')} required">
	<label for="opcaoCardapio">
		<g:message code="opcaoIngrediente.opcaoCardapio.label" default="Opcao Cardapio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="opcaoCardapio" name="opcaoCardapio.id" from="${br.sicogelan.caixa.OpcaoCardapio.list()}" optionKey="id" required="" value="${opcaoIngredienteInstance?.opcaoCardapio?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: opcaoIngredienteInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="opcaoIngrediente.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${br.sicogelan.caixa.Produto.list()}" optionKey="id" required="" value="${opcaoIngredienteInstance?.produto?.id}" class="many-to-one"/>

</div>

