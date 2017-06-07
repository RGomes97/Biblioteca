package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import classes.PedidosRetirados;
import persistencia.GerenteConexao;

public class DevolucaoDAO {
	
	
private Connection conn;
	
	public DevolucaoDAO(){
		conn = GerenteConexao.getConexao();
	}
	
	public List getAll() {
		List pedidosList = new ArrayList();
        try {
            String sql = "SELECT usuarios.nome,usuarios.id as usuario_id, livros.nome, livros.id as livro_id, item_retirado.id, item_retirado.multa, item_retirado.data_retirada FROM `item_retirado` inner join usuarios on usuarios.id = item_retirado.id_usuario inner join livros on livros.id = item_retirado.id_livro";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()){
				PedidosRetirados pedidos = new PedidosRetirados();
				pedidos.setNomeUsuario(rs.getString("usuarios.nome"));
				pedidos.setIdUsuario(rs.getInt("usuario_id"));
				pedidos.setNomeLivro(rs.getString("livros.nome"));
				pedidos.setIdLivro(rs.getInt("livro_id"));
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
	
	public void removerRetirada(int retiradaId) {
        try {
        	String sql = "DELETE FROM item_retirado WHERE id=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setInt(1, retiradaId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
     }
	
}
