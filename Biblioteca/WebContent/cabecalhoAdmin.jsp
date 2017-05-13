<%	
	if(session.getAttribute("nome") != null && session.getAttribute("tipo") != null){
		String nome = (String)session.getAttribute("nome");
		String tipo = (String)session.getAttribute("tipo");	
		if(!nome.equals(null) && !tipo.equals("admin")){
			%>
			<script>
				alert("Por favor, realize o login aaa");
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
			alert("Por favor, realize o login ccc");
			window.location.href = 'login.jsp';
		</script>
		<%
	}
	
%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Livros Cadastrados</title>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="/Biblioteca/estilo2.css" />
	
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#"><img class="img-responsive center-block" style="max-height: 90px; margin-top: 5px;" src="http://www.posunipos.com.br/upload/fotos/modelos/355/821533707aabdc13bf5cccad32526c22.png" /></a>
	    </div>
	
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a class="btn btn-success btn-lg" href="/Biblioteca/usuarios.jsp"><i class="fa fa-user fa-lg" aria-hidden="true"></i> Usuarios</a></li>
	        <li><a class="btn btn-warning btn-lg" href="/Biblioteca/livros.jsp"><i class="fa fa-book fa-lg" aria-hidden="true"></i> Livros</a></li>
	        <li><a class="btn btn-info btn-lg" href="/Biblioteca/logado.jsp"><i class="fa fa-desktop fa-lg" aria-hidden="true"></i> Logado</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
