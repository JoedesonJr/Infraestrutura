<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

	<c:if test="${status == 'cadastroUsuario'}"> 
        <div class="alert alert-success" role="alert"> 
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok!</strong> &nbsp Conta criada com Sucesso.
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="validateAccount" method="post" class="form-inline">
        				<input type="hidden" name="siape" value="${usuario.siape}" />
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if> 
    
	<c:if test="${status == 'cadastroInvalidado'}"> 
        <div class="alert alert-warning" role="alert"> 
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong>Sua conta ainda não foi validada.
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong> <br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="validateAccount" method="post" class="form-inline">
        				<input type="hidden" name="siape" value="${usuario.siape}" />
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" maxlength="4" autocomplete="off" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if>

	<c:if test="${status == 'erro_autenticarUsuario'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Código de autenticação invalido.
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong> <br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="validateAccount" method="post" class="form-inline">
        				<input type="hidden" name="siape" value="${usuario.siape}" />
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if>
    
    <c:if test="${status == 'modificarConta'}"> 
        <div class="alert alert-success" role="alert"> 
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong> Conta alterada com Sucesso.
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="validateAccount" method="post" class="form-inline">
        				<input type="hidden" name="siape" value="${usuario.siape}" />
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if>  
    
    <c:if test="${status == 'emailReenviado'}"> 
        <div class="alert alert-success" role="alert"> 
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong> O código de confirmação enviado novamente.
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="validateAccount" method="post" class="form-inline">
        				<input type="hidden" name="siape" value="${usuario.siape}" />
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if>  
<c:set var="status" value="vazio" scope="page" />

