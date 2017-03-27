<div id='map' style='width:100%;height:500px;' ></div>

<script type='text/javascript' >

//////////////////////////////////////////////////////////////////////////////////////

		var poligons = {

			1: {
				title: '1201 - Paquis-Temple',
				description: 'Rue de Lausanne<br>Rue de Zurich<br>Rue de Monthoux<br>Rue de Neuchâtel<br>Rue des Alpes<br>Rue de Fribourg<br>Rue de la Navigation<br>Rue de Berne',
				coords: [
					{ lng: 6.145606, lat: 46.2097744 },
					{ lng: 6.1465073, lat: 46.2111331 },
					{ lng: 6.1472797, lat: 46.2122171 },
					{ lng: 6.1466414, lat: 46.2124212 },
					{ lng: 6.1456275, lat: 46.2127442 },
					{ lng: 6.1448389, lat: 46.2129632 },
					{ lng: 6.1443186, lat: 46.2114115 },
					{ lng: 6.1439377, lat: 46.2107545 },
					{ lng: 6.1441898, lat: 46.2105466 },
					{ lng: 6.1447263, lat: 46.2102422 },
					{ lng: 6.145606, lat: 46.2097744 },
				]
			},

			2: {
				title: '1201 - Paquis-Mole',
				description: 'Rue du Prieuré<br>Rue du Môle<br>Rue Royame<br>Rue de Lausanne<br>Rue de Berne<br>Rue de la Navigation',
				coords: [
					{ lng: 6.147446, lat: 46.2124806 },
					{ lng: 6.1477304, lat: 46.2128815 },
					{ lng: 6.1482185, lat: 46.2135719 },
					{ lng: 6.1482399, lat: 46.2136054 },
					{ lng: 6.1481702, lat: 46.2136276 },
					{ lng: 6.1472905, lat: 46.2139951 },
					{ lng: 6.146754, lat: 46.2141844 },
					{ lng: 6.1463678, lat: 46.2143404 },
					{ lng: 6.1460245, lat: 46.2145148 },
					{ lng: 6.1448979, lat: 46.2130003 },
					{ lng: 6.1453003, lat: 46.2129038 },
					{ lng: 6.1473495, lat: 46.2123024 },
					{ lng: 6.147446, lat: 46.2124806 },
				]
			},

		};

//////////////////////////////////////////////////////////////////////////////////////

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

		// Processando a array de polígonos e exibindo no mapa cada um deles
		for ( var pid in poligons ) {
			var pol = new google.maps.Polygon({
				paths: poligons[pid].coords,
				strokeColor: '#000000',
				strokeOpacity: 0.5,
				strokeWeight: 2,
				fillColor: '#000000',
				fillOpacity: 0.5,
				id: pid,
				title: poligons[pid].title,
				description: poligons[pid].description,
			});
			pol.setMap(map);
			pol.addListener('rightclick', showArrays);
			pol.addListener('click', changeSelection);
		}

		// Exibindo a janela de informações do polígono
		var infoWindow = new google.maps.InfoWindow();

		function showArrays(event) {
			infoWindow.setContent('<b>'+this.title+'</b>'+'<br><br>'+this.description);
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
				$("<label class='select_field' >"+poligons[selected_areas[i]].title+'</label>').appendTo('#SelectedAreas_List');
			}

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

	}

</script>

<script  type='text/javascript' src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&callback=initMap' async defer ></script>