var map;
var selected_areas = Array();
var poligons_names = Array();
var poligons_desc = Array();
var routes_names = Array();

function initMap(zone=0) {

	// Definindo o mapa e suas propriedades
	map = new google.maps.Map(document.getElementById('map'), {
		center: centre(zone)[0],
		zoom: centre(zone)[1],
		zoomControl: true,
		mapTypeControl: false,
		scaleControl: false,
		streetViewControl: true,
		rotateControl: false,
		disableDoubleClickZoom: true,
	});

	// Carregando os polígonos do KML de acordo com a zona
	$.ajax({
		url: '/core/kml-parse?zone='+zone,
		type: 'GET',
		success: function (data) {

			var json = JSON.parse(data);

			for ( pid in json.Polygons) {
				var bgc;
				if ( selected_areas.includes(zone+'_'+pid) ) {
					bgc = getFillColor(zone)[0];
					bgo = 0.75;
				} else {
					bgc = '#999999';
					bgo = 0.25;
				}
				var pol = new google.maps.Polygon({
					paths: eval(('['+json.Polygons[pid].coords+']')),
					strokeColor: '#000000',
					strokeOpacity: 0.25,
					strokeWeight: 2,
					fillColor: bgc,
					fillOpacity: bgo,
					zone: zone,
					id: zone+'_'+pid,
					name: json.Polygons[pid].name,
					description: json.Polygons[pid].description,
				});
				poligons_names[pol.id] = pol.name;
				poligons_desc[pol.id] = pol.description;
				pol.setMap(map);
				pol.addListener('rightclick', showArrays);
				pol.addListener('click', changeSelection);
			}

		}
	});

	// Exibindo a janela de informações do polígono com o nome da área e das ruas pertencentes à ela
	var infoWindow = new google.maps.InfoWindow();
	function showArrays(event) {
		infoWindow.setContent('<b>'+this.name+'</b>'+'<br>'+this.description);
		infoWindow.setPosition(polygonCenter(this));
		infoWindow.open(map);
	}

	// Alterando o estado de seleção dos polígonos quando clicado
	function changeSelection(event) {

		/*
		if ( this.id[0] == '0' ) {
			selected_areas = new Array();
		}
		
		if ( this.id[0] == '1' ) {
			selected_areas.forEach( function(elem) {
				selected_areas.splice( selected_areas.indexOf(elem), 1 );
			});
		}
		*/
		
		if ( zone == 2 || zone == 4 ) {
			for ( var i in selected_areas ) {
				if ( selected_areas[i][0] == '1' ) {
					metroDialog.open('#selected_centre');
					return;		
				}
			}
		}
		if ( zone > 0 ) {
			for ( var i in selected_areas ) {
				if ( selected_areas[i] == '0_0' ) {
					metroDialog.open('#selected_total');
					return;
				}
			}
		}

		if ( selected_areas.includes(this.id) ) {
			this.setOptions({fillColor: '#999999', fillOpacity: 0.25});
			selected_areas.splice( selected_areas.indexOf(this.id), 1 );
		} else {
			this.setOptions({fillColor: getFillColor(this.zone)[0], fillOpacity: 0.75});
			selected_areas.push(this.id);
		}
		infoWindow.close(map);
		updateList();
	}

	// Setando as coordenadas do mapa de acordo com a zona
	function centre(zone) {
		switch (zone) {
			case 0: return [{lat: 46.214056349242824, lng: 6.146546162855657}, 11];
			case 1: return [{lat: 46.20529731360298, lng: 6.14371375013593}, 13];
			case 2: return [{lat: 46.21664530351684, lng: 6.131954945814641}, 14];
			case 3: return [{lat: 46.24308099706767, lng: 6.0781391041398365}, 12];
			case 4: return [{lat: 46.195565115294585, lng: 6.152725972425969}, 14];
			case 5: return [{lat: 46.206502759738854, lng: 6.13547400404218}, 12];
		}
	}

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

}

// Atualizando a lista de áreas selecionadas
function updateList() {

	routes_names = Array();
	// Exibindo lista de áreas selecionadas
	$('#SelectedAreas_List').empty();
	var selectedareas = '';
	for ( var i in selected_areas ) {
		if ( typeof selected_areas[i] === "string" ) {
			var c = selected_areas[i].split('_');
			closeButton = "<span class='mif-cross close_cross' onClick=" + '"javascript:removeSelection(' + "'" + selected_areas[i] + "'" + ');"' + "></span>";
			$("<label class='select_field field_"+getFillColor(parseInt(c[0]))[1]+"' style='padding-right:2em;position:relative;' >"+poligons_names[selected_areas[i]]+closeButton+'</label>').appendTo('#SelectedAreas_List');
			selectedareas += (poligons_names[selected_areas[i]]+';');
			var routs_array = poligons_desc[selected_areas[i]].split('<br>');
			for ( var j in routs_array ) {
				routes_names.push(routs_array[j]);
			}
		}
	}
	$('#selected_regions').val( selectedareas );

	// Exibindo lista de ruas das áreas selecionadas
	$('#selectedroutes_list').empty();
	var selectedroutes = '';
	for ( var i in routes_names ) {
		if ( typeof routes_names[i] === "string" ) {
			$("<div>"+routes_names[i]+"</div>").appendTo('#selectedroutes_list');
			selectedroutes += (routes_names[i]+';');
		}
	}
	$('#selected_routes').val( selectedroutes );

}

// Removendo áreas selecionadas da lista
function removeSelection(pid) {
	var c = pid.split('_');
	if ( selected_areas.includes(pid) ) {
		selected_areas.splice( selected_areas.indexOf(pid), 1 );
	}
	initMap( parseInt(c[0]) );
	updateList();
}

// Setando as cores de acordo com a zona
function getFillColor(zone) {
	switch ( parseInt(zone) ) {
		case 0: return [$('.field_red').css( "backgroundColor" ), 'red']; break;
		case 1: return [$('.field_orange').css( "backgroundColor" ), 'orange']; break;
		case 2: return [$('.field_yellow').css( "backgroundColor" ), 'yellow']; break;
		case 3: return [$('.field_green').css( "backgroundColor" ), 'green']; break;
		case 4: return [$('.field_cyan').css( "backgroundColor" ), 'cyan']; break;
		case 5: return [$('.field_blue').css( "backgroundColor" ), 'blue']; break;
		case 6: return [$('.field_violet').css( "backgroundColor" ), 'violet']; break;
	}
}

// Pesquisando se endereço faz parte da área selecionada
$(function() {
	$('#search_route_button').click( function(event) {
		if ( $('#search_route').val() != "" ) {
			var exists = false;
			for ( var i in routes_names ) {
				if ( typeof routes_names[i] === "string" && !exists ) {
					if ( routes_names[i].toLowerCase().includes($('#search_route').val().toLowerCase()) ) {
						exists = true;
					}
				}
			}
			if ( exists ) {
				metroDialog.open('#route_exists');
			} else {
				metroDialog.open('#route_not_exists');
			}
		}
		event.preventDefault();
	});
});


// Localizar polígono através de endereço
function locate_address() {
	alert(1);
}