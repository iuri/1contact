
  <table class="list-table" align="left" border="1" width="100%"> <tbody>
	<tr>
	  <td valign="top" align="center"> 
	    <h1>#videos.Videos#</h1>
	    <multiple name="related_videos">
	      <a href="@related_videos.url@videos-view?video_id=@related_videos.video_id@">
              @related_videos.video_name;noquote@<br><img  width="150px" src="@related_videos.url@@related_videos.video_id@.jpg"></a><br>
   	      
            </multiple>
	  </td>
	</tr>
	<tr>
	  <td>
	    <h1>#videos.Tags#</h1>
  	    <include src="/packages/tags/lib/tagcloud" item_id="@video_id;noquote@">
	  </td>
	</tr>
        <tr>
	  <td valign="top" align="center"> 
 	    <img style="width: 64px; height: 64px;" src="/resources/videos/Denuncie.png" align="left" />
	    <font size="2"><strong>Denunciar conteúdo impróprio? </strong></font>
            <br /><a href="/shared/send-email?sendto=687541&amp;return_url=">Clique Aqui</a>
          </td>
       	</tr> 

	</tbody>

 </table>

