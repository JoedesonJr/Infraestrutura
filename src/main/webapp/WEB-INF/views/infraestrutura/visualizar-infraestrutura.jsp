<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />

<!DOCTYPE html>           
<html ng-app="form" ng-cloak>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>| Modificar Solicitação</title>
        
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
			<li role="presentation"><a href="register">Solicitar</a></li>
			<li role="presentation" class="active"><a class="text-primary" href="#">Modificar</a></li>
		</ul>

		<!-- CAMINHO -->
		<ol class="breadcrumb" style="margin-top: 3%;">
	  		<li><a class="text-primary" href="http://200.132.36.170:8080/PortalProjetos/"><i class="fa fa-home" aria-hidden="true"></i> Portal de Projetos</a></li>
	  		<li class="active">Modificar Solicitação</li>
	  		<li></li>
		</ol>			
		
		<!-- MENSAGENS -->
		<jsp:include page="mensagens/mensagem.jsp"></jsp:include>

		<div class="row" style="margin-top: 3%">
			<div class="col-md-12">
				<c:if test="${not empty infraestruturas}">
				<table class="table table-bordered">
	 				<thead>
	 					<tr>
	 						<th class="text-center">Data</th>
	 						<th>Solicitação</th>
	 						<th class="text-center">Prédio</th>
	 						<th class="text-center">Sala</th>
	 						<th class="text-center"><i class="fa fa-cogs" aria-hidden="true"></i></th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<c:forEach var="infraestrutura" items="${infraestruturas}">
	 						<tr>
	 							<td class="text-center text-info" width="8%">
	 								<fmt:formatDate type="date" dateStyle="medium" value="${infraestrutura.data}" /> 
	 							</td>
	 							<td>${infraestrutura.solicitacao}</td>
	 							<td class="text-muted text-center" width="13%"> ${infraestrutura.predio} </td>
	 							<td class="text-muted text-center" width="8%"> ${infraestrutura.sala} </td>
	 							<td class="text-center" width="13%">
	 								<form action="edit" method="post">
	 									<input type="hidden" name="id" value="${infraestrutura.id}" />
	 									
	 									<button class="btn btn-default btn-md" title="Editar" type="submit">
	 										<span class="glyphicon glyphicon-wrench text-success"></span>
	 									</button>
	 									
		 								<button class="btn btn-default btn-md" type="button" title="Remover" data-toggle="modal" data-target="#remover_${infraestrutura.id}">
			 								<span class="glyphicon glyphicon-remove text-danger"></span>
			 							</button>
	 								</form>							
	 							</td>
	 						</tr>
	 						
	 						<!-- REMOVER -->
	 						<div class="modal fade" id="remover_${infraestrutura.id}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				            	<div class="modal-dialog" role="document">
				                	<div class="modal-content">
				                    	<div class="modal-header text-center">
				                       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                        	<h4 class="modal-title text-muted" id="myModalLabel">
				                        		<i class="fa fa-trash" aria-hidden="true"></i> Remover Solicitação 
				                        	</h4>
				                    	</div>
				                    	<div class="modal-body text-center">
											<h4 class="modal-title" id="myModalLabel"><strong>Tem certeza que deseja remover esta Solicitação?</strong></h4>
										</div>
										<div class="modal-footer">
											<form action="remove" method="post">
												<input type="hidden" name="id" value="${infraestrutura.id}" />
												
												<button type="submit" class="btn btn-primary" title="Remover">
													<span class="glyphicon glyphicon-ok"></span> Confirmar
												</button>
												
		                    					<button type="button" class="btn btn-default" data-dismiss="modal">
		                    						<span class="fa fa-close"></span> Cancelar
		                    					</button>
											</form>
	                   					</div>
				                    </div>
	                        	</div>
	                    	</div>		
	 						</c:forEach>
	 					</tbody>
					</table>
					</c:if>
					<c:if test="${empty infraestruturas}">
						<h3 class="text-muted text-center">Não há projetos cadastrados.</h3>
					</c:if>
				</div>
		</div>
			
	    <!-- RODAPE -->
		<jsp:include page="../rodape/rodape.jsp"></jsp:include>
		
    	</div>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	</body>
</html>