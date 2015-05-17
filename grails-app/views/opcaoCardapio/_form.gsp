<%@ page import="br.sicogelan.caixa.OpcaoCardapio" %>



<div class="fieldcontain ${hasErrors(bean: opcaoCardapioInstance, field: 'descricao', 'error')} required">
<div class="form-group">
	<label for="descricao">
		<g:message code="opcaoCardapio.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="descricao" required="" value="${opcaoCardapioInstance?.descricao}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoCardapioInstance, field: 'preco', 'error')} required">
<div class="form-group">
	<label for="preco">
		<g:message code="opcaoCardapio.preco.label" default="Preco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" name="preco" value="${fieldValue(bean: opcaoCardapioInstance, field: 'preco')}" required=""/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoCardapioInstance, field: 'observacao', 'error')} required">
<div class="form-group">
	<label for="observacao">
		<g:message code="opcaoCardapio.observacao.label" default="Observacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="observacao" required="" value="${opcaoCardapioInstance?.observacao}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoCardapioInstance, field: 'cardapio', 'error')} required">
<div class="form-group">
	<label for="cardapio">
		<g:message code="opcaoCardapio.cardapio.label" default="Cardapio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cardapio" name="cardapio.id" from="${br.sicogelan.caixa.Cardapio.list()}" optionKey="id" required="" value="${opcaoCardapioInstance?.cardapio?.id}" class="form-control"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoCardapioInstance, field: 'arquivo', 'error')} required">
<div class="form-group">
	<label for="arquivo">
		<g:message code="opcaoCardapio.arquivo.label" default="Arquivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="arquivo" name="arquivo.id" from="${br.sicogelan.comum.Arquivo.list()}" optionKey="id" required="" value="${opcaoCardapioInstance?.arquivo?.id}" class="form-control"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: opcaoCardapioInstance, field: 'categoriaOpcaoCardapio', 'error')} required">
<div class="form-group">
	<label for="categoriaOpcaoCardapio">
		<g:message code="opcaoCardapio.categoriaOpcaoCardapio.label" default="Categoria Opcao Cardapio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoriaOpcaoCardapio" name="categoriaOpcaoCardapio.id" from="${br.sicogelan.caixa.CategoriaOpcaoCardapio.list()}" optionKey="id" required="" value="${opcaoCardapioInstance?.categoriaOpcaoCardapio?.id}" class="form-control"/>
</div>
</div>

