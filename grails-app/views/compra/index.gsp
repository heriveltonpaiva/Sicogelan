
<%@ page import="br.sicogelan.caixa.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-compra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-compra" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="compra.produto.label" default="Produto" /></th>
					
						<g:sortableColumn property="quantidade" title="${message(code: 'compra.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="quantidadeReal" title="${message(code: 'compra.quantidadeReal.label', default: 'Quantidade Real')}" />
					
						<g:sortableColumn property="observacao" title="${message(code: 'compra.observacao.label', default: 'Observacao')}" />
					
						<th><g:message code="compra.registroGeral.label" default="Registro Geral" /></th>
					
						<g:sortableColumn property="valor" title="${message(code: 'compra.valor.label', default: 'Valor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${compraInstanceList}" status="i" var="compraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${compraInstance.id}">${fieldValue(bean: compraInstance, field: "produto")}</g:link></td>
					
						<td>${fieldValue(bean: compraInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "quantidadeReal")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "observacao")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "registroGeral")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "valor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${compraInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
