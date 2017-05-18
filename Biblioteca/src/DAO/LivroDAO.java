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
        	String sql = "INSERT INTO LIVROS(NOME,ESTOQUE,AUTOR,ISBN,GENERO,URL,DATA_DE_CADASTRO,quantidade_disponivel,quantidade_reservada,descricao) VALUES(?,?,?,?,?,?,now(),?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, livro.getNome());
            ps.setInt(2, livro.getEstoque());
            ps.setString(3, livro.getAutor());
            ps.setInt(4, livro.getIsbn());
            ps.setString(5, livro.getGenero());
            ps.setString(6, livro.getUrl());
            ps.setInt(7, livro.getEstoque());
            ps.setString(8, livro.getDescricao());
            ps.setInt(9, 0);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public int altera(Livro livro) {
		int ret = 0;
		try {
			String sql = "UPDATE livros SET nome = ?, estoque = ?, "
				+ "autor = ?, isbn = ?, genero = ?, url = ?, descricao = ? WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, livro.getNome());
            ps.setInt(2, livro.getEstoque());
            ps.setString(3, livro.getAutor());
            ps.setInt(4, livro.getIsbn());
            ps.setString(5, livro.getGenero());
            ps.setString(6, livro.getUrl());
            ps.setString(7, livro.getDescricao());
            ps.setInt(8, livro.getId());
			ret = ps.executeUpdate();
			System.out.println("Foi gravado algo?");
			
		} catch (SQLException sqle) {
			System.out.println("Não foi possível atualizar os dados!!");
			System.out.println(sqle);
			sqle.printStackTrace();
		}
		return ret;
	}
    
    public Livro readBook(int id) {
		Livro livro = null;
		try {
			String sql = "SELECT * FROM livros WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()){
				
				livro = new Livro();
				livro.setId(rs.getInt("id"));
				livro.setNome(rs.getString("nome"));
				livro.setEstoque(rs.getInt("estoque"));
				livro.setAutor(rs.getString("autor"));
				livro.setIsbn(rs.getInt("isbn"));
				livro.setGenero(rs.getString("genero"));
				livro.setUrl(rs.getString("url"));
				livro.setDescricao(rs.getString("descricao"));
				System.out.println(livro);
			}
			System.out.println(livro.getNome()+" Dados obtidos com sucesso!!!");
		} catch (SQLException sqle) {
			System.out.println("Não foi possível obter os dados!!");
			sqle.printStackTrace();
			System.out.println(sqle);
		}
		return livro;
	}
    
    public List getAllBooks() {
        List books = new ArrayList();
        try {
        	String sql = "SELECT * FROM livros";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Livro livro = new Livro();
                livro.setNome(rs.getString("nome")); 
                livro.setEstoque(rs.getInt("estoque")); 
                livro.setAutor(rs.getString("autor"));
                livro.setGenero(rs.getString("genero"));
                livro.setId(rs.getInt("id"));
                livro.setUrl(rs.getString("url"));
                books.add(livro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;
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
    
    public boolean reservarLivro(int idLivro){
    	try {
    		PreparedStatement ps = null;
    		String sql = "UPDATE LIVROS SET ESTOQUE = (ESTOQUE - 1), QUANTIDADE_RESERVADA = (QUANTIDADE_RESERVADA + 1) WHERE ID=?";
    		ps = conn.prepareStatement(sql);
            ps.setInt(1, idLivro);
            ps.executeUpdate();
            return true;
    	} catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
