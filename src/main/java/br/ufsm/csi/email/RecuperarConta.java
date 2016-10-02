package br.ufsm.csi.email;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.ufsm.model.Usuario;


public class RecuperarConta implements Runnable{

	private Usuario usuario;
	
	public RecuperarConta(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public void sendEmail() throws EmailException {
		
		SimpleEmail email = new SimpleEmail();
		
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(465);
		
		// Destinat�rio
		email.addTo(usuario.getEmail(), usuario.getNome());
		// O email do qual enviar�
		email.setFrom("solicitacaodedamandas@gmail.com", "Solicitacao de Infraestrutura");
		// Assunto
		email.setSubject("Recuperar Senha");
		// Mensagem
		email.setMsg(
				"Ol� " +usuario.getNome() +"\n\n"
			  + "Sua senha �: " +usuario.getSenha() +"\n\n"
		);

		email.setSSL(true);
		// Autenticar Email
		email.setAuthentication("solicitacaodedamandas@gmail.com", "politecnicoufsm");
		
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
