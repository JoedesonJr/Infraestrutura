<form action="request" method="post" autocomplete="off">
	<div class="row">
		<div class="col-md-3">
			<label for="Siape">Siape</label> 
			<input type="hidden" name="siape"
				value="${usuarioLogado.siape}" /> <input type="text"
				class="form-control" value="${usuarioLogado.siape}"
				placeholder="Siape" disabled />
		</div>
		<div class="col-md-9">
			<label for="Nome Completo">Proponente</label> 
			<input type="text"
				class="form-control" value="${usuarioLogado.nomeCompleto}"
				placeholder="Nome Completo" disabled />
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-5">
			<label for="Email">Email</label> 
			<input type="text"
				class="form-control" value="${usuarioLogado.email}"
				placeholder="Email" disabled />
		</div>
		<div class="col-md-4">
			<label for="Pr�dio">Pr�dio</label> 
			<select class="form-control" name="predio" ng-model="item.predio" required>
				<option value="">--- Selecione um Pr�dio ---</option>
				<option value="Bloco A">Bloco A</option>
				<option value="Bloco B">Bloco B</option>
				<option value="Bloco C">Bloco C</option>
				<option value="Bloco D">Bloco D</option>
				<option value="Bloco E">Bloco E</option>
				<option value="Bloco F">Bloco F</option>
				<option value="Pr�dio 70 - Carnes">Pr�dio 70 - Carnes</option>
				<option value="Pr�dio 70 - Agroindustria">Pr�dio 70 - Agroindustria</option>
				<option value="Predio 72">Predio 72</option>
				<option value="Outro">Outro</option>
			</select>
		</div>
		<div class="col-md-3">
			<label for="Sala">Sala</label> 
			<input type="text" class="form-control" name="sala" ng-model="item.sala" placeholder="Sala" required />
		</div>
	</div>
	<hr>
	<div class="form-group">
		<label for="Solicita��o">Solicita��o</label>
		<textarea class="form-control" rows="4" name="solicitacao" ng-model="item.solicitacao" required></textarea>
	</div>
	<hr>
	<button class="btn btn-primary" type="submit"margin-bottom: 1%;">
		<span class="glyphicon glyphicon-ok"></span> Solicitar
	</button>
</form>
