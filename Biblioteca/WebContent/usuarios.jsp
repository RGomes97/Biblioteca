<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!-- import header do administrador -->
<jsp:include page="/headerAdmin.jsp"/>

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