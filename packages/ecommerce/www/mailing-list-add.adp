<master>
  <property name="doc(title)">@title;noquote@</property>
  <property name="context">@context;noquote@</property>
  <property name="signatory">@ec_system_owner;noquote@</property>

<blockquote>
  We think that you are @user_name@.  If not, please <a href="@register_link@">log in</a>.  Otherwise,
  <form method="post" action="mailing-list-add-2">
    @hidden_form_variables;noquote@
    <center>
      <input type="submit" value="Continue">
    </center>
  </form>
</blockquote>
