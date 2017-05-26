<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.PedidoDAO" %>
<%@ page import="classes.Pedido" %>
<%@ page import="classes.User" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
</head>
<body>
<jsp:include page="cabecalho.jsp" />


<%
	int id = Integer.parseInt(request.getParameter("id"));
	UserDAO userDAO = new UserDAO();
	User user = userDAO.readUser(id);
%>
<div class="container">
	<div class="perfil col-md-12">
		<div class="col-md-6">
			<img class="img-responsive" src="<%=user.getFoto() %>">
		</div>
		<div class="col-md-6">
			<form action="" method="POST">
				<label>Nome:</label>
				<input type="text" class="form-control" name="nome" required value="<%=user.getNome()%>"/>
				<label>RA:</label>
				<input type="text" class="form-control" name="ra" required value="<%=user.getRa()%>" />
				<label>Telefone:</label>
				<input type="number" class="form-control" name="telefone" required value="<%=user.getTelefone()%>"/>
				<label>Tipo:</label>
				<input type="text" class="form-control" name="tipo" required value="<%=user.getTipo()%>"/>
				<label>Senha:</label>
				<input type="password" class="form-control" name="senha" required value="<%=user.getSenha()%>"/>
				<label>Curso:</label>
				<input type="text" class="form-control" name="curso" required value="<%=user.getCurso()%>"/>
				<button class="btn btn-info center-block margin-top" type="submit" value="">
					<i class="fa fa-edit fa-lg" aria-hidden="true"></i> Alterar
				</button>
			</form>
		</div>
		<div class="col-md-12">
		<div class="panel panel-default margin-top">
  		<!-- Default panel contents -->
  		<div class="panel-heading text-center">
  			<h3>Minhas Reservas</h3>
  		</div>
  				<%
  				PedidoDAO pedidoDAO = new PedidoDAO();
		    	List<Pedido>pedidos = pedidoDAO.getPedidoById(user.getRa());
		    	if(pedidos.size() <= 0){
		    		out.print("<p class='margin-top' style='text-align: center;'>Voce ainda não tem reservas</p>");
		    	}else{
  				%>
				<table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Id_pedido</th>
				        <th>Usuario</th>
				        <th>Livro</th>
				        <th>Data</th>
				        <th style="width: 170px">Cancelar reserva</th>
	
				      </tr>
				    </thead>
				    <tbody>
				    <%	
							for(Pedido pedido : pedidos){
					%>
						<tr>
							<td><%=pedido.getIdPedido() %></td>
							<td><%=pedido.getNomeUsuario() %></td>
							<td><%=pedido.getNomeLivro() %></td>
							<td><%=pedido.getDataReserva()%>
								<%=pedido.getHoraReserva() %></td>
							<td><a href="/Biblioteca/perfil.jsp?excluir=sim&id_livro=<%=pedido.getIdPedido() %>&id=<%=user.getId() %>" class="btn btn-default btn-cancel-center"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
						</tr>
					<%
						}
				    }
					%>
				    </tbody>
			  </table>
	</div>
		
	</div>
	</div>
	
	
</div>
<%
		if(request.getParameter("excluir") != null){
			int id2 = Integer.parseInt(request.getParameter("id_livro"));
			String retorno = pedidoDAO.removerPedido(id2);
		%>
		<script>
			alert("<%=retorno%>");
			var param = window.location.href.split('&')[2];
			var url = 'perfil.jsp?' + param;
			window.location.href = url;
		</script>
		<%
	}
%>
</body>
</html>