<master>

<if @announcements:rowcount@ gt 0>
  <div style='display:table;width:100%;' >

	<multiple name="announcements">

		<div style='display:table-row;width:100%;' >
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>title</span>
				<h4>@announcements.title@</h4>
			</div>
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>type of transaction</span>
				<h4>@announcements.type_of_transaction@</h4>
			</div>
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>type of property</span>
				<h4>@announcements.type_of_property@</h4>
			</div>
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>localization</span>
				<h4>@announcements.neighborhood@</h4>
			</div>
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>pieces</span>
				<h4>@announcements.room_qty@</h4>
			</div>
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>WC</span>
				<h4>@announcements.bathroom_qty@</h4>
			</div>
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>lavatory</span>
				<h4>@announcements.lavatory_qty@</h4>
			</div>
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>price</span>
				<h4>@announcements.price@</h4>
			</div>
			<div style='display:table-cell;border: 1px solid #333;padding:.15rem;' >
				<span>Actions</span>
				<h4><a href='/annonces/annonces-matching?annonce_id=@announcements.item_id@'>Matching</a></h4>
				<h4><a href='/annonces/create-announcement?annonce_id=@announcements.item_id@'>Edit</a></h4>
			</div>
		</div>

	</multiple>

</div>
</if>
<else>
    NO RESULTS
</else>
