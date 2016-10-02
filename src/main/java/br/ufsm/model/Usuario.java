package br.ufsm.model;

public class Usuario {

	private int siape;
	private String nome;
	private String nomeCompleto;
	private String senha;
	private String email;
	private boolean cadastro;
	
	public int getSiape() {
		return siape;
	}
	public void setSiape(int siape) {
		this.siape = siape;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public boolean getCadastro() {
		return cadastro;
	}
	public void setCadastro(boolean cadastro) {
		this.cadastro = cadastro;
	}
	
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}
	
}
