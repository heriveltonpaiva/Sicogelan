
<%@ page import="br.sicogelan.comum.Arquivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'arquivo.label', default: 'Arquivo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-arquivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-arquivo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list arquivo">
			
				<g:if test="${arquivoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="arquivo.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${arquivoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${arquivoInstance?.contentType}">
				<li class="fieldcontain">
					<span id="contentType-label" class="property-label"><g:message code="arquivo.contentType.label" default="Content Type" /></span>
					
						<span class="property-value" aria-labelledby="contentType-label"><g:fieldValue bean="${arquivoInstance}" field="contentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${arquivoInstance?.arquivo}">
				<li class="fieldcontain">
					<span id="arquivo-label" class="property-label"><g:message code="arquivo.arquivo.label" default="Arquivo" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:arquivoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${arquivoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
