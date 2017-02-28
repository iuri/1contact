ad_page_contract {
  This is a index to list videos

  @author Alessandro Landim

  $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} 
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
permission::require_permission -party_id [ad_conn user_id] -object_id $package_id -privilege read

set admin_p [permission::permission_p -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege admin]
set action_list ""

if {$admin_p eq 1} {
	set action_list {"#videos.New#" videos-new "#videos.New#"}
}

set image_size [parameter::get -package_id $package_id -parameter ImageSize]
set widthxheight [split $image_size "x"]
set width [lindex $widthxheight 0]
set height [lindex $widthxheight 1]
if {$width > 500} {
	set width [expr $width - 200]
}


template::list::create -name videos -multirow videos -key video_id -actions $action_list -pass_properties {
} -elements {
    item {
        label ""
        display_template {
	  <table>
	<tr>
          <group column="package_id">
		<if @videos.rownum@ odd>
			</tr>
			<tr>
		</if>
		<td width="100" valign="top">	
	        <a href="@videos.url@videos-view?video_id=@videos.video_id@"><img style="width:${width}px" src="@videos.url@@videos.video_id@.jpg"><center><p>@videos.video_name@</p></center></a>
		</td>
          </group>
	  <tr>
	</table>
	  
        }
    }
    

}
db_multirow videos select_videos {}
