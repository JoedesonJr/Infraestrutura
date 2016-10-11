<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>           
<html ng-app="form" ng-cloak>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>| Login</title>
        
        <link rel="shortcut icon" type="image/png" href="<c:url value='/resources/img/favicon.png'/>"/>
        <link rel="stylesheet" href="<c:url value='/resources/fonts/fonts.css'/>">
  		<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
        <link type="text/css" href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">      
        
        <!-- ANGULAR -->
		<script src="<c:url value='/resources/angular/angular.js'/>"></script>
		<script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
		<script src="<c:url value='/resources/js/app.js'/>"></script>
		<script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
		<script src="<c:url value='/resources/js/directives/ng-currency.js'/>"></script>
    </head>
    <body>
    	<!-- CABEÇALHO -->
    	<div class="container">
    		<div class="row text-center">
    			<div class="col-md-4 text-center">
    				<br>
    				<nav aria-label="...">
  						<ul class="pager pull-left">
    						<li class="previous">
    							<a class="text-muted" href="http://200.132.36.170:8080/PortalProjetos/">
    								<span aria-hidden="true">&larr;</span> Portal
    							</a>
    						</li>
 						</ul>
					</nav>
    			</div>
    			<div class="col-md-4" style="margin-top: 1%;">
    				<img class="img-responsive" src="<c:url value='/resources/img/img_2_poli.jpg'/>" alt="logo"/>
    			</div>
    			<div class="col-md-4"></div>
    		</div>
			<hr>
    		<ol class="breadcrumb">
  				<li></li>
  				<li class="active"> 
  					<i class="fa fa-info-circle" aria-hidden="true"></i> &nbsp
  					Você poderá utilizar a sua conta cadastrada no sistema de Solicitação de Demandas em Projeto para acessar este sistema.
  				</li>
			</ol>
    	</div>
    	
    	<br>
    	
    	<!-- FORMULARIOS -->
    	<div class="top-content">
        	<div class="container">
        		<!-- TITULO -->
            	<div class="text-center text-muted">
                 	<h1 class="title"><strong>UFSM</strong> | Solicitação de Infraestrutura</h1>
        		</div>                
                
                <div class="row form-row">
                	<!-- MENSAGENS CONTA-->	
					<c:import url="mensagens/mensagens-conta.jsp" />

                	<!-- CRIAR CONTA -->         
                	<div class="col-sm-5">
                		<!-- MENSAGENS CONTA-->	
						<c:import url="mensagens/mensagens-status-conta.jsp" />
                	
                		<!-- FORMULÁRIO CRIAR CONTA --> 
						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3><strong>Crie uma conta</strong></h3>
									<p class="text-muted">Para criar uma conta, preencha os campos:</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-pencil text-success"></i>
								</div>
							</div>
							<div class="form-bottom">
								<c:import url="formularios/form-criar-conta.jsp" />
							</div>
                   		</div>
                	</div>
                	
                    <!-- BORDA -->  
                    <div class="col-sm-1 middle-border"></div>
                    <div class="col-sm-1"></div>
                    
                    <!-- LOGIN -->    
					<div class="col-sm-5">
						<!-- MENSAGENS LOGIN -->
						<c:import url="mensagens/mensagens-login.jsp" />	
					
						<div class="form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3><strong>Login</strong></h3>
									<p class="text-muted">Para acessar sua conta, informe:</p>
								</div>
								<div class="form-top-right">
									<i class="fa fa-key text-info"></i>
								</div>
							</div>
							<div class="form-bottom">
								<c:import url="formularios/form-login.jsp" />	
							</div>
						</div>
                    </div>
            	</div>
            	        	
	        	<!-- RODAPE -->
				<jsp:include page="../rodape/rodape.jsp"></jsp:include>
        	</div>
        </div>
    	
    	<!-- REENVIAR EMAIL -->
    	<div class="modal fade" id="reenviarEmail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
			    	<div class="modal-header text-center">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			            <h4 class="modal-title text-muted" id="myModalLabel">
			            	<span class="fa fa-envelope"></span> Reenviar código de confirmação
			            </h4>
			        </div>
			        <div class="modal-body text-center">
						<h4 class="modal-title" id="myModalLabel">
							<strong> Confirme seus dados! </strong>  </br></br>
							
							<form action="remandMail" method="post" class="form-inline">
								<input type="hidden" name="siape" value="${usuario.siape}" />
				  				<div class="form-group">
				    				<label for="Código">Este é seu email?</label>
				    				<input type="text" class="form-control" name="email" value="${usuario.email}" disabled>
				  				</div>
		  						<br><br>
		  						<div class="text-center">
					  				<button type="submit" class="btn btn-default">
					  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">
					  						Sim, quero receber o código de confirmação novamente
					  					</span>
					  				</button> 
					  				<a class="btn btn-default" data-toggle="modal" href="#alterarCadastro" style="margin-top: 1%">
					  					<span class="glyphicon glyphicon-remove text-danger"></span> <span class="text-danger">
					  						Não, quero redefinir meu email
					  					</span>
					  				</a>
					  			</div>
							</form>						
						</h4>
					</div>
					<div class="modal-footer">
                    	<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Cancelar</button>
                   	</div>
			   </div>
           </div>
        </div>	
    	
    	<!-- ALTERAR CADASTRO -->
    	<div class="modal fade" id="alterarCadastro" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
			    	<div class="modal-header text-center">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			            <h4 class="modal-title text-muted" id="myModalLabel">
			            	<span class="glyphicon glyphicon-wrench"></span> Alterar Cadastro
			            </h4>
			        </div>
			        <div class="modal-body text-center">
						<h4 class="modal-title" id="myModalLabel">							
							<form action="editAccount" autocomplete="off" method="post">
								<input type="hidden" name="siape" value="${usuario.siape}" />
								<div class="form-group">
									<label for="Nome">Nome</label>
									<input type="text" name="nome" minlength="5" placeholder="Nome Completo" class="form-control" value="${usuario.nome}" required>
								</div>
								<hr>
								
								<div class="row">
									<div class="col-md-7">
										<div class="form-group">
											<label for="Email">Email</label>
											<input type="email" name="email" placeholder="Email" class="form-control" value="${usuario.email}" required>
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-group">
											<label for="Siape">Siape</label>
											<input type="text" name="siape" class="form-control" value="${usuario.siape}" disabled>
										</div>
									</div>
								</div>
								<hr>
								
								<button type="submit" class="btn btn-primary"> <span class="fa fa-check"></span> Alterar</button>
								<a href="removeAccount?siape=${usuario.siape}" class="btn btn-danger"> 
									<span class="fa fa-trash"></span> Excluir minha Conta
								</a>
							</form>						
						</h4>
					</div>
					<div class="modal-footer">
                    	<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Cancelar</button>
                   	</div>
			   </div>
           </div>
        </div>	
    	
    	<!-- RECUPERAR SENHA -->
    	<div class="modal fade" id="recuperarSenha" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
			    	<div class="modal-header text-center">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			            <h4 class="modal-title text-muted" id="myModalLabel">
			            	<i class="fa fa-key text-info"></i> Recuperar Senha
			            </h4>
			        </div>
			        <div class="modal-body text-center">
						<h4 class="modal-title" id="myModalLabel">
							<strong> Confirme seus dados! </strong>  </br></br>
						</h4>	
						<form action="recoverPassword" autocomplete="off" method="post">
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label for="Siape">Siape</label>
										<input type="text" name="siape" maxlength="9" placeholder="Siape" class="form-control" ng-model="x" required ui-number>
									</div>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<label for="Email">Email</label>
										<input type="email" name="email" placeholder="Email" class="form-control" required>
									</div>
								</div>
							</div>										
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">
					  		<span class="glyphicon glyphicon-ok"></span> Confirmar
					  	</button> 
					  	</form>	
                    	<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Cancelar</button>
                   	</div>
			   </div>
           </div>
        </div>	
    	
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	</body>
</html>