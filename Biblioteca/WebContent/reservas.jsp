<jsp:include page="cabecalhoAdmin.jsp" />
<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.Pedido" %>
<%@ page import="DAO.PedidoDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!-- import header do administrador -->

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
				        <th style="width: 170px">Confirmar / Excluir</th>
	
				      </tr>
				    </thead>
				    <tbody>
				    <%
						PedidoDAO pedidoDAO = new PedidoDAO();
						List<Pedido>pedidos = pedidoDAO.getAll();
						for(Pedido pedido : pedidos){
					%>
						<tr>
							<td><%=pedido.getIdPedido() %></td>
							<td><%=pedido.getNomeUsuario() %></td>
							<td><%=pedido.getNomeLivro() %></td>
							<td><%=pedido.getDataReserva()%>
								<%=pedido.getHoraReserva() %></td>
							<td><a class="btn btn-primary"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a>
							<a class="btn btn-default"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
							
						</tr>
					<%
						}
					%>
				    </tbody>
			  </table>
	</div>
</div>
</body>
