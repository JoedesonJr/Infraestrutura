<form action="authenticate" method="post" autocomplete="off">
	<div class="form-group">
		<label class="sr-only" for="Siape">Siape</label> 
		<input class="form-control" type="text" name="siape" maxlength="9" placeholder="Siape" ng-model="siape" required ui-number>
	</div>
	<div class="form-group">
		<label class="sr-only" for="Senha">Senha</label> 
		<input class="form-control"	type="password" name="senha" placeholder="Senha" required>
	</div>
	<button type="submit" class="btn btn-primary">Entrar</button>

	<div class="text-center" style="margin-top: 6%;">
		<h5>
			<a data-toggle="modal" href="#recuperarSenha"> 
				Esqueceu sua senha? 
			</a>
		</h5>
	</div>
</form>