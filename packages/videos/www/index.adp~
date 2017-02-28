<master>

<div class="buttons">
  <table width="100%">
    <tr>
      <td valign="top" align="left"><h1>#videos.Videos#</h1></td>
      <td valign="top" align="right">
      	  <formtemplate id="search" style="inline"></formtemplate>

	  <p>@notification_chunk;noquote@</p>
      </td>
    </tr>
    <if @admin_p@>
    <tr>
      <td valign="top" align="left">
        #videos.Admin#: <a href="videos-new">#videos.New#</a>
      </td>
      <td>&nbsp;</td>
    </tr>
    </if>
  </table>
</div>



<table width="100%" valign="top" align="center">
  <tr>
    <td width="30%" valign="top" align="center">
      <h1>#videos.Recent_Videos#</h1>
      <table width="100%" valign="top" align="center">
        <tr>

	<if @recent_videos:rowcount@ gt 0>
          <multiple name="recent_videos">
            <td valign="top" align="center">
       	      <a href="@recent_videos.url@videos-view?video_id=@recent_videos.video_id@">
	      <img  width="100px" height="75px" src="@recent_videos.url@@recent_videos.video_id@.jpg"></a><br>
	      @recent_videos.video_name;noquote@<br>
	    </td>
	  </multiple>
	</if>
	<else>
	  #videos.No_records#
	</else>
	</tr>
      </table>
      <hr>
    </td>  
    <td width="10%" valign="top" align="center">&nbsp;</td>
    <td width="60%" valign="top" align="center">   
     	<h1>#videos.Most_Popular#</h1> 
	
      <table width="100%" valign="top" align="center">
        <tr>

	<if @popular_videos:rowcount@ gt 0>
          <multiple name="popular_videos">
            <td valign="top" align="center">
       	      <a href="@popular_videos.url@videos-view?video_id=@popular_videos.video_id@">
	      <img  width="100px" height="75px" src="@popular_videos.url@@popular_videos.video_id@.jpg"></a><br>
	      @popular_videos.video_name;noquote@<br>
	    </td>
	  </multiple>
	</if>
	<else>
	  #videos.No_records#
	</else>
	</tr>
      </table>
      <hr>
    </td>
  </tr>
</table>
<hr>
<if @videos:rowcount@ gt 0>
<table width="100%" valign="top" align="center">
  <tr>
    <td valign="top" align="center">
      <h1>#videos.More_Videos#</h1>
      <table width="100%" valign="top" align="center">
        <tr>
          <multiple name="videos">
      	    <td valign="top" align="center">
	      <a href="@videos.url@videos-view?video_id=@videos.video_id@">
	      <img  width="100px" height="75px" src="@videos.url@@videos.video_id@.jpg"></a><br>
	      @videos.video_name;noquote@<br>
	    </td>
	  </multiple>
	</tr>
      </table>
    </td>
  </tr>
</table>
</if>
