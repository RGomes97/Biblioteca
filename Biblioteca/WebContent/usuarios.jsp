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
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
</head>
<body>
<div class="container">
<table class="table">
    <thead>
      <tr>
        <th>Nome</th>
        <th>RA</th>
        <th>Telefone</th>
        <th>Tipo</th>
        <th>Curso</th>
      </tr>
    </thead>
    <tbody>
    <%
		UserDAO userDAO = new UserDAO();
		List<User>usuarios = userDAO.getAllUsers();
		for(User usuario : usuarios){
	%>
		<tr>
			<td><%=usuario.getNome() %></td>
			<td><%=usuario.getRa() %></td>
			<td><%=usuario.getTelefone() %></td>
			<td><%=usuario.getTipo() %></td>
			<td><%=usuario.getCurso() %></td>
			<td><a href="usuarios.jsp?remover=sim&id=<%=usuario.getId()%>"class="btn btn-default">Remover</a></td>
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
		userDAO.removeUser(id);
		
%>
		<script>window.location.href = 'usuarios.jsp'</script>
<%
	}
%>
</body>
</html>