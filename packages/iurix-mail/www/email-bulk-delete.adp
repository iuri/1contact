<master>
<property name="context">@context_bar;noquote@</property>
<property name="title">#iurix-mail.Confirm_email_delete#</property>

<form method="post" action="email-delete">
  <p>#iurix-mail.Are_you_sure_you_want_to_delete#?</p>
  <multiple name="emails">
    @emails.subject;noquote@ - @emails.from_address;noquote@<br>
  </multiple>

<div>
  @hidden_vars;noquote@
  <input type="hidden" name="action" value="delete">
  <input type=submit name=submit.x value=#acs-kernel.common_Yes#>
  <input type=submit name=cancel.x value=#acs-kernel.common_No#>
</div>
</form>





