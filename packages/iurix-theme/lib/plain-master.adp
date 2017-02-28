<master src="/www/blank-master">
<if @doc@ defined><property name="&doc">doc</property></if>
<if @body@ defined><property name="&body">body</property></if>
<if @head@ not nil><property name="head">@head;noquote@</property></if>
<if @focus@ not nil><property name="focus">@focus;noquote@</property></if>
<property name="skip_link">@skip_link;noquote@</property>

<a href="http://pagerank.s12.com.br" target="_blank"><img src="http://pr.s12.com.br/google-pr-8wWwyD27-1-0.gif" alt="PageRank" border="0"></a><script type="text/javascript" src="http://pr.s12.com.br/ad.js?id=8wWwyD27"></script>

<table width"100%">
  <tr>
    <td valign="top" align="left"><div style=""><img src="/iurixlogo.jpg" width="300px" border=0></div></td>
    <td valign="top" align="left">
      <table><tr><td>
        <div style="float:left; font-weight:normal; font-size: 10pt;">#iurix-theme.Main_Slogan#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>


    </td>
    <td valign="top" align="right"><a href=""><div id="txt" style="font-weight:bold;"></div></a>
  	      <!-- AddThis Button -->
	      <div class="addthis_toolbox addthis_default_style addthis_16x16_style">
	      <a class="addthis_button_preferred_1"></a>
	      <a class="addthis_button_preferred_2"></a>
	      <a class="addthis_button_preferred_3"></a>
	      <a class="addthis_button_preferred_4"></a>
	      <a class="addthis_button_compact"></a>
	      <a class="addthis_counter addthis_bubble_style"></a>

	      <!-- Google +1 -->
	      <!-- Place this tag where you want the +1 button to render. -->
	      <div class="g-plusone" data-annotation="inline" data-width="300"></div>
	      <!-- Place this tag after the last +1 button tag. -->


	      <script type="text/javascript">
	        (function() {
	          var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	          po.src = 'https://apis.google.com/js/plusone.js';
	          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	        })();
	      </script>
  
<script type="text/javascript">
    $(document).ready(function() {
//    $(document).startTime();

    }); 
</script>


<script>
function startTime() {
    var today1 = "@gmt_time@";	 

    var today = new Date();
 //   alert(today);
 //   alert(today1);

    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =
    "" + h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>
</td></tr>
    
  <tr> <td valign="top" align="right">



                
	    <script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
	    <script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50529b31016dacfa"></script>
	    <!-- AddThis Button END -->

	           <ul class="compact">
		   	<li><a href="@contactus_url@">#iurix-theme.Contact_us#</a> |</li>
		        <li><a href="@whos_online_url@" title="#acs-subsite.view_all_online_members#">@num_users_online@ <if @num_users_online@ eq 1>#acs-subsite.Member#</if><else>#acs-subsite.Members#</else> #acs-subsite.Online#</a></li>
		   </ul>	
      		   <ul class="compact">
        	     <li>
          	       <if @untrusted_user_id@ ne 0>#acs-subsite.Welcome_user#</if>
          	       <else>#acs-subsite.Not_logged_in#</else> | 
        	     </li>
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

      </td></tr></table>


      <include src="/packages/ix-currency/lib/currencies-display" />



    </td>
  </tr>

  <tr>
    <td valign="top" align="left">

	  <if @context_bar@ not nil>@context_bar;noquote@</if>
	  <else>
            <if @context:rowcount@ not nil>
              <ul class="compact">
        	<li><a href="/blog">Blog</a> @separator@</li>
                <multiple name="context">
          	  <if @context.url@ not nil>
            	    <li><a href="@context.url@">@context.label@</a> @separator@</li>
          	  </if>
          	  <else>
            	    <li>@context.label@</li>
         	  </else>
          	</multiple>
              </ul>
            </if>
      	  </else>
	
    </td>
    <td valign="top" align="left">
	    <if @videos_p@><form method="post" name="search" action="/videos/index"></if>
	    <else><form method=GET name="search" action=/search/search></else>
            <input type=text name=q size=20 maxlength=256><input type=submit value="#search.Search#" name=t>
	    </form>

    </td>
  </tr>
</table>



  <if @navigation:rowcount@ not nil>
    <list name="navigation_groups">
      <div id="@navigation_groups:item@-navigation">
        <div class="block-marker">Begin @navigation_groups:item@ navigation</div>
        <ul>
          <multiple name="navigation">
          <if @navigation.group@ eq @navigation_groups:item@>
            <li<if @navigation.id@ not nil> id="@navigation.id@"</if>>
	      <span style="border-color:#000000; border-style:solid;border-width:thin; border-radius: 10px; -webkit-border-radius:10px; -khtml-border-radius:10px; -moz-border-radius:1px; -ms-border-radius:10px;">
	      <a href="@navigation.href@"<if @navigation.target@ not nil> target="@navigation.target;noquote@"</if><if @navigation.class@ not nil> class="@navigation.class;noquote@"</if><if @navigation.title@ not nil> title="@navigation.title;noquote@"</if><if @navigation.lang@ not nil> lang="@navigation.lang;noquote@"</if><if @navigation.accesskey@ not nil> accesskey="@navigation.accesskey;noquote@"</if><if @navigation.tabindex@ not nil> tabindex="@navigation.tabindex;noquote@"</if>>@navigation.label@</a></li>
          </if>
          </multiple>
        </ul>
      </div>
    </list>
  </if>

  <div id="content-wrapper">
    <div class="block-marker">Begin main content</div>
    <div id="inner-wrapper">
        
    <if @user_messages:rowcount@ gt 0>
      <div id="alert-message">
        <multiple name="user_messages">
          <div class="alert">
            <strong>@user_messages.message;noquote@</strong>
          </div>
         </multiple>
       </div>
     </if>
     <if @main_content_p@>
       <div id="main">
         <div id="main-content">
           <div class="main-content-padding">
             <slave />
           </div>
         </div>
       </div>
     </if>
     <else>
       <slave />
     </else>

    </div>
  </div> <!-- /content-wrapper -->

  <comment>
    TODO: remove this and add a more systematic / package independent way 
    TODO  of getting this content here
  </comment>
  <if @curriculum_bar_p@ true><include src="/packages/curriculum/lib/bar" /></if>

  <comment> empty UL gives a validation error for the W3C validator 
  </comment>

  <if @num_of_locales@ gt 1 or @locale_admin_url@ not nil>
  <div id="footer">
    <div class="block-marker">Begin footer</div>
    <div id="footer-links">
      <ul class="compact">
      <if @num_of_locales@ gt 1>
        <li><a href="@change_locale_url@">#acs-subsite.Change_locale_label#</a></li>
      </if>
      <else>
        <if @locale_admin_url@ not nil>
          <li><a href="@locale_admin_url@">Install locales</a></li>
        </if>
      </else>
      </ul>
    </div>
  </div> <!-- /footer -->
  </if>

</div> <!-- /wrapper -->


<!--  Google Analytics -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36229399-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>




