
#
# The following function is based on a non-existing table (currency_codes).
#

ad_proc currency_widget {{default ""} {select_name "currency_code"} {size_subtag "size=\"4\""}} "Returns a currency selection box" {
    
    set widget_value "<select name=\"$select_name\" $size_subtag>\n"
    if { $default eq "" } {
	if { [parameter::get -parameter SomeAmericanReadersP] } {
	    append widget_value "<option value=\"\">Currency</option>
 	<option value=\"USD\" selected=\"selected\">United States Dollar</option>\n"
	} else {
	    append widget_value "<option value=\"\" selected=\"selected\">Currency</option>\n"
	}
    }
    db_foreach currency_info {
	select currency_name, iso
	from currency_codes
	where supported_p='t'
	order by currency_name
    } {
	if { $default == $iso } {
	    append widget_value "<option value=\"$iso\" selected=\"selected\">$currency_name</option>\n"
	} else {           
	    append widget_value "<option value=\"$iso\">$currency_name</option>\n"
	}
    }
    
    append widget_value "</select>\n"
    return $widget_value
}