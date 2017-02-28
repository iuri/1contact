ad_library {
    
    Theme Uzeda API library

    @author Iuri Sampaio (iuri.sampaio@iurix.com)
    @creation-date 2015-08-02
}


namespace eval uzeda_theme::install {}

ad_proc -private uzeda_theme::install::after_install {
} {
    
    After Install proc
    
    If the package is installed on Main Site then it requires Main site's package_id
} {
    
    ns_log Notice "Running ad_proc uzeda_theme::install::after_install"
	
    
    db_1row select_object_id {
	SELECT package_id FROM acs_objects WHERE title = 'uzeda' AND object_type = 'site_node'    
    }
    
    parameter::set_value -package_id $package_id -parameter "DefaultMaster" -value "/packages/uzeda-theme/lib/uzeda-master"
    
}