#
# The following functions are based on non-existing tables (currency_codes)
#
ad_proc -public lc_monetary_currency {
    { -label_p 0 }
    { -style local }
    num currency locale
} {
    Formats a monetary amount, based on information held on given currency (ISO code), e.g. GBP, USD.

    @param label_p     Set switch to a true value if you want to specify the label used for the currency.
    @param style       Set to int to display the ISO code as the currency label. Otherwise displays
                       an HTML entity for the currency. The label parameter must be true for this
                       flag to take effect.
    @param num         Number to format as a monetary amount.
    @param currency    ISO currency code.
    @param locale      Locale used for formatting the number.
    @return            Formatted monetary amount
} {

    set row_returned [db_0or1row lc_currency_select {}]

    if { !$row_returned } {
	ns_log Warning "lc_monetary_currency: Unsupported monetary currency, defaulting digits to 2"
	set fractional_digits 2
	set html_entity ""
    }
    
    if { $label_p } {
	if {$style eq "int" } {
	    set use_as_label $currency
	} else {
	    set use_as_label $html_entity
	}
    } else {
	set use_as_label ""
    }
    
    return [lc_monetary -- $num $locale $fractional_digits $use_as_label]
}


ad_proc -private lc_monetary {
    { -label_p 0 }
    { -style local }
    num 
    locale 
    {forced_frac_digits ""} 
    {forced_currency_symbol ""}
} { 
    Formats a monetary amount.

    @param label       Specify this switch if you want to specify the label used for the currency.
    @param style       Set to int to display the ISO code as the currency label. Otherwise displays
                       an HTML entity for the currency. The label parameter must be specified for this
                       flag to take effect.
    @param num         Number to format as a monetary amount. If this number could be negative
                       you should put &quot;--&quot; in your call before it.
    @param currency    ISO currency code.
    @param locale      Locale used for formatting the number.
    @return            Formatted monetary amount
} { 

    if {$forced_frac_digits ne "" && [string is integer $forced_frac_digits]} {
	set dig $forced_frac_digits
    } else {
	# look up the digits
	if {$style eq "int" } { 
	    set dig [lc_get -locale $locale "int_frac_digits"]
	} else { 
	    set dig [lc_get -locale $locale "frac_digits"]
	}
    }

    # figure out if negative 
    if {$num < 0} { 
        set num [expr {abs($num)}]
        set neg 1
    } else { 
        set neg 0
    }
    
    # generate formatted number
    set out [format "%.${dig}f" $num]

    # look up the label if needed 
    if {$forced_currency_symbol eq ""} {
	if {$label_p} {
	    if {$style eq "int" } { 
		set sym [lc_get -locale $locale "int_curr_symbol"]
	    } else { 
		set sym [lc_get -locale $locale "currency_symbol"]
	    }
	} else { 
	    set sym {}
	}
    } else {
	set sym $forced_currency_symbol
    }

    # signorama
    if {$neg} { 
        set cs_precedes [lc_get -locale $locale "n_cs_precedes"]
        set sep_by_space [lc_get -locale $locale "n_sep_by_space"]
        set sign_pos [lc_get -locale $locale "n_sign_posn"]
        set sign [lc_get -locale $locale "negative_sign"]
    } else {
        set cs_precedes [lc_get -locale $locale "p_cs_precedes"]
        set sep_by_space [lc_get -locale $locale "p_sep_by_space"]
        set sign_pos [lc_get -locale $locale "p_sign_posn"]
        set sign [lc_get -locale $locale "positive_sign"]
    } 
    
    # decimal seperator
    set dec [lc_get -locale $locale "mon_decimal_point"]
    regsub {\.} $out $dec out

    # commify
    set sep [lc_get -locale $locale "mon_thousands_sep"]
    set grouping [lc_get -locale $locale "mon_grouping"]
    set num [lc_sepfmt $out $grouping $sep]
    
    return [subst [nsv_get locale "money:$cs_precedes$sign_pos$sep_by_space"]]
}    

