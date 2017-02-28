<?xml version="1.0"?>
<queryset>


	<fullquery name="banners::new.create_banner">
      		<querytext>
			select banner__new(
				   null, 
				   :name,
		       	   :url,
				   :sort_order,
			       :package_id,
			       now(),
			       :user_id,
			       :creation_ip,
			       :context_id
		       );
	        </querytext>
	</fullquery>

	<fullquery name="banners::edit.update_banner">
      		<querytext>
			select banner__edit(
				   :banner_id, 
				   :name,
		       	   :url,
				   :sort_order
		       );
	        </querytext>
	</fullquery>

	<fullquery name="banners::delete.delete_banner">
      		<querytext>
				select banner__del(:banner_id);
	        </querytext>
	</fullquery>


</queryset>

