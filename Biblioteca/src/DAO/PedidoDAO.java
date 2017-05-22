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
        	String sql = "SELECT usuarios.nome, livros.nome, item_pedido.id_pedido, item_pedido.data_reserva FROM `item_pedido` inner join usuarios on usuarios.id = item_pedido.id_usuario inner join livros on livros.id = item_pedido.id_livro";
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
}
