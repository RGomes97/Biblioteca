package servicos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import DAO.DevolucaoDAO;
import DAO.LivroDAO;
import DAO.PedidoDAO;
import classes.Livro;
import classes.User;
import persistencia.GerenteConexao;
	

public class Reserva {
	
	private Connection conn;
	
	public Reserva(){
		conn = GerenteConexao.getConexao();
	}
	
	public void reservar(int idUser,int idLivro){
		LivroDAO livroDAO = new LivroDAO();
		PedidoDAO pedidoDAO = new PedidoDAO();
		livroDAO.reservarLivro(idLivro);
		pedidoDAO.addItemPedido(idLivro, idUser);
	}
	
	public void retirarPedido(int idPedido){
		PedidoDAO pedidoDAO = new PedidoDAO();
		pedidoDAO.ConfirmarPedido(idPedido);
		
	}
	
	public String devolverPedidoRetirado(int idItemRetirado, int idLivro){
		DevolucaoDAO devolucaoDAO = new DevolucaoDAO();
		LivroDAO livroDAO = new LivroDAO();
		devolucaoDAO.removerRetirada(idItemRetirado);
		livroDAO.devolverLivro(idLivro);
		
		return "Devolução feita com sucesso";
	}
}
