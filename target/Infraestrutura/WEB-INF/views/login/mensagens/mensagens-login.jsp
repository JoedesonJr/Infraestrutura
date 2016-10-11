<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

	<c:if test="${status == 'erro_login'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Nenhuma conta vinculada a este siape.
        </div>
    </c:if>
    <c:if test="${status == '_erro_login_'}">
        <div class="alert alert-danger" role="alert" ng-init="siape='${usuario.siape}'">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span class="fa fa-close"></span> <strong>Olá ${usuario.nome}! &nbsp</strong> Sua senha está incorreta.
        </div>
    </c:if>

<c:if test="${status == 'recuperarSenha'}">
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong> A senha da sua conta foi enviada para seu email. 
        </div>
    </c:if>
    <c:if test="${status == 'erro_recuperarSenha'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong>  Email ou siape incorreto(s).
        </div>
    </c:if> 

<c:set var="status" value="vazio" scope="page" />

