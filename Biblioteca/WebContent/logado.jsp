<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.Livro" %>
<%@ page import="DAO.LivroDAO" %>
<%@ page import="servicos.Reserva" %>
<%@ page import="DAO.PedidoDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
</head>
<body id="logado">
<jsp:include page="cabecalho.jsp" />
<jsp:include page="carousel.jsp" />
<!-- sidebar -->
<div class="container-fluid">
	<div class="row margin-button">
		<div class="col-md-2 col-sm-3">
			<ul class="nav nav-pills nav-stacked">
			  <li role="presentation" class="active"><a href="#">Gênero</a></li>
			  <li role="presentation"><a href="#">Auto-ajuda</a></li>
			  <li role="presentation"><a href="#">Didáticos</a></li>
			  <li role="presentation"><a href="#">Ficção</a></li>
			  <li role="presentation"><a href="#">Filosofia</a></li>
			  <li role="presentation"><a href="#">Técnologia</a></li>
			  <li role="presentation"><a href="#">Romance</a></li>
			  <li role="presentation"><a href="#">Suspense</a></li>
			  <li role="presentation"><a href="#">Terror</a></li>
			</ul>
		</div>
		<%
		LivroDAO livroDAO = new LivroDAO();
		List<Livro>livros = livroDAO.getAllBooks();
		for(Livro livro : livros){
		%>
		<div class="col-md-2">
		    <div class="thumbnail">
		      <img src="<%=livro.getUrl() %>" alt="...">
		      <div class="caption">
		        <h3><%=livro.getNome() %></h3>
		        <p>...</p>
		        <p><a href="logado.jsp?reservar=sim&id=<%=livro.getId() %>" class="btn btn-primary" role="button">Reservar</a></p>
		      </div>
		    </div>
		  </div>
		<%
			}
		%>
		 
	</div>
	<%
		if(request.getParameter("reservar") != null){
			Reserva reserva = new Reserva();
			int idUser = (Integer) session.getAttribute("id");
			int idLivro = Integer.parseInt(request.getParameter("id"));
			reserva.reservar(idUser, idLivro);
			%>
			<script>alert('Reservado com Sucesso')</script>
			<%
		}
	%>
</div>
</body>
</html>