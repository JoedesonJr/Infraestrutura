package br.ufsm.csi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.UsuarioDAO;
import br.ufsm.csi.email.RecuperarConta;
import br.ufsm.model.Usuario;


@Controller
@SessionAttributes("usuario")
public class LoginController {

	private boolean retorno;
	
	@RequestMapping("login")
	public String login (){
		return "login/login";
	}
	
	@RequestMapping("register")
	public String infraestrutura (){
		return "infraestrutura/cadastrar-infraestrutura";
	}
	
	@RequestMapping("authenticate")
	public String autenticarUsuario (Usuario usuario, HttpSession session, RedirectAttributes redirectAttributes) throws Exception{

		String senha = usuario.getSenha();
		Usuario usuarioAutenticado = new UsuarioDAO().autenticarUsuario(usuario);

		if(usuarioAutenticado != null) {  // usuário tem conta
			if(senha.equals(usuarioAutenticado.getSenha())) {  // usuário acertou a senha
				usuarioAutenticado.setSenha("");

				if(usuarioAutenticado.getCadastro()) {  // usuário com a conta autenticada
					session.setAttribute("usuarioLogado", usuarioAutenticado);

					return "redirect:register";
				}
				else {  // usuário sem a conta autenticada
					redirectAttributes.addFlashAttribute("status", "cadastroInvalidado");
					session.setAttribute("usuario", usuarioAutenticado);

					return "redirect:login";
				}
			}
			else {  // usuário errou a senha
				redirectAttributes.addFlashAttribute("status", "_erro_login_");

				String nome[] = usuarioAutenticado.getNome().split(" ");
				usuarioAutenticado.setNome(nome[0].substring(0,1) + nome[0].substring(1, nome[0].length()).toLowerCase());
				redirectAttributes.addFlashAttribute("usuario", usuarioAutenticado);

				return "redirect:login";
			}
		}
		else {  // usuário não tem conta
			redirectAttributes.addFlashAttribute("status", "erro_login");

			return "redirect:login";
		}
	}

	@RequestMapping("recoverPassword")
	public String recuperarSenha (Usuario usuario, RedirectAttributes redirectAttributes) throws Exception{
		
		Usuario usuarioAutenticado = new UsuarioDAO().recuperarSenha(usuario);

		if(usuarioAutenticado != null){
			new Thread(new RecuperarConta(usuarioAutenticado)).start();
			
			redirectAttributes.addFlashAttribute("status", "recuperarSenha");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_recuperarSenha");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("validateAccount")
	public String autenticarConta (Usuario usuario, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception{

		this.retorno = new UsuarioDAO().validarConta(usuario.getSiape(), Integer.parseInt(request.getParameter("codigo")));

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "autenticarUsuario");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_autenticarUsuario");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("remandMail")
	public String reenviarEmail (Usuario usuario, RedirectAttributes redirectAttributes) throws Exception{

		this.retorno = new UsuarioDAO().reenviarEmail(usuario.getSiape());

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "emailReenviado");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_emailReenviado");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("editAccount")
	public String modificarConta (Usuario usuario, long siape, HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception{

		this.retorno = new UsuarioDAO().modificarConta(usuario, siape);

		if(retorno){
			this.retorno = new UsuarioDAO().reenviarEmail(siape);
			redirectAttributes.addFlashAttribute("status", "modificarConta");
			session.setAttribute("usuario", usuario);
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroUsuario");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("removeAccount")
	public String removerConta (long siape, RedirectAttributes redirectAttributes) throws Exception{

		this.retorno = new UsuarioDAO().removerConta(siape);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removerConta");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removerConta");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
	  session.invalidate();
	  
	  return "redirect:login";
	}
}
