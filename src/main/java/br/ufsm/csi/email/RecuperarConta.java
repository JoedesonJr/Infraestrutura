package br.ufsm.csi.email;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.ufsm.csi.model.Usuario;


public class RecuperarConta implements Runnable{

	private Usuario usuario;
	
	public RecuperarConta(Usuario usuario) {
		this.usuario = usuario;

		String nome[] = usuario.getNome().split(" ");
		usuario.setNome(nome[0].substring(0,1) + nome[0].substring(1, nome[0].length()).toLowerCase());
	}
	
	public void sendEmail() throws EmailException {
		
		SimpleEmail email = new SimpleEmail();
		
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(465);
		
		// Destinatário
		email.addTo(usuario.getEmail(), usuario.getNome());
		// O email do qual enviará
		email.setFrom("solicitacaodedemandas@gmail.com", "Solicitacao de Infraestrutura");
		// Assunto
		email.setSubject("Recuperar Senha");
		// Mensagem
		email.setMsg(
				"Olá " +usuario.getNome() +"\n\n"
			  + "Sua senha é: " +usuario.getSenha() +"\n\n"
		);

		email.setSSL(true);
		// Autenticar Email
		email.setAuthentication("solicitacaodedemandas@gmail.com", "politecnicoufsm");
		
		email.send();
		
	}

	public void run() {
		try {
			sendEmail();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}

}
