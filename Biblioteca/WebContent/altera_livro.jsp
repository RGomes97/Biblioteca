	<%@ page import="persistencia.GerenteConexao" %>
	<%@ page import="classes.Livro" %>
	<%@ page import="DAO.LivroDAO" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %>

<jsp:include page="/cabecalhoAdmin.jsp"/>

<%

	int id = Integer.parseInt(request.getParameter("id"));
	LivroDAO livroDAO = new LivroDAO();
	Livro livro = livroDAO.readBook(id);

%>

	<div class="container">
	<h1>Cadastro de Livros</h1>
		<form action="" method="POST">
			<label>Nome:</label>
			<input type="text" class="form-control" name="nome" required value="<%=livro.getNome()%>"/>
			<label>Quantidade:</label>
			<input type="text" class="form-control" name="estoque" required value="<%=livro.getEstoque()%>"/>
			<label>Autor:</label>
			<input type="text" class="form-control" name="autor" required value="<%=livro.getAutor()%>"/>
			<label>ISBN:</label>
			<input type="number" class="form-control" name="isbn" required value="<%=livro.getIsbn()%>"/>
			<label>Genero:</label>
			<input type="text" class="form-control" name="genero" required value="<%=livro.getGenero()%>"/>
			<label>Url:</label>
			<input type="text" class="form-control" name="url" required value="<%=livro.getUrl()%>"/>
			<input class="btn btn-info center-block margin-top" type="submit" value="Cadastrar">
		</form>
	</div>  
	<%
		if(request.getParameter("nome") != null){
			livro.setNome(request.getParameter("nome"));
			livro.setEstoque(Integer.parseInt(request.getParameter("estoque")));
			livro.setAutor(request.getParameter("autor"));
			livro.setIsbn(Integer.parseInt(request.getParameter("isbn")));
			livro.setGenero(request.getParameter("genero"));
			livro.setUrl(request.getParameter("url"));
			livroDAO.altera(livro);
			response.sendRedirect("livros.jsp");
		}
	%>
</body>
</html>