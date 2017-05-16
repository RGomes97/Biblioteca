	<%@ page import="persistencia.GerenteConexao" %>
	<%@ page import="classes.Livro" %>
	<%@ page import="DAO.LivroDAO" %>
	<%@ page import="servicos.Reserva" %>
	<%@ page import="DAO.PedidoDAO" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %>
	
	<% 
	Livro livro = null;
	if(request.getParameter("mostrar") != null){
		LivroDAO livroDAO = new LivroDAO(); 
		int idLivro = Integer.parseInt(request.getParameter("id"));
		livro = livroDAO.readBook(idLivro);
	}
	
	%>
	
	<jsp:include page="cabecalho.jsp" />
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
			<div class="col-md-4">
			    <div class="thumbnail">
			      <img src="<%=livro.getUrl() %>" alt="...">
			      <div class="caption">
			        <h3><%=livro.getNome() %></h3>
			        <p>...</p>
			        <p><a href="detalhe_livro.jsp?reservar=sim&id=<%=livro.getId() %>" class="btn btn-primary" role="button">Reservar</a></p>
			      </div>
			    </div>
			  </div> 
		</div>
	</div>
	<%
			if(request.getParameter("reservar") != null){
				Reserva reserva = new Reserva();
				int idUser = (Integer) session.getAttribute("id");
				int idLivro = Integer.parseInt(request.getParameter("id"));
				reserva.reservar(idUser, idLivro);
				%>
				<script>alert('Reservado com Sucesso')</script>
				<%
			}
			
		%>
</div>
</body>
</html>