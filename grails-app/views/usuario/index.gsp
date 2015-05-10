
<%@ page import="br.sicogelan.seguranca.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="row">
                <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">

                <a href="${createLink(uri: '/usuario/create')}" class="btn btn-primary" >Novo Usuário</a>

                </div>
            <div class="panel-body">
                <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <tr>

                    <g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Login')}" />
                    <g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Senha')}" />
                    <g:sortableColumn property="accountExpired" title="${message(code: 'usuario.accountExpired.label', default: 'Conta Expirada')}" />
                    <g:sortableColumn property="accountLocked" title="${message(code: 'usuario.accountLocked.label', default: 'Conta Travada')}" />
                    <g:sortableColumn property="enabled" title="${message(code: 'usuario.enabled.label', default: 'Ativo')}" />
                    <g:sortableColumn property="passwordExpired" title="${message(code: 'usuario.passwordExpired.label', default: 'Senha Expirada')}" />

                </tr>
                <g:each in="${usuarioInstanceList}" status="i" var="usuario">
                    <tr class="gradeA">
                        <td>${usuario.username}</td>
                        <td>${usuario.password}</td>
                        <td>${usuario.accountExpired}</td>
                        <td>${usuario.accountLocked}</td>
                        <td>${usuario.enabled}</td>
                        <td>${usuario.passwordExpired}</td>
                    </tr>
                </g:each>
            </table>
            </div></div>
                </div></div></div></div>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
