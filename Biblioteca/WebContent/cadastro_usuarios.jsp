<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.TestaEmpregado" %>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.*" %>

<jsp:include page="/cabecalhoAdmin.jsp"/>

	<div class="container">
	<h1>Cadastro de usuários</h1>
		<form action="" method="POST">
			<label>Nome:</label>
			<input type="text" class="form-control" name="nome" required/>
			<label>RA:</label>
			<input type="text" class="form-control" name="ra" required/>
			<label>Telefone:</label>
			<input type="number" class="form-control" name="telefone" required/>
			<label>Tipo:</label>
			<input type="text" class="form-control" name="tipo" required/>
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
			user.setTipo(request.getParameter("tipo"));
			user.setSenha(request.getParameter("senha"));
			user.setCurso(request.getParameter("curso"));
			UserDAO userDAO = new UserDAO();
			userDAO.addUser(user);
		}
	%>
</body>
</html>