# packages/videos/tcl/install-procs.tcl

ad_library {

    Videos Install Library

    callback implementations for videos
    
    @author iuri sampaio (iuri.sampaio@gmail.com)
    @creation-date 2010-06-09
}


namespace eval videos::install {}

ad_proc -private videos::install::add_categories {
    {-package_id ""}
} {
    a callback install that adds standard tree, categories ans sub-categories related to video 
} {

    #create category tree
    set tree_id [category_tree::add -name videos]
    
    set parent_id [category::add -tree_id $tree_id -parent_id [db_null] -name "Tipo" -description "Tipo de Video"]
    category::add -tree_id $tree_id -parent_id $parent_id -name "Entrevista" -description "Entrevista"
    category::add -tree_id $tree_id -parent_id $parent_id -name "Institutiocional" -description "Institucional"
    category::add -tree_id $tree_id -parent_id $parent_id -name "Propaganda" -description "Propaganda"
    category::add -tree_id $tree_id -parent_id $parent_id -name "Aula/Tutorial" -description "Aula/Tutorial"
    category::add -tree_id $tree_id -parent_id $parent_id -name "Documentario" -description "Documentario"
    category::add -tree_id $tree_id -parent_id $parent_id -name "Discurso" -description "Discurso"
    category::add -tree_id $tree_id -parent_id $parent_id -name "Debate" -description "Debate"

    set parent_id [category::add -tree_id $tree_id -parent_id [db_null] -name "Licensa" -description "Licensa"]
    category::add -tree_id $tree_id -parent_id $parent_id -name "CC" -description "CC"
    category::add -tree_id $tree_id -parent_id $parent_id -name "DGPL" -description "DGPL"
    category::add -tree_id $tree_id -parent_id $parent_id -name "GPL" -description "GPL"
    
    set object_id [db_list select_object_id "
	select object_id 
	from acs_objects 
	where object_type = 'apm_package' 
	and package_id = $package_id
    "]

    category_tree::map -tree_id $tree_id -object_id $object_id
}


