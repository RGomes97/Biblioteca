package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GerenteConexao {
	
	public static Connection getConexao(){
		 Connection conexao = null;
		 String url = "jdbc:mysql://localhost:3306/biblioteca";
		 String usuario = "root";
		 String senha = "";

		try{
			 Class.forName("org.gjt.mm.mysql.Driver");
			 conexao = DriverManager.getConnection(url, usuario, senha); 
			 System.out.println("Conexão efetuada com sucesso!!!");
		}
		
		catch(ClassNotFoundException cnfe){
			 System.out.println("Erro ao carregar o driver");
			 cnfe.printStackTrace();
		}
		
		catch(SQLException sqle){
			 System.out.println("Não foi possível conectar com o BD");
			 sqle.printStackTrace();
		}
		
		 System.out.println(conexao);
		 return conexao;
	}
		 

}
