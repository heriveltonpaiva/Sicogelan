
<%@ page import="br.sicogelan.caixa.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pedido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pedido">
			
				<g:if test="${pedidoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="pedido.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${pedidoInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.valorTotal}">
				<li class="fieldcontain">
					<span id="valorTotal-label" class="property-label"><g:message code="pedido.valorTotal.label" default="Valor Total" /></span>
					
						<span class="property-value" aria-labelledby="valorTotal-label"><g:fieldValue bean="${pedidoInstance}" field="valorTotal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.statusConsumo}">
				<li class="fieldcontain">
					<span id="statusConsumo-label" class="property-label"><g:message code="pedido.statusConsumo.label" default="Status Consumo" /></span>
					
						<span class="property-value" aria-labelledby="statusConsumo-label"><g:fieldValue bean="${pedidoInstance}" field="statusConsumo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.itemPedido}">
				<li class="fieldcontain">
					<span id="itemPedido-label" class="property-label"><g:message code="pedido.itemPedido.label" default="Item Pedido" /></span>
					
						<span class="property-value" aria-labelledby="itemPedido-label"><g:link controller="itemPedido" action="show" id="${pedidoInstance?.itemPedido?.id}">${pedidoInstance?.itemPedido?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.mesa}">
				<li class="fieldcontain">
					<span id="mesa-label" class="property-label"><g:message code="pedido.mesa.label" default="Mesa" /></span>
					
						<span class="property-value" aria-labelledby="mesa-label"><g:link controller="mesa" action="show" id="${pedidoInstance?.mesa?.id}">${pedidoInstance?.mesa?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.registroGeral}">
				<li class="fieldcontain">
					<span id="registroGeral-label" class="property-label"><g:message code="pedido.registroGeral.label" default="Registro Geral" /></span>
					
						<span class="property-value" aria-labelledby="registroGeral-label"><g:link controller="registroGeral" action="show" id="${pedidoInstance?.registroGeral?.id}">${pedidoInstance?.registroGeral?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pedidoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pedidoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
