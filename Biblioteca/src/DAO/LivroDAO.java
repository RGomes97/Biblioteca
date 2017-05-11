package DAO;


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
    
    public List getAllBooks() {
        List users = new ArrayList();
        try {
        	String sql = "SELECT * FROM livros";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Livro livro = new Livro();
                livro.setNome(rs.getString("nome"));    
                livro.setAutor(rs.getString("autor"));
                livro.setGenero(rs.getString("genero"));
                livro.setId(rs.getInt("id"));
                livro.setUrl(rs.getString("url"));
                users.add(livro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
	
    
    public void removerLivro(int livroId) {
        try {
        	String sql = "DELETE FROM livros WHERE id=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setInt(1, livroId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
     }
    
    public boolean reservarLivro(Livro livro){
    	try {
    		PreparedStatement ps = null;
    		String sql = "UPDATE LIVROS SET QUANTIDADE = (QUANTIDADE - 1) WHERE ID=?";
    		ps = conn.prepareStatement(sql);
            ps.setInt(1, livro.getId());
            ps.executeUpdate();
            return true;
    	} catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
