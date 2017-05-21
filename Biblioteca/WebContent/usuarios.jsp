<%@ page import="persistencia.GerenteConexao" %>
<%@ page import="classes.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!-- import header do administrador -->
<jsp:include page="/cabecalhoAdmin.jsp"/>

<div class="container">
	<div class="row">
		<h2 class="center-block text-center"><i class="fa fa-users fa-lg" aria-hidden="true"></i>Usuários</h2>
	</div>
</div>
<div class="container" id="tpl-usuarios">
    <div class="row">
    	<%
			UserDAO userDAO = new UserDAO();
			List<User>usuarios = userDAO.getAllUsers();
			for(User usuario : usuarios){
		%>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img style="max-width: 124px; max-height: 164px" src="<%= usuario.getFoto() %>" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4><%= usuario.getNome() %></h4>
                        <small><cite title="San Francisco, USA"><%= usuario.getCurso() %><i class="glyphicon glyphicon-map-marker">
                        </i></cite></small>
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i>email@example.com
                            <br />
                            <i class="glyphicon glyphicon-phone"></i><%= usuario.getTelefone() %>
                            <br />
                            <i class="glyphicon glyphicon-gift"></i>29 Dezembro 1997</p>
                        <!-- Split button -->
                        <div class="btn-group">
                            <a href="/Biblioteca/altera_usuario.jsp?alterar=sim&id=<%=usuario.getId()%>" class="btn btn-primary">Editar</a>
                            <a href="/Biblioteca/usuarios.jsp?remover=sim&id=<%=usuario.getId()%>"" class="btn btn-default">Remover</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
			}
        %>
    </div>
</div>

</div>
<%
	String parametro = request.getParameter("remover");
	if(parametro != null){
		int id = Integer.parseInt(request.getParameter("id"));
		String remove = userDAO.removeUser(id);
%>
	<script>
		alert("<%=remove%>");
		window.location.href = 'usuarios.jsp';
	</script>
<%
	}
%>
</body>
</html> 