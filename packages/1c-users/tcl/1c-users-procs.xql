<?xml version="1.0"?>
<queryset>
<fullquery name="1c_users::user::add.insert_userinfo">      
  <querytext>
    
    SELECT userinfo__new(
      :userinfo_id,
      :entitlement,
      :birthday,
      :nationality,
      :civilstate,
      :children_qty,
      :children_ages,
      :animal_p,
      :animals_type,
      :animals_qty,
      :mobilenumber,
      :phonenumber,
      :email,
      :job,
      :noexpirecontract_p,
      :jobactivity,
      :datestartjob,
      :salary,
      :salary_month,
      :independentjob_p,
      :jobother,
      :otherincoming,
      :address,
      :houseproperty,
      :houseproprietary,
      :mortgage,
      :user_id);
      
  </querytext>

</fullquery>

<fullquery name="1c_users::user::add.update_userinfo">      
  <querytext>
    
    SELECT userinfo__update(
      :userinfo_id,
      :entitlement,
      :birthday,
      :nationality,
      :civilstate,
      :children_qty,
      :children_ages,
      :animal_p,
      :animals_type,
      :animals_qty,
      :mobilenumber,
      :phonenumber,
      :email,
      :job,
      :noexpirecontract_p,
      :jobactivity,
      :datestartjob,
      :salary,
      :salary_month,
      :independentjob_p,
      :jobother,
      :otherincoming,
      :address,
      :houseproperty,
      :houseproprietary,
      :mortgage,
      :user_id);
      
  </querytext>
</fullquery>
</queryset>
