
<%@ page import="br.sicogelan.caixa.ItemPedido; br.sicogelan.caixa.Pedido" %>
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
                        <th> <label for="status">
                                        <g:message code="pedido.status.label" default="Status Pedido" />
                        </label></th>
						<g:sortableColumn property="status" title="${message(code: 'pedido.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="valorTotal" title="${message(code: 'pedido.valorTotal.label', default: 'Valor Total')}" />
					
						<g:sortableColumn property="statusConsumo" title="${message(code: 'pedido.statusConsumo.label', default: 'Status Consumo')}" />

						<th><g:message code="pedido.mesa.label" default="Mesa" /></th>

                        <th>Hora - Data</th>
						<th><div align="center">Opção | Unidade Medida  | Quantidade | R$</div></th>
                        <td></td>  <!-- TAG ADICIONADA -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
                    <tr class="gradeA">  <!--TAG ADICIONADA -->
                        <td>
                            <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'status', 'error')} required">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <g:select id="status" name="status" from="['Para Fazer', 'Fazendo', 'Feito', 'Servido', 'Finalizado']"  required="" value="${pedidoInstance?.status}" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
						<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "status")}</g:link></td>
					
						<td><g:formatNumber number="${pedidoInstance.valorTotal}" type="currency"  /></td>
					
						<td>${fieldValue(bean: pedidoInstance, field: "statusConsumo")}</td>

						<td>${fieldValue(bean: pedidoInstance, field: "mesa")}</td>

                        <td><g:formatDate format="HH:mm:ss - dd-MM-yyyy " date="${pedidoInstance.registroGeral.dateCreated}"/></td>
                        <td>
                           <table class="table table-striped table-hover">

                            <tbody>
                    <g:each in="${br.sicogelan.caixa.ItemPedido.findAllByPedido(pedidoInstance)}" status="b" var="item">
                            <tr>
                                <td>
                                    <img style="width: 50px; height: 50px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${item.opcaoCardapio.arquivo.id}")}" width='50' />
                                </td>
                                <td>${item.opcaoCardapio.descricao}</td>
                                <td>${item.opcaoUnidadeMedida.descricao}</td>
                                <td>${item.quantidade}</td>
                                <td><g:formatNumber number="${(item.opcaoCardapio.preco+item.opcaoUnidadeMedida.valorAcrescido)*item.quantidade}" type="currency" /></td>
                                <td> <button type="button" class="small btn-danger" title="Remover"><i class="fa fa-power-off"></i></button></td>
                            </tr>
                    </g:each>
                            </tbody>
                            </table>


                        </td>
                        <!-- ADICIONADO TD EDITAR E DELETAR  --->
                        <td class="col-md-1"> <!--TAG ADICIONADA -->
                   <button  class="btn btn-info col-sm-12" type="button" ><i class="fa fa-save"></i>Finalizar</button>
                        <g:form url="[resource:pedidoInstance, action:'delete']" method="DELETE"> <!--ALTER ENTITY -->
                            <g:actionSubmit  class="btn btn-danger col-sm-12" action="delete" value="Cancelar" onclick="return confirm('${message(code: 'default.button.delete.confirm.message',
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
        <p id="itensPedido"></p>
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
