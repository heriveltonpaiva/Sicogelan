
<%@ page import="br.sicogelan.caixa.Cardapio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-cardapio" class="content scaffold-list" role="main">
            <!-- #################### ADICIONANDO DIV 1 ############################## -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="${createLink(uri: '/cardapio/create')}" class="btn btn-primary" >Novo Cardápio</a>  <!--ALTER ENTITY -->

                        <!--Mensagens de Alerta e de Erro -->
                            <g:if test="${flash.message}">
                                <div class="alert alert-info close" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${cardapioInstance}">   <!--ALTER ENTITY -->
                                <ul class="alert alert-danger close" role="alert">
                                    <g:eachError bean="${cardapioInstance}" var="error">   <!--ALTER ENTITY -->
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
					
						<g:sortableColumn property="descricao" title="${message(code: 'cardapio.descricao.label', default: 'Descricao')}" />
					
						<th><g:message code="cardapio.arquivo.label" default="Arquivo" /></th>
                        <td></td>  <!-- TAG ADICIONADA -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${cardapioInstanceList}" status="i" var="cardapioInstance">
                    <tr class="gradeA">  <!--TAG ADICIONADA -->
					
						<td><g:link action="show" id="${cardapioInstance.id}">${fieldValue(bean: cardapioInstance, field: "descricao")}</g:link></td>

                        <td>
                            <img style="width: 200px; height: 200px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${cardapioInstance.arquivo.id}")}" width='300' />
                        </td>
                        <!-- ADICIONADO TD EDITAR E DELETAR  --->
                        <td class="col-md-1">
                            <g:form url="[resource:cardapioInstance, action:'delete']" method="DELETE"> <!--ALTER ENTITY -->

                                <g:link class="btn btn-primary col-sm-12 " action="edit" resource="${cardapioInstance}" ><g:message code="default.button.edit.label" default="Edit" /></g:link> <!--ALTER ENTITY -->
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
                <g:paginate total="${cardapioInstanceCount ?: 0}" /> <!--ALTER ENTITY -->
            </li>
        </ul>
    </nav>
    </div>
    </body>
</html>
