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
import classes.PedidosRetirados;
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
	
	public List getRetirados(int idUser) {
		List pedidosList = new ArrayList();
        try {
            String sql = "SELECT usuarios.nome, livros.nome, item_retirado.id, item_retirado.data_retirada, item_retirado.multa FROM `item_retirado` inner join usuarios on usuarios.id = item_retirado.id_usuario inner join livros on livros.id = item_retirado.id_livro where usuarios.id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idUser);
			ResultSet rs = pst.executeQuery();
			while (rs.next()){
				PedidosRetirados pedidos = new PedidosRetirados();
				pedidos.setNomeUsuario(rs.getString("usuarios.nome"));
				pedidos.setNomeLivro(rs.getString("livros.nome"));
				pedidos.setIdPedido(rs.getInt("item_retirado.id"));
				pedidos.setData(rs.getDate("item_retirado.data_retirada"));
				pedidos.setHora(rs.getTime("item_retirado.data_retirada"));
				pedidos.setMulta(rs.getDouble("item_retirado.multa"));
				pedidosList.add(pedidos);
			}
			
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
        return pedidosList;
    }
	
}
