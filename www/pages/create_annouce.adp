<header>

    <link rel='stylesheet' href='css/create_annouce.css' type='text/css' />

</header>

<body>
	<h3>Criar um novo anúncio</h3>

	<div class='box' style='margin-bottom:.5rem;' >

		<h4>Características gerais</h4>

		<!-- Título -->
		<div class='input-control text' style='width:16em;' >
			<input type='text' name='announce_title' placeholder='Título' style='width:100%;' />
		</div>

		<!-- Tipo de negociação (locação ou venda) -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Negócio' style='width:11.5em;' >
			<select name='announce_business' multiple='multiple' style='width:100%;' >
				<option value='0' >Locação</option>
				<option value='1' >Venda</option>
			</select>
		</div>

		<!-- Tipo de imóvel -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de propriedade' style='width:18em;' >
			<select name='announce_type' multiple='multiple' style='width:100%;' >
				<option value='0' >Casa</option>
				<option value='1' >Apartamento</option>
				<option value='2' >Comércio</option>
			</select>
		</div>

		<!-- Preço  -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='announce_price' placeholder='Preço' style='width:100%;' />
		</div>

		<!-- Taxas -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='announce_taxes' placeholder='Taxas' style='width:100%;' />
		</div>

		<!-- Data de disponibilidade -->
		<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:13em;' >
			<input type='text' name='announce_availability' placeholder='Data de disponibilidade' style='width:100%;' />
			<button class='button' ><span class='mif-calendar' ></span></button>
		</div>

		<!-- Num de cômodos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='announce_rooms' placeholder='Cômodos' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de lavabos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='announce_lavatory' placeholder='Lavabo' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de banheiros -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='announce_bathroom' placeholder='Banheiro' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de andares -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='announce_floor' placeholder='Andares' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Área total -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='text' name='announce_surface' placeholder='Área total' style='width:100%;' />
		</div>

		<!-- Tipo de anunciante -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de anunciante' style='width:14.5em;' >
			<select name='announce_announcer' multiple='multiple' style='width:100%;' >
				<option value='0' >Dono</option>
				<option value='1' >Fiador</option>
				<option value='2' >Agente</option>
			</select>
		</div>

	</div>

	<br>

	<div class='box' style='margin-bottom:.5rem;' >

		<h4>Características obrigatórias</h4>

		<!-- Características do matching -->
		<div style='display:table;' >
			
			<div style='display:table-cell;' >
				
				<!-- Mobiliado -->
				<div class='box2' >
					<b>Mobiliado</b><br>
					<input type='radio' name='characteristics_furnished' id='furnished_yes' /><label for='furnished_yes' />Sim</label>
					<input type='radio' name='characteristics_furnished' id='furnished_no' /><label for='furnished_no' />Não</label>
					<input type='radio' name='characteristics_furnished' id='furnished_notmatter' /><label for='furnished_notmatter' />Indiferente</label>
					<input type='radio' name='characteristics_furnished' id='furnished_ondemmand' /><label for='furnished_ondemmand' />Sob encomenda</label>
				</div>

				<!-- Elevador -->
				<div class='box2' >
					<b>Elevador</b><br>
					<input type='radio' name='characteristics_elevator' id='elevator_yes' style='margin:.25rem;' /><label for='elevator_yes' />Sim</label>
					<input type='radio' name='characteristics_elevator' id='elevator_no' style='margin:.25rem;' /><label for='elevator_no' />Não</label>
					<input type='radio' name='characteristics_elevator' id='elevator_notmatter' style='margin:.25rem;' /><label for='elevator_notmatter' />Indiferente</label>
				</div>

				<!-- Quintal -->
				<div class='box2' >
					<b>Quintal</b><br>
					<input type='radio' name='characteristics_yard' id='yard_yes' style='margin:.25rem;' /><label for='yard_yes' />Sim</label>
					<input type='radio' name='characteristics_yard' id='yard_no' style='margin:.25rem;' /><label for='yard_no' />Não</label>
					<input type='radio' name='characteristics_yard' id='yard_notmatter' style='margin:.25rem;' /><label for='yard_notmatter' />Indiferente</label>
				</div>

				<!-- Acesso ao exterior -->
				<div class='box2' >
					<b>Acesso ao exteror</b><br>
					<input type='radio' name='characteristics_exterioraccess' id='exterioraccess_yes' style='margin:.25rem;' /><label for='exterioraccess_yes' />Sim</label>
					<input type='radio' name='characteristics_exterioraccess' id='exterioraccess_no' style='margin:.25rem;' /><label for='exterioraccess_no' />Não</label>
					<input type='radio' name='characteristics_exterioraccess' id='exterioraccess_notmatter' style='margin:.25rem;' /><label for='exterioraccess_notmatter' />Indiferente</label>
				</div>
				
				<!-- Parque -->
				<div class='box2' >
					<b>Parque</b><br>
					<input type='radio' name='characteristics_park' id='park_yes' style='margin:.25rem;' /><label for='park_yes' />Sim</label>
					<input type='radio' name='characteristics_park' id='park_no' style='margin:.25rem;' /><label for='park_no' />Não</label>
					<input type='radio' name='characteristics_park' id='park_notmatter' style='margin:.25rem;' /><label for='park_notmatter' />Indiferente</label>
					<input type='radio' name='characteristics_park' id='park_ondemmand' style='margin:.25rem;' /><label for='park_demmand' />Sob encomenda</label>
				</div>

				<!-- Terraço -->
				<div class='box2' >
					<b>Terraço</b><br>
					<input type='radio' name='characteristics_terrace' id='terrace_yes' style='margin:.25rem;' /><label for='terrace_yes' />Sim</label>
					<input type='radio' name='characteristics_terrace' id='terrace_no' style='margin:.25rem;' /><label for='terrace_no' />Não</label>
					<input type='radio' name='characteristics_terrace' id='terrace_notmatter' style='margin:.25rem;' /><label for='terrace_notmatter' />Indiferente</label>
				</div>

				<!-- Varanda -->
				<div class='box2' >
					<b>Varanda</b><br>
					<input type='radio' name='characteristics_balcony' id='balcony_yes' style='margin:.25rem;' /><label for='balcony_yes' />Sim</label>
					<input type='radio' name='characteristics_balcony' id='balcony_no' style='margin:.25rem;' /><label for='balcony_no' />Não</label>
					<input type='radio' name='characteristics_balcony' id='balcony_notmatter' style='margin:.25rem;' /><label for='balcony_notmatter' />Indiferente</label>
				</div>

				<!-- Jardim -->
				<div class='box2' >
					<b>Jardim</b><br>
					<input type='radio' name='characteristics_garden' id='garden_yes' style='margin:.25rem;' /><label for='garden_yes' />Sim</label>
					<input type='radio' name='characteristics_garden' id='garden_no' style='margin:.25rem;' /><label for='garden_no' />Não</label>
					<input type='radio' name='characteristics_garden' id='garden_notmatter' style='margin:.25rem;' /><label for='garden_notmatter' />Indiferente</label>
				</div>

				<!-- Garagem -->
				<div class='box2' >
					<b>Garagem</b><br>
					<input type='radio' name='characteristics_garage' id='garage_yes' style='margin:.25rem;' /><label for='garage_yes' />Sim</label>
					<input type='radio' name='characteristics_garage' id='garage_no' style='margin:.25rem;' /><label for='garage_no' />Não</label>
					<input type='radio' name='characteristics_garage' id='garage_notmatter' style='margin:.25rem;' /><label for='garage_notmatter' />Indiferente</label>
					<input type='radio' name='characteristics_garage' id='garage_ondemmand' style='margin:.25rem;' /><label for='garage_ondemmand' />Sob encomenda</label>
				</div>

				<!-- Cozinha agenciada -->
				<div class='box2' >
					<b>Cozinha agenciada</b><br>
					<input type='radio' name='characteristics_arranged_kitchen' id='ak_yes' style='margin:.25rem;' /><label for='ar_yes' />Sim</label>
					<input type='radio' name='characteristics_arranged_kitchen' id='ak_no' style='margin:.25rem;' /><label for='ar_no' />Não</label>
					<input type='radio' name='characteristics_arranged_kitchen' id='ak_notmatter' style='margin:.25rem;' /><label for='ak_notmatter' />Indiferente</label>
				</div>

				<!-- Cozinha equipada -->
				<div class='box2' >
					<b>Cozinha equipada</b><br>
					<input type='radio' name='characteristics_equipped_kitchen' id='ek_yes' style='margin:.25rem;' /><label for='er_yes' />Sim</label>
					<input type='radio' name='characteristics_equipped_kitchen' id='ek_no' style='margin:.25rem;' /><label for='ek_no' />Não</label>
					<input type='radio' name='characteristics_equipped_kitchen' id='ek_notmatter' style='margin:.25rem;' /><label for='ek_notmatter' />Indiferente</label>
				</div>

				<!-- Andar térreo -->
				<div class='box2' >
					<b>Andar térreo</b><br>
					<input type='radio' name='characteristics_groundfloor' id='groundfloor_yes' style='margin:.25rem;' /><label for='groundfloor_yes' />Sim</label>
					<input type='radio' name='characteristics_groundfloor' id='groundfloor_no' style='margin:.25rem;' /><label for='groundfloor_no' />Não</label>
					<input type='radio' name='characteristics_groundfloor' id='groundfloor_notmatter' style='margin:.25rem;' /><label for='groundfloor_notmatter' />Indiferente</label>
				</div>

				<!-- Andar superior -->
				<div class='box2' >
					<b>Andar superior</b><br>
					<input type='radio' name='characteristics_superiorfloor' id='superiorfloor_yes' style='margin:.25rem;' /><label for='superiorfloor_yes' />Sim</label>
					<input type='radio' name='characteristics_superiorfloor' id='superiorfloor_no' style='margin:.25rem;' /><label for='superiorfloor_no' />Não</label>
					<input type='radio' name='characteristics_superiorfloor' id='superiorfloor_notmatter' style='margin:.25rem;' /><label for='superiorfloor_notmatter' />Indiferente</label>
				</div>

				<!-- Acesso à deficientes -->
				<div class='box2' >
					<b>Acesso à deficientes</b><br>
					<input type='radio' name='characteristics_handicap' id='handicap_yes' style='margin:.25rem;' /><label for='handicap_yes' />Sim</label>
					<input type='radio' name='characteristics_handicap' id='handicap_no' style='margin:.25rem;' /><label for='handicap_no' />Não</label>
					<input type='radio' name='characteristics_handicap' id='handicap_notmatter' style='margin:.25rem;' /><label for='handicap_notmatter' />Indiferente</label>
				</div>

				<!-- Porão -->
				<div class='box2' >
					<b>Porão</b><br>
					<input type='radio' name='characteristics_basement' id='basement_yes' style='margin:.25rem;' /><label for='basement_yes' />Sim</label>
					<input type='radio' name='characteristics_basement' id='basement_no' style='margin:.25rem;' /><label for='basement_no' />Não</label>
					<input type='radio' name='characteristics_basement' id='basement_notmatter' style='margin:.25rem;' /><label for='basement_notmatter' />Indiferente</label>
				</div>

			</div>

		</div>

	</div>

	<br>

	<div class='box' style='margin-bottom:.5rem;' >

		<h4>Características opcionais</h4>

		<!-- Propriedades opcionais -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Arquitetura' style='width:28em;' >
			<select name='announce_architecture' multiple='multiple' style='width:100%;' >
				<option value='0' >Prédio novo</option>
				<option value='1' >Arquitetura antiga</option>
				<option value='2' >Prestigiosa</option>
				<option value='3' >Vertical</option>
				<option value='4' >Anos 70</option>
			</select>
		</div>

		<!-- Propriedades da vizinhança -->
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

		<!-- Caracteríscicas gerais -->
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

	<br>

	<div class='box' style='margin-right:.5rem;' >
		<h4>Descrição</h4>
		<div class='input-control textarea' data-role='input' data-text-auto-resize='true' style='width:25em;' >
			<textarea></textarea>
		</div>
	</div>

	<div class='box' style='vertical-align:top;' >
		<h4>Adicionar fotos</h4>
		<div class='input-control file' data-role='input' >
    		<input type='file' >
    		<button class='button' ><span class='mif-folder' ></span></button>
		</div>
	</div>

	<div class='box' style='vertical-align:top;' >
		<h4>Status</h4>
		<div class='select' >
    		<select>
    			<option value='1' >Ativo</option>
    			<option value='0' >Inativo</option>
    			<option value='2' >Encerrado</option>
    		</select>
		</div>
	</div>

	<div class='box' style='vertical-align:top;' >
		<h4>Termos e condições</h4>
		<input type='checkbox' name='terms' id='terms' />&nbsp;<label for='terms' >Concordo com os termos e condições</label>
	</div>

</body>