<!-- Características gerais -->
<div class='input-control select' data-role='select' data-allow-clear='true' data-placeholder='#1c-realties.CharacGeneral#' style='width:28em;' >
	<select name='charac_gen' id='charac_gen' multiple='multiple' title='#1c-realties.CharacGeneral#' style='width:100%;' >
		<multiple name='charac_opt_gen' >
			<option value='@charac_opt_gen.id@' >@charac_opt_gen.name@</option>	
		</multiple>
	</select>
</div>

<!-- Características de arquitetura -->
<div class='input-control select' data-role='select' data-allow-clear='true' data-placeholder='#1c-realties.CharacArchitecture#' style='width:28em;' >
	<select name='charac_arc' id='charac_arc' multiple='multiple' title='#1c-realties.CharacArchitecture#' style='width:100%;' >
		<multiple name='charac_opt_arc' >
			<option value='@charac_opt_arc.id@' >@charac_opt_arc.name@</option>	
		</multiple>
	</select>
</div>

<!-- Características da vizinhança -->
<div class='input-control select' data-role='select' data-allow-clear='true' data-placeholder='#1c-realties.CharacNeighborhood#' style='width:56.25em;' >
	<select name='charac_vic' id='charac_vic' multiple='multiple' title='#1c-realties.CharacNeighborhood#' style='width:100%;' >
		<multiple name='charac_opt_vic' >
			<option value='@charac_opt_vic.id@' >@charac_opt_vic.name@</option>	
		</multiple>
	</select>
</div>