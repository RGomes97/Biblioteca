<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="estilo2.css" />
	<title>Insert title here</title>
	<%@ page import="persistencia.GerenteConexao"%>
	<%@ page import="classes.User" %>
	<%@ page import="DAO.UserDAO" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %>
</head>
<body>
	<div class="bg-image bg-size">
	</div>	
		<div class="login login-color">
			<img class="img-responsive center-block" style="max-height: 90px; margin-top: 5px;" src="http://unicatolica-site.s3.amazonaws.com/wp-content/uploads/2016/12/LOGO-BIBLIOTECA.png" />
			<form class="form-login" action="" method="POST" style="margin-top: 40px;">
				<div class="row">
					<div class="">
						<label for="senha">RA:</label>
						<input placeholder="RA" type="text" class="form-control" name="ra" required/>
					</div>
				</div>
				<div class="row margin-input">
					<div>
						<label for="senha">Senha:</label>
						<input placeholder="Senha" type="password" class="form-control" name="senha" required/>
					</div>
				</div>
				<div class="row">
					<input type="submit" class="btn btn-primary center-block margin-button" value="Entrar" />
				</div>
			</form>
		</div>
	

<%
	
	if(request.getParameter("ra") != null){
		String ra = request.getParameter("ra");
		String senha = request.getParameter("senha");
		UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserByRa(ra);
		if(user.getRa() != null){
			if(user.getRa().equals(ra)){
				if(user.getSenha().equals(senha)){
					session.setAttribute("nome",user.getNome());
					session.setAttribute("tipo",user.getTipo());
					session.setAttribute("id", user.getId());					
					
					// redirecionando apos login
					// se o usuario for admin 
					if(user.getTipo().equals("admin")){
						response.sendRedirect("/Biblioteca/admin.jsp");
					} else { // se o usuario for aluno/prof
						response.sendRedirect("/Biblioteca/logado.jsp");
					}
					
					%>
					<script>alert("logado com sucesso!")</script>
					
					<% 
				}else{
					%>
						<script>alert("Senha incorreta")</script>
					<%
				}
			}
			else{
				%>
				<script>alert("Login e/ou senha incorretos")</script>
				<% 
			}
		}else{
			%>
			<script>alert("Login e/ou senha incorretos")</script>
			<%
		}
	}
	
%>
</body>
</html>