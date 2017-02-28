<master>

<if @emails:rowcount@ not nil and @emails:rowcount@ gt 0><listtemplate name="emails"></listtemplate></if>
<else>#iurix-mail.No_data# <a href="/mail/account-ae">#iurix-mail.Click#</a> #iurix-mail.to_connect_lt#</else>