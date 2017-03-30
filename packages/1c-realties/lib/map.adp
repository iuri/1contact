<div style='display:table;width:100%;' >

	<!-- Lista de zonas contendo as áreas que o cliente pode selecionar -->
	<div style='display:table-cell;vertical-align:top;width:15%;padding-right:.25rem;position:relative;' >
		<div style='padding:.5rem 0;' ><h4>Zonas:</h4></div>
		<label class='select_field field_red' style='cursor:pointer;' onclick='javascript:initMap(0);' ><b>GE</b></label>
		<label class='select_field field_orange' style='cursor:pointer;' onclick='javascript:initMap(1);' ><b>Geneve</b></label>
		<label class='select_field field_yellow' style='cursor:pointer;' onclick='javascript:initMap(2);' ><b>Rive Droite Centre</b></label>
		<label class='select_field field_green' style='cursor:pointer;' onclick='javascript:initMap(3);' ><b>Rive Droite Campagne</b></label>
		<label class='select_field field_cyan' style='cursor:pointer;' onclick='javascript:initMap(4);' ><b>Rive Gauche Centre</b></label>
		<label class='select_field field_blue' style='cursor:pointer;' onclick='javascript:initMap(5);' ><b>Rive Gauche Campagne</b></label>
		<label class='select_field field_violet' style='cursor:pointer;' ><b>Something</b></label>
		<div style='position:absolute;bottom:0;' >
			<h4>Instruções</h4>
			<p style='text-align:left;margin:.5rem 0;' >Selecione a zona nos botões acima;</p>
			<p style='text-align:left;margin:.5rem 0;' >Clique com o botão esquerdo do mouse no mapa para selecionar/remover a área;</p>
			<p style='text-align:left;margin:.5rem 0;' >Clique com o botão direito do mouse no mapa para ver as informações e as ruas da área;</p>
		</div>
	</div>

	<!-- Gmap -->
	<div style='display:table-cell;vertical-align:top;width:65%;' >
		<div style='padding:.5rem 0;' ><h4>#1c-mandats.ChooseDesirebleAreas#:</h4></div>
		<div style='text-align:left;' >
			<div id='map' style='width:100%;height:500px;' ></div>
		</div>
	</div>

	<!-- Lista de áreas selecionadas pelo cliente -->
	<div style='display:table-cell;vertical-align:top;text-align:left;padding-left:.25rem;width:20%;height:100%;' >
		
		<div style='height:50%;' >
			<div style='padding:.5rem 0;position:relative;' ><h4 style='display:inline;' >Áreas selecionadas:</h4> <span style='position:absolute;right:0;' >Select all</span> </div>
			<div id='SelectedAreas_List' style='height:85%;overflow-y:scroll;' ></div>
		</div>
		<div style='height:50%;' >
			<div><h4>Ruas selecionadas:</h4></div>
			<div id='SelectedStreets_List' style='height:85%;overflow-y:scroll;' ></div>
		</div>

	</div>

	<input type='text' name='selected_regions' id='selected_regions' readonly hidden />

</div>

<!-- Mensagem de mapa selecionado total -->
<div id='selected_total' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>Você não pode selecionar áreas específicas se já selecionou GE inteira.</b></p>
</div>
<!-- Mensagem de mapa selecionado centro -->
<div id='selected_centre' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>Você não pode selecionar áreas específicas se já selecionou o Centro inteiro.</b></p>
</div>

<script type='text/javascript' src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&callback=initMap' async defer ></script>