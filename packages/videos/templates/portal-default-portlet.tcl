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

set query select_videos

set user_id [ad_conn user_id]
template::head::add_css -href "/resources/videos/videos.css"

db_multirow videos $query {} {
	set video_date_splited [split $date "-"]
	set videos_date "[lindex $video_date_splited 2]/[lindex $video_date_splited 1]"
}
