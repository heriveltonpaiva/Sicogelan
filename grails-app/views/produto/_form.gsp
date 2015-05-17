<%@ page import="br.sicogelan.caixa.Produto" %>



<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'descricao', 'error')} required">
<div class="form-group">
	<label for="descricao">
		<g:message code="produto.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="descricao" required="" value="${produtoInstance?.descricao}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidade', 'error')} required">
<div class="form-group">
	<label for="quantidade">
		<g:message code="produto.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="quantidade" type="number" value="${produtoInstance.quantidade}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidadeReal', 'error')} required">
<div class="form-group">
	<label for="quantidadeReal">
		<g:message code="produto.quantidadeReal.label" default="Quantidade Real" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="quantidadeReal" value="${fieldValue(bean: produtoInstance, field: 'quantidadeReal')}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidadeMinima', 'error')} required">
<div class="form-group">
	<label for="quantidadeMinima">
		<g:message code="produto.quantidadeMinima.label" default="Quantidade Minima" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="quantidadeMinima" type="number" value="${produtoInstance.quantidadeMinima}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'quantidadeMinimaReal', 'error')} required">
<div class="form-group">
	<label for="quantidadeMinimaReal">
		<g:message code="produto.quantidadeMinimaReal.label" default="Quantidade Minima Real" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="quantidadeMinimaReal" value="${fieldValue(bean: produtoInstance, field: 'quantidadeMinimaReal')}" required=""/>
</div>
</div>

