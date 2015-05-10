<%@ page import="br.sicogelan.caixa.Produto" %>



<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="produto.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${produtoInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="produto.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${produtoInstance.quantidade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidadeReal', 'error')} required">
	<label for="quantidadeReal">
		<g:message code="produto.quantidadeReal.label" default="Quantidade Real" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadeReal" value="${fieldValue(bean: produtoInstance, field: 'quantidadeReal')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidadeMinima', 'error')} required">
	<label for="quantidadeMinima">
		<g:message code="produto.quantidadeMinima.label" default="Quantidade Minima" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadeMinima" type="number" value="${produtoInstance.quantidadeMinima}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidadeMinimaReal', 'error')} required">
	<label for="quantidadeMinimaReal">
		<g:message code="produto.quantidadeMinimaReal.label" default="Quantidade Minima Real" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadeMinimaReal" value="${fieldValue(bean: produtoInstance, field: 'quantidadeMinimaReal')}" required=""/>

</div>

