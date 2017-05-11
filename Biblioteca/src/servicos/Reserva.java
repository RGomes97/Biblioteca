package servicos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import DAO.LivroDAO;
import DAO.PedidoDAO;
import classes.Livro;
import classes.User;
import persistencia.GerenteConexao;
	

public class Reserva {
	
	
	public void reservar(int idUser,int idLivro){
		LivroDAO livroDAO = new LivroDAO();
		PedidoDAO pedidoDAO = new PedidoDAO();
		livroDAO.reservarLivro(idLivro);
		pedidoDAO.addItemPedido(idLivro, idUser);
	}
}
