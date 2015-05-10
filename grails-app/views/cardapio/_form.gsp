<%@ page import="br.sicogelan.caixa.Cardapio" %>



<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="cardapio.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${cardapioInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardapioInstance, field: 'arquivo', 'error')} required">
	<label for="arquivo">
		<g:message code="cardapio.arquivo.label" default="Arquivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="arquivo" name="arquivo.id" from="${br.sicogelan.comum.Arquivo.list()}" optionKey="id" required="" value="${cardapioInstance?.arquivo?.id}" class="many-to-one"/>

</div>
