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
			<script>
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
<body>
<%
	out.print(session.getAttribute("nome"));
	out.print(session.getAttribute("tipo"));
%>
<div class="container">
<table class="table">
    <thead>
      <tr>
        <th>Nome</th>
        <th>Quantidade</th>
        <th>Autor</th>
        <th>Genero</th>
      </tr>
    </thead>
    <tbody>
    <%
		LivroDAO livroDAO = new LivroDAO();
		List<Livro>livros = livroDAO.getAllUsers();
		for(Livro livro : livros){
	%>
		<tr>
			<td><%=livro.getNome() %></td>
			<td><%=livro.getQuantidade() %></td>
			<td><%=livro.getAutor() %></td>
			<td><%=livro.getGenero() %></td>
			<td><a href="livros.jsp?remover=sim&id=<%=livro.getId()%>"class="btn btn-default">Remover</a></td>
		</tr>
	<%
		}
	%>
    </tbody>
  </table>
</div>
<%
	String parametro = request.getParameter("remover");
	if(parametro != null){
		int id = Integer.parseInt(request.getParameter("id"));
		livroDAO.removerLivro(id);
%>
		<script>window.location.href = 'livros.jsp'</script>
<%
	}
%>
</body>
</html>