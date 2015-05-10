
<%@ page import="br.sicogelan.caixa.Mesa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mesa.label', default: 'Mesa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mesa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mesa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'mesa.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'mesa.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'mesa.codigo.label', default: 'Codigo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mesaInstanceList}" status="i" var="mesaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mesaInstance.id}">${fieldValue(bean: mesaInstance, field: "descricao")}</g:link></td>
					
						<td>${fieldValue(bean: mesaInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: mesaInstance, field: "codigo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mesaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
