<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!-- import header do administrador -->
<jsp:include page="/cabecalhoAdmin.jsp"/>

<div class="container">
	<div class="row">
		<h2><i class="fa fa-users fa-lg" aria-hidden="true"></i> Usuários
		<a href="cadastro_usuarios.jsp" class="btn btn-primary">
		<i class="fa fa-user-plus fa-lg" aria-hidden="true"></i> Adicionar</a></h2>
	</div>
	<div class="row">
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
					<td>
						<a href="altera_usuario.jsp?alterar=sim&id=<%=usuario.getId()%>"class="pencil">
							<i class="fa fa-edit fa-lg" aria-hidden="true"></i>
						</a>
						<a href="usuarios.jsp?remover=sim&id=<%=usuario.getId()%>"class="lixo">
							<i class="fa fa-trash-o fa-lg" aria-hidden="true"></i>
						</a>
						
					</td>
				</tr>
			<%
				}
			%>
		   	</tbody>
		</table>
	</div>
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