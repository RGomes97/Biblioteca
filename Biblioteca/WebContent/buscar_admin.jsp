<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<%@ page import="persistencia.GerenteConexao" %>
	<%@ page import="classes.Pedido" %>
	<%@ page import="DAO.PedidoDAO" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %>
</head>
<body>
<jsp:include page="cabecalhoAdmin.jsp" />
	<div class="container">
		<div class="row text-center">
			<h1>Buscar reservas</h1>
		</div>
		<div class="row">
		  <div class="col-lg-offset-2 col-lg-8 margin-top">
		  	<form action="buscar_admin.jsp" method="POST">
		    <div class="input-group">
		      <input name="RA" type="text" class="form-control" placeholder="Search for...">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="submit">Buscar</a>
		      </span>
		    </div><!-- /input-group -->
		    </form>
		  </div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
	</div>
</body>
<%
	if(request.getParameter("RA") != null){
		PedidoDAO pedidoDAO = new PedidoDAO();
		List<Pedido>pedidos = pedidoDAO.getPedidoById(request.getParameter("RA"));
		%>
		<div class="panel panel-default margin-top">
  		<!-- Default panel contents -->
  		<div class="panel-heading text-center">
  			<h3>Resultados da busca:</h3>
  		</div>
				<table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Id pedido</th>
				        <th>Cliente</th>
				        <th>livro</th>
				        <th>Data de reserva</th>
				        
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
							<td><%=pedido.getDataReserva() %><%=pedido.getHoraReserva() %></td>
						</tr>
					<%
						}
					%>
				    </tbody>
			  </table>
			  <div class="col-md-12 text-center margin-top"> 
    			<a href="cadastro_livros.jsp" class="btn btn-primary">Cadastrar <span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a> 
			  </div>
	</div>
	<%		
		}
	%>
</html>