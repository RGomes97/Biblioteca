	<%@ page import="persistencia.GerenteConexao" %>
	<%@ page import="classes.Livro" %>
	<%@ page import="DAO.LivroDAO" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %>

<jsp:include page="/cabecalhoAdmin.jsp"/>

	<div class="container">
	<h1>Cadastro de Livros</h1>
		<form action="" method="POST">
			<label>Nome:</label>
			<input type="text" class="form-control" name="nome" required/>
			<label>Quantidade:</label>
			<input type="text" class="form-control" name="estoque" required/>
			<label>Autor:</label>
			<input type="text" class="form-control" name="autor" required/>
			<label>ISBN:</label>
			<input type="number" class="form-control" name="isbn" required/>
			<label>Genero:</label>
			<input type="text" class="form-control" name="genero" required/>
			<label>Url:</label>
			<input type="text" class="form-control" name="url" required/>
			<label>Descrição:</label>
			<input type="text" class="form-control" name="descricao" required/>
			<input class="btn btn-info center-block margin-top" type="submit" value="Cadastrar">
		</form>
	</div> 
	<%
		if(request.getParameter("nome") != null){
			Livro livro = new Livro();
			livro.setNome(request.getParameter("nome"));
			livro.setEstoque(Integer.parseInt(request.getParameter("estoque")));
			livro.setAutor(request.getParameter("autor"));
			livro.setIsbn(Integer.parseInt(request.getParameter("isbn")));
			livro.setGenero(request.getParameter("genero"));
			livro.setUrl(request.getParameter("url"));
			livro.setDescricao(request.getParameter("descricao"));
			LivroDAO livroDAO = new LivroDAO();
			livroDAO.addLivro(livro);
		}
	%>
</body>
</html>