
<div class='header_wrapper' >
  <div class='header_cell header_logo' ><a href="/" >
    <img src="/resources/1c-theme/images/LogoNoir.png" /></a>
  </div>
  <div class='header_cell header_title' >
		Rue de la Servette 45<br>1202 Genève SUISSE<br>+41(0)22 782 83 70
  </div>
  <div class='header_cell header_links' >
    <if @num_of_locales@ gt 1 or @locale_admin_url@ not nil>
      	    <if @num_of_locales@ gt 1>
              <a href="@change_locale_url@">#1c-theme.Idiom#</a>
      	    </if>
      	    <else>
              <if @locale_admin_url@ not nil>
                <a href="@locale_admin_url@">Install locales</a></li>
       	      </if>
      	    </else>
    </if>
    <br>
    <if @login_url@ not nil>
      <a href="javascript:metroDialog.open('#login_form')" title="#acs-subsite.Log_in_to_system#">#acs-subsite.Log_In#</a>
    </if>
    <if @logout_url@ not nil>
      <a href="@logout_url@" title="#acs-subsite.Logout_from_system#">#acs-subsite.Logout#</a>
    </if><br>
    <a href="#" >#1c-theme.Contact#</a>
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
					<span class='caption' ><b>#1c-theme.Remeber_me#</b></span>
					<span class='check' ></span>
				</label>
			</div>
		</form>
		<p style='text-align:center;' ><b>#1c-theme.or_use#</b></p>
		<div>
			<a href='#' ><img src='/resources/1c-theme/images/logo-google.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>
			<a href='#' ><img src='/resources/1c-theme/images/logo-facebook.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>
			<a href='#' ><img src='/resources/1c-theme/images/logo-paypal.svg' style='height:50px;width:auto' /></a>
		</div>
		<br>
		<div style='position:absolute;right:.75rem;text-align:right;' >
			<a href='#' >#1c-theme.Register#</a><br>
			<a href='#' style='float:right' >#1c-theme.Forgot_password#</a>
		</div>
		<br style='line-height:1.5rem;height:1.5rem;' >
	</div>
</div>

