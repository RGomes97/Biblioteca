package classes;

public class User {
	
	private String nome;
	private String ra;
	private int telefone;
	private String tipo;
	private String senha;
	private String curso;

	public User(String nome, String ra, int telefone, String tipo, String senha, String curso){
		this.nome = nome;
		this.ra = ra;
		this.telefone = telefone;
		this.tipo = tipo;
		this.senha = senha;
		this.curso = curso;
	}
	
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	
	public String getRa() {
		return ra;
	}
	public void setRa(String ra) {
		this.ra = ra;
	}
	public int getTelefone() {
		return telefone;
	}
	public void setTelefone(int telefone) {
		this.telefone = telefone;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
