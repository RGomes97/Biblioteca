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
	        	String sql = "INSERT INTO USUARIOS(NOME,RA,TELEFONE,TIPO,SENHA,CURSO,DATA_DE_CADASTRO) VALUES(?,?,?,?,?,?,now())";
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, user.getNome());
	            ps.setString(2, user.getRa());
	            ps.setInt(3, user.getTelefone());
	            ps.setString(4, user.getTipo());
	            ps.setString(5, user.getSenha());
	            ps.setString(6, user.getCurso());
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

	    public void editUser(User user) {    	
	    	try {
	    		String sql = "UPDATE users SET firstname=?";
	            PreparedStatement ps = conn
	                    .prepareStatement(sql);
	            ps.setString(1, user.getNome());          	
	            ps.executeUpdate();            

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
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
	            	user.setSenha(rs.getString("senha"));
	            	user.setCurso(rs.getString("curso"));
	            	user.setRa(rs.getString("ra"));
	            	user.setTelefone(rs.getInt("telefone"));
	            	user.setTipo(rs.getString("tipo"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return user;
	    }
}
