<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>           
<html ng-app="form" ng-cloak>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>| Editar Infraestrutura</title>
        
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
    	<br>
    	<div class="container">	
    	
		<!-- CABEÇALHO -->
		<div class="row">
    		<div class="col-md-10">
    			<h1 class="text-muted"> <span class="fa fa-university"></span> Solicitação de Infraestrutura</h1>
    		</div>
    		<div class="col-md-2">
    			<jsp:include page="../menu/drop-menu.jsp"></jsp:include>
    		</div>
    	</div>
		
		<!-- MENU -->
		<ul class="nav nav-tabs" style="margin-top: 2%;" id="menu">
			<li role="presentation"><a class="text-primary" href="register">Solicitar</a></li>
			<li role="presentation"><a class="text-primary" href="view">Modificar</a></li>
			<li role="presentation"  class="active"><a class="text-primary" href="#">Editar</a></li>
		</ul>

		<!-- CAMINHO -->
		<ol class="breadcrumb" style="margin-top: 3%;">
	  		<li><a class="text-primary" href="http://200.132.36.170:8080/PortalProjetos/"><i class="fa fa-home" aria-hidden="true"></i> Portal de Projetos</a></li>
	  		<li><a class="text-primary" href="view">Modificar Solicitação</a></li>
	  		<li class="active">Editar Solicitação</li>
	  		<li></li>
		</ol>			

		<div class="row" style="margin-top: 2%">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<c:forEach var="infra" items="${infraestruturas}">
				<form action="update" method="post" autocomplete="off">	
					<input type="hidden" name="id" value="${infra.id}" />	
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
								class="form-control" value="${usuarioLogado.nome}"
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
							<label for="Prédio">Prédio</label> 
							<div ng-init="item.predio='${infra.predio}'"></div>
							<select class="form-control" name="predio" ng-model="item.predio" required>
								<option value="">--- Selecione um Prédio ---</option>
								<option value="Bloco A">Bloco A</option>
								<option value="Bloco B">Bloco B</option>
								<option value="Bloco C">Bloco C</option>
								<option value="Bloco D">Bloco D</option>
								<option value="Bloco E">Bloco E</option>
								<option value="Bloco F">Bloco F</option>
								<option value="Prédio 70 - Carnes">Prédio 70 - Carnes</option>
								<option value="Prédio 70 - Agroindustria">Prédio 70 - Agroindustria</option>
								<option value="Predio 72">Predio 72</option>
								<option value="Outro">Outro</option>
							</select>
						</div>
						<div class="col-md-3" ng-init="item.sala='${infra.sala}'">
							<label for="Sala">Sala</label> 
							<input type="text" class="form-control" name="sala" ng-model="item.sala" placeholder="Sala" required />
						</div>
					</div>
					<hr>
					<div class="form-group" ng-init="item.solicitacao='${infra.solicitacao}'">
						<label for="Solicitação">Solicitação</label>
						<textarea class="form-control" rows="4" minlength="5" name="solicitacao" ng-model="item.solicitacao" required></textarea>
					</div>
					<hr>
					<button class="btn btn-primary" type="submit"margin-bottom: 1%;">
						<span class="glyphicon glyphicon-ok"></span> Alterar
					</button>
				</form>
				</c:forEach>
			</div>
			<div class="col-md-1"></div>
		</div>
			
	    <!-- RODAPE -->
		<jsp:include page="../rodape/rodape.jsp"></jsp:include>
		
    	</div>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	</body>
</html>