
<%@ page import="br.sicogelan.caixa.ItemPedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemPedido.label', default: 'ItemPedido')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemPedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemPedido" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="quantidade" title="${message(code: 'itemPedido.quantidade.label', default: 'Quantidade')}" />
					
						<th><g:message code="itemPedido.opcaoCardapio.label" default="Opcao Cardapio" /></th>
					
						<th><g:message code="itemPedido.opcaoUnidadeMedida.label" default="Opcao Unidade Medida" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemPedidoInstanceList}" status="i" var="itemPedidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemPedidoInstance.id}">${fieldValue(bean: itemPedidoInstance, field: "quantidade")}</g:link></td>
					
						<td>${fieldValue(bean: itemPedidoInstance, field: "opcaoCardapio")}</td>
					
						<td>${fieldValue(bean: itemPedidoInstance, field: "opcaoUnidadeMedida")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemPedidoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
