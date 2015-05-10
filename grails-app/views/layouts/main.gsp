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
font-size: 16px;"> Ultimo Acesso : 10 de Maio 2015 &nbsp; <a href="${createLink(uri: '/login.gsp')}" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="${assetPath(src:'find_user.png')}" class="user-image img-responsive"/>
					</li>
                    <li>
                        <a class="active-menu"  href=${createLink(uri: '')}><i class="fa fa-dashboard fa-3x"></i> Painel Principal</a>
                    </li>
                    <li>
                        <a  href="${createLink(uri: '/cardapio/index.gsp')}"><i class="fa fa-desktop fa-3x"></i> Cardápio</a>
                    </li>
                    <li>
                        <a  href="${createLink(uri: '/pedido/index.gsp')}"><i class="fa fa-qrcode fa-3x"></i> Pedidos</a>
                    </li>
                    <li  >
                        <a  href="${createLink(uri: '/usuario/index.gsp')}"><i class="fa fa-bar-chart-o fa-3x"></i> Usuarios</a>
                    </li>
                    <li  >
                        <a  href="${createLink(uri: '/mesa/index.gsp')}"><i class="fa fa-table fa-3x"></i> Cadastros <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${createLink(uri: '/mesa/index.gsp')}">Cadastrar Mesa</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/cardapio/index.gsp')}">Cadastrar Cardápio</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/opcaoCardapio/index.gsp')}">Cadastrar Opção Cardápio</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/arquivo/index.gsp')}">Cadastrar Arquivo</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/produto/index.gsp')}">Cadastrar Produto</a>
                            </li>
                            <li>
                                <a href="${createLink(uri: '/opcaoUnidadeMedida/index.gsp')}">Cadastrar Opção Unidade Medida</a>
                            </li>
                        </ul>
                    </li>
                    <li  >
                        <a  href="form.html"><i class="fa fa-edit fa-3x"></i> Ajuda <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Em Desenvolvimento</a>
                            </li>
                            <li>
                                <a href="#">Em Desenvolvimento</a>
                            </li>
                        </ul>
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
