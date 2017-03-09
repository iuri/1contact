<header>

    <link rel='stylesheet' href='css/create_annouce.css' type='text/css' />

</header>

<body>
	<h3>Criar anúncio</h3>

	<div class='box' style='margin-bottom:.5rem;' >

		<h4>Proproedades gerais</h4>

		<div class='input-control text error' style='width:16em;' >
			<input type='text' name='announce_title' placeholder='Título' style='width:100%;' />
		</div>

		<div class='input-control error' data-role='select' data-allow-clear='true' data-placeholder='Negócio' style='width:12em;' >
			<select name='announce_business' multiple='multiple' style='width:100%;' >
				<option value='0' >Venda</option>
				<option value='1' >Locação</option>
			</select>
		</div>

		<div class='input-control error' data-role='select' data-allow-clear='true' data-placeholder='Tipo de propriedade' style='width:16.5em;' >
			<select name='announce_type' multiple='multiple' style='width:100%;' >
				<option value='0' >Casa</option>
				<option value='1' >Apartamento</option>
				<option value='2' >Outro</option>
			</select>
		</div>

		<div class='input-control text error' style='width:5.5em;' >
			<input type='text' name='announce_price' placeholder='Preço' style='width:100%;' />
		</div>

		<div class='input-control text error' style='width:5.5em;' >
			<input type='text' name='announce_taxes' placeholder='Taxas' style='width:100%;' />
		</div>

		<br>

		<div class='input-control text error' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:13em;' >
			<input type='text' name='announce_availability' placeholder='Data de disponibilidade' style='width:100%;' />
			<button class='button error' ><span class='mif-calendar' ></span></button>
		</div>

		<div class='input-control text error' style='width:5.5em;' >
			<input type='number' name='announce_rooms' placeholder='Cômodos' min='0' max='999' style='width:100%;' />
		</div>

		<div class='input-control text error' style='width:5.5em;' >
			<input type='number' name='announce_lavatory' placeholder='Lavabo' min='0' max='999' style='width:100%;' />
		</div>

		<div class='input-control text error' style='width:5.5em;' >
			<input type='number' name='announce_bathroom' placeholder='Banheiro' min='0' max='999' style='width:100%;' />
		</div>

		<div class='input-control text error' style='width:5.5em;' >
			<input type='number' name='announce_floor' placeholder='Andares' min='0' max='999' style='width:100%;' />
		</div>

		<div class='input-control text error' style='width:5.5em;' >
			<input type='text' name='announce_surface' placeholder='Área total' style='width:100%;' />
		</div>

		<div class='input-control error' data-role='select' data-allow-clear='true' data-placeholder='Tipo de anunciante' style='width:14.5em;' >
			<select name='announce_announcer' multiple='multiple' style='width:100%;' >
				<option value='0' >Dono</option>
				<option value='1' >Fiador</option>
				<option value='2' >Agente</option>
			</select>
		</div>

	</div>

	<div class='box' style='margin-bottom:.5rem;' >

		<h4>Propriedades opcionais</h4>

		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Arquitetura' style='width:28em;' >
			<select name='announce_architecture' multiple='multiple' style='width:100%;' >
				<option value='0' >Prédio novo</option>
				<option value='1' >Arquitetura antiga</option>
				<option value='2' >Prestigiosa</option>
				<option value='3' >Vertical</option>
				<option value='4' >Anos 70</option>
			</select>
		</div>

		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Vizinhança' style='width:28em;' >
			<select name='announce_architecture' multiple='multiple' style='width:100%;' >
				<option value='0' >Aeroporto</option>
				<option value='1' >Comércio</option>
				<option value='2' >Centro</option>
				<option value='3' >Lago</option>
				<option value='4' >Organizações</option>
				<option value='5' >Transporte público</option>
				<option value='6' >Escolas</option>
				<option value='7' >Estações de trem</option>
			</select>
		</div>

		<br>
		
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Características' style='width:56.25em;' >
			<select name='announce_characteristics' multiple='multiple' style='width:100%;' >
				<option value='0' >Bela Vista</option>
				<option value='1' >Lareira</option>
				<option value='2' >Teto alto</option>
				<option value='3' >Piso antigo</option>
				<option value='4' >Máquina de lavar</option>
				<option value='5' >Local para máquina de lavar</option>
				<option value='6' >Secadora de roupas</option>
				<option value='7' >Lavadoura de louças</option>
				<option value='8' >Local para lavadoura de louças</option>
				<option value='9' >Cozinha habitável</option>
				<option value='10' >Cozinha grande</option>
				<option value='11' >Cozinha aberta</option>
			</select>
		</div>

	</div>

	<div class='box' >

		<h4>Características obrigatórias</h4>

	</div>

</body>