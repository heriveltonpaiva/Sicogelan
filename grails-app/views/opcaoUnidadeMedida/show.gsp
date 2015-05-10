
<%@ page import="br.sicogelan.caixa.OpcaoUnidadeMedida" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoUnidadeMedida.label', default: 'OpcaoUnidadeMedida')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-opcaoUnidadeMedida" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-opcaoUnidadeMedida" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list opcaoUnidadeMedida">
			
				<g:if test="${opcaoUnidadeMedidaInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="opcaoUnidadeMedida.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${opcaoUnidadeMedidaInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoUnidadeMedidaInstance?.valorAcrescido}">
				<li class="fieldcontain">
					<span id="valorAcrescido-label" class="property-label"><g:message code="opcaoUnidadeMedida.valorAcrescido.label" default="Valor Acrescido" /></span>
					
						<span class="property-value" aria-labelledby="valorAcrescido-label"><g:fieldValue bean="${opcaoUnidadeMedidaInstance}" field="valorAcrescido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoUnidadeMedidaInstance?.quantidade}">
				<li class="fieldcontain">
					<span id="quantidade-label" class="property-label"><g:message code="opcaoUnidadeMedida.quantidade.label" default="Quantidade" /></span>
					
						<span class="property-value" aria-labelledby="quantidade-label"><g:fieldValue bean="${opcaoUnidadeMedidaInstance}" field="quantidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoUnidadeMedidaInstance?.quantidadeReal}">
				<li class="fieldcontain">
					<span id="quantidadeReal-label" class="property-label"><g:message code="opcaoUnidadeMedida.quantidadeReal.label" default="Quantidade Real" /></span>
					
						<span class="property-value" aria-labelledby="quantidadeReal-label"><g:fieldValue bean="${opcaoUnidadeMedidaInstance}" field="quantidadeReal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${opcaoUnidadeMedidaInstance?.opcaoCardapio}">
				<li class="fieldcontain">
					<span id="opcaoCardapio-label" class="property-label"><g:message code="opcaoUnidadeMedida.opcaoCardapio.label" default="Opcao Cardapio" /></span>
					
						<span class="property-value" aria-labelledby="opcaoCardapio-label"><g:link controller="opcaoCardapio" action="show" id="${opcaoUnidadeMedidaInstance?.opcaoCardapio?.id}">${opcaoUnidadeMedidaInstance?.opcaoCardapio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:opcaoUnidadeMedidaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${opcaoUnidadeMedidaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
