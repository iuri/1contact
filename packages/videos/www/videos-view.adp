<master>
<property name="title">@title;noquote@</property>
<property name="context">@context;noquote@</property>

<table width="100%" cellpadding="5" cellspacing="0">
  <tr>
    <td width="100%" valign="top" align="left">
    	<a href="/videos/">#videos.Go_Back#</a> | <a href="@url@download_orig_file?video_id=@video_id@">#videos.Download_Video#</a> 
   	<if @admin_p@>
          | <a href="@url@videos-new?video_id=@video_id@">#videos.Video_Edit#</a> |
	  @add_tag_link;noquote@ | <a href="@url@videos-del?video_id=@video_id@">#videos.Video_del#</a> |
	  
        </if> 
    </td>
  </tr>
</table>
<table width="100%" cellpadding="5" cellspacing="0">
  <tr>
    <td width="20%" valign="top" align="left">
      <div id="description">
        <h2>@video.video_name;noquote@</h2>
	#videos.Posted_by#: @creator_name@<br>
        #videos.in# @video.video_date;noquote@<br>

        <p> @video.video_description;noquote@</p>


      </div>
      <p>@notification_chunk;noquote@</p>
     
      <h1>#videos.Share_this_video#</h1>
      <a href="http://twitter.com/share" class="twitter-share-button" data-count="none">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script><br>
   
      <a name="fb_share" type="button" href="http://www.facebook.com/sharer.php">Compartilhar</a><script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script><br>

      <a href="http://www.linkedin.com/shareArticle?mini=true&url=@return_url@&title=@video.video_name@&summary=@video.video_description@"><img src="/resources/videos/linkedin_icon.gif" width="100" border=0 alt="Share on Linkedin"></a>
      

    </td>
    <td width="60%" valign="top" align="left">
      <div class="videos"> 
        <div class="videos_view">
          <div class="box_media_view">
            <div id='mediavideos_view'>This text will be replaced</div>
           </div>

		<script type='text/javascript'>
		 var so = new SWFObject('/resources/videos/player.swf','mpl','580','395','9');
		 so.addParam('allowfullscreen','true');
		 so.addVariable('autostart','true');
		 so.addVariable('file','@url@?video_id=@video_id@');
  		 so.write('mediavideos_view');
		</script>
	
          </div>
        </div>
      </div>
      <if @comments_p@ eq 1>
       <h1>#videos.Comments#</h4>
#      <a href="@comment_add_url@">Add a comment</a>      @comments_html;noquote@
      </if>


    </td>
    <td width="20%" valign="top" align="left">
      <table class="list-table" align="left" border="1" width="100%"> <tbody>
        <tr>
	  <td valign="top" align="center"> 
 	    <img style="width: 64px; height: 64px;" src="/resources/videos/Denuncie.png" align="left" />
	    <font size="2"><strong>Denunciar conteúdo impróprio? </strong></font>
            <br /><a href="/shared/send-email?sendto=687541&amp;return_url=">Clique Aqui</a>
          </td>
       	</tr> 
	<tr>
	  <td valign="top" align="center"> 
	    <h1>#videos.Related_Videos#</h1>
	    <multiple name="related_videos">
	      <a href="@related_videos.url@videos-view?video_id=@related_videos.video_id@">
              <img  width="100px" height="75px" src="@related_videos.url@@related_videos.video_id@.jpg"></a><br>
   	      @related_videos.video_name;noquote@<br>
            </multiple>
	  </td>
	</tr>
	<tr>
	  <td>
	    <h1>#videos.Tags#</h1>
  	    <include src="/packages/tags/lib/tagcloud" item_id="@video_id;noquote@">
	  </td>
	</tr>
	</tbody>
      </table>


    </td>
  </tr>
</table>


