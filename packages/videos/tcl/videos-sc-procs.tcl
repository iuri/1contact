ad_library {
    Videos service contract bindings

    @creation-date 2004-04-01
    @author Jeff Davis davis@xarg.net
    @cvs-id $Id: videos-sc-procs.tcl,v 1.2 2006/08/16 17:52:14 daveb Exp $
}



ad_proc video__datasource {
    object_id
} {
    @author Iuri Sampaio (iuri.sampaio@iurix.com)
} {
    db_0or1row video_datasource {} -column_array datasource
    
    return [array get datasource]
}


ad_proc video__url {
    object_id
} {
    @author Iuri Sampaio (iuri.sampaio@iurix.com)
} {

    db_1row get_url_stub {}

    return "${url_stub}videos-view?video_id=$object_id" 
}

namespace eval videos::fts {}

ad_proc -private videos::fts::datasource { revision_id } {
    returns a datasource for a videos 
    be indexed by the full text search engine.

    @param item_id

    @author davis@xarg.net
    @creation_date 2004-04-01
} {
    set item_id [content::revision::item_id -revision_id $revision_id]
    videos::get -item_id $item_id -array row

    return [list object_id $item_id \
                title $row(video_name) \
                content $row(video_description) \
                keywords {} \
                storage_type text \
                mime text/plain ]
}

ad_proc -private videos::fts::url { revision_id } {
    returns a url for an event to the search package

    @author davis@xarg.net
    @creation_date 2004-04-01
} {
    set item_id [content::revision::item_id -revision_id $revision_id]
    videos::get -item_id $item_id -array row
    return "[ad_url][apm_package_url_from_id $row(package_id)]videos-view?video_id=$item_id"
}

namespace eval videos::sc {}

ad_proc -private videos::sc::register_implementations {} {
    Register the item content type fts contract
} {
    db_transaction {
        videos::sc::register_videos_item_fts_impl
    }
}

ad_proc -private videos::sc::unregister_implementations {} {
    db_transaction { 
        acs_sc::impl::delete -contract_name FtsContentProvider -impl_name videos_object
    }
}

ad_proc -private videos::sc::register_videos_item_fts_impl {} {
    set spec {
        name "videos_object"
        aliases {
            datasource videos::fts::datasource
            url videos::fts::url
        }
        contract_name FtsContentProvider
        owner videos
    }

    acs_sc::impl::new_from_spec -spec $spec
}
