<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

	<c:if test="${status == 'erro_cadastroInfraestrutura'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Solicitação não realizada. Tente novamente mais tarde. 
        </div>
    </c:if> 
    <c:if test="${status == 'cadastroInfraestrutura'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong> Solicitação realizada com sucesso. 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_alterarSenha_'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Siape ou senha invalido(s). 
        </div>
    </c:if>
    <c:if test="${status == 'erro_alterarSenha'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Senha não alterada. Tente novamente mais tarde. 
        </div>
    </c:if> 
    <c:if test="${status == 'alterarSenha'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong> Senha alterada com sucesso. 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_editarConta'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Conta não editada. Tente novamente mais tarde. 
        </div>
    </c:if>
    <c:if test="${status == 'erro_editarConta_'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Siape ou Senha invalido(s).
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removerInfraestrutura'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Solicitação não removida. Tente novamente mais tarde. 
        </div>
    </c:if> 
    <c:if test="${status == 'removerInfraestrutura'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong> Solicitação removida com sucesso. 
        </div>
    </c:if>
        <c:if test="${status == 'erro_atualizarInfraestrutura'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="fa fa-close"></span> <strong>Opa! &nbsp</strong> Solicitação não atualizada. Tente novamente mais tarde. 
        </div>
    </c:if> 
    
    <c:if test="${status == 'atualizarInfraestrutura'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong> Solicitação atualizada com sucesso. 
        </div>
    </c:if>

<c:set var="status" value="vazio" scope="page" />