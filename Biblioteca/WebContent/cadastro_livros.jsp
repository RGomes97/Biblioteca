<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.Livro" %>
<%@ page import="DAO.LivroDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
</head>
<style>
	.margin-top{
		margin-top: 20px;
	}
</style>
<body>
	<div class="container">
	<h1>Cadastro de Livros</h1>
		<form action="" method="POST">
			<label>Nome:</label>
			<input type="text" class="form-control" name="nome" required/>
			<label>Quantidade:</label>
			<input type="text" class="form-control" name="quantidade" required/>
			<label>Autor:</label>
			<input type="text" class="form-control" name="autor" required/>
			<label>ISBN:</label>
			<input type="number" class="form-control" name="isbn" required/>
			<label>Genero:</label>
			<input type="text" class="form-control" name="genero" required/>
			<input class="btn btn-info center-block margin-top" type="submit" value="Cadastrar">
		</form>
	</div>
	<%
		if(request.getParameter("nome") != null){
			String nome = request.getParameter("nome");
			int quantidade = Integer.parseInt(request.getParameter("quantidade"));
			String autor = request.getParameter("autor");
			int isbn = Integer.parseInt(request.getParameter("isbn"));
			String genero = request.getParameter("genero");
			Livro livro = new Livro(nome,quantidade,autor,isbn,genero);
			LivroDAO livroDAO = new LivroDAO();
			livroDAO.addLivro(livro);
		}
	%>
</body>
</html>