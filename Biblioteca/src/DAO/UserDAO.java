package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import classes.User;
import persistencia.GerenteConexao;
	
public class UserDAO {

	    private Connection conn;

	    public UserDAO() {
	    	conn = GerenteConexao.getConexao();
	    }

	    public void addUser(User user) {
	        try {
	        	PreparedStatement ps = null;
	        	String sql = "INSERT INTO USUARIOS(NOME,RA,TELEFONE,TIPO,SENHA,CURSO,Email,DATA_DE_CADASTRO) VALUES(?,?,?,?,?,?,?,now())";
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, user.getNome());
	            ps.setString(2, user.getRa());
	            ps.setInt(3, user.getTelefone());
	            ps.setString(4, user.getTipo());
	            ps.setString(5, user.getSenha());
	            ps.setString(6, user.getCurso());
	            ps.setString(7, user.getEmail());
	            ps.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    public void removeUser(int userId) {
	        try {
	        	String sql = "DELETE FROM usuarios WHERE id=?";
	            PreparedStatement ps = conn
	                    .prepareStatement(sql);
	            ps.setInt(1, userId);
	            ps.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	     }
	    
	    public int altera(User user) {
			int ret = 0;
			try {
				String sql = "UPDATE usuarios SET nome = ?, ra = ?, "
					+ "telefone = ?, tipo = ?, senha = ?, curso = ?,email = ? WHERE id = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, user.getNome());
	            ps.setString(2, user.getRa());
	            ps.setInt(3, user.getTelefone());
	            ps.setString(4, user.getTipo());
	            ps.setString(5, user.getSenha());
	            ps.setString(6, user.getCurso());
	            ps.setString(7, user.getEmail());
	            ps.setInt(8, user.getId());
				ret = ps.executeUpdate();
				System.out.println("Foi gravado algo?");
				
			} catch (SQLException sqle) {
				System.out.println("Não foi possível atualizar os dados!!");
				System.out.println(sqle);
				sqle.printStackTrace();
			}
			return ret;
		}
	    
	    public User readUser(int id) {
			User user = null;
			try {
				String sql = "SELECT * FROM usuarios WHERE id = ?";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setInt(1, id);
				ResultSet rs = pst.executeQuery();
				if (rs.next()){
					
					user = new User();
					user.setId(rs.getInt("id"));
					user.setNome(rs.getString("nome"));
					user.setRa(rs.getString("ra"));
					user.setTelefone(rs.getInt("telefone"));
					user.setTipo(rs.getString("tipo"));
					user.setSenha(rs.getString("senha"));
					user.setCurso(rs.getString("curso"));
					user.setEmail(rs.getString("email"));
					System.out.println(user);
				}
				System.out.println(user.getNome()+"Dados obtidos com sucesso!!!");
			} catch (SQLException sqle) {
				System.out.println("Não foi possível obter os dados!!");
				sqle.printStackTrace();
				System.out.println(sqle);
			}
			return user;
		}
	    
	    public List getAllUsers() {
	        List users = new ArrayList();
	        try {
	        	String sql = "SELECT * FROM usuarios";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                User user = new User();
	                user.setNome(rs.getString("nome"));
	                user.setCurso(rs.getString("curso"));
	                user.setTipo(rs.getString("tipo"));
	                user.setRa(rs.getString("ra"));
	                user.setTelefone(rs.getInt("telefone"));
	                user.setId(rs.getInt("id"));
	                users.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return users;
	    }
	    public User getUserByRa(String ra) {
	    	User user = new User();
	        try {
	        	String sql = "SELECT * FROM usuarios WHERE ra=?";
	            PreparedStatement ps = conn.
	                    prepareStatement(sql);
	            ps.setString(1, ra);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	            	user.setId(rs.getInt("id"));
	            	user.setNome(rs.getString("nome"));
	            	user.setRa(rs.getString("ra"));
	            	user.setCurso(rs.getString("curso"));
	            	user.setTelefone(rs.getInt("telefone"));
	            	user.setTipo(rs.getString("tipo"));
	            	user.setSenha(rs.getString("senha"));
	            	user.setEmail(rs.getString("email"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return user;
	    }
}
