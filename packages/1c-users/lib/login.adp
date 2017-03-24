<property name='focus' >@focus;literal@</property>

<div id='login_form_popup' data-role='dialog' data-close-button='true' data-overlay='true' data-overlay-color='dialog_overlay' >
	<div style='text-align:center;position:relative;padding: 1rem 4rem;' >
		<p style='text-align:center;' ><b>#1c-users.Login#</b></p>

		<!-- Início do formulário -->
		<formtemplate class='' id='login' ></formtemplate>
		<!-- Fim do formulário -->

		<p style='text-align:center;' ><b>#1c-users.or_using#</b></p>
		<div>
			<a href='#' ><img src='/resources/1c-users/images/logo-google.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>

			<a href="https://www.facebook.com/v2.8/dialog/oauth?client_id=1352605191467865&redirect_uri=@return_url@"><img src='/resources/1c-users/images/logo-facebook.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>
		</div>
		<br>
		<div style='position:absolute;right:.75rem;text-align:right;' >
			<a href='@register_url@' >#acs-subsite.Register#</a><br>
			<a href='@forgotten_pwd_url@' style='float:right' >#acs-subsite.Forgot_your_password#</a>
		</div>
		<br style='line-height:1.5rem;height:1.5rem;' >
	</div>

</div>