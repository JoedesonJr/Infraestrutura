<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>           
<html ng-app="form" ng-cloak>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>| Infraestrutura</title>
        
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
				<li role="presentation" class="active"><a href="#">Solicitar</a></li>
				<li role="presentation"><a class="text-primary" href="view">Modificar</a></li>
			</ul>

			<!-- CAMINHO -->
			<ol class="breadcrumb" style="margin-top: 3%;">
				<li><a class="text-primary" href="http://200.132.36.170:8080/PortalProjetos/"><i class="fa fa-home" aria-hidden="true"></i> Portal de Projetos</a></li>
				<li class="active">Solicitar Infraestrutura</li>
				<li></li>
			</ol>
		
			<!-- MENSAGENS -->
			<jsp:include page="mensagens/mensagem.jsp"></jsp:include>
		
			<div class="row" style="margin-top: 2%">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<!-- FORMULARIO -->
					<jsp:include page="formularios/form-cadastrar-infraestrutura.jsp"></jsp:include>
				</div>
				<div class="col-md-1"></div>
			</div>
			
			<!-- RODAPE -->
			<jsp:include page="../rodape/rodape.jsp"></jsp:include>
    	</div>

		<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
						(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
					m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

			ga('create', 'UA-85149828-1', 'auto');
			ga('send', 'pageview');
		</script>

	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	</body>
</html>