<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.Livro" %>
<%@ page import="DAO.LivroDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!-- import header do administrador -->
<jsp:include page="/cabecalhoAdmin.jsp"/>

<div class="container">
	<div class="row">
		<table>
			<tr>
				<td><h1><i class="fa fa-book fa-lg" aria-hidden="true"></i> Livros</h1></td>
			</tr>
		</table>
	</div>
	<div class="panel panel-default">
  		<!-- Default panel contents -->
  		<div class="panel-heading text-center">
  			<h3>Livros cadastrados</h3>
  		</div>
				<table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Nome</th>
				        <th>Quantidade</th>
				        <th>Autor</th>
				        <th>Genero</th>
				        <th  class="text-center">Alterar/Excluir</th>
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
							<td><%=livro.getEstoque() %></td>
							<td><%=livro.getAutor() %></td>
							<td><%=livro.getGenero() %></td>
							<td  class="text-center">
								<a href="altera_livro.jsp?alterar=sim&id=<%=livro.getId()%>"class="pencil"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></a>
								<a href="livros.jsp?remover=sim&id=<%=livro.getId()%>"class="lixo"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i></a>
							</td>
						</tr>
					<%
						}
					%>
				    </tbody>
			  </table>
			  <div class="col-md-12 text-center margin-top"> 
    			<a href="cadastro_livros.jsp" class="btn btn-primary">Cadastrar <span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a> 
			  </div>
	</div>
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