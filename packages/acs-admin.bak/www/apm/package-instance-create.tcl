ad_page_contract {
    Create (unmounted) package instance. 
    @author Gustaf Neumann
    @creation-date 8 Sept 2014
    @cvs-id $Id: package-instance-create.tcl,v 1.2.2.1 2015/09/10 08:21:02 gustafn Exp $
} {
    {package_key:notnull}
    {return_url /acs/admin/apm}
}
apm_package_instance_new -package_key $package_key
ad_returnredirect $return_url

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
