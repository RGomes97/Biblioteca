<%	
	if(session.getAttribute("nome") != null){
		String nome = (String)session.getAttribute("nome");	
		if(nome.equals(null)){
			%>
			<script>
				alert("Por favor, realize o login");
				window.location.href = 'login.jsp';
			</script>
			<% 
		}else if(nome.equals(null)){
			%>
			<script>http://localhost:8080/Biblioteca/livros.jsp#
				alert("Por favor, realize o login");
				window.location.href = 'login.jsp';
			</script>
			<%
		}
	}else{
		%>
		<script>
			alert("Por favor, realize o login");
			window.location.href = 'login.jsp';
		</script>
		<%
	}
	
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Biblioteca Digital</title>
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Biblioteca</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="logado.jsp">Home <span class="sr-only">(current)</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Bem vindo <%= session.getAttribute("nome") %><span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/Biblioteca/perfil.jsp?id=<%= session.getAttribute("id") %>">Meu perfil</a></li>
            <li><a href="#">Trocar Senha</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/Biblioteca/sair.jsp">Sair</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
