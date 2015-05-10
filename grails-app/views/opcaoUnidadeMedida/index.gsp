
<%@ page import="br.sicogelan.caixa.OpcaoUnidadeMedida" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoUnidadeMedida.label', default: 'OpcaoUnidadeMedida')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-opcaoUnidadeMedida" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-opcaoUnidadeMedida" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'opcaoUnidadeMedida.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="valorAcrescido" title="${message(code: 'opcaoUnidadeMedida.valorAcrescido.label', default: 'Valor Acrescido')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'opcaoUnidadeMedida.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="quantidadeReal" title="${message(code: 'opcaoUnidadeMedida.quantidadeReal.label', default: 'Quantidade Real')}" />
					
						<th><g:message code="opcaoUnidadeMedida.opcaoCardapio.label" default="Opcao Cardapio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${opcaoUnidadeMedidaInstanceList}" status="i" var="opcaoUnidadeMedidaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${opcaoUnidadeMedidaInstance.id}">${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "descricao")}</g:link></td>
					
						<td>${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "valorAcrescido")}</td>
					
						<td>${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "quantidadeReal")}</td>
					
						<td>${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "opcaoCardapio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${opcaoUnidadeMedidaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
