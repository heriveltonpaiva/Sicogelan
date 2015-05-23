<%@ page import="br.sicogelan.caixa.CategoriaOpcaoCardapio" %>

<div class="fieldcontain ${hasErrors(bean: categoriaOpcaoCardapioInstance, field: 'descricao', 'error')} required">
    <div class="form-group">
        <label for="descricao">
            <g:message code="categoriaOpcaoCardapio.descricao.label" default="Nome da Categoria" />
        </label>
        <fieldset disabled="disabled">
        <g:textField  class="form-control" name="descricao" required="" value="${categoriaOpcaoCardapioInstance?.descricao}"/>
        </fieldset>
    </div>
</div>