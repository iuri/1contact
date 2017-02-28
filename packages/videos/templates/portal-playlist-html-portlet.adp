



<multiple name="videos">
	<if @videos.rownum@ not gt 2>

		<div id="box-posts">
			<div class="cat-img">
			     <a href="@videos.url@/videos-view?video_id=@videos.video_id@"><img class="border-img" src="@videos.url@@videos.video_id@.jpg" alt="@videos.video_name@"  width="150"/></a>
			</div>
			<h2><a href="@videos.url@/videos-view?video_id=@videos.video_id@">@videos.video_name@</a></h2>
			<p>@videos.hr@</p>
			<p class="date_info"><span>@videos.date@</span></p>
		</div>  
	</if>
	<else>
		
		<p class="main_video_title"><strong>@videos.video_name@</strong></p>

		<div id='mediaspace'><#lt_This_text_will_be_rep This text will be replaced#></div>
 
		<script type='text/javascript'>
		  <#lt_var_so__new_SWFObject var so = new SWFObject('/resources/videos/player.swf','mpl','@width@','@height@','9');
		  so.addParam('allowfullscreen','true');
		  so.addParam('allowscriptaccess','always');
	          so.addParam('wmode','opaque');
		  so.addParam('flashvars','file=@videos.url@/@videos.video_id@.flv&image=@videos.url@@videos.video_id@.jpg');
		  so.write('mediaspace');#>
		</script>

	</else>
</multiple>
<if @admin_p@>
<p><a href="@url@videos-new">#videos.New#</a></p>
</if>
 


