
ad_page_contract {
    This is the view-edit page for Users.
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: note-edit.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
    @param item_id If present, assume we are editing that note. Otherwise, we show the option to add a new users
} {
    {return_url ""}
    user_id:integer,optional
    type_of_user:integer,optional
}

set package_id [ad_conn package_id]

# Type 1 client, 2 garant, 3 associe, 4 conjoint

ad_form -name "user-add" -form {
    {inform1:text(inform) {label "<h1>Add/Edit User</h1>"}}
    {type_of_user:integer(checkbox),optional
	{label "#1c-users.Type_of_user#"}
	{options { {"[_ 1c-users.Client]" "1"} {"[_ 1c-users.Guarantor]" "2"} {"[_ 1c-users.Associate]" "3"} {"[_ 1c-users.Spouse_Room-mate]" "4"} }}
    }  
    {title_person:integer(select),optional
	{label "#1c-users.Title#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Mr]" "1"} {"[_ 1c-users.Mrs]" "2"} {"[_ 1c-users.Ms]" "3"}}}
    }
}

ad_form -extend -name "user-add" -form [auth::get_registration_form_elements] -validate {
    {email
        {[string equal "" [party::get_by_email -email $email]]}
        "[_ acs-subsite.Email_already_exists]"	
    }
}



ad_form -extend -name "user-add" -form {    
    {born_date:date
	{label "[_ 1c-users.Birthday_date]"}
	{format "YYYY MM DD"}
	{after_html {<input type="button" style="height:23px; width:23px; background: url('/resources/acs-templating/calendar.gif');" onclick ="return showCalendarWithDateWidget('born_date', 'y-m-d');" > \[<b>[_ 1c-users.y-m-d]</b>\]}}
    }
    {country:integer(select),optional
	{label "#1c-users.Country#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Switzerland]" "CH"} {"[_ 1c-users.Other]" "ZZ"}}}
    }
    {civil_state:integer(select),optional
	{label "#1c-users.Civil_State#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Single]" "1"} {"[_ 1c-users.Couple]" "2"} {"[_ 1c-users.Married]" "3"} {"[_ 1c-users.Divorced]" "4"}  {"[_ 1c-users.Couple]" "5"} {"[_ 1c-users.Widower]" "6"}}}
    }  
    {children_p:boolean(select),optional
	{label "#1c-users.Do_you_have_children#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Yes]" "1"} {"[_ 1c-users.No]" "0"}}}
    }
    {children_qty:integer(select),optional
	{label "#1c-users.Number_of_children#"}
	{options {{"[_ 1c-users.Select]" ""} {"1" "1"} {"2" "2"} {"3" "3"} {"4" "4"} {"5" "5"} {"6" "6"} {"7" "7"} {"8" "8"} {"9" "9"}}} 
    }
    {children_age:text(text),optional
	{label "#1c-users.Age_of_children#"}
	{help_text "[_ 1c-users.children_age_format]"}
    }
    {pet_p:boolean(select),optional
	{label "#1c-users.Do_you_have_pets#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Yes]" "1"} {"[_ 1c-users.No]" "0"}}}
    }
    {phone_number:text(text),optional
	{label "#1c-users.Phone#"}
    }
    {other_phone:text(text),optional
	{label "#1c-users.Other_phone#"}
    }
    {profession:text(text),optional
	{label "#1c-users.Profession#"}
    }
    {idepentent_p:boolean(select),optional
	{label "#1c-users.Independent#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Yes]" "1"} {"[_ 1c-users.No]" "0"}}}
    }
    {primary_work:text(text),optional
	{label "#1c-users.Primary_work#"}
	{help_text "[_ 1c-users.What_is_your_main_work]"}
    }
    {undetermined_contract_p:boolean(select),optional
	{label "#1c-users.Undetermined_Contract#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Yes]" "1"} {"[_ 1c-users.No]" "0"}}}
    }
    {secondary_work:text(text),optional
	{label "#1c-users.Primary_work#"}
	{help_text "[_ 1c-users.If_you_have_other_work]"}
    }
    {monthly_salary:text(text),optional
	{label "#1c-users.Month_salary#"}
    }
    {month_of_salary:integer(select),optional
	{label "#1c-users.Month_salary#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.12_months]" "12"} {"[_ 1c-users.13_months]" "13"}}}
    }
    {other_revenue_sources:text(textarea),optional
	{label "#1c-users.Other_revenue_sources#"}
	{help_text "[_ 1c-users.If_you_have_other_revenue]"}
    }
    {inform2:text(inform) {label "<h1>#1c-users.Current_Rent_Information# </h1>"}}
    {manager_options:integer(select),optional
	{label "#1c-users.Manager_options#"}
	{options {{"[_ 1c-users.Select]" ""} {"#1c-users.Owner" "1"} {"#1c-users.Govern#" "2"} {"#1c-users.Other#" "3"}}}
    }
    {room_qty:integer(select),optional
	{label "#1c-users.Number_of_rooms#"}
	{options {{"[_ 1c-users.Select]" ""} {"1" "1"} {"2" "2"} {"3" "3"} {"4" "4"} {"5" "5"} {"6" "6"} {"7" "7"} {"8" "8"} {"9" "9"}}} 
    }
    {rent_mortgage:text(text),optional
	{label "#1c-users.Rent_Mortgage#"}
    }    
    {inform3:text(inform) {label "<h1>#1c-users.Client_Checklist# </h1>"}}
    {pay_slip_p:integer(select),optional
	{label "#1c-users.Pay_slip#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Yes]" "1"} {"[_ 1c-users.Pending]" "0"}}}
    }
    {payslip_reminder:text(text),optional
	{label "#1c-users.Pay_slip_reminder#"}
    }    
    {document_id_p:boolean(select),optional
	{label "#1c-users.Document_id#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Yes]" "1"} {"[_ 1c-users.Pending]" "0"}}}
    }
    {employment_contrat_p:boolean(select),optional
	{label "#1c-users.Employment_contrat#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Yes]" "1"} {"[_ 1c-users.Pending]" "0"}}}
    }
    {rec_letter_p:boolean(select),optional
	{label "#1c-users.Recommendation_letter#"}
	{options {{"[_ 1c-users.Select]" ""} {"[_ 1c-users.Yes]" "1"} {"[_ 1c-users.Pending]" "0"}}}
    }
    
    
} -new_request {
    auth::require_login
    permission::require_permission -object_id [ad_conn package_id] -privilege create

    set page_title "Add a User"
    set context [list $page_title]

    set creator [1c_usersvideo::get_user_name -user_id [ad_conn user_id]]
    
} -new_data {


    
    1c_users::user::add \
	-creation_ip [ad_conn peeraddr] \
	-creation_user [ad_conn user_id] \
	-context_id [ad_conn package_id]
    
    
    
} -after_submit {
    ad_returnredirect "."
    ad_script_abort
}
