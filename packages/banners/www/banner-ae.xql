<?xml version="1.0"?>
<queryset>


	<fullquery name="get_banner">
      		<querytext>
			select name,
				   url,
				   sort_order
			from banners
			where banner_id = :banner_id
	        </querytext>
	</fullquery>

</queryset>

