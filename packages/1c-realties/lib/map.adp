<div style='display:table;width:100%;' >

	<!-- Lista de zonas contendo as áreas que o cliente pode selecionar -->
	<div style='display:table-cell;vertical-align:top;width:15%;padding-right:.25rem;' >
		<h4>Zonas:</h4>
		<label class='select_field field_blue' >Centre Rive Doite</label>
		<label class='select_field field_green' >Centre Rive Gauge</label>
		<label class='select_field field_red' >Campagne Rive Doite</label>
		<label class='select_field field_yellow' >Campagne Rive Gauge</label>
	</div>

	<!-- Gmap -->
	<div style='display:table-cell;text-align:center;vertical-align:top;width:70%;' >
		<h4>#1c-mandats.ChooseDesirebleAreas#</h4>
		<div style='text-align:left;' >
			<div id='map' style='width:100%;height:500px;' ></div>
		</div>
		<b>Clique com o botão esquerdo para selecionar/remover, e com o botão direito para ver as informações</b>
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

	function initMap() {

		// Definindo o mapa
		map = new google.maps.Map(document.getElementById('map'), {
			center: {lat: 46.2044841, lng: 6.1433119},
			zoom: 14,
			zoomControl: true,
			mapTypeControl: false,
			scaleControl: false,
			streetViewControl: false,
			rotateControl: false,
		});

		// Estilizando o mapa
		var stylesArray = [
			{ featureType: "all", stylers: [ { saturation: -100 } ] },
			{ elementType: "labels", stylers: [ { visibility: "off" } ] },
			{ elementType: "road", stylers: [ { visibility: "on" } ] }
		]
		map.setOptions({styles: stylesArray});

		// Carregando o KML
		loadMap();

	}

		// Obtendo as coordenadas do centro do polígono
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
			infoWindow.setContent('<b>'+this.name+'</b>'+'<br><br>'+this.description);
			infoWindow.setPosition(polygonCenter(this));
  			infoWindow.open(map);
		}

		// Alterando o estado de seleção dos polígonos
		function changeSelection(event) {
			if ( selected_areas.includes(this.id) ) {
				this.setOptions({fillColor: '#000000'});
				selected_areas.splice( selected_areas.indexOf(this.id), 1 );
			} else {
				this.setOptions({fillColor: '#4848ff'});
				selected_areas.push(this.id);
			}
			infoWindow.close(map);
			$('#SelectedAreas_List').empty();
			for ( var i in selected_areas ) {
				$("<label class='select_field field_blue' >"+poligons[selected_areas[i]].name+'</label>').appendTo('#SelectedAreas_List');
			}
		}

	// Carregando o map
	function loadMap() {
		$.ajax({
			url: '/core/kml-parse',
			type: 'GET',
			success: function (data) {
				
				var json = JSON.parse(data);

				for ( pid in json.Polygons) {

					var pol = new google.maps.Polygon({
						paths: eval(('['+json.Polygons[pid].coords+']')),
						strokeColor: '#000000',
						strokeOpacity: 0.25,
						strokeWeight: 2,
						fillColor: '#000000',
						fillOpacity: 0.25,
						id: pid,
						title: json.Polygons[pid].name,
						description: json.Polygons[pid].description,
					});

					pol.setMap(map);
					pol.addListener('rightclick', showArrays);
					pol.addListener('click', changeSelection);

				}
				//alert( data );

			}
		});
	}

</script>

<script type='text/javascript' src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&callback=initMap&sensor=false' async defer ></script>