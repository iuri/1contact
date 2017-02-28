

set communities [db_list_of_lists select_communities {
    select pretty_name, community_id
    from dotlrn_communities 
    where archived_p = 'f'
    order by lower(pretty_name)
    
}]


foreach community $communities 
    
set users [db_list select_users "select count(d.user_id) from dotlrn_users u, dotlrn_member_rels_full d where  u.user_id = d.user_id  and    community_id = 15315976"]



foreach 
      ams::value -object_id object_id $user_id -attribute_name state
}