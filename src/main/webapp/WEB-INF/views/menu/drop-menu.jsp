<h4 class="text-muted pull-right">
	<ul class="nav nav-pillis">
		<li role="presentation" class="dropdown">
    		<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" id="menu"  aria-haspopup="true" aria-expanded="false">
    			<span class="glyphicon glyphicon-user"></span> ${usuarioLogado.nome} <span class="caret"></span>
    		</a> 
    					
    		<ul class="dropdown-menu">
    			<hr>
    			<li> <a data-toggle="modal" href="#editar"> <span class="fa fa-cog"></span> Editar Conta</a> </li>
    			<li> <a data-toggle="modal" href="#alterarSenha"> <span class="fa fa-key"></span> Alterar Senha</a> </li>
    			<li> <a data-toggle="modal" href="#excluirConta"> <span class="fa fa-trash"></span> Excluir Conta</a> </li>
    			<li><a><hr></a></li>
    			<li> <a href="logout"> <span class="glyphicon glyphicon-log-out"></span> Sair</a> </li>
    		</ul>
   		</li>
   	</ul>
</h4>

<!-- EDITAR CONTA -->
<jsp:include page="formularios/form-editar-conta.jsp"></jsp:include>
<!-- ALTERAR SENHA -->
<jsp:include page="formularios/form-alterar-senha.jsp"></jsp:include>
<!-- EXCLUIR CONTA -->
<jsp:include page="formularios/form-excluir-conta.jsp"></jsp:include>





    	