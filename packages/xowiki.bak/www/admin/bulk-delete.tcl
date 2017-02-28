::xowiki::Package initialize -ad_doc {
  this file is called by the bulk action of admin/list 

  @author Gustaf Neumann (gustaf.neumann@wu-wien.ac.at)
  @creation-date Nov 11, 2007
  @cvs-id $Id: bulk-delete.tcl,v 1.3 2012/09/13 16:05:31 victorg Exp $

  @param object_type 
} -parameter {
  {-objects ""}
}

foreach o $objects {
  ns_log notice "DELETE $o"
  $package_id delete -name $o 
}

ad_returnredirect "./list"
