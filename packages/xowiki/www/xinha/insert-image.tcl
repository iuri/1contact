ad_page_contract {
  @author Guenter Ernst guenter.ernst@wu-wien.ac.at, 
  @author Gustaf Neumann neumann@wu-wien.ac.at
  @creation-date 13.07.2004
  @cvs-id $Id: insert-image.tcl,v 1.7.2.1 2015/09/10 08:10:44 gustafn Exp $
} {
  {fs_package_id:naturalnum,optional}
  {folder_id:naturalnum,optional}
}
 
set selector_type "image"
set file_selector_link [export_vars -base file-selector \
                            {fs_package_id folder_id selector_type}]
set fs_found 1

# Local variables:
#    mode: tcl
#    tcl-indent-level: 2
#    indent-tabs-mode: nil
# End:
