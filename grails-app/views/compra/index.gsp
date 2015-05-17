
<%@ page import="br.sicogelan.caixa.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-compra" class="content scaffold-list" role="main">
            <!-- #################### ADICIONANDO DIV 1 ############################## -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="${createLink(uri: '/compra/create')}" class="btn btn-primary" >Nova Categoria Opção Cardápio</a>  <!--ALTER ENTITY -->

                        <!--Mensagens de Alerta e de Erro -->
                            <g:if test="${flash.message}">
                                <div class="alert alert-info close" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${compraInstance}">   <!--ALTER ENTITY -->
                                <ul class="alert alert-danger close" role="alert">
                                    <g:eachError bean="${compraInstance}" var="error">   <!--ALTER ENTITY -->
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                        <!--Fim Mensagens de Alerta e de Erro -->

                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">

                                    <!-- #################### FIM ADICIONADO DIV 1 ############################## -->
					<tr>
					
						<th><g:message code="compra.produto.label" default="Produto" /></th>
					
						<g:sortableColumn property="quantidade" title="${message(code: 'compra.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="quantidadeReal" title="${message(code: 'compra.quantidadeReal.label', default: 'Quantidade Real')}" />
					
						<g:sortableColumn property="observacao" title="${message(code: 'compra.observacao.label', default: 'Observacao')}" />
					
						<th><g:message code="compra.registroGeral.label" default="Registro Geral" /></th>
					
						<g:sortableColumn property="valor" title="${message(code: 'compra.valor.label', default: 'Valor')}" />
                        <td></td>  <!-- TAG ADICIONADA -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${compraInstanceList}" status="i" var="compraInstance">
                    <tr class="gradeA">  <!--TAG ADICIONADA -->
					
						<td><g:link action="show" id="${compraInstance.id}">${fieldValue(bean: compraInstance, field: "produto")}</g:link></td>
					
						<td>${fieldValue(bean: compraInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "quantidadeReal")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "observacao")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "registroGeral")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "valor")}</td>
                        <!-- ADICIONADO TD EDITAR E DELETAR  --->
                        <td class="col-md-1">
                            <g:form url="[resource:compraInstance, action:'delete']" method="DELETE"> <!--ALTER ENTITY -->

                                <g:link class="btn btn-primary col-sm-12 " action="edit" resource="${compraInstance}" ><g:message code="default.button.edit.label" default="Edit" /></g:link> <!--ALTER ENTITY -->
                                <g:actionSubmit  class="btn btn-danger col-sm-12" action="delete" value="${message(code: 'default.button.delete.label',
                                        default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message',
                                        default: 'Você tem certeza?')}');"/>

                            </g:form>
                        </td>
                        <!-- FIM ADICIONADO TD EDITAR E DELETAR  --->
                    </tr>
                </g:each>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        </div>
    <!--Paginador -->
    <nav>
        <ul class="pagination">
            <li>
                <g:paginate total="${compraInstanceCount ?: 0}" /> <!--ALTER ENTITY -->
            </li>
        </ul>
    </nav>
    </div>
    </body>
</html>
