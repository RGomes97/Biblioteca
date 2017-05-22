package classes;
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;
import persistencia.GerenteConexao;
import DAO.PedidoDAO;

public class TestaEmpregado {
	
	public static void main(String[] args){
		PedidoDAO pedidoDAO = new PedidoDAO();
		Calendar calendar = Calendar.getInstance();
		List<Pedido>pedidos = pedidoDAO.getAll();
		for(Pedido pedido : pedidos){
			System.out.print(pedido.getDataReserva());
		}
		
	}

}
