
<%@ page import="br.sicogelan.caixa.ItemPedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemPedido.label', default: 'ItemPedido')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-itemPedido" class="content scaffold-list" role="main">
            <!-- #################### ADICIONANDO DIV 1 ############################## -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="${createLink(uri: '/itemPedido/create')}" class="btn btn-primary" >Novo Item Pedido</a>  <!--ALTER ENTITY -->

                        <!--Mensagens de Alerta e de Erro -->
                            <g:if test="${flash.message}">
                                <div class="alert alert-info close" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${itemPedidoInstance}">   <!--ALTER ENTITY -->
                                <ul class="alert alert-danger close" role="alert">
                                    <g:eachError bean="${itemPedidoInstance}" var="error">   <!--ALTER ENTITY -->
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
                        <th><g:message code="opcaoCardapio.arquivo.label" default="Foto da Opção Cardápio" /></th>
                        <th><g:message code="opcaoUnidadeMedida.opcaoCardapio.label" default="Opcao Cardapio" /></th>
                        <g:sortableColumn property="quantidade" title="${message(code: 'itemPedido.quantidade.label', default: 'Quantidade')}" />
						<th><g:message code="itemPedido.opcaoUnidadeMedida.label" default="Opcao Unidade Medida" /></th>
                         <td></td>  <!-- TAG ADICIONADA -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemPedidoInstanceList}" status="i" var="itemPedidoInstance">
                    <tr class="gradeA">  <!--TAG ADICIONADA -->
                        <td>
                            <img style="width: 200px; height: 200px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${itemPedidoInstance.opcaoCardapio.arquivo.id}")}" width='300' />
                        </td>
                        <td>${fieldValue(bean: itemPedidoInstance, field: "opcaoCardapio")}</td>
						<td><g:link action="show" id="${itemPedidoInstance.id}">${fieldValue(bean: itemPedidoInstance, field: "quantidade")}</g:link></td>
						<td>${fieldValue(bean: itemPedidoInstance, field: "opcaoUnidadeMedida")}</td>
                        <!-- ADICIONADO TD EDITAR E DELETAR  --->
                        <td class="col-md-1">
                        <g:form url="[resource:itemPedidoInstance, action:'delete']" method="DELETE"> <!--ALTER ENTITY -->

                            <g:link class="btn btn-primary col-sm-12 " action="edit" resource="${itemPedidoInstance}" ><g:message code="default.button.edit.label" default="Edit" /></g:link> <!--ALTER ENTITY -->

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
                <g:paginate total="${itemPedidoInstanceCount ?: 0}" /> <!--ALTER ENTITY -->
            </li>
        </ul>
    </nav>
    </div>
    </body>
</html>

