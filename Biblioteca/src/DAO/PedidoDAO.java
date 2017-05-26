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
	
	public List getAll() {
        List pedidos = new ArrayList();
        try {
        	String sql = "SELECT usuarios.nome, livros.nome, item_pedido.id_pedido, item_pedido.data_reserva FROM `item_pedido` inner join usuarios on usuarios.id = item_pedido.id_usuario inner join livros on livros.id = item_pedido.id_livro where item_pedido.data_retirada is null";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	Pedido pedido = new Pedido();
            	pedido.setIdPedido(rs.getInt("item_pedido.id_pedido"));
            	pedido.setNomeLivro(rs.getString("livros.nome"));
            	pedido.setNomeUsuario(rs.getString("usuarios.nome"));
            	pedido.setDataReserva(rs.getDate("item_pedido.data_reserva"));
            	pedido.setHoraReserva(rs.getTime("item_pedido.data_reserva"));
                pedidos.add(pedido);
             }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pedidos;
    }
	
	public List getPedidoById(String ra) {
        try {
        	int id = 0;
        	String sql = "SELECT usuarios.id FROM `item_pedido` inner join usuarios on usuarios.id = item_pedido.id_usuario inner join livros on livros.id = item_pedido.id_livro where usuarios.ra = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, ra);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
            
            return getPedido(id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
	
	public List getPedido(int id){
		List pedidos = new ArrayList();
        try {
        	String ra1 = "";
        	String sql = "SELECT usuarios.nome, livros.nome, item_pedido.id_pedido, item_pedido.data_reserva FROM `item_pedido` inner join usuarios on usuarios.id = item_pedido.id_usuario inner join livros on livros.id = item_pedido.id_livro where usuarios.id = ? and item_pedido.data_retirada is null";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	Pedido pedido = new Pedido();
            	pedido.setIdPedido(rs.getInt("item_pedido.id_pedido"));
            	pedido.setNomeLivro(rs.getString("livros.nome"));
            	pedido.setNomeUsuario(rs.getString("usuarios.nome"));
            	pedido.setDataReserva(rs.getDate("item_pedido.data_reserva"));
            	pedido.setHoraReserva(rs.getTime("item_pedido.data_reserva"));
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pedidos;
	}
	
	public String ConfirmarPedido(int idPedido){
    	try {
    		PreparedStatement ps = null;
    		String sql = "UPDATE ITEM_PEDIDO SET DATA_RETIRADA = NOW() WHERE ID_PEDIDO = ?";
    		ps = conn.prepareStatement(sql);
    		ps.setInt(1, idPedido);
            ps.executeUpdate();
            return "Livro retirado com sucesso";
    	} catch (SQLException e) {
            e.printStackTrace();
            return "Não foi possivel retirar o livro";
        }
    }
	
	public String removerPedido(int pedidoId) {
        try {
        	String sql = "DELETE FROM item_pedido WHERE id_pedido = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pedidoId);
            ps.executeUpdate();
            return "Pedido removido com sucesso";

        } catch (SQLException e) {
            e.printStackTrace();
            return "Nao foi possivel remover esse pedido";
        }
     }
}
