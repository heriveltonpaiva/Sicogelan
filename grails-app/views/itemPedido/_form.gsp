<%@ page import="br.sicogelan.caixa.ItemPedidoController; br.sicogelan.caixa.ItemPedido" %>
<%@ page import="br.sicogelan.caixa.CategoriaOpcaoCardapio" %>
<%@ page import="br.sicogelan.caixa.OpcaoCardapio" %>
<%@ page import="br.sicogelan.caixa.OpcaoIngrediente" %>
<%@ page import="br.sicogelan.caixa.OpcaoUnidadeMedida" %>

    <div class="panel-body">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
	<label for="opcaoCategoria">
       Escolha uma Categoria:
    </label>
                <g:select id="opcaoCategoria" name="opcaoUnidadeMedida.id" from="${CategoriaOpcaoCardapio.list()}" optionKey="id" required="" value="${itemPedidoInstance?.opcaoUnidadeMedida?.id}" class="form-control"/>
        </div>
    </div>
           <div class="col-md-12">
                <div class="panel panel-default">


<div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">

                <!-- #################### FIM ADICIONADO DIV 1 ############################## -->
                <tr>
                    <th colspan="2">Opção Cardápio</th>
                    <th>Ingredientes</th>
                    <th>R$</th>
                    <th>Quantidade</th>
                    <th>Unidade Medida</th>
                    <td></td>  <!-- TAG ADICIONADA -->
                </tr>
            </thead>

                <tbody>
                <g:each in="${OpcaoCardapio.list()}" status="i" var="opcao">
                    <form data-id="item_${opcao?.id}" data-url="${g.createLink(absolute:true, controller: 'itemPedido', action: 'adicionarItem')}">
                        <tr class="grade-x">
                            <g:hiddenField name="opcaoCardapio.id" value="${opcao.id}" />
                            <td>
                            <img style="width: 100px; height: 100px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${opcao.arquivo.id}")}" />
                        </td>
                            <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoCardapio', 'error')} required">
                                <td>${fieldValue(bean: opcao, field: "descricao")} </td>
                            </div>
                            %{--<td>${OpcaoIngrediente.findByOpcaoCardapio(opcao)} </td>--}%
                            <td>${opcao?.opcaoIngrediente} </td>
                            <td>${fieldValue(bean: opcao, field: "preco")}</td>
                            <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'quantidade', 'error')} required">
                                <td><g:field name="quantidade" class="form-control" type="number" value="${itemPedidoInstance.quantidade}" required=""/></td>
                            </div>
                            <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoUnidadeMedida', 'error')} required" >

                                <td>
                                    <g:select id="opcaoUnidadeMedida" name="opcaoUnidadeMedida.id"
                                              from="${OpcaoUnidadeMedida.findAllByOpcaoCardapio(opcao)}"
                                              optionKey="id" required=""
                                              value="${itemPedidoInstance?.opcaoUnidadeMedida?.id}" class="form-control"/>

                                </td>
                            </div>
                            <td>
                                %{--<button type="submit" class="btn btn-default" onclick="${remoteFunction(action: 'adicionarItem', update:"tabelaItens")}">
                                    Adicionar aos Pedidos
                                </button>--}%
                                <button type="submit" class="btn btn-default">
                                    Adicionar aos Pedidos
                                </button>
                            </td>
                        </tr>
                    </form>
                </g:each>
                </tbody>
            </table>
        </div>
                </div>
           </div>
        </div>
    </div>


<g:form url="[resource:itemPedidoInstance, action:'save']"  name="frmItemPedido">



    <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'status', 'error')} required">
        <div class="form-group">
            <label for="status">
                <g:message code="pedido.status.label" default="Status" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField class="form-control" name="status" required="" value="${pedidoInstance?.status}"/>
        </div>
    </div>

    <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'valorTotal', 'error')} required">
        <div class="form-group">
            <label for="valorTotal">
                <g:message code="pedido.valorTotal.label" default="Valor Total" />
                <span class="required-indicator">*</span>
            </label>
            <g:field class="form-control" name="valorTotal" value="${fieldValue(bean: pedidoInstance, field: 'valorTotal')}" required=""/>
        </div>
    </div>

    <div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'statusConsumo', 'error')} required">
        <div class="form-group">
            <label for="statusConsumo">
                <g:message code="pedido.statusConsumo.label" default="Status Consumo" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField class="form-control" name="statusConsumo" required="" value="${pedidoInstance?.statusConsumo}"/>
        </div>
    </div>

    <g:submitButton  name="create" class="btn btn-primary" value="Finalizar Pedido" />
</g:form>


