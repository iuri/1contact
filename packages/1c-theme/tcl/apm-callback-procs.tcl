namespace eval 1c_theme {}
namespace eval 1c_theme::install {}

ad_proc 1c_theme::install::after_install {} {
    Package after installation callback proc.  Add our themes, and set the acs-subsite's
    default master template parameter's default value to our "plain" theme.
} {

    # Insert this package's themes
    db_transaction {

        subsite::new_subsite_theme \
            -key 1c_plain \
            -name #1c-theme.plain# \
            -template /packages/1c-theme/lib/plain-master \
            -css {{{href /resources/1c-theme/styles/1c-master.css} {media all}}
                  {{href /resources/acs-templating/forms.css} {media all}}
                  {{href /resources/acs-templating/lists.css} {media all}}} \
            -form_template /packages/acs-templating/resources/forms/standard \
            -list_template /packages/acs-templating/resources/lists/table \
            -list_filter_template /packages/acs-templating/resources/lists/filters 

        subsite::new_subsite_theme \
            -key 1c_tabbed \
            -name #1c-theme.tabbed# \
            -template /packages/1c-theme/lib/tabbed-master \
            -css {{{href /resources/1c-theme/styles/1c-master.css} {media all}}
                  {{href /resources/acs-templating/forms.css} {media all}}
                  {{href /resources/acs-templating/lists.css} {media all}}} \
            -form_template /packages/acs-templating/resources/forms/standard \
            -list_template /packages/acs-templating/resources/lists/table \
            -list_filter_template /packages/acs-templating/resources/lists/filters 
    }

    # Set the default value of the master template parameter, so all subsites will
    # default to this when mounted.  At this point in the ACS installation process, the
    # main subsite has yet to be mounted, so it will get the "plain" theme value
    # when the installer gets around to doing so.

    # Don't do this if you're creating your own theme package!  Override the default by
    # creating a custom install.xml file to be run during the install process if you want
    # it to be installed by default for your sites.

    # We don't set up the form or list templates or CSS because the default is to use
    # those values set for acs-templating during install.

    parameter::set_default -package_key acs-subsite -parameter DefaultMaster \
        -value /packages/1c-theme/lib/plain-master

    parameter::set_default -package_key acs-subsite -parameter ThemeCSS \
       -value {{{href /resources/1c-theme/styles/1c-master.css} {media all}}
               {{href /resources/acs-templating/forms.css} {media all}}
               {{href /resources/acs-templating/lists.css} {media all}}}

    parameter::set_default -package_key acs-subsite -parameter ThemeKey -value 1c_plain
}














ad_proc 1c_theme::install::after_uninstall {} {
    Remove references from subsite theme datamodel package and set the acs-subsite's
    default master template parameter's default value to our "plain" theme.
} {

    # Set the default value of the master template parameter, so all subsites will
    # default to this when mounted.  At this point in the ACS installation process, the
    # main subsite has yet to be mounted, so it will get the "plain" theme value
    # when the installer gets around to doing so.

    # Don't do this if you're creating your own theme package!  Override the default by
    # creating a custom install.xml file to be run during the install process if you want
    # it to be installed by default for your sites.

    # We don't set up the form or list templates or CSS because the default is to use
    # those values set for acs-templating during install.

    parameter::set_default -package_key acs-subsite -parameter DefaultMaster \
        -value /packages/openacs-default-theme/lib/plain-master

    parameter::set_default -package_key acs-subsite -parameter ThemeCSS \
       -value {{{href /resources/openacs-default-theme/styles/default-master.css} {media all}}
               {{href /resources/acs-templating/forms.css} {media all}}
               {{href /resources/acs-templating/lists.css} {media all}}}



    # Insert this package's themes
    db_transaction {
	subsite::delete_subsite_theme -key 1c_plain 

	subsite::delete_subsite_theme -key 1c_tabbed 
    }
}