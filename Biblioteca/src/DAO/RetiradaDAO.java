package DAO;

import java.sql.Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import classes.Pedido;
import classes.User;
import persistencia.GerenteConexao;

public class RetiradaDAO {
		
	private Connection conn;
	
	public RetiradaDAO(){
		conn = GerenteConexao.getConexao();
	}
	
	public void retirar(int idPedido) {
        try {
        	int idLivro = 0;
        	int idUsuario = 0;
        	PreparedStatement ps = null;
            String sql = "SELECT * FROM item_pedido WHERE id_pedido = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idPedido);
			ResultSet rs = pst.executeQuery();
			if (rs.next()){
				idLivro = rs.getInt("id_livro");
				idUsuario = rs.getInt("id_usuario");
			}
			insertRetirada(idLivro,idUsuario);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public void insertRetirada(int idLivro, int idUsuario){
		try{
			PreparedStatement ps = null;
	    	String sql = "INSERT INTO ITEM_RETIRADO(ID_USUARIO,ID_LIVRO,DATA_RETIRADA) VALUES(?,?,now())";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, idUsuario);
	        ps.setInt(2, idLivro);
	        ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
}
