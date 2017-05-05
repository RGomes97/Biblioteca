package DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import classes.Livro;
import persistencia.GerenteConexao;


public class LivroDAO {

    private Connection conn;

    public LivroDAO() {
    	conn = GerenteConexao.getConexao();
    }

    public void addLivro(Livro livro) {
        try {
        	PreparedStatement ps = null;
        	String sql = "INSERT INTO LIVROS(NOME,QUANTIDADE,AUTOR,ISBN,GENERO,DATA_DE_CADASTRO) VALUES(?,?,?,?,?,now())";
            ps = conn.prepareStatement(sql);
            ps.setString(1, livro.getNome());
            ps.setInt(2, livro.getQuantidade());
            ps.setString(3, livro.getAutor());
            ps.setInt(4, livro.getIsbn());
            ps.setString(5, livro.getGenero());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	

}
