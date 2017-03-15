<master>

<div style='position:relative;' >

<h3>Crirar um novo mandato</h3>

<div style='display:table;width:100%;vertical-align:top;' >

	<!-- Informações do cliente -->
	<div style='display:table-cell;width:30%;padding-right:.5rem;' >
		<div class='box' style='width:100%;' >
			<h4>Informações pessoais</h4>

			<!-- Tratamento -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_customer_entitlement' id='mandat_customer_entitlement' style='width:100%;' >
					<option value='' disabled selected hidden >Tratamento</option>
					<option value='0' >Senhor</option>
					<option value='1' >Senhora</option>
					<option value='2' >Senhorita</option>
				</select>
			</div>
			<br>
			<!-- Nome -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_name' placeholder='Nome' style='width:100%;' />
			</div>
			<br>
			<!-- Sobrenome -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_surname' placeholder='Sobrenome' style='width:100%;' />
			</div>
			<br>
			<!-- Data de nascimento -->
			<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:100%;' >
				<input type='text' name='mandat_customer_birthday' placeholder='Data de nascimento' style='width:100%;' />
				<button class='button clear' ><span class='mif-calendar' ></span></button>
			</div>
			<br>
			<!-- Nacionalidade -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_nationality' placeholder='Nacionalidade' style='width:100%;' />
			</div>
			<br>
			<!-- Estado civil -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_customer_civilstate' style='width:100%;' >
					<option value='' disabled selected hidden >Estado civil</option>
					<option value='0' >Solteiro</option>
					<option value='1' >Em um relacionamento</option>
					<option value='2' >Casado(a)</option>
					<option value='3' >Separado(a)</option>
					<option value='4' >Divorciado(a)</option>
					<option value='5' >Viúvo(a)</option>
				</select>
			</div>
			<br>
			<!-- Filhos -->
			<div class='input-control text' style='width:100%;' >
				<input type='number' name='mandat_customer_children' placeholder='Filhos' style='width:100%;' />
			</div>
			<br>
			<!-- Filhos -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_children_ages' placeholder='Idades dos filhos' style='width:100%;' />
			</div>
			<br>
			<!-- Animais -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_customer_animals' style='width:100%;' >
					<option value='' disabled selected hidden >Animais</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>
			<br>
			<!-- Celular -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_mobilenumber' placeholder='Celular' style='width:100%;' />
			</div>
			<br>
			<!-- Telefone -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_phonenumber' placeholder='Telefone' style='width:100%;' />
			</div>
			<br>
			<!-- Email -->
			<div class='input-control email' style='width:100%;' >
				<input type='email' name='mandat_customer_email' placeholder='Email' style='width:100%;' />
			</div>
			<br>
			<!-- Contrato por tempo indeterminado -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_customer_noexpirecontract' style='width:100%;' >
					<option value='' disabled selected hidden >Contrato tempo indeterminado</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>

			<h4>Informações profissionais</h4>

			<!-- Profissão -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_job' placeholder='Proissão' style='width:100%;' />
			</div>
			<br>
			<!-- Ramo da profissão -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_jobactivity' placeholder='Ramo da atividade' style='width:100%;' />
			</div>
			<br>
			<!-- Autônomo -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_customer_independentjob' style='width:100%;' >
					<option value='' disabled selected hidden >Autônomo</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>
			<br>
			<!-- Outra ocupação -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_jobother' placeholder='Outra ocupação' style='width:100%;' />
			</div>
			<br>
			<!-- Outra fonte de renda -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_otherincomming' placeholder='Outra fonte de renda' style='width:100%;' />
			</div>
			<br>
			<!-- Salário mensal -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_salary' placeholder='Salário mensal' style='width:100%;' />
			</div>
			<br>
			<!-- Meses de salario -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_customer_type' style='width:100%;' >
					<option value='' disabled selected hidden >Mêses de salário</option>
					<option value='12' >12</option>
					<option value='13' >13</option>
				</select>
			</div>

			<h4>Informações de residência</h4>

			<!-- Endereço atual -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_address' placeholder='Endereço atual' style='width:100%;' />
			</div>

			<!-- Propridade do imóvel atual -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_customer_houseproperty' style='width:100%;' >
					<option value='' disabled selected hidden >Propriedade do imóvel</option>
					<option value='0' >Própria</option>
					<option value='1' >Alugada</option>
					<option value='2' >Outro</option>
				</select>
			</div>

			<!-- Cômodos -->
			<div class='input-control text' style='width:100%;' >
				<input type='number' name='mandat_customer_rooms' placeholder='Cômodos' style='width:100%;' />
			</div>

			<!-- Proprietário do imóvel -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_houseproprietary' placeholder='Proprietário do imóvel (nome ou imobiliária)' style='width:100%;' />
			</div>

			<!-- Hipoteca -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_customer_hypothec' placeholder='Hipoteca' style='width:100%;' />
			</div>

		</div>
	</div>

	<!-- Informações do conjuge ou co-locatário -->
	<div style='display:table-cell;width:30%;padding-right:.5rem;' >
		<div class='box' style='width:100%;' >
			<h4>Informações do conjuge ou co-locatário</h4>
			<!-- Tratamento -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_cotenant_entitlement' id='mandat_cotenant_entitlement' style='width:100%;' >
					<option value='' disabled selected hidden >Tratamento</option>
					<option value='0' >Senhor</option>
					<option value='1' >Senhora</option>
					<option value='2' >Senhorita</option>
				</select>
			</div>
			<br>
			<!-- Nome -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_name' placeholder='Nome' style='width:100%;' />
			</div>
			<br>
			<!-- Sobrenome -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_surname' placeholder='Sobrenome' style='width:100%;' />
			</div>
			<br>
			<!-- Data de nascimento -->
			<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:100%;' >
				<input type='text' name='mandat_cotenant_birthday' placeholder='Data de nascimento' style='width:100%;' />
				<button class='button clear' ><span class='mif-calendar' ></span></button>
			</div>
			<br>
			<!-- Nacionalidade -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_nationality' placeholder='Nacionalidade' style='width:100%;' />
			</div>
			<br>
			<!-- Estado civil -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_cotenant_civilstate' style='width:100%;' >
					<option value='' disabled selected hidden >Estado civil</option>
					<option value='0' >Solteiro</option>
					<option value='1' >Em um relacionamento</option>
					<option value='2' >Casado(a)</option>
					<option value='3' >Separado(a)</option>
					<option value='4' >Divorciado(a)</option>
					<option value='5' >Viúvo(a)</option>
				</select>
			</div>
			<br>
			<!-- Filhos -->
			<div class='input-control text' style='width:100%;' >
				<input type='number' name='mandat_cotenant_children' placeholder='Filhos' style='width:100%;' />
			</div>
			<br>
			<!-- Filhos -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_children_ages' placeholder='Idades dos filhos' style='width:100%;' />
			</div>
			<br>
			<!-- Animais -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_cotenant_animals' style='width:100%;' >
					<option value='' disabled selected hidden >Animais</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>
			<br>
			<!-- Celular -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_mobilenumber' placeholder='Celular' style='width:100%;' />
			</div>
			<br>
			<!-- Telefone -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_phonenumber' placeholder='Telefone' style='width:100%;' />
			</div>
			<br>
			<!-- Email -->
			<div class='input-control email' style='width:100%;' >
				<input type='email' name='mandat_cotenant_email' placeholder='Email' style='width:100%;' />
			</div>
			<br>
			<!-- Contrato por tempo indeterminado -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_cotenant_noexpirecontract' style='width:100%;' >
					<option value='' disabled selected hidden >Contrato tempo indeterminado</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>

			<h4>Informações profissionais</h4>

			<!-- Profissão -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_job' placeholder='Proissão' style='width:100%;' />
			</div>
			<br>
			<!-- Ramo da profissão -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_jobactivity' placeholder='Ramo da atividade' style='width:100%;' />
			</div>
			<br>
			<!-- Autônomo -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_cotenant_independentjob' style='width:100%;' >
					<option value='' disabled selected hidden >Autônomo</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>
			<br>
			<!-- Outra ocupação -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_jobother' placeholder='Outra ocupação' style='width:100%;' />
			</div>
			<br>
			<!-- Outra fonte de renda -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_otherincomming' placeholder='Outra fonte de renda' style='width:100%;' />
			</div>
			<br>
			<!-- Salário mensal -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_salary' placeholder='Salário mensal' style='width:100%;' />
			</div>
			<br>
			<!-- Meses de salario -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_cotenant_type' style='width:100%;' >
					<option value='' disabled selected hidden >Mêses de salário</option>
					<option value='12' >12</option>
					<option value='13' >13</option>
				</select>
			</div>

			<h4>Informações de endereço</h4>

			<!-- Endereço atual -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_address' placeholder='Endereço atual' style='width:100%;' />
			</div>

			<!-- Propridade do imóvel atual -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_cotenant_houseproperty' style='width:100%;' >
					<option value='' disabled selected hidden >Propriedade do imóvel</option>
					<option value='0' >Própria</option>
					<option value='1' >Alugada</option>
					<option value='2' >Outro</option>
				</select>
			</div>

			<!-- Cômodos -->
			<div class='input-control text' style='width:100%;' >
				<input type='number' name='mandat_cotenant_rooms' placeholder='Cômodos' style='width:100%;' />
			</div>

			<!-- Proprietário do imóvel -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_houseproprietary' placeholder='Proprietário do imóvel (nome ou imobiliária)' style='width:100%;' />
			</div>

			<!-- Hipoteca -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_cotenant_hypothec' placeholder='Hipoteca' style='width:100%;' />
			</div>

		</div>
	</div>

	<!-- Informações do fiador -->
	<div style='display:table-cell;width:30%;padding-right:.5rem;' >
		<div class='box' style='width:100%;' >
			<h4>Informações do fiador</h4>
			<!-- Tratamento -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_guarantor_entitlement' id='mandat_guarantor_entitlement' style='width:100%;' >
					<option value='' disabled selected hidden >Tratamento</option>
					<option value='0' >Senhor</option>
					<option value='1' >Senhora</option>
					<option value='2' >Senhorita</option>
				</select>
			</div>
			<br>
			<!-- Nome -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_name' placeholder='Nome' style='width:100%;' />
			</div>
			<br>
			<!-- Sobrenome -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_surname' placeholder='Sobrenome' style='width:100%;' />
			</div>
			<br>
			<!-- Data de nascimento -->
			<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:100%;' >
				<input type='text' name='mandat_guarantor_birthday' placeholder='Data de nascimento' style='width:100%;' />
				<button class='button clear' ><span class='mif-calendar' ></span></button>
			</div>
			<br>
			<!-- Nacionalidade -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_nationality' placeholder='Nacionalidade' style='width:100%;' />
			</div>
			<br>
			<!-- Estado civil -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_guarantor_civilstate' style='width:100%;' >
					<option value='' disabled selected hidden >Estado civil</option>
					<option value='0' >Solteiro</option>
					<option value='1' >Em um relacionamento</option>
					<option value='2' >Casado(a)</option>
					<option value='3' >Separado(a)</option>
					<option value='4' >Divorciado(a)</option>
					<option value='5' >Viúvo(a)</option>
				</select>
			</div>
			<br>
			<!-- Filhos -->
			<div class='input-control text' style='width:100%;' >
				<input type='number' name='mandat_guarantor_children' placeholder='Filhos' style='width:100%;' />
			</div>
			<br>
			<!-- Filhos -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_children_ages' placeholder='Idades dos filhos' style='width:100%;' />
			</div>
			<br>
			<!-- Animais -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_guarantor_animals' style='width:100%;' >
					<option value='' disabled selected hidden >Animais</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>
			<br>
			<!-- Celular -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_mobilenumber' placeholder='Celular' style='width:100%;' />
			</div>
			<br>
			<!-- Telefone -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_phonenumber' placeholder='Telefone' style='width:100%;' />
			</div>
			<br>
			<!-- Email -->
			<div class='input-control email' style='width:100%;' >
				<input type='email' name='mandat_guarantor_email' placeholder='Email' style='width:100%;' />
			</div>
			<br>
			<!-- Contrato por tempo indeterminado -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_guarantor_noexpirecontract' style='width:100%;' >
					<option value='' disabled selected hidden >Contrato tempo indeterminado</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>

			<h4>Informações profissionais</h4>

			<!-- Profissão -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_job' placeholder='Proissão' style='width:100%;' />
			</div>
			<br>
			<!-- Ramo da profissão -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_jobactivity' placeholder='Ramo da atividade' style='width:100%;' />
			</div>
			<br>
			<!-- Autônomo -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_guarantor_independentjob' style='width:100%;' >
					<option value='' disabled selected hidden >Autônomo</option>
					<option value='0' >Não</option>
					<option value='1' >Sim</option>
				</select>
			</div>
			<br>
			<!-- Outra ocupação -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_jobother' placeholder='Outra ocupação' style='width:100%;' />
			</div>
			<br>
			<!-- Outra fonte de renda -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_otherincomming' placeholder='Outra fonte de renda' style='width:100%;' />
			</div>
			<br>
			<!-- Salário mensal -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_salary' placeholder='Salário mensal' style='width:100%;' />
			</div>
			<br>
			<!-- Meses de salario -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_guarantor_type' style='width:100%;' >
					<option value='' disabled selected hidden >Mêses de salário</option>
					<option value='12' >12</option>
					<option value='13' >13</option>
				</select>
			</div>

			<h4>Informações de endereço</h4>

			<!-- Endereço atual -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_address' placeholder='Endereço atual' style='width:100%;' />
			</div>

			<!-- Propridade do imóvel atual -->
			<div class='input-control select' style='width:100%;' >
				<select name='mandat_guarantor_houseproperty' style='width:100%;' >
					<option value='' disabled selected hidden >Propriedade do imóvel</option>
					<option value='0' >Própria</option>
					<option value='1' >Alugada</option>
					<option value='2' >Outro</option>
				</select>
			</div>

			<!-- Cômodos -->
			<div class='input-control text' style='width:100%;' >
				<input type='number' name='mandat_guarantor_rooms' placeholder='Cômodos' style='width:100%;' />
			</div>

			<!-- Proprietário do imóvel -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_houseproprietary' placeholder='Proprietário do imóvel (nome ou imobiliária)' style='width:100%;' />
			</div>

			<!-- Hipoteca -->
			<div class='input-control text' style='width:100%;' >
				<input type='text' name='mandat_guarantor_hypothec' placeholder='Hipoteca' style='width:100%;' />
			</div>

		</div>
	</div>

