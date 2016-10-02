package br.ufsm.csi.email;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.ufsm.model.Usuario;


public class CriarConta implements Runnable{
	
	private Usuario usuario;
	private int codigo;
	
	public CriarConta(Usuario usuario, int codigo) {
		this.usuario = usuario;
		this.codigo = codigo;
	}
	
	public void sendEmail() throws EmailException {
		
		SimpleEmail email = new SimpleEmail();
		
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(465);
		email.setCharset("UTF-8");
		
		// Destinatário
		email.addTo(usuario.getEmail(), usuario.getNome());
		// O email do qual enviará
		email.setFrom("solicitacaodedamandas@gmail.com", "Solicitacao de Infraestrutura");
		// Assunto
		email.setSubject("Autenticar Cadastro");
		// Mensagem
		email.setMsg(
				"Olá " +usuario.getNome() +"\n\n"
			  + "Este é seu codigo de autenticação: " +codigo +"\n\n"
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
