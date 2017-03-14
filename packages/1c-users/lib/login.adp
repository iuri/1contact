<property name="focus">@focus;literal@</property>

<!-- Popup com formulário de login -->
<div id='login_form' data-role='dialog' data-close-button='true' data-overlay='true' data-overlay-color='dialog_overlay' >
  <div style='text-align:center;position:relative;padding: 1rem 4rem;' >
    <p style='text-align:center;' ><b>#1c-users.Login_to_your_account#</b></p>


      <formtemplate id="login"></formtemplate>

      <p style='text-align:center;' ><b>#1c-users.or_using#</b></p>
		<div>
			<a href='#' ><img src='/resources/1c-theme/images/logo-google.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>
			<a href='#' ><img src='/resources/1c-theme/images/logo-facebook.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>
		</div>
		<br>
		<div style='position:absolute;right:.75rem;text-align:right;' >
			<if @self_registration@ eq 1>		   
			  <if @register_url@ not nil>
  			    <a href="@register_url@">#acs-subsite.Register#</a><br>
			  </if>
			</if>

			<if @forgotten_pwd_url@ not nil>
  			  <if @email_forgotten_password_p@ true>
  			    <a href="@forgotten_pwd_url@" style="float: right;">#acs-subsite.Forgot_your_password#</a>
  			    <br>
  			  </if>
			</if>

		</div>
		<br style='line-height:1.5rem;height:1.5rem;' >
	</div>
</div>