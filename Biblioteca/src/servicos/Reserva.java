package servicos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import classes.Livro;
import classes.User;
import persistencia.GerenteConexao;
	

public class Reserva {
	
	
	public void reservar(User user, Livro livro){
		int idUser = user.getId();
		int idLivro = livro.getId();
		
		
	}
}
