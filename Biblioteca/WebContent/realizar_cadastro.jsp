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
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.TestaEmpregado" %>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.*" %>

	<div class="container">
	<h1>Por favor, preencha os dados abaixo:</h1>
		<form action="" method="POST">
			<label class="col-md-02">Nome:</label>
			<input type="text" class="form-control" name="nome" required/>
			<label>RA:</label>
			<input type="text" class="form-control" name="ra" required/>
			<label>Telefone:</label>
			<input type="number" class="form-control" name="telefone" required/>
			<label>Senha:</label>
			<input type="password" class="form-control" name="senha" required/>
			<label>Curso:</label>
			<input type="text" class="form-control" name="curso" required/>
			<input class="btn btn-info center-block margin-top" type="submit" value="Cadastrar">
		</form>
	</div>
	<%
		if(request.getParameter("nome") != null){
			User user = new User();
			user.setNome(request.getParameter("nome"));
			user.setRa(request.getParameter("ra"));
			user.setTelefone(Integer.parseInt(request.getParameter("telefone")));
			user.setSenha(request.getParameter("senha"));
			user.setCurso(request.getParameter("curso"));
			UserDAO userDAO = new UserDAO();
			%>
			<script>
			alert("<%=userDAO.addNormalUser(user)%>");
			window.location.href = '/Biblioteca/login.jsp';
			</script>
			<%
		}
	%>
</body>
</html>
</body>
</html>