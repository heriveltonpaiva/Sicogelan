
<%@ page import="br.sicogelan.comum.RegistroGeral" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registroGeral.label', default: 'RegistroGeral')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-registroGeral" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-registroGeral" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="permissao" title="${message(code: 'registroGeral.permissao.label', default: 'Permissao')}" />
					
						<g:sortableColumn property="ip" title="${message(code: 'registroGeral.ip.label', default: 'Ip')}" />
					
						<th><g:message code="registroGeral.usuario.label" default="Usuario" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'registroGeral.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registroGeralInstanceList}" status="i" var="registroGeralInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${registroGeralInstance.id}">${fieldValue(bean: registroGeralInstance, field: "permissao")}</g:link></td>
					
						<td>${fieldValue(bean: registroGeralInstance, field: "ip")}</td>
					
						<td>${fieldValue(bean: registroGeralInstance, field: "usuario")}</td>
					
						<td><g:formatDate date="${registroGeralInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registroGeralInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
