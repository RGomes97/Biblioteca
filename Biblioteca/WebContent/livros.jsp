<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.Livro" %>
<%@ page import="DAO.LivroDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!-- import header do administrador -->
<jsp:include page="/cabecalhoAdmin.jsp"/>

<div class="container">
	<div class="row">
		<h2><i class="fa fa-book fa-lg" aria-hidden="true"></i> Livros
		<a href="cadastro_usuarios.jsp" class="btn btn-primary btn-lg">
		<i class="fa fa-book fa-lg" aria-hidden="true"></i> Adicionar</a></h2>
	</div>
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
			List<Livro>livros = livroDAO.getAllBooks();
			for(Livro livro : livros){
		%>
			<tr>
				<td><%=livro.getNome() %></td>
				<td><%=livro.getQuantidade() %></td>
				<td><%=livro.getAutor() %></td>
				<td><%=livro.getGenero() %></td>
				<td><a href="livros.jsp?remover=sim&id=<%=livro.getId()%>"class="lixo"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i></a></td>
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