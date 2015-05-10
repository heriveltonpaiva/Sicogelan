
<%@ page import="br.sicogelan.caixa.OpcaoIngrediente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoIngrediente.label', default: 'OpcaoIngrediente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-opcaoIngrediente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-opcaoIngrediente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="quantidade" title="${message(code: 'opcaoIngrediente.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="quantidade_real" title="${message(code: 'opcaoIngrediente.quantidade_real.label', default: 'Quantidadereal')}" />
					
						<th><g:message code="opcaoIngrediente.opcaoCardapio.label" default="Opcao Cardapio" /></th>
					
						<th><g:message code="opcaoIngrediente.produto.label" default="Produto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${opcaoIngredienteInstanceList}" status="i" var="opcaoIngredienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${opcaoIngredienteInstance.id}">${fieldValue(bean: opcaoIngredienteInstance, field: "quantidade")}</g:link></td>
					
						<td>${fieldValue(bean: opcaoIngredienteInstance, field: "quantidade_real")}</td>
					
						<td>${fieldValue(bean: opcaoIngredienteInstance, field: "opcaoCardapio")}</td>
					
						<td>${fieldValue(bean: opcaoIngredienteInstance, field: "produto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${opcaoIngredienteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
