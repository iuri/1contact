<master src="/www/blank-master">


<div style="width:1260px;height:550px;color:red; background:url('http://www.allies.in/wp-content/uploads/2011/09/Allies-Interactive-Technologies-Home-Screen-contact_bg.jpg');">
  <div style="margin:500px 100px; float:left;">
    <ul class="compact">
        <if @login_url@ not nil>
          <li><a style="color:#FFFFFF; text-decoration:none;" href="@login_url@" title="#acs-subsite.Log_in_to_system#">#acs-subsite.Log_In#</a></li>
        </if>
	<span style="padding-left:20px;">&nbsp;</span>
	<if @register_url@ not nil>
  	  <li><a style="color:#FFFFFF;  text-decoration:none;" href="@register_url@">#acs-subsite.Register#</a></li>
	</if>
      </ul>
</div>


</div>