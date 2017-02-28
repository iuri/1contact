ad_page_contract {
    spits out correctly MIME-typed bits for a user's portrait

    @author philg@mit.edu
    @creation-date 26 Sept 1999
    @cvs-id $Id: portrait-bits.tcl,v 1.2 2001/10/31 20:42:07 donb Exp $
} {
    item_id:integer
}

permission::require_permission -party_id [ad_conn user_id] -object_id $item_id -privilege read
cr_write_content -item_id $item_id
