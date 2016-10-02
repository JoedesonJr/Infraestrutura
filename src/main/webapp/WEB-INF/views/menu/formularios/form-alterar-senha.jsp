<div class="modal fade" id="alterarSenha" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
			    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			    	<h4 class="modal-title text-muted" id="myModalLabel"> 
			        	<span class="fa fa-key"></span> Alterar Senha
			        </h4>
			</div>
			<div class="modal-body text-center">
				<form action="update_Password" method="post" autocomplete="off">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="Siape">Siape</label>
								<input type="text" name="siape" maxlength="9" ng-model="alterar.siape" class="form-control" required ui-number>		
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="Senha Atual">Senha Atual</label>
								<input type="password" name="senha" class="form-control" required>		
							</div>
						</div>
					</div>
					<hr>
					
					<div ng-if="novaSenha != confirmarSenha" class="alert alert-danger" role="alert">
						<strong><span class="glyphicon glyphicon-warning-sign"></span> Opa! Senhas não correspondem! </strong>
					</div>
					<div ng-if="novaSenha && confirmarSenha && novaSenha == confirmarSenha" class="alert alert-success" role="alert">
						<strong><span class="glyphicon glyphicon-ok"></span> Ok! As senhas correspondem! </strong>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="Nova Senha">Nova Senha</label>
								<input type="password" name="novaSenha" minlength="6" ng-model="novaSenha" class="form-control" required>		
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="Senha Atual">Confirme sua Nova Senha</label>
								<input type="password" name="confirmarSenha" minlength="6" ng-model="confirmarSenha" class="form-control" required>		
							</div>
						</div>
					</div>
			</div>
			<div class="modal-footer">
						<button class="btn btn-primary" ng-disabled="novaSenha != confirmarSenha" type="submit" margin-bottom: 1%;">
							<span class="glyphicon glyphicon-ok"></span> Alterar
						</button>
				</form>		
                	<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Fechar</button>
           </div>
       </div>
	</div>
</div>