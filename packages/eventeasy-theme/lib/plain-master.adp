<master src="/www/blank-master">
<if @doc@ defined><property name="&doc">doc</property></if>
<if @body@ defined><property name="&body">body</property></if>
<if @head@ not nil><property name="head">@head;noquote@</property></if>
<if @focus@ not nil><property name="focus">@focus;noquote@</property></if>
<property name="skip_link">@skip_link;noquote@</property>


<div id="wrapper">
    <div id="subsite-name">
      <if @system_url@ not nil><a href="@system_url@">@subsite_name@</a></if>
      <else>@subsite_name@</else>
    </div>
  <div id="header">
    <div class="block-marker">Free advice: +55 71 2000-3001</div>
    <div id="header-navigation">
      <ul class="compact">
        <li>
          <if @untrusted_user_id@ ne 0>#acs-subsite.Welcome_user#</if>
          <else>#acs-subsite.Not_logged_in#</else> | 
        </li>
        <li><a href="@whos_online_url@" title="#acs-subsite.view_all_online_members#">@num_users_online@ <if @num_users_online@ eq 1>#acs-subsite.Member#</if><else>#acs-subsite.Members#</else> #acs-subsite.Online#</a> |</li>
        <if @pvt_home_url@ not nil>
          <li><a href="@pvt_home_url@" title="#acs-subsite.Change_pass_email_por#">@pvt_home_name@</a> |</li>
        </if>
        <if @login_url@ not nil>
          <li><a href="@login_url@" title="#acs-subsite.Log_in_to_system#">#acs-subsite.Log_In#</a></li>
        </if>
        <if @logout_url@ not nil>
          <li><a href="@logout_url@" title="#acs-subsite.Logout_from_system#">#acs-subsite.Logout#</a></li>
        </if>
      </ul>
    </div>

</div>



                        <div class="fr-text">Sign in</div>
                        <div class="fr-text">Sign Up</div>

                       <div class="fr-text">List your Service</div>
                        <div class="fr-text">List your Venue</div>
