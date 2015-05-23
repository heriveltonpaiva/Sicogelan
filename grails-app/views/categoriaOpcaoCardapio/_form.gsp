<%@ page import="br.sicogelan.caixa.CategoriaOpcaoCardapio" %>



<div class="fieldcontain ${hasErrors(bean: categoriaOpcaoCardapioInstance, field: 'descricao', 'error')} required">
<div class="form-group">
	<label for="descricao">
		<g:message code="categoriaOpcaoCardapio.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField  class="form-control" name="descricao" required="" value="${categoriaOpcaoCardapioInstance?.descricao}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'arquivo', 'error')} required">
    <div class="form-group">
        <label for="arquivoEnvio">
            <g:message code="cardapio.arquivo.label" default="Arquivo" />
            <span class="required-indicator">*</span>
        </label>

        <g:field type="file" name="arquivoEnvio" class="form-control" />

    </div>
</div>
