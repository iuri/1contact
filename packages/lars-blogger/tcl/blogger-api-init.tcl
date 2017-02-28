# /packages/lars-blogger/tcl/blogger-api-init.tcl
ad_library {
     Register Blogger API procs
     @author Vinod Kurup [vinod@kurup.com]
     @creation-date Fri Oct  3 23:04:15 2003
     @cvs-id $Id: blogger-api-init.tcl,v 1.1 2003/12/08 05:55:52 vinodk Exp $
}

xmlrpc::register_proc blogger.newPost
xmlrpc::register_proc blogger.editPost
xmlrpc::register_proc blogger.getUsersBlogs
xmlrpc::register_proc blogger.getUserInfo
xmlrpc::register_proc blogger.getPost
xmlrpc::register_proc blogger.getRecentPosts
xmlrpc::register_proc blogger.deletePost

