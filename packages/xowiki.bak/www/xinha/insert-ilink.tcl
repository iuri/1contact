ad_page_contract {
  @author Guenter Ernst guenter.ernst@wu-wien.ac.at, 
  @author Gustaf Neumann neumann@wu-wien.ac.at
  @creation-date 13.07.2004
  @cvs-id $Id: insert-ilink.tcl,v 1.6.2.2 2014/07/29 11:14:20 gustafn Exp $
} {
  {fs_package_id:naturalnum,optional}
  {folder_id:naturalnum,optional}
  {file_types *}
}
 
set selector_type "file"
set file_selector_link [export_vars -base file-selector \
                            {fs_package_id folder_id selector_type file_types}]
set fs_found 1

ad_return_template
