<%@ page import="br.sicogelan.caixa.OpcaoCardapio" %>

<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'descricao', 'error')}">
    <div class="form-group">
        <label for="descricao">
            <g:message code="cardapio.descricao.label" default="Descricao do Cardápio" />
        </label>
        <fieldset disabled="disabled">
        <g:textField  class="form-control" name="descricao" required="" value="${cardapioInstance?.descricao}"/>
        </fieldset>
    </div>
</div>