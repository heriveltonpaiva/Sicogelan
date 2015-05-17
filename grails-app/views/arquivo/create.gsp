<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'arquivo.label', default: 'Arquivo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <div id="page-inner">
    <div class="col-md-10 col-sm-10">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="${createLink(uri: '/')}" class="btn btn-primary" ><g:message code="default.home.label"/></a>
                <g:link class="btn btn-info" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
            </div>
        <!--Mensagens de Alerta e de Erro -->
            <g:if test="${flash.message}">
                <div class="alert alert-info close" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${arquivoInstance}">
                <ul class="alert alert-danger close" role="alert">
                    <g:eachError bean="${arquivoInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
        <!--Fim Mensagens de Alerta e de Erro -->
            <div class="panel-body">
                <ul class="nav nav-tabs">

                    <g:if test="${indexTab==0}">
                        <li class="active" id="tabView0"><a href="#formulario" data-toggle="tab">Cadastro</a></li>
                        <li class="" id="tabView1"><a href="#listagem" data-toggle="tab">Listagem</a></li>
                    </g:if>
                    <g:else test="${indexTab==1}">
                        <li class="" id="tabView0"><a href="#formulario" data-toggle="tab">Cadastro</a></li>
                        <li class="active" id="tabView1"><a href="#listagem" data-toggle="tab">Listagem</a></li>
                    </g:else>
                </ul>
                <div class="tab-content">

                        <div class="tab-pane fade active in" id="formulario" >
                            <div id="create-arquivo" class="content scaffold-create" role="main">
                                <!-- /. NAV SIDE  -->
                                <div class="row">
                                    <div class="col-md-12">
                                    <!-- Form Elements -->
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <g:form url="[resource:arquivoInstance, action:'save']"  enctype="multipart/form-data">
                                                        <fieldset class="form">
                                                            <g:render template="form"/>
                                                        </fieldset>
                                                        </br>
                                                        <fieldset class="buttons">
                                                            <g:submitButton name="create" class="btn btn-default" value="Salvar" />
                                                            <button type="reset" class="btn btn-primary">Limpar</button>
                                                        </fieldset>

                                                    </g:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <div class="tab-pane fade" id="listagem"   >

                 <g:include controller="arquivo" action="index" />

                     </div>


             </div>
        </div>
    </div>

            <!-- /. ROW  -->
    </div>
        <g:javascript >
            $( document ).ready(function() {
                if(document.getElementById("tabView0").className==="active"){

                    document.getElementById("tabView0").className=''
                    document.getElementById("tabView1").className='active'

                    document.getElementById("listagem").className='tab-pane fade active in'
                    document.getElementById("formulario").className='tab-pane fade'

                }else {
                    document.getElementById("tabView1").className=''
                    document.getElementById("tabView0").className='active'

                    document.getElementById("formulario").className='tab-pane fade active in'
                    document.getElementById("listagem").className='tab-pane fade'
                }
                });
        </g:javascript>
	</body>

</html>
