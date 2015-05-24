<%@ page import="br.sicogelan.caixa.ItemPedidoController; br.sicogelan.caixa.ItemPedido" %>
<%@ page import="br.sicogelan.caixa.CategoriaOpcaoCardapio" %>
<%@ page import="br.sicogelan.caixa.OpcaoCardapio" %>
<%@ page import="br.sicogelan.caixa.OpcaoIngrediente" %>
<%@ page import="br.sicogelan.caixa.OpcaoUnidadeMedida" %>

<g:form url="[resource:itemPedidoInstance, action:'adicionarItem']"  >
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
                    <tr class="grade-x">
                        <g:hiddenField name="opcaoCardapio.id" value="${itemPedidoInstance?.opcaoCardapio?.id}" />
                        <td> <img style="width: 100px; height: 100px" src="${createLink(controller:'arquivo', action:'showImagem', id:"${opcao.arquivo.id}")}" /></td>
                        <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoCardapio', 'error')} required">
                            <td>${fieldValue(bean: opcao, field: "descricao")} </td>
                        </div>
                        <td>${OpcaoIngrediente.findByOpcaoCardapio(opcao)} </td>
                        <td>${fieldValue(bean: opcao, field: "preco")}</td>
                        <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'quantidade', 'error')} required">
                        <td><g:field name="quantidade" class="form-control" type="number" value="${itemPedidoInstance.quantidade}" required=""/></td>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoUnidadeMedida', 'error')} required">
                        <td>
                           <g:select id="opcaoUnidadeMedida" name="opcaoUnidadeMedida.id" from="${OpcaoUnidadeMedida.findByOpcaoCardapio(opcao)}" optionKey="id" required="" value="${itemPedidoInstance?.opcaoUnidadeMedida?.id}" class="form-control"/>

                        </td>
                        </div>
                        <td> <button type="submit" class="btn btn-default" onclick="${remoteFunction(action:'adicionarItem', update:"tabelaItens")}">Adicionar aos Pedidos</button></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
                </div>
           </div>
        </div>
    </div>



    <div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoCardapio', 'error')} required">
        <div class="form-group">
            <label for="opcaoCardapio">
                <g:message code="itemPedido.opcaoCardapio.label" default="Opcao Cardapio" />
                <span class="required-indicator">*</span>
            </label>
            <g:select id="opcaoCardapio" name="opcaoCardapio.id" from="${br.sicogelan.caixa.OpcaoCardapio.list()}" optionKey="id" required="" value="${itemPedidoInstance?.opcaoCardapio?.id}" class="form-control"/>
        </div>
    </div>

<div class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'opcaoUnidadeMedida', 'error')} required">
<div class="form-group">
	<label for="opcaoUnidadeMedida">
		<g:message code="itemPedido.opcaoUnidadeMedida.label" default="Opcao Unidade Medida" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="opcaoUnidadeMedida" name="opcaoUnidadeMedida.id" from="${br.sicogelan.caixa.OpcaoUnidadeMedida.list()}" optionKey="id" required="" value="${itemPedidoInstance?.opcaoUnidadeMedida?.id}" class="form-control"/>
</div>
</div>
</g:form>


