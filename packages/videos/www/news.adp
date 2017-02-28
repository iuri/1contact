

<div class="news">
<multiple name="videos">
	<div id="one_news">
		<if @videos.rownum@ eq 1 and @not_videos_where_clause@ eq "">
		        <div id='large_video'>This text will be replaced</div>

 	               <script type='text/javascript'>
        		        var so = new SWFObject('/resources/videos/player.swf','mpl','320','205','9');
                 		so.addParam('allowfullscreen','true');
                 		so.addVariable('autostart','false');
                 		so.addVariable('file','@videos.url@@videos.video_id@.flv');
                 		so.addVariable('image','@videos.url@@videos.video_id@.jpg');
                 		so.write('large_video');
                	</script>

		
		</if>
		<else>
			<p class="image"><a href=@videos.url@videos-view?video_id=@videos.video_id@><img class="img" src="@videos.url@@videos.video_id@.jpg"/></a></p>
		</else>
		<p class="category"><span>@videos.video_name@</span></p>
		<p class="title"><a href="@url@videos-view?video_id=@videos.video_id@">@videos.hr;noquote@</a></p>
		<p class="date_info"><span>@videos.date@</span></p>
	</div>
</multiple>
</div>
