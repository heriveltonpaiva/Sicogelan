
<%@ page import="br.sicogelan.caixa.ItemPedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemPedido.label', default: 'ItemPedido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-itemPedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-itemPedido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list itemPedido">
			
				<g:if test="${itemPedidoInstance?.quantidade}">
				<li class="fieldcontain">
					<span id="quantidade-label" class="property-label"><g:message code="itemPedido.quantidade.label" default="Quantidade" /></span>
					
						<span class="property-value" aria-labelledby="quantidade-label"><g:fieldValue bean="${itemPedidoInstance}" field="quantidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemPedidoInstance?.opcaoCardapio}">
				<li class="fieldcontain">
					<span id="opcaoCardapio-label" class="property-label"><g:message code="itemPedido.opcaoCardapio.label" default="Opcao Cardapio" /></span>
					
						<span class="property-value" aria-labelledby="opcaoCardapio-label"><g:link controller="opcaoCardapio" action="show" id="${itemPedidoInstance?.opcaoCardapio?.id}">${itemPedidoInstance?.opcaoCardapio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemPedidoInstance?.opcaoUnidadeMedida}">
				<li class="fieldcontain">
					<span id="opcaoUnidadeMedida-label" class="property-label"><g:message code="itemPedido.opcaoUnidadeMedida.label" default="Opcao Unidade Medida" /></span>
					
						<span class="property-value" aria-labelledby="opcaoUnidadeMedida-label"><g:link controller="opcaoUnidadeMedida" action="show" id="${itemPedidoInstance?.opcaoUnidadeMedida?.id}">${itemPedidoInstance?.opcaoUnidadeMedida?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:itemPedidoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${itemPedidoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
