<master src="/www/blank-master">
<if @doc@ defined><property name="&doc">doc</property></if>
<if @body@ defined><property name="&body">body</property></if>
<if @head@ not nil><property name="head">@head;noquote@</property></if>
<if @focus@ not nil><property name="focus">@focus;noquote@</property></if>
<property name="skip_link">@skip_link;noquote@</property>


<div class="wrapper">
    <div style="width: 100%; background-color: rgb(0, 0, 0); position: fixed; z-index: 6666;">
      <div class="topsectionWrapper">
        <div class="topsection">
          <ul class="topnav">
            <li><a href="about-us">About us</a></li>
            <li>|</li>
            <li><a href="/contact-us">Contact</a></li>
            <li>|</li>
        <!--  <li><a href="/experiences/pagename/help">Help</a></li>
            <li>|</li>-->
            <li style="padding: 0px; margin: -5px 0px 0px 10px;text-transform: uppercase;" id="nmbr"><a href="/make-a-difference" style="line-height: 26px; padding: 0px 0px 0px 4px;"><img src="http://www.natopia.com/img/heart_tree1.png" alt="" style="float: left;width:18px;">Make a Difference</a></li>
            <li>|</li>
	    <li style="padding: 0px; margin: -5px 0px 0px 10px;">
	      <a href="http://www.planetnatopia.com" target="_blank" style="line-height: 26px; color: rgb(154, 210, 76); padding: 0px 0px 0px 4px;"><img src="http://www.natopia.com/img/natopia_icon2.png" alt="" style="float: left;">Our Community</a></li>
            <li>|</li>
            <li style="padding: 0px; margin: -5px 0px 0px 10px;">
	      <a href="http://www.planetnatopia.com//blog/" target="_blank" style="line-height: 26px; color: rgb(154, 210, 76); padding: 0px 0px 0px 4px;word-spacing:3px;">Blog</a></li>
	    <li style="width:50px">&nbsp;</li>
	    

	    <li id="joinusli"><a href="/quotations">Quotations</a></li>
	    <li>|</li>
	    <li id="joinusli"><a href="javascript:joinow('joinow');">Join us</a></li>
	    <li>|</li>
	    <li id="login"><a href="javascript:joinow('login');">Log In</a></li>   
	    <li>
	        <form name='test' method='GET'>											      	 
		  <input type="hidden" name="LanguageName" id="LanguageName" value="">
		  <input type="image" src="http://www.natopia.com/img/en/flag1.png" alt="en" onclick="AssignLanguage('en')" title="en"/> 
		  <input type="image" src="http://www.natopia.com/img/en/flag2.png" alt="pt" onclick="AssignLanguage('pt')" title="pt" /> 
		  <!-- <input type="image" src="http://www.natopia.com/img/en/flag3.png" alt="es" onclick="AssignLanguage('es')" title="es" /> -->
		</form>
	    </li>           
	    <li></li>
	    <li></li> 
	  </ul>
        </div>
      </div>     
    </div>
  </div>
  <div id="header">





<div class="header" style="background:#000000; height:50px;">
  <div class="logo"><a href="/"><img src="http://www.natopia.com/img/en/logo_experince_nw.png" alt="logo" border="0" /></a></div>
  <div style="position: absolute; top: 57px; left: 162px;">
    <div class="temNatopia">
      <img height="19px" src="http://www.natopia.com/img/experience_icon_banner.png">
      <div class="txt">
        <a style="color: #FFF ;text-decoration: none" href="/experiences"><span style="font-family: 'HelveticaNeueLTProRegular';font-size: 22px;text-transform: uppercase;">Experience</span></a>
      </div>
    </div>
    <div class="temNatopia two">
      <img height="21px" src=""http://www.natopia.com/img/getaways_icon_banner.png">
      <div class="txt">
        <a style="color: #FFF ;text-decoration: none" href="/Discovery"><span style="font-family: 'HelveticaNeueLTProRegular';font-size: 22px;text-transform: uppercase;">Discovery</span></a>
      </div>
    </div>
    <div class="temNatopia three">
      <img height="19px" src=""http://www.natopia.com/img/retreats_icon_banner.png">
      <div class="txt">
        <a style="color: #FFF ;text-decoration: none" href="/Retreats"><span style="font-family: 'HelveticaNeueLTProRegular';font-size: 22px;text-transform: uppercase;">Retreats</span></a>
      </div>
    </div>
    <div class="temNatopia four">
      <img height="19px" src="/img/people.png" height="19px" />
      <div class="txt">
        <a href="/Insiders" style="color: #FFF ;text-decoration: none"><span style="font-family: 'HelveticaNeueLTProRegular';font-size: 22px;text-transform: uppercase;">INSIDERS</span></a>
      </div>
    </div>
  </div>	
  


      <form id="search_form" action="https://www.natopia.com/experiences/search" name="myFormSearch" method="GET">

      <div class="enterkeywords">

        <input id="search_keyword" name="search" type="text" onblur="if(this.value=='') this.value='Enter Keywords..'" onfocus="this.value=''" value="Enter Keywords.." />

	       <INPUT style="padding-top:5px;width:16px;" type="image" onclick="return SearchKey();" src=""http://www.natopia.com/img/en/findicon.png">



        </div>

		</form>

				<div class="topnavUpper">

          <ul>

<li><div style="position: absolute; left: 0px;"><img src="/img/buy_gft_icon.png" style="padding-right:4px;"/></div><a href="https://www.natopia.com/experiences/gift">Gifts</a></li>    

<li style="margin-left: 10px;"><a href="https://www.natopia.com/experiences/promotions">Special Offer</a></li>   

<li style="margin-left: 10px;"><a href="https://www.natopia.com/experiences/getstarted">Get Started</a></li> 

<li style="margin-left: 10px;"><a href="https://www.natopia.com/experiences/groups">Groups</a></li>

<!-- <li><a href="https://www.natopia.com/experiences/giftcertificate">Gift Certificate</a></li> -->

      </ul>

        </div>





    </div>     <!-- header ends --> 

  <div id="content-wrapper">
  </div>
  <div id="footer">
  </div>
</wrapper>

















<div id="wrapper">
    <div id="system-name">
      <if @system_url@ not nil><a href="@system_url@">@system_name@</a></if>
      <else>@system_name@</else>
    </div>
  <div id="header">
    <div class="block-marker">Begin header</div>
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
    <div id="breadcrumbs">
      <if @context_bar@ not nil>
        @context_bar;noquote@
      </if>
      <else>
        <if @context:rowcount@ not nil>
        <ul class="compact">
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
    </div>
  </div> <!-- /header -->
            
  <if @navigation:rowcount@ not nil>
    <list name="navigation_groups">
      <div id="@navigation_groups:item@-navigation">
        <div class="block-marker">Begin @navigation_groups:item@ navigation</div>
        <ul>
          <multiple name="navigation">
          <if @navigation.group@ eq @navigation_groups:item@>
            <li<if @navigation.id@ not nil> id="@navigation.id@"</if>><a href="@navigation.href@"<if @navigation.target@ not nil> target="@navigation.target;noquote@"</if><if @navigation.class@ not nil> class="@navigation.class;noquote@"</if><if @navigation.title@ not nil> title="@navigation.title;noquote@"</if><if @navigation.lang@ not nil> lang="@navigation.lang;noquote@"</if><if @navigation.accesskey@ not nil> accesskey="@navigation.accesskey;noquote@"</if><if @navigation.tabindex@ not nil> tabindex="@navigation.tabindex;noquote@"</if>>@navigation.label@</a></li>
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

