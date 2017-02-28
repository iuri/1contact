<master>
<property name="title">#iurix-mail.Compose_email#</property>
<property name="context">{#iurix-mail.Compose_email#}</property>

<h1>#iurix-mail.Compose_email#</h1>
<table width="100%">
  <tr>
    <td valign="top">
        <if @msg@ not nil>
	    <h1 style="color:red;">@msg;noquote@</h1>
	    </if>
    	    <formtemplate id="send-email"></formtemplate>
    </td>
  </tr>
</table>

