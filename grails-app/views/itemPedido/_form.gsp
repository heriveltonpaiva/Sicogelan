<%@ page import="br.sicogelan.caixa.ItemPedidoController; br.sicogelan.caixa.ItemPedido" %>
<%@ page import="br.sicogelan.caixa.CategoriaOpcaoCardapio" %>
<%@ page import="br.sicogelan.caixa.OpcaoCardapio" %>
<%@ page import="br.sicogelan.caixa.OpcaoIngrediente" %>
<%@ page import="br.sicogelan.caixa.OpcaoUnidadeMedida" %>

    <div class="panel-body">
        <div class="bs-docs-header" id="content" tabindex="-1">
        </div>
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
                <div class="panel panel-info">

<div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">

                <!-- #################### FIM ADICIONADO DIV 1 ############################## -->
                <tr>
                    <th colspan="2">Opção Cardápio</th>
                    <th>Ingredientes</th>
                    <th>Preço R$</th>
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
                            <g:hiddenField name="username" ><sec:username/></g:hiddenField>
                            <td>
                            <img style="width: 50px; height: 50px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${opcao.arquivo.id}")}" />
                        </td>
                            <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoCardapio', 'error')} required">
                                <td>${fieldValue(bean: opcao, field: "descricao")} </td>
                            </div>
                            %{--<td>${OpcaoIngrediente.findByOpcaoCardapio(opcao)} </td>--}%
                            <g:if test="${opcao.opcaoIngrediente.isEmpty()}">
                                <td>Não Possui Ingredientes</td>
                            </g:if>
                            <g:else>
                                <td>${opcao?.opcaoIngrediente} </td>
                            </g:else>
                            <td><g:formatNumber number="${(opcao.preco)}" type="currency" /></td>
                            <td style="width:10px">
                            <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'quantidade', 'error')} required">

                                <g:field name="quantidade" class="form-control" type="number" value="${itemPedidoInstance.quantidade}" required=""/>

                            </div>
                            </td>
                            <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoUnidadeMedida', 'error')} required" >

                                <td>
                                    <g:select id="opcaoUnidadeMedida" name="opcaoUnidadeMedida.id"
                                              from="${OpcaoUnidadeMedida.findAllByOpcaoCardapio(opcao)}"
                                              optionKey="id" required=""
                                              value="${itemPedidoInstance?.opcaoUnidadeMedida?.id}" class="form-control"/>

                                </td>
                            </div>
                            <td>

                                <button type="submit" class="btn btn-info">
                                    Adicionar ao Pedido
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

    <div class="row">
        <div class="col-md-12">
                   <!-- Advanced Tables -->
            <div class="panel panel-info">
                <div class="panel-heading">
                            Meus Pedidos
                </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                              <table class="table table-striped  table-hover"" id="tblOpcaoCardapio">
                                  <thead>
                                  <tr>
                                      <th>Foto</th>
                                      <th>Opção</th>
                                      <th>Unidade Medida</th>
                                      <th>Preço Unitário</th>
                                      <th>Quantidade</th>
                                      <th>Valor R$</th>
                                  </tr>
                                  </thead>
                                  <tbody id="ajaxRetorno">
                                  </tbody>
                              </table>

                        </div>
                    </div>
            </div>
        </div>
    </div>
    <table>
    <th>Selecione a Mesa:</th>
    <th><div style="margin-left:18px;">Status Consumo</div></th>
    <th><div style="margin-left:18px;">Valor Total R$</div></th>
    <th></th>
    <tr>
    <td >
         <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <div class="form-group">
                        <g:select id="mesa" name="mesa.id" from="${br.sicogelan.caixa.Mesa.list()}" optionKey="id" required="" value="${pedidoInstance?.mesa?.id}" class="form-control"/>
                    </div>
                </div>
            </div>
         </div>
    </td>
    <td>
        <div class="row" style="margin-left:5px;">
            <div class="col-md-12">
                <div class="form-group">
                    <g:select id="status" name="statusConsumo" from="['Local', 'Para Viagem']"  required="" value="${pedidoInstance?.statusConsumo}" class="form-control"/>
                </div>
            </div>
        </div>
    </td>
    <td>
        <div class="row" style="margin-top:-10px; margin-left:5px;">
            <div class="col-md-12">
                    <input class="form-control" id="valorTotal" name="valorTotal" type="text" value="${fieldValue(bean: pedidoInstance, field: 'valorTotal')}" placeholder="R$ 0,00" disabled />
                </div>
            </div>
        </div>
    </td>
    <td >
        <div class="row" style="margin-top:-10px; margin-left:5px;">
            <div class="col-md-12" >
        <g:submitButton   name="create" class="btn btn-primary" value="Finalizar Pedido"  />
    </div></div>
    </td>
    </tr>
    <table>


</g:form>


