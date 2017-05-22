package classes;

import java.sql.Time;
import java.util.Date;

public class Pedido {
	
	private String nomeUsuario;
	private String nomeLivro;
	private int idPedido;
	private Date dataReserva;
	private Time horaReserva;
	
	public Pedido(){
		this.nomeUsuario = nomeUsuario;
		this.nomeLivro = nomeLivro;
		this.idPedido = idPedido;
		this.dataReserva = dataReserva;
		this.horaReserva = horaReserva;
	}

	public Time getHoraReserva() {
		return horaReserva;
	}

	public void setHoraReserva(Time horaReserva) {
		this.horaReserva = horaReserva;
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

	public Date getDataReserva() {
		return dataReserva;
	}

	public void setDataReserva(Date dataReserva) {
		this.dataReserva = dataReserva;
	}
}
