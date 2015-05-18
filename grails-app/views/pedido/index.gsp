
<%@ page import="br.sicogelan.caixa.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-pedido" class="content scaffold-list" role="main">
            <!-- #################### ADICIONANDO DIV 1 ############################## -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="${createLink(uri: '/pedido/create')}" class="btn btn-primary" >Novo Pedido</a>  <!--ALTER ENTITY -->

                        <!--Mensagens de Alerta e de Erro -->
                            <g:if test="${flash.message}">
                                <div class="alert alert-info close" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${pedidoInstance}">   <!--ALTER ENTITY -->
                                <ul class="alert alert-danger close" role="alert">
                                    <g:eachError bean="${pedidoInstance}" var="error">   <!--ALTER ENTITY -->
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
					
						<g:sortableColumn property="status" title="${message(code: 'pedido.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="valorTotal" title="${message(code: 'pedido.valorTotal.label', default: 'Valor Total')}" />
					
						<g:sortableColumn property="statusConsumo" title="${message(code: 'pedido.statusConsumo.label', default: 'Status Consumo')}" />

						<th><g:message code="pedido.itemPedido.label" default="Item Pedido" /></th>
					
						<th><g:message code="pedido.mesa.label" default="Mesa" /></th>
					
						<th><g:message code="pedido.registroGeral.label" default="Registro Geral" /></th>
                        <td></td>  <!-- TAG ADICIONADA -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
                    <tr class="gradeA">  <!--TAG ADICIONADA -->
					
						<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "status")}</g:link></td>
					
						<td>${fieldValue(bean: pedidoInstance, field: "valorTotal")}</td>
					
						<td>${fieldValue(bean: pedidoInstance, field: "statusConsumo")}</td>

						<td>${fieldValue(bean: pedidoInstance, field: "itemPedido")}</td>

						<td>${fieldValue(bean: pedidoInstance, field: "mesa")}</td>
					
						<td>${fieldValue(bean: pedidoInstance, field: "registroGeral")}</td>
                        <!-- ADICIONADO TD EDITAR E DELETAR  --->
                        <td class="col-md-1"> <!--TAG ADICIONADA -->
                        <g:form url="[resource:pedidoInstance, action:'delete']" method="DELETE"> <!--ALTER ENTITY -->

                            <g:link class="btn btn-primary col-sm-12 " action="edit" resource="${pedidoInstance}" ><g:message code="default.button.edit.label" default="Edit" /></g:link> <!--ALTER ENTITY -->
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
                <g:paginate total="${pedidoInstanceCount ?: 0}" /> <!--ALTER ENTITY -->
            </li>
        </ul>
    </nav>
    </div>
    </body>
</html>
