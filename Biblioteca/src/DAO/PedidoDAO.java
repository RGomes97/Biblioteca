package DAO;

import java.sql.Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import persistencia.GerenteConexao;

public class PedidoDAO {
		
	private Connection conn;
	
	public PedidoDAO(){
		conn = GerenteConexao.getConexao();
	}
	
	public void addItemPedido(int idLivro, int idUsuario){
		try {
        	PreparedStatement ps = null;
        	String sql = "INSERT INTO ITEM_PEDIDO(id_livro,id_usuario,data_reserva) VALUES(?,?,now())";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idLivro);
            ps.setInt(2, idUsuario);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
