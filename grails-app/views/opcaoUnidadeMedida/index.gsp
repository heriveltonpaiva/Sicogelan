
<%@ page import="br.sicogelan.caixa.OpcaoUnidadeMedida" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoUnidadeMedida.label', default: 'OpcaoUnidadeMedida')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-opcaoUnidadeMedida" class="content scaffold-list" role="main">
            <!-- #################### ADICIONANDO DIV 1 ############################## -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="${createLink(uri: '/opcaoUnidadeMedida/create')}" class="btn btn-primary" >Nova Opção Unidade Medida</a>  <!--ALTER ENTITY -->

                        <!--Mensagens de Alerta e de Erro -->
                            <g:if test="${flash.message}">
                                <div class="alert alert-info close" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${opcaoUnidadeMedidaInstance}">   <!--ALTER ENTITY -->
                                <ul class="alert alert-danger close" role="alert">
                                    <g:eachError bean="${opcaoUnidadeMedidaInstance}" var="error">   <!--ALTER ENTITY -->
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
						<g:sortableColumn property="descricao" title="${message(code: 'opcaoUnidadeMedida.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="valorAcrescido" title="${message(code: 'opcaoUnidadeMedida.valorAcrescido.label', default: 'Valor Acrescido')}" />
					
						<g:sortableColumn property="quantidade" title="${message(code: 'opcaoUnidadeMedida.quantidade.label', default: 'Quantidade')}" />
					
						<g:sortableColumn property="quantidadeReal" title="${message(code: 'opcaoUnidadeMedida.quantidadeReal.label', default: 'Quantidade Real')}" />


                         <td></td>  <!-- TAG ADICIONADA -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${opcaoUnidadeMedidaInstanceList}" status="i" var="opcaoUnidadeMedidaInstance">
                    <tr class="gradeA">  <!--TAG ADICIONADA -->
                        <td>
                            <img style="width: 200px; height: 200px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${opcaoUnidadeMedidaInstance.opcaoCardapio.arquivo.id}")}" width='300' />
                        </td>
                        <td>${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "opcaoCardapio")}</td>

						<td><g:link action="show" id="${opcaoUnidadeMedidaInstance.id}">${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "descricao")}</g:link></td>
					
						<td>${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "valorAcrescido")}</td>
					
						<td>${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "quantidade")}</td>
					
						<td>${fieldValue(bean: opcaoUnidadeMedidaInstance, field: "quantidadeReal")}</td>
					

                        <!-- ADICIONADO TD EDITAR E DELETAR  --->
                        <td class="col-md-1"> <!--TAG ADICIONADA -->
                        <g:form url="[resource:opcaoUnidadeMedidaInstance, action:'delete']" method="DELETE"> <!--ALTER ENTITY -->

                            <g:link class="btn btn-primary col-sm-12 " action="edit" resource="${opcaoUnidadeMedidaInstance}" ><g:message code="default.button.edit.label" default="Edit" /></g:link> <!--ALTER ENTITY -->
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
                <g:paginate total="${opcaoUnidadeMedidaInstanceCount ?: 0}" /> <!--ALTER ENTITY -->
            </li>
        </ul>
    </nav>
    </div>
    </body>
</html>
