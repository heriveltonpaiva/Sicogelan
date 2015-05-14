
<%@ page import="br.sicogelan.caixa.OpcaoCardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoCardapio.label', default: 'OpcaoCardapio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-opcaoCardapio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-opcaoCardapio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'opcaoCardapio.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'opcaoCardapio.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="observacao" title="${message(code: 'opcaoCardapio.observacao.label', default: 'Observacao')}" />
					
						<th><g:message code="opcaoCardapio.cardapio.label" default="Cardapio" /></th>
					
						<th><g:message code="opcaoCardapio.arquivo.label" default="Arquivo" /></th>
					
						<th><g:message code="opcaoCardapio.categoriaOpcaoCardapio.label" default="Categoria Opcao Cardapio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${opcaoCardapioInstanceList}" status="i" var="opcaoCardapioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${opcaoCardapioInstance.id}">${fieldValue(bean: opcaoCardapioInstance, field: "descricao")}</g:link></td>
					
						<td>${fieldValue(bean: opcaoCardapioInstance, field: "preco")}</td>
					
						<td>${fieldValue(bean: opcaoCardapioInstance, field: "observacao")}</td>
					
						<td>${fieldValue(bean: opcaoCardapioInstance, field: "cardapio")}</td>

                        <td>
                            <img style="width: 200px; height: 200px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${opcaoCardapioInstance.id}")}" width='300' />
                        </td>
					
						<td>${fieldValue(bean: opcaoCardapioInstance, field: "categoriaOpcaoCardapio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${opcaoCardapioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
