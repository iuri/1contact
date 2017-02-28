



<div class="categories">
	<if @one_category_view@ eq 0>
	<div id="category_one_video">
          <div id='categories_large_video'>This text will be replaced</div>

                       <script type='text/javascript'>
                                var so = new SWFObject('/resources/videos/player.swf','mpl','320','205','9');
                                so.addParam('allowfullscreen','true');
                                so.addVariable('autostart','false');
                                so.addVariable('file','@url@@latest_video_id@.flv');
                                so.addVariable('image','@url@@latest_video_id@.jpg');
                                so.write('categories_large_video');
                        </script>
               <p class="category"><span>@latest_video_name@</span></p>
                <p class="title"><a href="@url@videos-view?video_id=@latest_video_id@">@latest_hr;noquote@</a></p>
                <p class="date_info"><span>@latest_video_date@</span></p>
	</div>
	</if>

<multiple name="videos">
		<if @one_category_view@ eq 0><h3 class="category_title">@videos.category_name@</h3></if>
		<div id="category_videos">
			<ul>
			<group column="category_name">
				<li>
					<a href="@videos.url@videos-view?video_id=@videos.video_id@" title="@videos.hr@">
						<img src="@videos.url@@videos.video_id@.jpg"></a>
						<p><a href="@videos.url@videos-view?video_id=@videos.video_id@">@videos.video_name@</a>
						<span class="video_date">@videos.date@</span></p>
				</li>
			</group>
			</ul>
		</div>
</multiple>
</div>
