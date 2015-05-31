<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <asset:javascript src="application.js"/>
        <g:layoutHead/>
	<!-- BOOTSTRAP STYLES-->
    <link href="${assetPath(src:'bootstrap.css')}" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="${assetPath(src:'font-awesome.css')}" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="${assetPath(src:'custom.css')}" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=${createLink(uri: '')}>Sicogelan</a>
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> <sec:ifLoggedIn>Bem vindo <sec:username/></sec:ifLoggedIn>
  <sec:ifNotLoggedIn>
      <g:link controller='login' action='auth'>Login</g:link>
  </sec:ifNotLoggedIn>
      <span id='loginLink' style='position: relative; margin-right: 30px; float: right'>
          <sec:ifLoggedIn>
              (<g:link controller='logout' action=''>Logout</g:link>)
          </sec:ifLoggedIn>

      </span>
  </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="${assetPath(src:'logoSicogelan.png')}" class="user-image img-responsive"/>
					</li>
                    <li>
                        <a  href="${createLink(uri: '/pedido/index.gsp')}"><i class="fa fa-desktop fa-3x"></i> Painel Pedidos</a>
                    </li>
                    <li>
                        <a  href="${createLink(uri: '/itemPedido/create.gsp')}"><i class="fa fa-qrcode fa-3x"></i> Fazer Pedido</a>
                    </li>
                    <li  >
                        <a  href="${createLink(uri: '/opcaoCardapio/index.gsp')}"><i class="fa fa-bar-chart-o fa-3x"></i> Opções Cardápio</a>
                    </li>
                    <li  >
                        <a  href="${createLink(uri: '/mesa/index.gsp')}"><i class="fa fa-table fa-3x"></i> Cadastros <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">

                            <li>
                                <a href="${createLink(uri: '/itemPedido/index.gsp')}">Cadastrar ItemPedido</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/opcaoCardapio/index.gsp')}">Cadastrar Opção Cardápio</a>
                            </li>

                            <li>
                                <a href="${createLink(uri: '/opcaoUnidadeMedida/index.gsp')}">Cadastrar Opção Unidade Medida</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/categoriaOpcaoCardapio/index.gsp')}">Cadastrar Categoria Opção Cardapio</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/cardapio/index.gsp')}">Cadastrar Cardápio</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/arquivo/create.gsp')}">Cadastrar Arquivo</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/mesa/index.gsp')}">Cadastrar Mesa</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/opcaoIngrediente/index.gsp')}">Cadastrar Opcão Ingrediente</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/compra/index.gsp')}">Cadastrar Compras</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/produto/index.gsp')}">Cadastrar Produto</a>
                            </li>
                        </ul>
                    </li>

                    <li  >
                        <a  href="form.html"><i class="fa fa-edit fa-3x"></i> Painel Administrativo <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a  href="${createLink(uri: '/usuario/index.gsp')}"> Cadastrar Usuarios</a>
                            </li>
                            <li>
                                <a  href="${createLink(uri: '/papel/index.gsp')}"> Cadastrar Papel</a>
                            </li>
                            <li>
                                <a  href="${createLink(uri: '/usuarioPapel/index.gsp')}"> Cadastrar usuário Papel</a>
                            </li>
                            <li>
                                <a  href="${createLink(uri: '/registroGeral/index.gsp')}"> Cadastrar Registro Geral</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a class="active-menu"  href=${createLink(uri: '/infoGrails.gsp')}><i class="fa fa-dashboard fa-3x"></i> Grails Info</a>
                    </li>
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                    <g:layoutBody/>
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="${assetPath(src:'jquery-1.10.2.js')}"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="${assetPath(src:'bootstrap.min.js')}"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="${assetPath(src:'jquery.metisMenu.js')}"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="${assetPath(src:'custom.js')}"></script>
         <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
   
</body>
</html>
