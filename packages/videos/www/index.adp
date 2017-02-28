<master>
 <property name="context">@context;noquote@</property>
 <property name="title">@q;noquote@</property>

<div class="buttons">
  <table width="100%">
    <tr>
      <td valign="top" align="right">
	  <span style="">@notification_chunk;noquote@ |
	  <if @admin_p@>
            <a href="videos-new">#videos.New#</a>
    	  </if>
	  </span>
      </td>
    </tr>
  </table>
</div>


<!-- <table width="100%" valign="top" align="center">

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
    </td>  
    <td width="10%" valign="top" align="center">&nbsp;</td>
    <td width="60%" valign="top" align="center">   
     	<h1>#videos.Popular#</h1> 
	
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

    </td>
  </tr>
</table>
-->

<if @q@ ne "">
    <h1> Results for <a href="@general_search_url@"><i>@q;noquote@</i></a></h1>
</if>
<else>

<table cellpadding="5px" width="100%" style="background:#E7E8E3;" cellpadding="0"> <tr>
  <tr>
    <td valign="bottom" width="23%" align="left">
<!-- 
    <a class="lightview" href="one?numlikes=2&width=320&height=180&id=JiPkDbjbN8w&img=http%3a%2f%2fi%2eytimg%2ecom%2fvi%2ffUjOfsoBhMY%2fmqdefault%2ejpg&title=Malvides&average=5%2e0&url=http%3a%2f%2fwww%2eyoutube%2ecom%2fwatch%3fv%3dJiPkDbjbN8w">
                <img src="http://i.ytimg.com/vi/JiPkDbjbN8w/mqdefault.jpg" style="width:305px;" alt="Submit Button">
-->

    <a class="lightview" href="one?numlikes=2&width=320&height=180&id=-w1Va4DqDWs&img=http%3a%2f%2fi%2eytimg%2ecom%2fvi%2f-w1Va4DqDWs%2fmqdefault%2ejpg&title=Matisyahu+King+Witouht+Crown&average=5%2e0&url=http%3a%2f%2fwww%2eyoutube%2ecom%2fwatch%3fv%3d-w1Va4DqDWs">
                <img src="http://i.ytimg.com/vi/-w1Va4DqDWs/mqdefault.jpg" style="width:305px;" alt="Submit Button">
    <a class="lightview" href="one?numlikes=2&width=320&height=180&id=fUjOfsoBhMY&img=http%3a%2f%2fi%2eytimg%2ecom%2fvi%2ffUjOfsoBhMY%2fmqdefault%2ejpg&title=Cartola+Preciso+me+encontrar&average=5%2e0&url=http%3a%2f%2fwww%2eyoutube%2ecom%2fwatch%3fv%3dfUjOfsoBhMY">
                <img src="http://i.ytimg.com/vi/fUjOfsoBhMY/mqdefault.jpg" style="width:305px;" alt="Submit Button">


    </td>
    <td width="50%" valign="top" align="left">
      <embed width="635" height="345" src="http://www.youtube.com/v/@ytid@&index=1&hd=1" type="application/x-shockwave-flash"></embed>
    </td>
  
     <td width="27%" valign="bottom" align="center">


     <a class="lightview" href="one?numlikes=2&width=320&height=180&id=NUIG8P8bvSQ&img=http%3a%2f%2fi%2eytimg%2ecom%2fvi%2fNUIG8P8bvSQ%2fmqdefault%2ejpg&title=Ishome&average=5%2e0&url=http%3a%2f%2fwww%2eyoutube%2ecom%2fwatch%3fv%3dNUIG8P8bvSQ">
                <img src="http://i.ytimg.com/vi/NUIG8P8bvSQ/mqdefault.jpg" style="width:305px;" alt="Submit Button">

<!--     <a class="lightview" href="one?numlikes=2&width=320&height=180&id=0RszchMVvbs&img=http%3a%2f%2fi%2eytimg%2ecom%2fvi%2f0RszchMVvbs%2fmqdefault%2ejpg&title=Carbon+Based+Lifeforms+World+of+Sleepers&average=5%2e0&url=http%3a%2f%2fwww%2eyoutube%2ecom%2fwatch%3fv%3d0RszchMVvbs">
                <img src="http://i.ytimg.com/vi/0RszchMVvbs/mqdefault.jpg" style="width:305px;" alt="Submit Button">
-->
<!--
    <a class="lightview" href="one?numlikes=2&width=320&height=180&id=t64m5Lm7CrA&img=http%3a%2f%2fi%2eytimg%2ecom%2fvi%2faB33qOyz0Ek%2fmqdefault%2ejpg&title=Carbon+Based+Lifeforms+Leaves&average=5%2e0&url=http%3a%2f%2fwww%2eyoutube%2ecom%2fwatch%3fv%3daB33qOyz0Ek">
                <img src="http://i.ytimg.com/vi/t64m5Lm7CrA/mqdefault.jpg" style="width:305px;" alt="Submit Button">

-->

<!-- https://www.youtube.com/watch?v=EuKhccJi_GI&list=RDuPyJLRFk_UY -->

    <a class="lightview" href="one?numlikes=2&width=320&height=180&id=EuKhccJi_GI&img=http%3a%2f%2fi%2eytimg%2ecom%2fvi%2fEuKhccJi_GI%2fmqdefault%2ejpg&title=Miles+Davis+-+Red+China+Blues&average=5%2e0&url=http%3a%2f%2fwww%2eyoutube%2ecom%2fwatch%3fv%3dEuKhccJi_GI">
                <img src="http://i.ytimg.com/vi/EuKhccJi_GI/mqdefault.jpg" style="width:305px;" alt="Submit Button">
 

    </td>
  </tr>
</table>

</else>


<include src="search-youtube">

