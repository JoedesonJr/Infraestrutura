package br.ufsm.csi.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.UsuarioDAO;
import br.ufsm.csi.email.CriarConta;
import br.ufsm.csi.model.Usuario;

@Controller
public class UsuarioController {

	private boolean retorno = false;
	
	@RequestMapping("createAccount")
	public String criarConta (Usuario usuario, RedirectAttributes redirectAttributes) throws Exception{
		
		Random random = new Random();
		int codigo = random.nextInt(8999) + 1000;  // gera um codigo aleatorio de 4 digitos
		
		this.retorno = new UsuarioDAO().cadastrarUsuario(usuario, codigo);

		if(retorno){
			new Thread(new CriarConta(usuario, codigo)).start();
			
			redirectAttributes.addFlashAttribute("status", "cadastroUsuario");
			redirectAttributes.addFlashAttribute("usuario", usuario);	
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroUsuario");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("update_Account")
	public String atualizarConta (Usuario usuario, RedirectAttributes redirectAttributes, HttpSession session) throws Exception{

		this.retorno = new UsuarioDAO().autenticar(usuario);
		
		if(retorno){
			this.retorno = false;
			this.retorno = new UsuarioDAO().modificarConta(usuario, usuario.getSiape());
			
			if(retorno){
				redirectAttributes.addFlashAttribute("status", "editarConta");
			}else{
				redirectAttributes.addFlashAttribute("status", "erro_editarConta");
			}
			session.invalidate();
			
			return "redirect:login";
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_editarConta_");
			
			return "redirect:register";
		}
	}
	
	@RequestMapping("update_Password")
	public String atualizarSenha (Usuario usuario, HttpServletRequest request, 
			HttpSession session, RedirectAttributes redirectAttributes) throws Exception{
		
		String novaSenha = request.getParameter("novaSenha");

		this.retorno = new UsuarioDAO().autenticar(usuario);

		if(retorno){
			retorno = false;
			this.retorno = new UsuarioDAO().alterarSenha(usuario.getSiape(), novaSenha);
			
			if(retorno){
				redirectAttributes.addFlashAttribute("status", "alterarSenha");
			}else{
				redirectAttributes.addFlashAttribute("status", "erro_alterarSenha");
			}
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_alterarSenha_");
			
			return "redirect:register";
		}
		session.invalidate();
		
		return "redirect:login";
	}
	
}
