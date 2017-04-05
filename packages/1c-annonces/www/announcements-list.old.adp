<master>

<if @announcements:rowcount@ gt 0>
	<div style='display:table;table-layout:fixed;' >
		
		<multiple name="announcements">

			<if @announcements.count@ eq 0>
				<div style='display:table-row;' >
			</if>

			<div style='display:table-cell;vertical-align:top;' class='box' >
				<div style='position:relative;' >
					@announcements.title@
					<img src='@image_url@' style='width:100%;height:auto;' />
				</div>
				<br>
				<div style='text-align:center;' ><span style='font-size:1.3em;font-weight:bold;color:red;' >95%</span> conforme à votre recherche</div>
				<p>
					<span style='font-size:1.15em;font-weight:bold;' >@announcements.type_of_property@</span><br>
					<span>@transact@</span>
				</p>
				<p>
					<span style='font-size:1.2em;font-weight:bold;' >@announcements.neighborhood@</span><br>
				</p>
				<p style='font-size:1.2em;font-weight:bold;'' >
					<span>Loyer:&nbsp;</span><span style='color:red' >@announcements.price@ &euro; / mois</span><br>
				</p>
				<ul>
					<li>@announcements.inner_surface@m² intèrieur / @announcements.outer_surface@m² extèrieur</li>
					<li>@announcements.room_qty@ Piéces</li>
					<li>1 Chambre, @announcements.bathroom_qty@ Salle de bain, @announcements.lavatory_qty@ WC</li>
				</ul>
				<ul>
					<li>Moublé</li>
				</ul>
			</div>

			<if @announcements.count@ eq 0>
				</div >
			</if>

		</multiple>

  </div>
</if>
<else>
    NO RESULTS
</else>