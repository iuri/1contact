ad_page_contract {}

auth::require_login


set areas [list "" "Scope" "Time" "Costs" "Human Resources" "Communication" "Risks" "Aquisitions"]

set steps [list "" "Initiation" "Planning" "Monitor n Control" "Closure"]


set line [list]
set row [list]

template::multirow create lines area
template::multirow create rows step

#areas 
foreach elem1 $areas { 
    template::multirow append lines $elem1
   
    foreach elem2 $steps {
	template::multirow append rows $elem2
    }
    
}