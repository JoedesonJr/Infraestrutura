package br.ufsm.csi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.InfraestruturaDAO;
import br.ufsm.csi.model.Infraestrutura;
import br.ufsm.csi.model.Usuario;

@Controller
@SessionAttributes("usuario")
public class InfraestrutruraController {

	private boolean retorno;
	
	@RequestMapping("request")
	public String infraestrutura(Infraestrutura infraestrutura, RedirectAttributes redirectAttributes) throws Exception{

		this.retorno = new InfraestruturaDAO().solicitar(infraestrutura);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroInfraestrutura");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroInfraestrutura");
		}

		return "redirect:register";
	}
	
	@RequestMapping("view")
	public String teste (Usuario usuario, Model model) throws Exception{
		model.addAttribute("infraestruturas", new InfraestruturaDAO().listaSolicitacao(usuario.getSiape()));

		return "infraestrutura/visualizar-infraestrutura";
	}

	
	@RequestMapping("edit")
	public String editar (Infraestrutura infraestrutura, Model model) throws Exception{
		model.addAttribute("infraestruturas", new InfraestruturaDAO().getSolicitacao(infraestrutura.getId()));
		
		return "infraestrutura/editar-infraestrutura";
	}
	
	@RequestMapping("remove")
	public String remover (Infraestrutura infraestrutura, RedirectAttributes redirectAttributes) throws Exception{
		
		this.retorno = new InfraestruturaDAO().remover(infraestrutura.getId());

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removerInfraestrutura");	
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removerInfraestrutura");
		}
		
		return "redirect:view";
	}
	
	@RequestMapping("update")
	public String atualizar (Infraestrutura infraestrutura, RedirectAttributes redirectAttributes) throws Exception{
		
		this.retorno = new InfraestruturaDAO().atualizar(infraestrutura);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "atualizarInfraestrutura");	
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_atualizarInfraestrutura");
		}
		
		return "redirect:view";
	}
	
}
