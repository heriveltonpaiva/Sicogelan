
<%@ page import="br.sicogelan.caixa.OpcaoCardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoCardapio.label', default: 'OpcaoCardapio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-opcaoCardapio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-opcaoCardapio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list opcaoCardapio">
			
				<g:if test="${opcaoCardapioInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="opcaoCardapio.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${opcaoCardapioInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoCardapioInstance?.preco}">
				<li class="fieldcontain">
					<span id="preco-label" class="property-label"><g:message code="opcaoCardapio.preco.label" default="Preco" /></span>
					
						<span class="property-value" aria-labelledby="preco-label"><g:fieldValue bean="${opcaoCardapioInstance}" field="preco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoCardapioInstance?.observacao}">
				<li class="fieldcontain">
					<span id="observacao-label" class="property-label"><g:message code="opcaoCardapio.observacao.label" default="Observacao" /></span>
					
						<span class="property-value" aria-labelledby="observacao-label"><g:fieldValue bean="${opcaoCardapioInstance}" field="observacao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoCardapioInstance?.cardapio}">
				<li class="fieldcontain">
					<span id="cardapio-label" class="property-label"><g:message code="opcaoCardapio.cardapio.label" default="Cardapio" /></span>
					
						<span class="property-value" aria-labelledby="cardapio-label"><g:link controller="cardapio" action="show" id="${opcaoCardapioInstance?.cardapio?.id}">${opcaoCardapioInstance?.cardapio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoCardapioInstance?.arquivo}">
				<li class="fieldcontain">
					<span id="arquivo-label" class="property-label"><g:message code="opcaoCardapio.arquivo.label" default="Arquivo" /></span>
					
						<span class="property-value" aria-labelledby="arquivo-label"><g:link controller="arquivo" action="show" id="${opcaoCardapioInstance?.arquivo?.id}">${opcaoCardapioInstance?.arquivo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoCardapioInstance?.categoriaOpcaoCardapio}">
				<li class="fieldcontain">
					<span id="categoriaOpcaoCardapio-label" class="property-label"><g:message code="opcaoCardapio.categoriaOpcaoCardapio.label" default="Categoria Opcao Cardapio" /></span>
					
						<span class="property-value" aria-labelledby="categoriaOpcaoCardapio-label"><g:link controller="categoriaOpcaoCardapio" action="show" id="${opcaoCardapioInstance?.categoriaOpcaoCardapio?.id}">${opcaoCardapioInstance?.categoriaOpcaoCardapio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:opcaoCardapioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${opcaoCardapioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
