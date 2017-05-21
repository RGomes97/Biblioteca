<%@ page import="persistencia.GerenteConexao" %>
	<%@ page import="classes.Livro" %>
	<%@ page import="DAO.LivroDAO" %>
	<%@ page import="servicos.Reserva" %>
	<%@ page import="DAO.PedidoDAO" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %>

	<jsp:include page="cabecalho.jsp" />
	<jsp:include page="carousel.jsp" />
	<!-- sidebar -->
<div id="logado">
	<div class="container-fluid">
		<div class="row margin-button">
			<div class="col-md-2 col-sm-3">
				<ul class="nav nav-pills nav-stacked">
				  <li role="presentation" class="active"><a href="#">Gênero</a></li>
				  <li role="presentation"><a href="#">Auto-ajuda</a></li>
				  <li role="presentation"><a href="#">Didáticos</a></li>
				  <li role="presentation"><a href="#">Ficção</a></li>
				  <li role="presentation"><a href="#">Filosofia</a></li>
				  <li role="presentation"><a href="#">Técnologia</a></li>
				  <li role="presentation"><a href="#">Romance</a></li>
				  <li role="presentation"><a href="#">Suspense</a></li>
				  <li role="presentation"><a href="#">Terror</a></li>
				</ul>
			</div>
			<%
			LivroDAO livroDAO = new LivroDAO();
			List<Livro>livros = livroDAO.getAllBooks();
			for(Livro livro : livros){
			%>
			<div class="col-md-2">
			    <div class="thumbnail">
			      <img src="<%=livro.getUrl() %>" alt="...">
			      <div class="caption">
			        <h3><%=livro.getNome() %></h3>
			        <p>...</p>
			        <p><a href="/Biblioteca/detalhe_livro.jsp?id=<%=livro.getId() %>" class="btn btn-primary" role="button">Reservar</a></p>
			      </div>
			    </div>
			  </div>
			<%
				}
			%>
			 
		</div>
	</div>
</div>
</html>