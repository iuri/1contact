#     Add a [ Administer ] link at the far right to the context bar.

#     @param context_addition

#     @author Bart Teeuwisse (bart.teeuwisse@thecodemill.biz)
#     @cvs-id $Id: contextbar.tcl,v 1.3 2003/12/11 21:40:02 jeffd Exp $
#     @creation-date September 2002

# Create an empty context_addition list if no addition has been passed
# in.

if {![info exists context_addition]} {
    set context_addition {}
}

# Create a context bar with the passed in addition(s) if any.

if {[empty_string_p $context_addition]} {
    set context_bar [ad_context_bar]
} else {
    set cmd [list ad_context_bar --]
    foreach elem $context_addition {
        lappend cmd $elem
    }
    set context_bar [eval $cmd]
}

# Check for admin rights to this (the ecommerce) package.

set ec_admin_p [ad_permission_p [ad_conn package_id] admin]
set ec_admin_link [apm_package_url_from_key ecommerce]admin/
set ec_installed_p [apm_package_installed_p "ecommerce"]

# Get the name of the ecommerce package

set ec_system_name [ad_parameter -package_id [apm_package_id_from_key ecommerce] SystemName "" Store]

