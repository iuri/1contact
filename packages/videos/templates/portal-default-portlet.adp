<%

    #
    #  Copyright (C) 2001, 2002 MIT
    #
    #  This file is part of dotLRN.
    #
    #  dotLRN is free software; you can redistribute it and/or modify it under the
    #  terms of the GNU General Public License as published by the Free Software
    #  Foundation; either version 2 of the License, or (at your option) any later
    #  version.
    #
    #  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
    #  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    #  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
    #  details.
    #

%>
<div class="list_videos">
	<ul>
		<multiple name="videos">
				<li class="date"><p>@videos.date@</p></li>
					<group column="date">
						<li><a href="@videos.url@videos-view?video_id=@videos.video_id@"><img class="img_video" alt="Video Image" src="@videos.url@@videos.video_id@.jpg"/></a><br/><a href="@videos.url@videos-view?video_id=@videos.video_id@">@videos.hr@</a></li>
					</group>
				</multiple>
	</ul>
</div>

