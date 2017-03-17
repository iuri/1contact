<div class='header' >
	<div class='header_cell header_logo' >
		<a href='@system_url@' ><img src='/resources/1c-theme/images/logo.png' /></a>
	</div>
	<div class='header_cell header_title' >
		45 Rue de la Servette<br>1202 Genève SUISSE<br>+41 022 782 8370
	</div>
	<div class='header_cell' >
		<a href='#' ><span class='mif-menu mif-2x'></span></a>
	</div>
	<div class='header_cell header_links' >
		
		<div title='Alterar o idioma' >
			<a href='javascript:change_locale("fr_FR");' ><img src='/resources/1c-theme/images/flag-fr.svg' style='width:auto;height:16px;margin-right:.1rem;' /></a>
			<a href='javascript:change_locale("en_US");' ><img src='/resources/1c-theme/images/flag-uk.svg' style='width:auto;height:16px;margin-right:.1rem;' /></a>
			<a href='javascript:change_locale("pt_BR");' ><img src='/resources/1c-theme/images/flag-pt.svg' style='width:auto;height:16px;' /></a>
		</div>

		<!-- Início do botão de login -->
		<if @logout_url@ not nil>
			<a href="@logout_url@" title="#acs-subsite.Logout_from_system#" >#1c-theme.Logout#</a>
		</if>
		<else>
			<a href="javascript:metroDialog.open('#login_form');" title="#acs-subsite.Log_in_to_system#" >#1c-theme.Log_In#</a>
		</else>

		<br>
		<a href='#' >#1c-theme.Contact#</a>
<!--
		<br>
		<select name='select_language' onChange='change_locale();' id='select_language' style='margin:0;padding:0;' >
			<option value="fr_FR">#1c-theme.French#</option>
			<option value="en_US">#1c-theme.English#</option>
			<option value="pt_BR">#1c-theme.Portuguese#</option>
		</select>
-->
	</div>
</div>


<!-- Popup com formulário de login -->
<include src='../../1c-users/lib/login' />



