
<%@ page import="br.sicogelan.caixa.Mesa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mesa.label', default: 'Mesa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-mesa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>


            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="${createLink(uri: '/mesa/create')}" class="btn btn-primary" >Nova Mesa</a>

                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'mesa.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'mesa.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'mesa.codigo.label', default: 'Codigo')}" />

                                    </tr>
                                    <g:each in="${mesaInstanceList}" status="i" var="mesa">
                                        <tr class="gradeA">
                                            <td>${mesa.descricao}</td>
                                            <td>${mesa.status}</td>
                                            <td>${mesa.codigo}</td>
                                        </tr>
                                    </g:each>
                                </table>
                            </div></div>
                    </div></div></div></div>
			<div class="pagination">
				<g:paginate total="${mesaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
