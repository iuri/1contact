<?xml version="1.0"?>
<queryset>

<fullquery name="ad_db_select_widget.currency_info">      
      <querytext>
      
        select currency_name, iso 
        from currency_codes 
        where supported_p='t'
        order by currency_name 
    
      </querytext>
</fullquery>

</queryset>
