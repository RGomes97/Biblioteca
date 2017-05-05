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
<%@ page import="classes.TestaEmpregado" %>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
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
	<h1>Cadastro de usuários</h1>
		<form action="" method="POST">
			<label>Nome:</label>
			<input type="text" class="form-control" name="nome" required/>
			<label>RA:</label>
			<input type="text" class="form-control" name="ra" required/>
			<label>Telefone:</label>
			<input type="number" class="form-control" name="telefone" required/>
			<label>Tipo:</label>
			<input type="text" class="form-control" name="tipo" required/>
			<label>Senha:</label>
			<input type="password" class="form-control" name="senha" required/>
			<label>Curso:</label>
			<input type="text" class="form-control" name="curso" required/>
			<input class="btn btn-info center-block margin-top" type="submit" value="Cadastrar">
		</form>
	</div>
	<%
		if(request.getParameter("nome") != null){
			String nome = request.getParameter("nome");
			String ra = request.getParameter("ra");
			int telefone = Integer.parseInt(request.getParameter("telefone"));
			String tipo = request.getParameter("tipo");
			String senha = request.getParameter("senha");
			String curso = request.getParameter("curso");
			User user = new User(nome,ra,telefone,tipo,senha,curso);
			UserDAO userDAO = new UserDAO();
			userDAO.addUser(user);
		}
	%>
</body>
</html>