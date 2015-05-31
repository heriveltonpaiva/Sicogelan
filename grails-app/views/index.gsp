<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
    <div class="row">
        <div class="col-md-10 col-sm-12 col-xs-12">
            <div class="panel panel-back noti-box">
                <span class="icon-box ">
                    <i class="fa fa-desktop"></i>
                </span>
                <div class="text-box" >
                    <p class="main-text">Bem vindo ao Sistema de Controle e Gerenciamento de Lanchonetes - Sicogelan</p>
                    <p class="text-muted">Total controle e acompanhamento dos seus pedidos - Sicogelan</p>
                    <hr />
                    </div></div></div>
    <div class="row">
        <div class="col-md-10 col-sm-12 col-xs-12">
            <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-purple">
                    <i class="fa fa-table"></i>
                </span>
                <h3>Cadastros</h3>
                <hr />
                    <p class="text-muted">
                        <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i>
                            1.1 - <b>Cardápio</b> - O Administrador do sistema poderá cadastrar um ou mais cardápios, para que possa utilizar em determinados períodos, e até mesmo cardápios promocionais.</br>
                            <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.2 - <b>Opção Cardápio</b> - O Administrador poderá cadastrar as comidas,bebidas e sobremesas.</br>
                                <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.3 - <b>Categoria Opção do Cardápio</b> - O Administrador definirá a categoria das opções, ex: Bebidas, Sobremesas, Massas, Pastéis, etc.</br>
                                    <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.4 - <b>Unidade de Medida</b> - O Administrador poderá cadastrar complemento a uma opção do cardápio, Ex: Item do cardápio: Batata Frita 300 g, opção para opção:400 g, - 500 g, com seus respectivos preços.</br>
                                        <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.5 - <b>Item Pedido</b> - O cliente ou atendente escolherá uma opção do cardápio.</br>
                                            <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.6 - <b>Pedido</b> - O cliente ou atendente confirmará a realização do seu pedido, com as suas opções para pedido escolhida.</br>
                                            <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.7 - <b>Mesa</b> - Cada Mesa terá uma identificação única, para que seja possível relacionar o cliente ao pedido.</br>
                                                <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.8 - <b>Produto</b> - O Administrador poderá realizar o cadastro dos produtos que fazem parte dos ingredientes dos itens do cardápio.</br>
                                                    <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.9 - <b>Compras</b> - O Administrador poderá cadastrar toda a entrada de mercadoria, onde realizou a compra, e o valor pago na mercadoria.</br>
                                                        <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                            1.10 - <b>Opção Ingrediente</b> - Cada item do cardápio terá vários ingredientes que são necessário para a produção da opção do cardápio, essa informação é importante para quando os ingredientes acabarem, não será possível servir aquela opção.</br>
                        </span>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10 col-sm-12 col-xs-12">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-purple">
                        <i class="fa fa-edit"></i>
                    </span>
                        <h3>Painel Administrativo</h3>
                        <hr />
                        <p class="text-muted">
                            <span class="text-muted color-bottom-txt"><i class="fa fa-desktop"></i>
                                2.1 - <b>Usuário</b> - O Administrador do sistema poderá cadastrar os usuários que terão acesso ao sistema.</br>
                                <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                                2.2 - <b>Papel</b> - O Administrador poderá cadastrar criar papéis para acesso as funcionalidades.</br>
                                <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i></span>
                                2.3 - <b>Usuario Papel</b> - O Administrador poderá vincular um Papel a um Usuário.</br>

                            </span>
                        </p>
                    </div>
                </div>
            </div>
	</body>
</html>
