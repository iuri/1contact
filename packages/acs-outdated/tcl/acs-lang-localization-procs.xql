<?xml version="1.0"?>
<queryset>

   <fullquery name="lc_monetary_currency.lc_currency_select">      
      <querytext>
      
	select fractional_digits,
               html_entity 
        from   currency_codes 
        where  iso = :currency
    
      </querytext>
   </fullquery>

 
</queryset>
