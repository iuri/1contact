ad_page_contract {
    This is the matching script.
    It displays all mandats matching with the annonce
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: index.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
} {
    annonce_id
}

set page_title [ad_conn instance_name]
set context [list]

db_1row select_annonce {
    SELECT
    a.type_of_transaction AS atransaction,
    a.price AS aprice,
    r.room_qty AS arooms,
    r.inner_surface AS asurface,
    r.charac_required AS annonce_chars,
    r.route
    FROM realties r, annonces a
    WHERE a.realty_id = r.realty_id 
    AND a.annonce_id = :annonce_id
} 

set annonce_chars [string map ", \" \"" [lsort -increasing $annonce_chars]]


set mandat_ids [list]


db_multirow -extend {} mandats select_mandats {
    SELECT m.mandat_id,
    m.type_of_transaction AS mtransaction,
    m.budget_max AS mprice,
    m.rooms_qty AS mrooms,
    m.surface AS msurface,
    m.selected_routes,
    m.charac_required AS mandat_chars
    FROM mandats m 
} {
    
    # ns_log Notice "Start $mandat_id"
    
    set mandat_chars [string map ", \" \"" [lsort -increasing $mandat_chars]]
    
    ns_log Notice "MANDAT ID $mandat_id"

    ns_log Notice "TRANSACT: $atransaction -  $mtransaction"
    if {$atransaction eq $mtransaction} {
	ns_log Notice "PRICE: $aprice - $mprice"
	if {$aprice >= $mprice} {
	    ns_log Notice "ROOMS $arooms - $mrooms" 
	    if {$arooms >= $mrooms} {
		ns_log Notice "SURFACE $asurface - $msurface"
		if {$asurface >= $msurface} {
		    set route [string map {" " "" "-" ""} [string tolower $route]]
		    #ns_log Notice "ANNONCE LOCAL: $route"
		    # Second comparison - Zone Location
	       
		    set selected_routes [string map {" " "" "-" ""} [string tolower $selected_routes]]
		    #ns_log Notice "REGIONS $selected_regions"
		    #ns_log Notice "ROUTES $selected_routes"
		    #  ns_log Notice "MATCH [regexp $route $selected_routes]"
		    if {[regexp $route $selected_routes]} {

			set matching_chars t			
			foreach mchar $mandat_chars rchar $annonce_chars {    
			    if {$matching_chars} {
				# First comparison - REquired Chars
				ns_log Notice "COMPARE $mchar $rchar"
			        ns_log Notice "[category::get_name [lindex [split $mchar "-"] 1]]"
			        ns_log Notice "[category::get_name [lindex [split $rchar "-"] 1]]"
				set cat_opt [category::get_name [lindex [split $mchar "-"] 1]]
				if {$cat_opt eq "Not Indicated" || $cat_opt eq "On Demand"} {
				    ns_log Notice "MATCHED"
				    set matching_chars t				
				} elseif {[lindex [split $rchar "-"] 1] eq [lindex [split $mchar "-"] 1]} {
				    ns_log Notice "MATCHED"
				    set matching_chars t
				} else {
				    ns_log Notice "NOT MATCHED"
				    set matching_chars f
				}      						    
			    }
			}
			ns_log Notice "CHARS $matching_chars"
			if {$matching_chars} {
			    lappend mandat_ids $mandat_id
			}
		    }
		}
	    }
	}
    }
}

ns_log Notice "MATCHING IDS $mandat_ids"








