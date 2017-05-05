package classes;

public class Livro {
	
	private String nome;
	private int quantidade;
	private String autor;
	private int isbn;
	private String genero;
	
	public Livro(String nome, int quantidade, String autor, int isbn, String genero){
		this.nome = nome;
		this.quantidade = quantidade;
		this.autor = autor;
		this.isbn = isbn;
		this.genero = genero;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
}
