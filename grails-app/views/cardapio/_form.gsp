<%@ page import="br.sicogelan.caixa.Cardapio" %>



<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'descricao', 'error')} required">
    <div class="form-group">
	<label for="descricao">
		<g:message code="cardapio.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="descricao" required="" value="${cardapioInstance?.descricao}"/>
    </div>
</div>

    <div class="fieldcontain ${hasErrors(bean: arquivoInstance, field: 'arquivo', 'error')} required">
        <div class="form-group">
        <label for="arquivo">
            <g:message code="arquivo.arquivo.label" default="Arquivo" />
            <span class="required-indicator">*</span>
        </label>
        </div>
        <input type="file" id="arquivo" name="arquivo" />
    </div>

</div>

