<jsp:include page="cabecalhoAdmin.jsp" />
<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.PedidosRetirados" %>
<%@ page import="servicos.Reserva" %>
<%@ page import="DAO.PedidoDAO" %>
<%@ page import="DAO.RetiradaDAO" %>
<%@ page import="DAO.DevolucaoDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<div class="container">
	<div class="row">
		<table>
			<tr>
				<td><h1>Reservas</h1></td>
			</tr>
		</table>
	</div>
	<div class="panel panel-default">
  		<!-- Default panel contents -->
  		<div class="panel-heading text-center">
  			<h3>Reservas</h3>
  		</div>
				<table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Id_pedido</th>
				        <th>Usuario</th>
				        <th>Livro</th>
				        <th>Data</th>
				        <th>Valor da Multa</th>
				        <th style="width: 170px">Devoluções</th>
	
				      </tr>
				    </thead>
				    <tbody>
				    <%
						PedidoDAO pedidoDAO = new PedidoDAO();
				    	DevolucaoDAO devolucaoDAO = new DevolucaoDAO();
						List<PedidosRetirados>pedidos = devolucaoDAO.getAll();
						for(PedidosRetirados pedido : pedidos){
					%>
						<tr>
							<td><%=pedido.getIdPedido() %></td>
							<td><%=pedido.getNomeUsuario() %></td>
							<td><%=pedido.getNomeLivro() %></td>
							<td><%=pedido.getData()%>
								<%=pedido.getHora() %></td>
							<td><%=pedido.getMulta() %></td>
							<td><a href="/Biblioteca/devolucoes.jsp?confirmar=sim&id=<%=pedido.getIdPedido() %>&idLivro=<%=pedido.getIdLivro() %>" class="btn btn-primary"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a></td>
						</tr>
					<%
						}
					%>
				    </tbody>
			  </table>
	</div>
</div>
<%
	if(request.getParameter("confirmar") != null){
		int id = Integer.parseInt(request.getParameter("id"));
		int idLivro = Integer.parseInt(request.getParameter("idLivro"));
		Reserva reserva = new Reserva();
		String retorno = reserva.devolverPedidoRetirado(id, idLivro);
		%>
		<script>
			alert("<%=retorno%>");
			window.location.href = 'devolucoes.jsp';
		</script>
		<%
	}
%>
</body>
