<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

    <c:if test="${status == 'erro_cadastroUsuario'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong>  Já possui usuário com este siape.
        </div>
    </c:if> 

	<c:if test="${status == 'autenticarUsuario'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong>  Conta autenticada com Sucesso.
        </div>
    </c:if>
    
    <c:if test="${status == 'editarConta'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong>  Conta alterada com Sucesso.
        </div>
    </c:if>
    <c:if test="${status == 'erro_editarConta'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong>  Senha invalida.
        </div>
    </c:if> 
    
    <c:if test="${status == 'excluirConta'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong> Conta excluida com sucesso.
        </div>
    </c:if>
    
	<c:if test="${status == 'removerConta'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong>  Conta removida com Sucesso.
        </div>
    </c:if>
    <c:if test="${status == 'erro_removerConta'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong>  Conta não removida.
        </div>
    </c:if>
    
	<c:if test="${status == 'alterarSenha'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong>  Senha alterada com Sucesso.
        </div>
    </c:if>
    <c:if test="${status == 'erro_alterarSenha'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Senha não alterada. 
        </div>
    </c:if>  
    
	<c:if test="${status == 'erro_emailReenviado'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong>  Tente novamente mais tarde.
        </div>
    </c:if> 
<c:set var="status" value="vazio" scope="page" />
