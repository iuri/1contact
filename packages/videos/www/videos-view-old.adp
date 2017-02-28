<master>
<property name="title">@title;noquote@</property>
<property name="context">@context;noquote@</property>



<div class="videos"> 
  <div class="videos_view">
    <if @cont@ eq 1>
		<div class="box_media_view">
			<div id='mediavideos_view'>This text will be replaced</div>
			<p>#videos.Download#: <a href="@url@download_orig_file?video_id=@video_id@">#videos.Click_here#</a></p>
		</div>
 
		<script type='text/javascript'>
		 var so = new SWFObject('/resources/videos/player.swf','mpl','480','295','9');
		 so.addParam('allowfullscreen','true');
		 so.addVariable('autostart','true');
		 so.addVariable('file','@url@@video_id@.mp4');
  		 so.write('mediavideos_view');
		</script>
	
		<div id="description">
		<h2>@video.video_name@</h2>
		<p> @video.video_description;noquote@</p>

		<if @admin_p@>
			<a href="@url@videos-del?video_id=@video_id@">#videos.Video_del#</a> | <a href="@url@videos-new?video_id=@video_id@">#videos.Video_Edit#</a>
	    	</if>

		<if @comment_p@>
		    <p style="margin-top:10px;"><a href="@comment_add_url@" title="Enviar seu comentário">Enviar comentário</a></p>
	    	</if>
    
	</div> 


   </if>
   <else>
	<p>Seu video está convertendo</p>
   </else>
  </div>



  <div>
    <if @comment_p@>
    <h1>#videos.Comments#(@comments:rowcount@):</h1><br>
    </if>
	<multiple name="comments">
		<if @comments.approved_p@ nil>
			<if @admin_p@>

				<if @comments.title@ eq "User">
					<h3>@comments.user_names@</h3>
				</if>
				<else>
					<h3>@comments.title@</h3>
				</else>
				<p>@comments.content@</p>
				<a href="toggle-comment-approval?video_id=@video_id@&comment_id=@comments.comment_id@&revision_id=@comments.revision_id@&return_url=@return_url@">(#lars-blogger.comment_approve#)</a> | 
				<a href="comment-delete?video_id=@video_id@&comment_id=@comments.comment_id@&return_url=@return_url@">(#lars-blogger.Delete#)</a> 
			</if>
		</if>
		<else>
			<if @comments.title@ eq "User">
				<h3>@comments.user_names@</h3>
			</if>
			<else>
				<h3>@comments.title@</h3>
			</else>
			<p>@comments.content@</p>
			<if @admin_p@>
				<a href="toggle-comment-approval?video_id=@video_id@&comment_id=@comments.comment_id@&return_url=@return_url@">(#lars-blogger.comment_reject#)</a> |
				<a href="comment-delete?video_id=@video_id@&comment_id=@comments.comment_id@&return_url=@return_url@">(#lars-blogger.Delete#)</a> 
			</if>
		</else>
	</multiple>
    </div>


    <if @category_id@ not nil> 
    	    <h1>#videos.Relationship_Videos#</h1>
  	    <include src="/packages/videos/www/categories" category_id="@category_id@">
    </if>
    <else>
    	    <h1>#videos.See_others#</h1>
	    <include src="/packages/videos/www/news" not_video_id="@video_id@">
    </else>	
	
</div>
