<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <div class="panel panel-default">
            <div class="panel">
                <div class="panel-body">
                    <div class="table-responsive">
                    <h2 class="form-signin-heading">Sicogelan Login</h2>

                            <form action='${postUrl}' method='POST' id='loginForm' class='form-signin-heading' autocomplete='off'>
                                <div class="form-group">
                                    <label  for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                                    <input type='text' class='form-control' name='j_username' placeholder="Nome do Usuário" id='username'/>
                                </div>

                                <div class="form-group">
                                    <label  for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                                    <input type='password' class='form-control' name='j_password' placeholder="Informe sua Senha" id='password'/>
                                </div>

                                <div class="form-group">
                                    <input type='checkbox'  name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                    <label  for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                                </div>

                                <div class="form-group">
                                    <input class="btn btn-lg btn-danger btn-block" type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
                                </div>
                            </form>

                        </div>
                </div>
                        <g:if test='${flash.message}'>
                            <div class='alert alert-danger'>${flash.message}</div>
                        </g:if>
                </div>
	        </div>
        </div>
    </div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
