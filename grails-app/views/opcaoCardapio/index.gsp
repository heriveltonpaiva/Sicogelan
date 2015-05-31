
<%@ page import="br.sicogelan.caixa.OpcaoCardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'opcaoCardapio.label', default: 'OpcaoCardapio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-opcaoCardapio" class="content scaffold-list" role="main">
            <!-- #################### ADICIONANDO DIV 1 ############################## -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="${createLink(uri: '/opcaoCardapio/create')}" class="btn btn-primary" >Nova Opção Cardápio</a>  <!--ALTER ENTITY -->

                        <!--Mensagens de Alerta e de Erro -->
                            <g:if test="${flash.message}">
                                <div class="alert alert-info close" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${opcaoCardapioInstance}">   <!--ALTER ENTITY -->
                                <ul class="alert alert-danger close" role="alert">
                                    <g:eachError bean="${opcaoCardapioInstance}" var="error">   <!--ALTER ENTITY -->
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
						<g:sortableColumn property="descricao" title="${message(code: 'opcaoCardapio.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="preco" title="${message(code: 'opcaoCardapio.preco.label', default: 'Preco')}" />
					
						<g:sortableColumn property="observacao" title="${message(code: 'opcaoCardapio.observacao.label', default: 'Observacao')}" />
					
						<th><g:message code="opcaoCardapio.cardapio.label" default="Cardapio" /></th>
                                    <th><g:message code="opcaoCardapio.arquivo.label" default="Foto do Cardápio" /></th>
						<th><g:message code="opcaoCardapio.categoriaOpcaoCardapio.label" default="Categoria Opcao Cardapio" /></th>

                                    <th><g:message code="opcaoCardapio.arquivo.label" default="Foto da Categoria" /></th>

                                    <th><g:message code="opcaoCardapio.opcaoIngrediente.label" default="Ingredientes" /></th>
                         <td></td>  <!-- TAG ADICIONADA -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${opcaoCardapioInstanceList}" status="i" var="opcaoCardapioInstance">
                    <tr class="gradeA">  <!--TAG ADICIONADA -->
                        <td>
                            <img style="width: 100px; height: 100px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${opcaoCardapioInstance.arquivo.id}")}" width='300' />
                        </td>
						<td><g:link action="show" id="${opcaoCardapioInstance.id}">${fieldValue(bean: opcaoCardapioInstance, field: "descricao")}</g:link></td>
					
						<td><g:formatNumber number="${(opcaoCardapioInstance.preco)}" type="currency" /></td>
					
						<td>${fieldValue(bean: opcaoCardapioInstance, field: "observacao")}</td>
					
						<td>${fieldValue(bean: opcaoCardapioInstance, field: "cardapio")}</td>
                        <td>
                            <img style="width: 100px; height: 100px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${opcaoCardapioInstance.cardapio.arquivo.id}")}" width='300' />
                        </td>
                        <td>${fieldValue(bean: opcaoCardapioInstance, field: "categoriaOpcaoCardapio")}</td>
                        <td>
                            <img style="width: 100px; height: 100px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${opcaoCardapioInstance.categoriaOpcaoCardapio.arquivo.id}")}" width='300' />
                        </td>
                        <g:if test="${opcaoCardapioInstance.opcaoIngrediente.isEmpty()}">
                            <td>Não Possui Ingredientes</td>
                        </g:if>
                        <g:else>
                            <td>${opcaoCardapioInstance?.opcaoIngrediente} </td>
                        </g:else>
                        <!-- ADICIONADO TD EDITAR E DELETAR  --->
                        <td class="col-md-1"> <!--TAG ADICIONADA -->
                        <g:form url="[resource:opcaoCardapioInstance, action:'delete']" method="DELETE"> <!--ALTER ENTITY -->

                            <g:link class="btn btn-primary col-sm-12 " action="edit" resource="${opcaoCardapioInstance}" ><g:message code="default.button.edit.label" default="Edit" /></g:link> <!--ALTER ENTITY -->
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
                <g:paginate total="${mesaInstanceCount ?: 0}" /> <!--ALTER ENTITY -->
            </li>
        </ul>
    </nav>
    </div>
	</body>
</html>
