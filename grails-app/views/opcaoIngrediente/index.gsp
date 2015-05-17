
<%@ page import="br.sicogelan.caixa.OpcaoIngrediente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoIngrediente.label', default: 'OpcaoIngrediente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-opcaoIngrediente" class="content scaffold-list" role="main">
            <!-- #################### ADICIONANDO DIV 1 ############################## -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="${createLink(uri: '/opcaoIngrediente/create')}" class="btn btn-primary" >Nova Opção Ingrediente</a>  <!--ALTER ENTITY -->

                        <!--Mensagens de Alerta e de Erro -->
                            <g:if test="${flash.message}">
                                <div class="alert alert-info close" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${opcaoIngredienteInstance}">   <!--ALTER ENTITY -->
                                <ul class="alert alert-danger close" role="alert">
                                    <g:eachError bean="${opcaoIngredienteInstance}" var="error">   <!--ALTER ENTITY -->
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
					
						<g:sortableColumn property="quantidade" title="${message(code: 'opcaoIngrediente.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="quantidade_real" title="${message(code: 'opcaoIngrediente.quantidade_real.label', default: 'Quantidadereal')}" />
					
						<th><g:message code="opcaoIngrediente.opcaoCardapio.label" default="Opcao Cardapio" /></th>
					
						<th><g:message code="opcaoIngrediente.produto.label" default="Produto" /></th>
                         <td></td>  <!-- TAG ADICIONADA -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${opcaoIngredienteInstanceList}" status="i" var="opcaoIngredienteInstance">
                    <tr class="gradeA">  <!--TAG ADICIONADA -->
					
						<td><g:link action="show" id="${opcaoIngredienteInstance.id}">${fieldValue(bean: opcaoIngredienteInstance, field: "quantidade")}</g:link></td>
					
						<td>${fieldValue(bean: opcaoIngredienteInstance, field: "quantidade_real")}</td>
					
						<td>${fieldValue(bean: opcaoIngredienteInstance, field: "opcaoCardapio")}</td>
					
						<td>${fieldValue(bean: opcaoIngredienteInstance, field: "produto")}</td>
                        <!-- ADICIONADO TD EDITAR E DELETAR  --->
                        <td class="col-md-1"> <!--TAG ADICIONADA -->
                        <g:form url="[resource:opcaoIngredienteInstance, action:'delete']" method="DELETE"> <!--ALTER ENTITY -->

                            <g:link class="btn btn-primary col-sm-12 " action="edit" resource="${opcaoIngredienteInstance}" ><g:message code="default.button.edit.label" default="Edit" /></g:link> <!--ALTER ENTITY -->
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
                <g:paginate total="${opcaoIngredienteInstanceCount ?: 0}" /> <!--ALTER ENTITY -->
            </li>
        </ul>
    </nav>
    </div>
    </body>
</html>
