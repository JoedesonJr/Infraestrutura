<form action="createAccount" method="post" autocomplete="off">
	<div class="form-group">
		<label class="sr-only" for="Nome">Nome</label> 
		<input type="text" name="nome" minlength="5" placeholder="Nome completo" class="form-control" required>
	</div>
	<div class="form-group">
		<label class="sr-only" for="Email">Email</label>
		<input type="email"	name="email" placeholder="Email" class="form-control" required>
	</div>
	<div class="form-group">
		<label class="sr-only" for="Siape">Siape</label> 
		<input type="text" name="siape" maxlength="9" placeholder="Siape" class="form-control" ng-model="item.siape" required ui-number>
	</div>
	<div class="form-group">
		<label class="sr-only" for="Senha">Senha</label> 
		<input type="password" minlength="6" name="senha" placeholder="Senha" ng-model="item.senha" class="form-control" required>
	</div>
	<div class="form-group">
		<label class="sr-only" for="Senha">Confirme sua senha</label> 
		<input type="password" minlength="6" placeholder="Confirme sua senha" ng-model="item.confirmarSenha" class="form-control" required>
	</div>

	<div ng-if="item.senha != item.confirmarSenha" class="alert alert-danger" role="alert">
			<strong><span class="fa fa-close"></span> Opa! &nbsp</strong> Senhas não correspondem! 
	</div>
	<div ng-if="item.senha && item.confirmarSenha && item.senha == item.confirmarSenha" class="alert alert-success" role="alert">
		<strong><span class="glyphicon glyphicon-ok"></span> Ok! &nbsp</strong> As senhas correspondem! 
	</div>

	<button type="submit" ng-disabled="item.senha != item.confirmarSenha" class="btn btn-primary">Cadastrar-se</button>
</form>