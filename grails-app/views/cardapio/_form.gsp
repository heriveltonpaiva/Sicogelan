<%@ page import="br.sicogelan.caixa.Cardapio" %>



<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'descricao', 'error')} required">
    <div class="form-group">
        <label for="descricao">
            <g:message code="cardapio.descricao.label" default="Descricao" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField  class="form-control" name="descricao" required="" value="${cardapioInstance?.descricao}"/>
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


