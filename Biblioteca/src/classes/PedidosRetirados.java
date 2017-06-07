package classes;

import java.sql.Time;
import java.util.Date;

public class PedidosRetirados {
	
	private String nomeUsuario;
	private String nomeLivro;
	private int idPedido;
	private int idUsuario;
	private int idLivro;
	private Date data;
	private Time hora;
	private double multa;
	
	public PedidosRetirados(){
		this.nomeUsuario = nomeUsuario;
		this.nomeLivro = nomeLivro;
		this.idUsuario = idUsuario;
		this.idLivro = idLivro;
		this.idPedido = idPedido;
		this.data = data;
		this.hora = hora;
		this.multa = multa;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public int getIdLivro() {
		return idLivro;
	}

	public void setIdLivro(int idLivro) {
		this.idLivro = idLivro;
	}

	public String getNomeUsuario() {
		return nomeUsuario;
	}

	public void setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}

	public String getNomeLivro() {
		return nomeLivro;
	}

	public void setNomeLivro(String nomeLivro) {
		this.nomeLivro = nomeLivro;
	}

	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Time getHora() {
		return hora;
	}

	public void setHora(Time hora) {
		this.hora = hora;
	}

	public double getMulta() {
		return multa;
	}

	public void setMulta(double multa) {
		this.multa = multa;
	}
}
