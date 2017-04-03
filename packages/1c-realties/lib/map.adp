<!-- Pesquisar por logradouro -->
<div class='input-control text' data-role='input' style='width:100%' >
	<input type='text' name='search_for_route' id='search_for_route' placeholder='Search for route or neighborhood' title='#1c-mandats.Undesired#' style='width:100%;' />
	<button class='button' id='search_for_route_button' onClick='return false;' ><span class='mif-search'></span></button>
</div>

<div style='display:table;width:100%;' >

	<div style='display:table-row;width:100%;' >
		<div style='display:table-cell;vertical-align:top;width:15%;padding: .5rem 0;' >
			<h4>Zones:</h4>
		</div>
		<div style='display:table-cell;vertical-align:top;width:65%;padding: .5rem 0;' >
			<h4>#1c-mandats.ChooseDesirebleAreas#:</h4>
		</div>
		<div style='display:table-cell;vertical-align:top;width:20%;padding: .5rem 0;' >
			<h4 style='display:inline;' >Selected areas:</h4>
		</div>
	</div>

	<div style='display:table-row;width:100%;' >

		<!-- Lista de zonas contendo as áreas que o cliente pode selecionar -->
		<div style='display:table-cell;vertical-align:top;width:15%;padding-right:.25rem;position:relative;' >
			<label class='select_field field_red' style='cursor:pointer;' onclick='javascript:initMap(0);' ><b>GE</b></label>
			<label class='select_field field_orange' style='cursor:pointer;' onclick='javascript:initMap(1);' ><b>Geneve</b></label>
			<label class='select_field field_yellow' style='cursor:pointer;' onclick='javascript:initMap(2);' ><b>Rive Droite Centre</b></label>
			<label class='select_field field_green' style='cursor:pointer;' onclick='javascript:initMap(3);' ><b>Rive Droite Campagne</b></label>
			<label class='select_field field_cyan' style='cursor:pointer;' onclick='javascript:initMap(4);' ><b>Rive Gauche Centre</b></label>
			<label class='select_field field_blue' style='cursor:pointer;' onclick='javascript:initMap(5);' ><b>Rive Gauche Campagne</b></label>
			<label class='select_field field_violet' style='cursor:pointer;' ><b>Something</b></label>
			<div style='position:absolute;bottom:0;' >
				<h4>Instruções</h4>
				<p style='text-align:left;margin:.5rem 0;' >Select the zones in the button above;</p>
				<p style='text-align:left;margin:.5rem 0;' >Left click on the map on right to select/unselect the areas;</p>
				<p style='text-align:left;margin:.5rem 0;' >Right click on the map on right to see the list of routes of that area;</p>
			</div>
		</div>

		<!-- Gmap -->
		<div style='display:table-cell;vertical-align:top;width:65%;' >
			<div style='text-align:left;' >
				<div style='position:relative;' >
					<div id='map' style='width:100%;height:500px;'' ></div>
					<img src='/resources/1c-theme/images/logo.png' style='height:50px;width:auto;position:absolute;top:.25rem;left:.25rem;z-index:2;' />
				</div>
			</div>
		</div>

		<!-- Lista de áreas selecionadas pelo cliente -->
		<div style='position:relative;display:table-cell;vertical-align:top;text-align:left;padding-left:.25rem;width:20%;height:100%;' >

			<div style='position:absolute;width:100%;height:50%;right:0;padding-left:.25rem;' >
				<div id='SelectedAreas_List' style='height:93%;overflow-y:scroll;' ></div>
				<input type='text' name='selected_regions' id='selected_regions' readonly hidden />
			</div>

			<!-- Lista de ruas das áreas selecionadas pelo cliente -->
			<div style='position:absolute;width:100%;height:45%;right:0;bottom:3em;padding-left:.25rem;' >
				<div><h4>Selected routes:</h4></div>
				<div>
					<div class='input-control text' data-role='input' style='width:100%;' >
    					<input type='text' name='search_route' id='search_route' placeholder='Search for route' >
    					<button class='button' id='search_route_button' onClick='return false;' ><span class='mif-search'></span></button>
					</div>
				</div>
				<div id='selectedroutes_list' style='height:93%;overflow-y:scroll;' ></div>
				<input type='text' name='selected_routes' id='selected_routes' readonly hidden />
			</div>

		</div>

	</div>

</div>

<!-- Áreas indesejadas -->
<div class='input-control text' style='width:100%' >
	<input type='text' name='unwanted_areas' id='unwanted_areas' placeholder='#1c-mandats.Undesired#' title='#1c-mandats.Undesired#' style='width:100%;' />
</div>

<!-- Mensagem de mapa selecionado total -->
<div id='selected_total' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>You cannot select zones if you have already selected entire GE.</b></p>
</div>
<!-- Mensagem de mapa selecionado centro -->
<div id='selected_centre' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>You cannot select zones if you have already selected entire Centre.</b></p>
</div>
<!-- Mensagem de logradouro localizado na lista -->
<div id='route_exists' data-role='dialog' data-overlay='true' data-type='success' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>The searched route is part of the areas selected.</b></p>
</div>
<!-- Mensagem de logradouro NÃO localizado na lista -->
<div id='route_not_exists' data-role='dialog' data-overlay='true' data-type='alert' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>The searched route is NOT part of the areas selected.</b></p>
</div>

<script type='text/javascript' src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&callback=initMap' async defer ></script>