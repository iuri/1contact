<div style='display:table;width:100%;' >

	<!-- Lista de zonas contendo as áreas que o cliente pode selecionar -->
	<div style='display:table-cell;vertical-align:top;width:15%;padding-right:.25rem;' >
		<h4>Zonas:</h4>
		<label class='select_field field_blue' onclick='javascript:initMap(0);' >Centre Rive Doite</label>
		<label class='select_field field_green' onclick='javascript:initMap(1);' >Centre Rive Gauge</label>
		<label class='select_field field_red' onclick='javascript:initMap(2);' >Campagne Rive Doite</label>
		<label class='select_field field_yellow' onclick='javascript:initMap(3);' >Campagne Rive Gauge</label>
		<p style='text-align:left;' >Selecione a zona nos botões acima;</p>
		<p style='text-align:left;' >Clique com o botão esquerdo do mouse no mapa para selecionar/remover a área;</p>
		<p style='text-align:left;' >Clique com o botão direito do mouse no mapa para ver as informações e as ruas da área;</p>
	</div>

	<!-- Gmap -->
	<div style='display:table-cell;text-align:center;vertical-align:top;width:70%;' >
		<h4>#1c-mandats.ChooseDesirebleAreas#</h4>
		<div style='text-align:left;' >
			<div id='map' style='width:100%;height:500px;' ></div>
		</div>
	</div>

	<!-- Lista de áreas selecionadas pelo cliente -->
	<div style='display:table-cell;vertical-align:top;text-align:left;padding-left:.25rem;width:15%;height:100%;' >
		<div><h4>Áreas selecionadas:</h4></div>
		<div id='SelectedAreas_List' ></div>
	</div>

</div>

<script type='text/javascript' >

var map;
var selected_areas = Array();
var poligons = Array();

function initMap(zone=0) {

	// Setando as coordenadas do mapa de acordo com a zona
	function centre(zone) {
		switch (zone) {
			case 0: return [{lat: 46.21730207731562, lng: 6.131954945814641}, 14];
			case 1: return [{lat: 46.195565115294585, lng: 6.152725972425969}, 14];
			case 2: return [{lat: 46.24308099706767, lng: 6.0781391041398365}, 12];
			case 3: return [{lat: 46.206502759738854, lng: 6.13547400404218}, 12];
		}
	}

	// Definindo o mapa
	map = new google.maps.Map(document.getElementById('map'), {
		center: centre(zone)[0],
		zoom: centre(zone)[1],
		zoomControl: true,
		mapTypeControl: false,
		scaleControl: false,
		streetViewControl: false,
		rotateControl: false,
	});

	// Carregando os polígonos de acordo com a zona
	$.ajax({
		url: '/core/kml-parse?zone='+zone,
		type: 'GET',
		success: function (data) {

			var json = JSON.parse(data);

			for ( pid in json.Polygons) {

				if ( selected_areas.includes(zone+'-'+pid) ) {
					var bgc = fillColor(zone);
				} else {
					var bgc = '#999999';
				}

				var pol = new google.maps.Polygon({
					paths: eval(('['+json.Polygons[pid].coords+']')),
					strokeColor: '#000000',
					strokeOpacity: 0.25,
					strokeWeight: 2,
					fillColor: bgc,
					fillOpacity: 0.5,
					zone: zone,
					id: pid,
					name: json.Polygons[pid].name,
					description: json.Polygons[pid].description,
				});
				poligons[pol.zone+'-'+pol.id] = pol.name;
				pol.setMap(map);
				pol.addListener('rightclick', showArrays);
				pol.addListener('click', changeSelection);
			}

		}
	});

	// Estilizando o mapa
	var stylesArray = [
		//{ featureType: "all", stylers: [ { saturation: -100 } ] },
		{ elementType: "labels", stylers: [ { visibility: "off" } ] },
		{ elementType: "road", stylers: [ { visibility: "on" } ] }
	]
	map.setOptions({styles: stylesArray});

	// Obtendo as coordenadas do centro do polígono para exibição da janela de informações
	function polygonCenter(poly) {
		var lowx,
		highx,
		lowy,
		highy,
		lats = [],
		lngs = [],
		vertices = poly.getPath();
   		for(var i=0; i<vertices.length; i++) {
			lngs.push(vertices.getAt(i).lng());
			lats.push(vertices.getAt(i).lat());
		}
		lats.sort();
		lngs.sort();
		lowx = lats[0];
		highx = lats[vertices.length - 1];
		lowy = lngs[0];
		highy = lngs[vertices.length - 1];
		center_x = lowx + ((highx-lowx) / 2);
		center_y = lowy + ((highy - lowy) / 2);
		return (new google.maps.LatLng(center_x, center_y));
	}

	// Exibindo a janela de informações do polígono
	var infoWindow = new google.maps.InfoWindow();
	function showArrays(event) {
		infoWindow.setContent('<b>'+this.name+'</b>'+'<br>'+this.description);
		infoWindow.setPosition(polygonCenter(this));
		infoWindow.open(map);
	}

	// Alterando o estado de seleção dos polígonos
	function changeSelection(event) {
		var pid = this.zone+'-'+this.id
		if ( selected_areas.includes(pid) ) {
			this.setOptions({fillColor: '#999999'});
			selected_areas.splice( selected_areas.indexOf(pid), 1 );
		} else {
			this.setOptions({fillColor: fillColor(this.zone)});
			selected_areas.push(pid);
		}
		infoWindow.close(map);
		updateList();
	}

	// Atualizando a lista de áreas selecionadas
	function updateList() {
		$('#SelectedAreas_List').empty();
		for ( var i in selected_areas ) {
			var c = selected_areas[i].split('-');
			switch ( parseInt(c[0]) ) {
				case 0: var clas = 'blue'; break;
				case 1: var clas = 'green'; break;
				case 2: var clas = 'red'; break;
				case 3: var clas = 'yellow'; break;
			}
			$("<label class='select_field field_"+clas+"' onClick='initMap("+c[0]+");' >"+poligons[selected_areas[i]]+'</label>').appendTo('#SelectedAreas_List');
		}
	}

	// Setando as cores de acordo com a zona
	function fillColor(zone) {
		switch ( parseInt(zone) ) {
			case 0: return '#6060ff';
			case 1: return '#60ff60';
			case 2: return '#ff6060';
			case 3: return '#ffff60';
		}
	}

}

</script>

<script type='text/javascript' src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&callback=initMap&sensor=false' async defer ></script>