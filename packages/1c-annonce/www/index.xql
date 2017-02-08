<?xml version="1.0" encoding="utf-8"?>


<queryset>
  <fullquery name="annonces_pagination">
    <querytext> 
      SELECT ca.annonce_id
      FROM cn_annonces ca 
      $where_clause
      [template::list::orderby_clause -orderby -name "annonces"]

    </querytext>
  </fullquery>

  <fullquery name="select_annonces">
    <querytext> 

      SELECT ca.annonce_id, ca.annonce_number, cv.vehicle_id, cv.vin AS chassis, cp1.person_id AS owner_id, cp1.pretty_name AS owner_name, cp2.person_id AS distributor_id, cp2.pretty_name AS distributor_name, ca.total_cost, ca.annonce_date 
      FROM cn_annonces ca 
      $where_clause
      [template::list::page_where_clause -and -name "annonces" -key ca.annonce_id]
      [template::list::orderby_clause -orderby -name "annonces"]
      

    </querytext>
  </fullquery>

</queryset>
