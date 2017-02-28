# from /packages/acs-admin/www/users/one.tcl
# The code from below is from pre-ACS 4.0 and should be revised for entry later

# it looks like we should be doing 0or1row but actually
# we might be in an ACS installation where users_demographics
# isn't used at all

#  set contact_info [ad_user_contact_info $user_id "site_admin"]

#  if {$contact_info ne ""} {
#      append whole_page "<h3>Contact Info</h3>\n\n$contact_info\n
#  <ul>
#  <li><a href=contact-edit?[export_vars -url {user_id}]>Edit contact information</a>
#  </ul>"
#  } else {
#      append whole_page "<h3>Contact Info</h3>\n\n$contact_info\n
#  <ul>
#  <li><a href=contact-edit?[export_vars -url {user_id}]>Add contact information</a>
#  </ul>"
#  }

#  if {[db_table_exists users_demographics]} {
#      if {[db_0or1row user_demographics "select 
#      ud.*,
#      u.first_names as referring_user_first_names,
#      u.last_name as referring_user_last_name
#      from users_demographics ud, users u
#      where ud.user_id = $user_id
#      and ud.referred_by = u.user_id(+)"]} {
#  	# the table exists and there is a row for this user
#  	set demographic_items ""
#  	for {set i 0} {$i<[ns_set size $selection]} {incr i} {
#  	    set varname [ns_set key $selection $i]
#  	    set varvalue [ns_set value $selection $i]
#  	    if { $varname ne "user_id" && $varvalue ne "" } {
#  		append demographic_items "<li>$varname: $varvalue\n"
#  	    }
#  	}
#  	if {$demographic_items ne ""} {
#  	    append whole_page "<h3>Demographics</h3>\n\n<ul>$demographic_items</ul>\n"
	    
#  	}
#      }
#  }

#  if {[db_table_exists categories] && [db_table_exists users_interests]} {
#      set category_items ""
#      db_foreach users_interests "select c.category 
#      from categories c, users_interests ui 
#      where ui.user_id = $user_id
#      and c.category_id = ui.category_id" {
#  	append category_items "<LI>$category\n"
#      }

#      if {$category_items ne ""} {
#  	append whole_page "<H3>Interests</H3>\n\n<ul>\n\n$category_items\n\n</ul>"
#      }
#  }

#  # randyg is brilliant! we can recycle the same handle here because the
#  # inner argument is evaluated before the outer one. this should actually
#  # be done with the db api. 12 june 00, richardl@arsdigita.com

#  if { [im_enabled_p] && [ad_user_group_member $db [im_employee_group_id] $user_id] } {
#      # We are running an intranet enabled acs and this user is a member of the 
#      # employees group. Offer a link to the employee administration page
#      set intranet_admin_link "<li><a href=\"[im_url_stub]/employees/admin/view?[export_vars -url {user_id}]\">Update this user's employee information</a><p>"
#  } else {
#      set intranet_admin_link ""
#  }

