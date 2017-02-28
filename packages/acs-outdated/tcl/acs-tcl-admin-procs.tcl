
ad_proc -private ad_user_class_query { set_id  } {
    Takes an ns_set of key/value pairs and produces a query for the class of users specified (one user per row returned).

    @param set_id The id of a ns_set containing all the parameters of the user class.
    

} {
    # we might need this 
    set where_clauses [list]
    set join_clauses [list]
    set group_clauses [list]
    set having_clauses [list]
    set tables [list users]

    # turn all the parameters in the ns_set into tcl vars
    ad_ns_set_to_tcl_vars -duplicates fail $set_id 

    # if we are using a user_class, just get the info

    # Get all the non-LOB columns.
    set user_columns [list]
    foreach column [db_columns users] {
	if { $column ne "portrait" && $column ne "portrait_thumbnail" } {
	    lappend user_columns "users.$column"
	}
    }

    if { [info exists count_only_p] && $count_only_p } {
	set select_list "count(users.user_id)"
    } else {
	set select_list $user_columns
    }

    if { [info exists include_contact_p] && $include_contact_p} {
	lappend select_list "user_contact_summary(users.user_id) as contact_summary"
    }
    if { [info exists include_demographics_p] && $include_demographics_p} {
	lappend select_list "user_demographics_summary(users.user_id) as demographics_summary"
    }
    
    if { [info exists user_class_id] && $user_class_id ne "" } {
	set sql_post_select [db_string sql_post_select_for_user_class "
	    select sql_post_select
	    from user_classes where user_class_id = [ns_dbquotevalue $user_class_id]
	"]

	return "select [join $select_list ",\n    "]\n$sql_post_select"
    }
    
    if { [info exists sql_post_select] && $sql_post_select ne "" } {
	return "select [join $select_list ",\n    "]\n$sql_post_select"
    }

    foreach criteria [ad_user_class_parameters] {
	if { [info exists $criteria] && [set $criteria] ne "" } {
	    switch $criteria {
		"category_id" {
		    if {"users_interests" ni $tables} {
		    lappend tables "users_interests"
			lappend join_clauses "users.user_id = users_interests.user_id"
		    }
		    lappend where_clauses "users_interests.category_id = [ns_dbquotevalue $category_id]"
		}
		"Country_code" {
		    if {"users_contact" ni $tables} {
			lappend tables "users_contact"
			lappend join_clauses "users.user_id = users_contact.user_id"
		    }
		    lappend where_clauses "users_contact.ha_country_code = [ns_dbquotevalue $country_code]"
		    
		}
		"usps_abbrev" {
		    if {"users_contact" ni $tables} {
			lappend tables "users_contact"
			lappend join_clauses "users.user_id = users_contact.user_id"
		    }
		    lappend where_clauses "(users_contact.ha_state = [ns_dbquotevalue $usps_abbrev] and (users_contact.ha_country_code is null or users_contact.ha_country_code = 'us'))"
		    
		}
		"intranet_user_p" {
		    if {$intranet_user_p eq "t" && [lsearch $tables "intranet_users"] == -1 } {
			lappend tables "intranet_users"
			lappend join_clauses "users.user_id = intranet_users.user_id"
		    }
		}
		"group_id" {
		    lappend tables "group_member_map"
		    lappend join_clauses "users.user_id = group_member_map.member_id"
		    lappend where_clauses "group_member_map.group_id = $group_id"
		    
		}
		
		"last_name_starts_with" {
		    lappend where_clauses "lower(users.last_name) like lower([ns_dbquotevalue "${last_name_starts_with}%"])"
		    # note the added percent sign  here
		    
		}
		"email_starts_with" {
		    lappend where_clauses "lower(users.email) like lower([ns_dbquotevalue "${email_starts_with}%"])"
		    # note the added percent sign  here
		    
		}
		"expensive" {
		    if { [info exists count_only_p] && $count_only_p } {
			lappend where_clauses "[parameter::get -parameter ExpensiveThreshold] < (select sum(amount) from users_charges where users_charges.user_id = users.user_id)"
		    } else {
			if {"user_charges" ni $tables} {
			    lappend tables "users_charges"
			    lappend join_clauses "users.user_id = users_charges.user_id"
			}

			set group_clauses [concat $group_clauses $user_columns]

			lappend having_clauses "sum(users_charges.amount) > [parameter::get -parameter ExpensiveThreshold]"
			# only the ones where they haven't paid
			lappend where_clauses "users_charges.order_id is null"
		    }
		}
		"user_state" {
		    lappend where_clauses "users.user_state = [ns_dbquotevalue $user_state]"
		    
		}
		"sex" {
		    if {"users_demographics" ni $tables} {
			lappend tables "users_demographics"
			lappend join_clauses "users.user_id = users_demographics.user_id"
		    }
		    lappend where_clauses "users_demographics.sex = [ns_dbquotevalue $sex]"
		    
		    
		}
		"age_below_years" {
		    if {"users_demographics" ni $tables} {
			lappend tables "users_demographics"
			lappend join_clauses "users.user_id = users_demographics.user_id"
		    }
		    lappend where_clauses "users_demographics.birthdate > sysdate - ([ns_dbquotevalue $age_below_years] * 365.25)"
		    
		}
		"age_above_years" {
		    if {"users_demographics" ni $tables} {
			lappend tables "users_demographics"
			lappend join_clauses "users.user_id = users_demographics.user_id"
		    }
		    lappend where_clauses "users_demographics.birthdate < sysdate - ([ns_dbquotevalue $age_above_years] * 365.25)"
		    
		}
		"registration_during_month" {
		    lappend where_clauses "to_char(users.registration_date,'YYYYMM') = [ns_dbquotevalue $registration_during_month]"
		    
		}
		"registration_before_days" {
		    lappend where_clauses "users.registration_date < sysdate - [ns_dbquotevalue $registration_before_days]"
		    
		}
		"registration_after_days" {
		    lappend where_clauses "users.registration_date > sysdate - [ns_dbquotevalue $registration_after_days]"
		    
		}
		"registration_after_date" {
		    lappend where_clauses "users.registration_date > [ns_dbquotevalue $registration_after_date]"
		    
		}
		"last_login_before_days" {
		    lappend where_clauses "users.last_visit < sysdate - [ns_dbquotevalue $last_login_before_days]"
		    
		}
		"last_login_after_days" {
		    lappend where_clauses "users.last_visit > sysdate - [ns_dbquotevalue $last_login_after_days]"
		    
		}
		"last_login_equals_days" {
		    lappend where_clauses "round(sysdate-last_visit) = [ns_dbquotevalue $last_login_equals_days]"
		    
		}
		"number_visits_below" {
		    lappend where_clauses "users.n_sessions < [ns_dbquotevalue $number_visits_below]"
		    
		}
		"number_visits_above" {
		    lappend where_clauses "users.n_sessions > [ns_dbquotevalue $number_visits_above]"
		    
		}
		"crm_state" {
		    lappend where_clauses "users.crm_state = [ns_dbquotevalue $crm_state]"
		    
		}
		"curriculum_elements_completed" {
		    lappend where_clauses "[ns_dbquotevalue $curriculum_elements_completed] = (select count(*) from user_curriculum_map ucm where ucm.user_id = users.user_id and ucm.curriculum_element_id in (select curriculum_element_id from curriculum))"
		    
		}
	    }
	}
    }
    #stuff related to the query itself
    
    if { [info exists combine_method] && $combine_method eq "or" } {
	set complete_where [join $where_clauses " or "]
    } else {
	set complete_where [join $where_clauses " and "]
    }
    

    if { [info exists include_accumulated_charges_p] && $include_accumulated_charges_p && (![info exists count_only_p] || !$count_only_p) } {
	# we're looking for expensive users and not just counting them
	lappend select_list "sum(users_charges.amount) as accumulated_charges"
    }
    if { [llength $join_clauses] == 0 } {
	set final_query "select [join $select_list ",\n    "]
	from [join $tables ", "]"
	if { $complete_where ne "" } {
	    append final_query "\nwhere $complete_where"
	}
    } else {
	# we're joining at 
	set final_query "select [join $select_list ",\n    "]
	from [join $tables ", "]
	where [join $join_clauses "\nand "]"
	if { $complete_where ne "" } {
	    append final_query "\n and ($complete_where)"
	}
    }
    if { [llength $group_clauses] > 0 } {
	append final_query "\ngroup by [join $group_clauses ", "]"
    }
    if { [llength $having_clauses] > 0 } {
	append final_query "\nhaving [join $having_clauses " and "]"
    }

    return $final_query
}

    
ad_proc -private ad_user_class_query_count_only { set_id } {
    Takes an ns_set of key/value pairs and produces a query that will compute the number of users in the class specified.
} {
    set new_set [ns_set copy $set_id]
    ns_set update $new_set count_only_p 1
    return [ad_user_class_query $new_set]
}