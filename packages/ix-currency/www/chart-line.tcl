ad_page_contract {
  displays currency prices versus timestamp

    References:
    @https://developers.google.com/chart/interactive/docs/gallery/histogram
    @https://jsfiddle.net/api/post/library/pure/
    @https://google-developers.appspot.com/chart/interactive/docs/gallery/linechart#examples


    @author iuri.sampaio@iurix.com
    @creation-date 2015-10-17

} {
    {code ""}
    {rate ""}
    {diff ""}
    {percent ""}
    {usd_rate ""}
} -properties {
    rates:multirow
}


#ns_log Notice "CODE CURRENCY $code"

if {![db_table_exists ix_currency_rates]} {
    set header [ad_header "IX Currency Rates"]
    ad_return_template currency-rates-no-exist
    return
}

db_multirow rates select_currency_rates "
    SELECT CR.creation_date AS timestamp, CR.rate AS price FROM ix_currency_rates CR WHERE CR.currency_code = :code ORDER BY CR.creation_date ASC " {
#	ns_log Notice "$usd_rate"
	
	set eur_rate [expr 1 / [expr $usd_rate]]
	set price [format "%.4f" [expr [expr $eur_rate] * [expr $price]]]
#	ns_log Notice "$price"
}

set untrusted_user_id [ad_conn untrusted_user_id]
set return_url [ad_return_url]

if { $untrusted_user_id == 0 } {
    # The browser does NOT claim to represent a user that we know about
    set login_url [export_vars -base /register {return_url}]
} else {
    set login_url ""
}


ad_return_template