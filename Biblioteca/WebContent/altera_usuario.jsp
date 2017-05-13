<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.TestaEmpregado" %>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.*" %>

<jsp:include page="/cabecalhoAdmin.jsp"/>

<%

	int id = Integer.parseInt(request.getParameter("id"));
	UserDAO userDAO = new UserDAO();
	User user = userDAO.readUser(id);

%>
	<div class="container">
	<h1><i class="fa fa-edit fa-lg" aria-hidden="true"></i> Altera Usu�rio</h1>
		<form action="" method="POST">
			<label>Nome:</label>
			<input type="text" class="form-control" name="nome" required value="<%=user.getNome()%>"/>
			<label>RA:</label>
			<input type="text" class="form-control" name="ra" required value="<%=user.getRa()%>" />
			<label>Telefone:</label>
			<input type="number" class="form-control" name="telefone" required value="<%=user.getTelefone()%>"/>
			<label>Tipo:</label>
			<input type="text" class="form-control" name="tipo" required value="<%=user.getTipo()%>"/>
			<label>Senha:</label>
			<input type="password" class="form-control" name="senha" required value="<%=user.getSenha()%>"/>
			<label>Curso:</label>
			<input type="text" class="form-control" name="curso" required value="<%=user.getCurso()%>"/>
			<button class="btn btn-info center-block margin-top" type="submit" value="">
				<i class="fa fa-edit fa-lg" aria-hidden="true"></i> Alterar
			</button>
		</form>
		
	</div>
	<%
	if(request.getParameter("nome") != null){
		
		// n�o est� atualizando ajuda aqui
		
		user.setNome(request.getParameter("nome"));
		user.setRa(request.getParameter("ra"));
		user.setTelefone(Integer.parseInt(request.getParameter("telefone")));
		user.setTipo(request.getParameter("tipo"));
		user.setSenha(request.getParameter("senha"));
		user.setCurso(request.getParameter("curso"));
		userDAO.altera(user);
		response.sendRedirect("usuarios.jsp");
		
		
	}
	%>
</body>
</html>