package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.ufsm.csi.model.Infraestrutura;

public class InfraestruturaDAO {

	private String query;
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	
	public boolean solicitar(Infraestrutura infraestrutura) throws Exception{
		
		query = " INSERT INTO infraestrutura (siape, predio, sala, solicitacao, data) VALUES (?,?,?,?, CURRENT_DATE); ";
					
		stmt = conn.prepareStatement(query);			
		stmt.setInt(1, infraestrutura.getSiape());
		stmt.setString(2, infraestrutura.getPredio());
		stmt.setString(3, infraestrutura.getSala());
		stmt.setString(4, infraestrutura.getSolicitacao());
					
		try{
			stmt.execute();
			stmt.close();
			conn.close();

			return true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return false;
	}

	public ArrayList<Infraestrutura> listaSolicitacao(int siape) {
		
		ArrayList<Infraestrutura> infraestruturas = new ArrayList<Infraestrutura>();
		
		this.query = " SELECT id, data, solicitacao, predio, sala FROM infraestrutura WHERE siape = ?; ";
		
		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, siape);
				
			ResultSet rs = stmt.executeQuery();
				
			while(rs.next()){
				Infraestrutura infraestrutura = new Infraestrutura();
					infraestrutura.setId(rs.getInt("id"));
					infraestrutura.setData(rs.getDate("data"));
					infraestrutura.setSolicitacao(rs.getString("solicitacao"));
					infraestrutura.setPredio(rs.getString("predio"));
					infraestrutura.setSala(rs.getString("sala"));	
				infraestruturas.add(infraestrutura);
			}
			
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			
		return infraestruturas;
	}

	public boolean remover(int id) {
		
		this.query = " DELETE FROM infraestrutura WHERE id = ?; ";

		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, id);

			stmt.execute();
			stmt.close();
			conn.close();

			return true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return false;
	}
	
	public ArrayList<Infraestrutura> getSolicitacao(int id) {
		
		ArrayList<Infraestrutura> infraestruturas = new ArrayList<Infraestrutura>();
		
		this.query = " SELECT id, solicitacao, predio, sala FROM infraestrutura WHERE id = ?; ";

		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, id);
				
			ResultSet rs = stmt.executeQuery();
				
			while(rs.next()){
				Infraestrutura infraestrutura = new Infraestrutura();
					infraestrutura.setId(rs.getInt("id"));
					infraestrutura.setSolicitacao(rs.getString("solicitacao"));
					infraestrutura.setPredio(rs.getString("predio"));
					infraestrutura.setSala(rs.getString("sala"));	
				infraestruturas.add(infraestrutura);
			}
			
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			
		return infraestruturas;
	}

	public boolean atualizar(Infraestrutura infraestrutura) throws Exception{
		this.query = " UPDATE infraestrutura SET solicitacao = ?, "
			+ " predio = ?, sala = ? "
			+ " WHERE id = ? ; ";
				
			stmt = conn.prepareStatement(this.query);
				
			stmt.setString(1, infraestrutura.getSolicitacao());
			stmt.setString(2, infraestrutura.getPredio());
			stmt.setString(3, infraestrutura.getSala());
			stmt.setInt(4, infraestrutura.getId());

			try{
				stmt.execute();
				stmt.close();
				conn.close();

				return true;
			}catch(Exception e){
				e.printStackTrace();
			}

			return false;
	}

}
