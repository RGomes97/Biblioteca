<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Insert title here</title>
<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
</head>
<body id="tpl-login">
<img class="img-responsive center-block" style="height: 280px" src="http://1.bp.blogspot.com/-7fgqAV0sjSY/VGthi05wW1I/AAAAAAAADj0/enOlOFcNRIA/s1600/logo_biblioteca-03.png" />
<div class="login login-color">
	<form class="login" action="" method="POST">
		<div class="row">
			<div class="">
				<label for="login">RA:</label>
				<input type="text" class="form-control" name="ra" required/>
			</div>
		</div>
		<div class="row">
			<div class="">
				<label for="senha">Senha:</label>
				<input type="password" class="form-control" name="senha" required/>
			</div>
		</div>
		<div class="row">
			<input type="submit" class="btn btn-default center-block margin-button" />
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