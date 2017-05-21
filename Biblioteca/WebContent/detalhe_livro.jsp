<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.Livro" %>
<%@ page import="DAO.LivroDAO" %>
<%@ page import="servicos.Reserva" %>
<%@ page import="DAO.PedidoDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<jsp:include page="cabecalho.jsp" />
<%
	int id = Integer.parseInt(request.getParameter("id"));
	LivroDAO livroDAO = new LivroDAO();
	Livro livro = livroDAO.readBook(id);
%>
<div class="container">
	<div style="padding: 20px !important; margin-top: 50px;" class="box-product-detail">
		<div class="row">
			<div style="padding-left: 0px!important;" class="col-md-6">
				<img style="max-height: 300px !important" class="img-responsive center-block" src="<%=livro.getUrl()%>">
			</div>
			<div class="col-md-6 text-center"> 
				<h2><%=livro.getNome() %></h2>
				<p><%=livro.getDescricao() %></p>
				<a href="detalhe_livro.jsp?reservar=sim&id=<%=livro.getId()%>" class="btn btn-primary">Confirmar Reserva</a>
			</div>
		</div>
	</div>
	<center><a href="/Biblioteca/logado.jsp" class="btn btn-default"><span class="glyphicon glyphicon-triangle-left" aria-hidden="true"></span>Continuar reservas</a></center>
</div>
<%
			if(request.getParameter("reservar") != null){
				Reserva reserva = new Reserva();
				int idUser = (Integer) session.getAttribute("id");
				int idLivro = Integer.parseInt(request.getParameter("id"));
				reserva.reservar(idUser, idLivro);
				%>
				<script>
					alert('Reservado com Sucesso');
					var param = window.location.href.split('&')[1];
					var url = 'detalhe_livro.jsp?' + param;
					window.location.href = url;
				</script>
				<%
			}
		%>