<head>
	<link rel='stylesheet' href='css/header.css' type='text/css' />
</head>

<body>

<div class='header_wrapper' >
	<div class='header_cell header_logo' >
		<a href='./' ><img src='images/logo.png' /></a>
	</div>
	<div class='header_cell header_title' >
		Rue de la Servette 45<br>1202 Genève SUISSE<br>+41(0)22 782 83 70
	</div>
	<div class='header_cell header_links' >
		<a href='' >Idioma</a><br>
		<a href="javascript:metroDialog.open('#login_form')" >Login</a><br>
		<a href='#' >Contato</a>
	</div>
</div>

<!-- Popup com formulário de login -->
<div id='login_form' data-role='dialog' data-close-button='true' data-overlay='true' data-overlay-color='dialog_overlay' >
	<div style='text-align:center;position:relative;padding: 1rem 4rem;' >
		<p style='text-align:center;' ><b>Fazer login com sua conta:</b></p>
		<form>
			<div class='input-control text' style='width:12em;' ><input name='login_field' type='text' placeholder='Email' /></div><br>
			<div class='input-control text' style='width:12em;' ><input name='password_field' type='password' placeholder='Senha' /></div><br>
			<div class='button colour_button' style='width:12em;' >Login</div><br>
			<div style='text-align:right;' >
				<label class='input-control checkbox small-check' >
					<input type='checkbox' name='remember_field' />
					<span class='caption' ><b>Lembrar-me</b></span>
					<span class='check' ></span>
				</label>
			</div>
		</form>
		<p style='text-align:center;' ><b>ou usando:</b></p>
		<div>
			<a href='#' ><img src='images/logo-google.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>
			<a href='#' ><img src='images/logo-facebook.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>
			<a href='#' ><img src='images/logo-paypal.svg' style='height:50px;width:auto' /></a>
		</div>
		<br>
		<div style='position:absolute;right:.75rem;text-align:right;' >
			<a href='#' >Cadastrar-se</a><br>
			<a href='#' style='float:right' >Esqueci minha senha</a>
		</div>
		<br style='line-height:1.5rem;height:1.5rem;' >
	</div>
</div>

</body>