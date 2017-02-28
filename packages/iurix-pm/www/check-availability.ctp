


<?php echo $this->Html->script('http://code.jquery.com/jquery-1.10.2.js'); ?>
<?php echo $this->Html->css('http:////code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css'); ?>
<?php echo $this->Html->script('http://code.jquery.com/ui/1.10.4/jquery-ui.js'); ?>
<?php echo $this->Html->css('http://http://jqueryui.com/datepicker/resources/demos/style.css'); ?>

<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>


<!-- 
//////////////// CHECK AVAILABILITY CHUNK 
// Pop up html code
// Iuri Sampaio iuri.sampaio@iurix.com
///////////
-->




<style>
.select_input_age {border-color:#FFFFFF; border-style:solid;border-width:thick; border-radius: 10px; webkit-boder-radius:10px; khtml-border-radius:10px; moz-border-radius:10px; }
.preferred_title { padding:10px; width:100%; font-family:tradegothicbold;font-size: 36px;text-transform: uppercase; font-weight:bold; }
.preferred_subtitle { padding:10px; width:95%;font-family:Arial, Helvetica, sans-serif; font-size:11pt; color:#878787;}
.preferred_form { padding:10px; width:100%; font-family:Arial, Helvetica, sans-serif; color:#878787; }
.preferred_dates {font-family:Arial, Helvetica, sans-serif; color:#878787;}

.preferred_input {font-family:Arial, Helvetica, sans-serif; height:30px; border-style:solid;border-width:thick; border-color: #DCDCDC; border-radius:15px; -webkit-border-radius:15px; -khtml-border-radius:15px; -moz-border-radius:15px; -ms-border-radius:15px; color:#878787;}


.form_fields {
  padding-left:10px; font-size:11pt; font-family:Arial, Helvetica, sans-serif; font-weight:bold; color:#585858;
}
/* red */
.cross-img {
margin-right:-100px;
margin-top:-7px;
}

.drp {
     color:#878787; 
}

.red {
font-family:tradegothicbold; font-size: 16px;text-transform: uppercase; font-weight:bolder;
color: #faddde;
padding:5px;
border: solid 1px #980c10;
background: #d81b21;
background: -webkit-gradient(linear, left top, left bottom, from(#ed1c24), to(#aa1317));
background: -moz-linear-gradient(top,  #ed1c24,  #aa1317);
filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ed1c24', endColorstr='#aa1317');
border-style:solid;border-width:thin; border-radius: 10px; -webkit-border-radius:10px; -khtml-border-radius:10px; -moz-border-radius:1px; -ms-border-radius:10px;
}
.red:hover {
font-family:tradegothicbold;font-size: 16px;text-transform: uppercase; font-weight:bolder;
background: #b61318;
background: -webkit-gradient(linear, left top, left bottom, from(#c9151b), to(#a11115));
background: -moz-linear-gradient(top,  #c9151b,  #a11115);
filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#c9151b', endColorstr='#a11115');
border-style:solid;border-width:thin; border-radius: 10px; -webkit-border-radius:10px; -khtml-border-radius:10px; -moz-border-radius:1px; -ms-border-radius:10px;
padding:5px;
}

.red:active {
font-family:tradegothicbold;font-size: 16px;text-transform: uppercase; font-weight:bolder;
color: #de898c;
background: -webkit-gradient(linear, left top, left bottom, from(#aa1317), to(#ed1c24));
background: -moz-linear-gradient(top,  #aa1317,  #ed1c24);
filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#aa1317', endColorstr='#ed1c24');
border-style:solid;border-width:thin; border-radius: 10px; -webkit-border-radius:10px; -khtml-border-radius:10px; -moz-border-radius:1px; -ms-border-radius:10px;
padding:5px;
}


</style>

</head>
<body>

<script>

$(document).ready(function() {    
var pr=$("#sale_price").val();
var pb=dotBefore(pr.toString());
var pa=dotAfter(pr.toString());
var htm=addCommas(pb)+'<span style="font-size: 18px;">'+pa+'</span>';
$("#salePrice").html(htm);
makeslect('#my_select2');


			$("#Astrology").click(function(){

			if($('input[name="hobbies"]:checked').length > 0)
			{
			$("#buy_gift").val('yes');
			}
			else{
			$("#buy_gift").val('no');
			}
	});

});

</script>

<!--/------------------start-preferredbox_area/------------->
<div class="overOuter5" id="overOuter5" style="display: none;left: 5%; top:0%;position:absolute !important;">
  <div style="width: 790px;left: 0; top:-3%; position: absolute;padding:0;" class="lightBoxCont displayBlock" id="aa5">                       
    <div class="speakerslightBox">                                                                                                  
      <div class="close">                                           
        <a href="javascript:void(0);" onclick="return closeCheckAvailability();"><img style="margin-right:5px;margin-top:0px;" alt="" src="<?php echo DIRECT_WEBROOT_PATH ; ?>img/en/cross.png"></a>
      </div>                                                                                                                  
      <div class="clear"></div>
      <table width="100%" cellpading="0" cellspacing="0" style="border-style:solid;border-width:thin; border-radius: 20px; -webkit-border-radius:10px; -khtml-border-radius:20px; -moz-border-radius:1px; -ms-border-radius:20px; background:#FFFFFF;">
	<tr>
	  <td valign="top">
	     <div class="preferred_title" style="padding:10px; width:100%; front-family:; font-size:36pt; font-weight:bold;">
	        <?php echo __('exp.CHECK');?>&nbsp;<span style="color:red;"><?php echo __('exp.AVAILABILITY');?></span>
	    </div>
	  </td>
	</tr>
	<tr>
	  <td valign="top">
	      <div class="preferred_subtitle">
		<p><?php echo __('exp.To_confirm_the_availability_of');?> <b><?php echo  ucfirst($exFullData[0]['Experiences']['name_en']);?></b><?php echo __('exp.please_fill_out_the_form_below_We_will_contact_you_by_phone_or_email_to_confirm_availability_in_one_business_day_or_to_discuss_alternative_dates');?></p>  
	      </div>
	  </td>
	</tr>
	<tr>
	  <td valign="top">
	    <div class="preferred_form">
  	      <span style="color:red">*</span><span style="font-size:8pt;"><?php echo __('exp.indicates_required_fields');?></span>
	      <form enctype="multipart/form-data" method="post" action="" id="ajax_form">
                <table width="98%" cellpadding="0" style="background:#DCDCDC;" cellspacing="0" >
 		  <tr>
		    <td valign="top" width="40%">
		      <br><br>
                      <table width="100%" cellpadding="5px" cellspacing="0" >	
 		        <tr>
		    	  <td>
                               <p class="form_fields"><?php echo __('exp.Name');?><span style="color:red">*</span></p>
			       <p><input class="preferred_input" type="text" id="firstname" name="firstname" onblur="if(this.value=='') this.value=''" onfocus="this.value=''" maxlenght="100" size="13" value="&nbsp;&nbsp;&nbsp;<?php echo __('exp.First_Name');?>" /> 
				  <span id="fnamecheck"></span>
			    	  <input class="preferred_input" type="text" id="lastname" name="lastname" onblur="if(this.value=='') this.value='Last Name'" onfocus="this.value=''"  maxlenght="100" size="22" value="&nbsp;&nbsp;&nbsp;<?php echo __('exp.Last_Name');?>" />
				  <span id="lnamecheck"></span></p>
			  </td>
			</tr>
			<tr>
		    	  <td valign="top">
		      	       <br><br>
                               <p class="form_fields"><?php echo __('exp.Daytime_Phone');?><span style="color:red">*</span></p>
			       <input class="preferred_input" onblur="if(this.value=='') this.value='<?php echo __('exp.Daytime_Phone');?>'" onfocus="this.value=''" size="43" type="text" name="phone" id="phone" value="&nbsp;&nbsp;&nbsp;<?php echo __('exp.Daytime_Phone');?>" />
			  </td>
			</tr>
			<tr>
		    	  <td valign="top">
                            <br><br>
		            <p class="form_fields"><?php echo __('exp.Email');?><span style="color:red">*</span></span></p>
			    <input class="preferred_input" onblur="if(this.value=='') this.value='Email Address'" onfocus="this.value=''" value="&nbsp;&nbsp;&nbsp;<?php echo __('exp.Email');?>" size="43" type="text" id="email" name="email" value="" /><br>
  			    <span id="emailcheck" style="padding-left:5px; ; vertical-align: middle;"></span>
			  </td>
			</tr>
			<tr>
 		    	  <td valign="top"><br><br>	    
			    <div style="float:left;">
			    <div id="Astrology" class="checkbox" style="background-position: bottom 0px;"><input type="checkbox" value="1" name="newsletter_p" id="newsletter_p"></div>
			    <div class="form_fields" style="font-size:10pt; margin-left:-10px; padding-top:2px;"><?php echo __('exp.Please_send_me_your_email_newsletter');?></div></div>
			  </td>
			</tr>
	              </table>


		    </td>
		    <td align="left" valign="top" width="60%">
		      <br><br>

		        <?php
		          if($exFullData[0]['Experiences']['checkin_checkout']=='1') {
		        ?>
			  <!-- Check-in/Check-out Dates -->


		          <p class="form_fields" style="text-transform:capitalize;font-weight:bold;"><?php echo __('exp.Checkin_Checkout_Dates');?><span style="color:red">*</span></p>
		          <div class="checkin_checkout_dates_wrap" style="float:left; width:90%;height:50px; border-color:#FFFFFF; border-style:solid;border-width:thick; border-radius: 10px; webkit-boder-radius:10px; khtml-border-radius:10px; moz-border-radius:10px; background:#FFFFFF; padding:10px;">

			  <p>Date: <input type="text" id="datepicker"></p>


			  </div>

		        <!-- 3 Preferred Dates -->
		        <?php } else { ?>

			  <!-- Check-in/Check-out Dates -->
		          <p class="form_fields" style="text-transform:capitalize;font-weight:bold;"><?php echo __('exp.Preferred_Dates');?><span style="color:red">*</span></p>
		          <div class="preferred_dates_wrap" style="float:left; width:90%;height:50px; border-color:#FFFFFF; border-style:solid;border-width:thick; border-radius: 10px; webkit-boder-radius:10px; khtml-border-radius:10px; moz-border-radius:10px; background:#FFFFFF; padding:10px;">

    		        <?php } ?>

		      </div>
		    



		      <?php if(count($price_list)>0){
		        $sale_price=$price_list[0]['ExpPrice']['price'];
		      ?>

          	        <br>
			<p class="form_fields" style="text-transform:capitalize;font-weight:bold;">
			  <?php echo __('exp.Select_Option');?><span style="color:red">*</span>
			</p>
	 	 	<div class="room_options" style="float:left; width:90%;height:50px; border-color:#FFFFFF; border-style:solid;border-width:thick; border-radius: 10px; webkit-boder-radius:10px; khtml-border-radius:10px; moz-border-radius:10px; background:#FFFFFF; padding:10px;">

			  <strong style="float: left; width: 100%; margin-top: 10px;"><?php echo __('Select Option');?> :</strong><br/>

<div class="select-menu" id="my_select2">
<div class="arrow-select"></div>
<select>
<?php for($p=0;$p<count($price_list);$p++)
{
if($price_list[$p]['ExpPrice']['description_'.$_COOKIE['language']]!="")
{
	$dropdown_text=$price_list[$p]['ExpPrice']['description_'.$_COOKIE['language']].": <span>".$exFullData[0]['Experiences']['currency'].number_format($price_list[$p]['ExpPrice']['price'],2)."</span>";
}
else 
{
	$dropdown_text=$price_list[$p]['ExpPrice']['description_en'].": <span>".$exFullData[0]['Experiences']['currency'].number_format($price_list[$p]['ExpPrice']['price'],2)."</span>";
}
?>
<option value="<?php echo $dropdown_text."###".number_format($price_list[$p]['ExpPrice']['price'],2)."##".$price_list[$p]['ExpPrice']['id'];?>"><?php echo $dropdown_text;?><</option>
<?php

}
if($price_list[0]['ExpPrice']['description_'.$_COOKIE['language']]!="")
{
	$dropdown_text1=$price_list[0]['ExpPrice']['description_'.$_COOKIE['language']].": <span>".$exFullData[0]['Experiences']['currency'].number_format($price_list[0]['ExpPrice']['price'],2)."</span>";
}
else 
{
	$dropdown_text1=$price_list[0]['ExpPrice']['description_en'].": <span>".$exFullData[0]['Experiences']['currency'].number_format($price_list[0]['ExpPrice']['price'],2)."</span>";
}
?>
</select>
<div class="select_box">
<input type="text" class="ckl" value="<?php echo strip_tags($dropdown_text1);?>" readonly>

<div class="me_list">
<ul></ul>
</div>
</div>
</div>
<div style="clear:both;"></div>
<?php }?>
<?php if($exFullData[0]['Experiences']['ratedisc_'.$_COOKIE['language']]!=''){?>
<div class="catDescCon2" style=" font-size: 10px;line-height: 12px;text-transform: none;">* <?php echo $exFullData[0]['Experiences']['ratedisc_'.$_COOKIE['language']];?></div>
<?php } ?>

</div>









<div style="clear:both;"></div>

   
	    <br><p class="form_fields"><?php echo __('exp.Your_question_special_request');?></p>
	      <textarea id="message" class="preferred_input" style="border-radius: 10px; webkit-boder-radius:10px; khtml-border-radius:10px; moz-border-radius:10px; width:430px; height:80px;" name="message" onblur="if(this.value=='') this.value='exp.Ask_your_question_here'" onfocus="this.value=''"/><?php echo __('exp.Ask_your_question_here');?></textarea><br><br>
	    <input type="hidden" id="locale" name="locale" value="<?php echo($_COOKIE['language']);?>">
	    <input type="hidden" id="product" name="product" value="<?php echo  ucfirst($exFullData[0]['Experiences']['name_en']);?>">
	    <input type="hidden" id="provider_email" name="provider_email" value="<?php echo  ucfirst($exFullData[0]['prvd_profile']['email']);?>">
	    <input type="hidden" id="provider_name" name="provider_name" value="<?php echo  ucfirst($exFullData[0]['prvd_profile']['name']);?>">
	    <input type="hidden" id="provider_phone" name="provider_phone" value="<?php echo  ucfirst($exFullData[0]['prvd_profile']['phonenumber']);?>">

<!--	  <span style="float:right; padding:10px;">
	    <input  onclick="return CheckValues();" type="button" class="red" value="<?php echo __('exp.CHECK');?>&nbsp;<?php echo __('exp.AVAILABILITY');?>"></span>
-->

<script>
	$("#checkavailbtn").click(function() {
  	closeCheckAvailability();
	 });

</script>
        <input type="submit" class="checkavailbtn" id="checkavailbtn" value="Test">
		    </td>
		  </tr>
	        </table>              
              </form>
	      </div>
            </td>
          </tr> 	  	     
        </table>
      <div class="clear"></div>
     

    </div>
  </div>
</div>

<!-- End Check Availability Block -->

</body>
</html>

