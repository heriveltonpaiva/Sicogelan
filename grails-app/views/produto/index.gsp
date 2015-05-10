
<%@ page import="br.sicogelan.caixa.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
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

                    <a href="${createLink(uri: '/produto/create')}" class="btn btn-primary" >Novo Produto</a>

                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'produto.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'produto.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="quantidadeReal" title="${message(code: 'produto.quantidadeReal.label', default: 'Quantidade Real')}" />
					
						<g:sortableColumn property="quantidadeMinima" title="${message(code: 'produto.quantidadeMinima.label', default: 'Quantidade Minima')}" />
					
						<g:sortableColumn property="quantidadeMinimaReal" title="${message(code: 'produto.quantidadeMinimaReal.label', default: 'Quantidade Minima Real')}" />
					
					</tr>

                        </tr>
                            <g:each in="${produtoInstanceList}" status="i" var="produto">
                                <tr class="gradeA">
                                    <td>${produto.descricao}</td>
                                    <td>${produto.quantidade}</td>
                                    <td>${produto.quantidadeReal}</td>
                                    <td>${produto.quantidadeMinima}</td>
                                    <td>${produto.quantidadeMinimaReal}</td>
                                </tr>
                            </g:each>
                        </table>
                    </div></div>
            </div></div></div></div>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${produtoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
