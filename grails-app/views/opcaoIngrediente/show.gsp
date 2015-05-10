
<%@ page import="br.sicogelan.caixa.OpcaoIngrediente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoIngrediente.label', default: 'OpcaoIngrediente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-opcaoIngrediente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-opcaoIngrediente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list opcaoIngrediente">
			
				<g:if test="${opcaoIngredienteInstance?.quantidade}">
				<li class="fieldcontain">
					<span id="quantidade-label" class="property-label"><g:message code="opcaoIngrediente.quantidade.label" default="Quantidade" /></span>
					
						<span class="property-value" aria-labelledby="quantidade-label"><g:fieldValue bean="${opcaoIngredienteInstance}" field="quantidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoIngredienteInstance?.quantidade_real}">
				<li class="fieldcontain">
					<span id="quantidade_real-label" class="property-label"><g:message code="opcaoIngrediente.quantidade_real.label" default="Quantidadereal" /></span>
					
						<span class="property-value" aria-labelledby="quantidade_real-label"><g:fieldValue bean="${opcaoIngredienteInstance}" field="quantidade_real"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoIngredienteInstance?.opcaoCardapio}">
				<li class="fieldcontain">
					<span id="opcaoCardapio-label" class="property-label"><g:message code="opcaoIngrediente.opcaoCardapio.label" default="Opcao Cardapio" /></span>
					
						<span class="property-value" aria-labelledby="opcaoCardapio-label"><g:link controller="opcaoCardapio" action="show" id="${opcaoIngredienteInstance?.opcaoCardapio?.id}">${opcaoIngredienteInstance?.opcaoCardapio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoIngredienteInstance?.produto}">
				<li class="fieldcontain">
					<span id="produto-label" class="property-label"><g:message code="opcaoIngrediente.produto.label" default="Produto" /></span>
					
						<span class="property-value" aria-labelledby="produto-label"><g:link controller="produto" action="show" id="${opcaoIngredienteInstance?.produto?.id}">${opcaoIngredienteInstance?.produto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:opcaoIngredienteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${opcaoIngredienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
