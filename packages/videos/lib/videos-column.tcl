ad_page_contract {
  This is a index to list videos

  @author Alessandro Landim
  @author Iuri Sampaio
  @date 2010-10-18
  $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} {
    {url ""}
} 

set package_id 61678





# Right Scrolling Videos

db_multirow -extend {} related_videos select_related_videos {} {
    foreach {category_id category_name} [videos::get_categories -package_id $package_id] {

    }
}



