<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'itemPedido.label', default: 'ItemPedido')}" /> <!-- ALTER ENTIDADE-->
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>
<!-- ############################## INICIO DIV ADICIONADO 1 ######################################################## !-->
<div id="page-inner">
    <div class="col-md-12 col-sm-12">
        <div class="panel panel-default">
          <!--Mensagens de Alerta e de Erro -->
            <g:if test="${flash.message}">
                <div class="alert alert-info close" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${itemPedidoInstance}"> <!-- ALTER ENTIDADE-->
                <ul class="alert alert-danger close" role="alert">
                    <g:eachError bean="${itemPedidoInstance}" var="error"> <!-- ALTER ENTIDADE-->
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
        <!--Fim Mensagens de Alerta e de Erro -->
            <div class="panel-body">

                <ul class="nav nav-tabs">
                    <li class="active" id="tabView0"><a href="#formulario" data-toggle="tab">Fazer Pedido</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="formulario" >
                        <!-- ########################################### FIM INICIO DIV ADICIONADO 1 ####################################################### -->
                        <div id="create-itemPedido" class="content scaffold-create" role="main"> <!-- ALTER ENTIDADE-->

                        <!-- ######################### INICIO DIV ADICIONADO 2 ############################################ -->
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- Form Elements -->
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                            <!-- #################### FIM INICIO DIV ADICIONADO 2 ########################### -->
                                                <!-- ALTER ENTIDADE-->
                                                    <fieldset class="form">
                                                        <g:render template="form"/>

                                                    </fieldset>
                                            <!--########### FECHAMENTO DIVS ADICIONADO 2 ######################### -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--########### FECHAMENTO DIVS ADICIONADO 1 ######################### -->
</body>
</html>
