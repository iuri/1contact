<div class='header' >
	<div class='header_cell header_logo' >
		<a href='index' ><img src='/resources/1c-theme/images/logo.png' /></a>
	</div>
	<div class='header_cell header_title' >
		Rue de la Servette 45<br>1202 Genève SUISSE<br>+41 022 782 8370
	</div>
	<div class='header_cell' style='text-align:left;vertical-align:middle;' >
		<a href='#' ><span class='mif-menu mif-2x'></span></a>
	</div>
	<div class='header_cell header_links' style='vertical-align:top;' >
		<select name='select_language' id='select_language' style='margin:0;padding:0;' >
			<option>Francês</option>
			<option>Inglês</option>
			<option>Portugês</option>
		</select>
		<br>
		
		<!-- Início do botão de login -->
		<if @logout_url@ not nil>
			<a href="@logout_url@" title="#acs-subsite.Logout_from_system#">#acs-subsite.Logout#</a>
		</if>
		<else>
			<a href="javascript:metroDialog.open('#login_form');" title="#acs-subsite.Log_in_to_system#" >#acs-subsite.Log_In#</a>
        </else>

        <br>
		<a href='#' >Contato</a>
	</div>
</div>

<!-- Popup com formulário de login -->
<include src='../../1c-users/lib/login' />