</div>


<div class='box' >
	
	<div class='box' >

		<h4>Informações sobre o imóvel desejado</h4>

		<!-- Tipo de negociação (locação ou venda) -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de negócio' style='width:11.5em;' >
			<select name='mandat_business' multiple='multiple' style='width:100%;' >
				<option value='0' >Locação</option>
				<option value='1' >Compra</option>
			</select>
		</div>

		<!-- Tipo de imóvel -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de propriedade' style='width:18em;' >
			<select name='mandat_type' multiple='multiple' style='width:100%;' >
				<option value='0' >Casa</option>
				<option value='1' >Apartamento</option>
				<option value='2' >Comércio</option>
			</select>
		</div>

		<!-- Num de cômodos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='mandat_rooms' placeholder='Cômodos' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Área total -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='text' name='mandat_surface' placeholder='Área total' style='width:100%;' />
		</div>

		<!-- Preço min  -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='mandat_pricemin' placeholder='Preço min' style='width:100%;' />
		</div>

		<!-- Preço max  -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='mandat_pricemax' placeholder='Preço max' style='width:100%;' />
		</div>

		<br>
		<!-- Mapa -->
		<div>
			<b>Selecione no mapa as áreas desejadas:<b><br>
			<iframe src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d914.8077890098408!2d-46.73154277301919!3d-23.48818211105614!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94cef93f1aa3352b%3A0xa426edb6bd4edaab!2sAv.+Mutinga%2C+477+-+Vila+Pirituba%2C+S%C3%A3o+Paulo+-+SP!5e0!3m2!1spt-BR!2sbr!4v1489423781796' width='534' height='300' frameborder='0' style='border:0' ></iframe><br>
			<div class='input-control text' style='width:534px' >
				<input type='text' name='mandat_unwanted' placeholder='Áreas ou ruas indesejadas' style='width:100%;' />
			</div>
		</div>

	</div>

	<div class='box' >
		<h4>Características obrigatórias</h4>
		<include src='../../1c-realties/lib/charaq-req' />
	</div>

	<br>

	<div class='box' >
		<h4>Características opcionais</h4>
		<include src='../../1c-realties/lib/charaq-opt' />
	</div>

	<div class='box' style='display:block;' >
		<h4>Observações</h4>
		<div class='input-control textarea' data-role='input' data-text-auto-resize='true' name='mandat_observations' style='width:100%;' >
			<textarea></textarea>
		</div>
	</div>

</div>

<div class='box' style='vertical-align:top;' >
	<h4>Status</h4>
	<label class='input-control radio small-check' >
		<input type='radio' name='mandat_status' id='mandat_status_inactive' checked='checked' />
		<span class='check' ></span>
		<span class='caption' >Inativo</span>
	</label>
	<label class='input-control radio small-check' >
		<input type='radio' name='mandat_status' id='mandat_status_ctive' />
		<span class='check' ></span>
		<span class='caption' >Ativo</span>
	</label>
	<label class='input-control radio small-check' >
		<input type='radio' name='mandat_status' id='mandat_status_closed' />
		<span class='check' ></span>
		<span class='caption' >Encerrado</span>
	</label>
</div>

<div class='box' style='vertical-align:top;' >
	<h4>Termos e condições</h4>
	<label class='input-control checkbox small-check' >
		<input type='checkbox' name='mandat_terms' id='mandat_terms' />
		<span class='check' ></span>
		<span class='caption' >Concordo com os termos e condições</span>
	</label>
</div>

<span style='position:absolute;right:0;bottom:0;' >
	<input type='submit' class='button' value='Salvar' />
</span>

</div>