package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.ufsm.csi.email.CriarConta;
import br.ufsm.model.Usuario;

public class UsuarioDAO {

	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private String query;
	
	public Usuario autenticarUsuario(Usuario usuario) {

		this.query = " SELECT nome, cadastro, email FROM usuario WHERE siape = ? AND senha = ? ; ";
			
		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, usuario.getSiape());
			stmt.setString(2, usuario.getSenha());
				
			ResultSet rs = stmt.executeQuery();
				
			while(rs.next()){
				usuario.setNomeCompleto(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setCadastro(rs.getBoolean("cadastro"));
				
				String[] primeiroNome = usuario.getNomeCompleto().split(" ");
				usuario.setNome(primeiroNome[0]);

				return usuario;
			}
			
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			
		return null;
	}

	public Usuario recuperarSenha(Usuario usuario) {
		
		query = " SELECT siape, nome, email, senha FROM usuario WHERE siape = ?; ";
		
		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, usuario.getSiape());
				
			ResultSet rs = stmt.executeQuery();

			while(rs.next()){
				if(usuario.getEmail().equals(rs.getString("email"))) {
					Usuario u = new Usuario();
					u.setSiape(rs.getInt("siape"));
					u.setNome(rs.getString("nome"));
					u.setEmail(rs.getString("email"));
					u.setSenha(rs.getString("senha"));
					
					return u;
				}
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}

	public boolean cadastrarUsuario(Usuario usuario, int codigo) throws Exception{
		
		query = " INSERT INTO usuario (siape, nome, email, senha, cadastro, codigo) "
			+ " VALUES (?,?,?,?,?,?); ";
				
		stmt = conn.prepareStatement(query);			
		stmt.setInt(1, usuario.getSiape());
		stmt.setString(2, usuario.getNome().toUpperCase());
		stmt.setString(3, usuario.getEmail());
		stmt.setString(4, usuario.getSenha());
		stmt.setBoolean(5, false);
		stmt.setInt(6, codigo);
				
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

	public boolean validarConta(int siape, int codigo) {
		
		query = " SELECT nome FROM usuario WHERE siape = ? AND codigo = ?; ";
		
		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, siape);
			stmt.setInt(2, codigo);
				
			ResultSet rs = stmt.executeQuery();
			
			Usuario usuario = new Usuario();
				
			while(rs.next()){
				usuario.setNome(rs.getString("nome"));
				
				if(validar(siape))
					return true;
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean validar(long siape) throws Exception{
		
		query = " UPDATE usuario SET cadastro = true WHERE siape = ?;";
		
		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, siape);
				
			stmt.execute();
			stmt.close();
			conn.close();
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}

	public boolean reenviarEmail(long siape) {
		
		query = " SELECT nome, email, codigo FROM usuario WHERE siape = ?; ";
		
		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, siape);
				
			ResultSet rs = stmt.executeQuery();
				
			while(rs.next()){
				Usuario usuario = new Usuario();
				
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				int codigo = Integer.parseInt(rs.getString("codigo"));

				new Thread(new CriarConta(usuario, codigo)).start();
				
				return true;
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}

	public boolean modificarConta(Usuario usuario, long siape) throws Exception{

		this.query = " UPDATE usuario SET nome = ?, email = ?"
			+ " WHERE siape = ? ; ";
				
		stmt = conn.prepareStatement(this.query);
				
		stmt.setString(1, usuario.getNome());
		stmt.setString(2, usuario.getEmail());
		stmt.setLong(3, siape);

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

	public boolean removerConta(long siape) throws Exception{
		
		this.query = " DELETE FROM usuario WHERE siape = ?; ";
		
		stmt = conn.prepareStatement(this.query);	
		stmt.setLong(1, siape);

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
	
	public boolean autenticar (Usuario usuario) {

		this.query = " SELECT nome, cadastro, email FROM usuario WHERE siape = ? AND senha = ? ; ";
			
		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, usuario.getSiape());
			stmt.setString(2, usuario.getSenha());
				
			ResultSet rs = stmt.executeQuery();
				
			while(rs.next()){
				return true;
			}
			
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			
		return false;
	}

	public boolean alterarSenha(int siape, String novaSenha) throws Exception{
		
		this.query = " UPDATE usuario SET senha = ? "
			+ " WHERE siape = ? ; ";
					
		stmt = conn.prepareStatement(this.query);
					
		stmt.setString(1, novaSenha);
		stmt.setLong(2, siape);

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
