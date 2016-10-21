package br.ufsm.csi.model;

import java.sql.Date;

public class Infraestrutura {
	
	private int id;
	private int siape;
	private String predio;
	private String sala;
	private String solicitacao;
	private Date data;
	
	public String getPredio() {
		return predio;
	}
	public void setPredio(String predio) {
		this.predio = predio;
	}
	
	public String getSala() {
		return sala;
	}
	public void setSala(String sala) {
		this.sala = sala;
	}
	
	public String getSolicitacao() {
		return solicitacao;
	}
	public void setSolicitacao(String solicitacao) {
		this.solicitacao = solicitacao;
	}
	
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	
	public int getSiape() {
		return siape;
	}
	public void setSiape(int siape) {
		this.siape = siape;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
