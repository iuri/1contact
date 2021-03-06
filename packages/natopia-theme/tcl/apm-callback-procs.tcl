namespace eval natopia_theme {}
namespace eval natopia_theme::install {}

ad_proc natopia_theme::install::after_install {} {
    Package after installation callback proc.  Add our themes, and set the acs-subsite's
    default master template parameter's default value to our "plain" theme.
} {

    # Insert this package's themes
    db_transaction {

        subsite::new_subsite_theme \
            -key natopia_plain \
            -name #natopia-theme.plain# \
            -template /packages/natopia-theme/lib/plain-master \
            -css {{{href /resources/natopia-theme/styles/natopia-master.css} {media all}}
                  {{href /resources/acs-templating/forms.css} {media all}}
                  {{href /resources/acs-templating/lists.css} {media all}}} \
            -form_template /packages/acs-templating/resources/forms/standard \
            -list_template /packages/acs-templating/resources/lists/table \
            -list_filter_template /packages/acs-templating/resources/lists/filters 

        subsite::new_subsite_theme \
            -key natopia_tabbed \
            -name #natopia-theme.tabbed# \
            -template /packages/natopia-theme/lib/tabbed-master \
            -css {{{href /resources/natopia-theme/styles/natopia-master.css} {media all}}
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
        -value /packages/natopia-theme/lib/plain-master

    parameter::set_default -package_key acs-subsite -parameter ThemeCSS \
       -value {{{href /resources/natopia-theme/styles/natopia-master.css} {media all}}
               {{href /resources/acs-templating/forms.css} {media all}}
               {{href /resources/acs-templating/lists.css} {media all}}}

    parameter::set_default -package_key acs-subsite -parameter ThemeKey -value natopia_plain
}
