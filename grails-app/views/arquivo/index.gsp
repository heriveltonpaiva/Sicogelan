
<%@ page import="br.sicogelan.comum.ArquivoController; br.sicogelan.comum.Arquivo" %>

		<div id="list-arquivo" class="content scaffold-list" role="main">
            </br>
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel">

                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <g:sortableColumn property="nome" title="${message(code: 'arquivo.nome.label', default: 'Nome')}" />
                                        <g:sortableColumn property="contentType" title="${message(code: 'arquivo.contentType.label', default: 'Content Type')}" />
                                        <g:sortableColumn property="arquivo" title="${message(code: 'arquivo.arquivo.label', default: 'Arquivo')}" />
                                        <td></td>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${arquivoInstanceList}" status="i" var="arquivoInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                            <td><g:link action="show" id="${arquivoInstance.id}">${fieldValue(bean: arquivoInstance, field: "nome")}</g:link></td>

                                            <td>${fieldValue(bean: arquivoInstance, field: "contentType")}</td>


                                            <td>
                                                <img style="width: 200px; height: 200px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${arquivoInstance.id}")}" width='300' />
                                            </td>
                                            <td>
                                                <g:form url="[resource:arquivoInstance, action:'delete']" method="DELETE">

                                                        <g:link class="btn btn-primary " action="edit" resource="${arquivoInstance}" ><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                                        <g:actionSubmit  class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label',
                                                                default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message',
                                                                default: 'Você tem certeza?')}');"/>

                                                </g:form>
                                            </td>
                                        </tr>
                                    </g:each>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Paginador -->
                <nav>
                    <ul class="pagination">
                        <li>
				            <g:paginate class="pagination" total="${arquivoInstanceListCount ?: 0}" />
                        </li>
                    </ul>
                </nav>

		</div>

	</body>
</html>
