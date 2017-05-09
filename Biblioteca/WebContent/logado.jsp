<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body id="logado">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- carousel -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="http://static.marianakalil.com.br/wp-content/uploads/2015/12/livros.jpg" alt="Los Angeles" style="width:100%;">
    </div>

    <div class="item">
      <img src="https://www.psicologiamsn.com/wp-content/uploads/2014/06/1460025318_e1ef3fe13f_z.jpg" alt="Chicago" style="width:100%;">
    </div>
  
    <div class="item">
      <img src="http://cdn.revistabula.com/wp/wp-content/uploads/2015/04/Livros.jpg" alt="New york" style="width:100%;">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!-- sidebar -->
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
	 <div class="col-md-2">
	    <div class="thumbnail">
	      <img src="http://blog.cancaonova.com/padrejoaozinho/files/2010/04/capa.jpg" alt="...">
	      <div class="caption">
	        <h3>Nome do livro</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Reservar</a></p>
	      </div>
	    </div>
	  </div>
	 <div class="col-md-2">
	    <div class="thumbnail">
	      <img src="http://blog.cancaonova.com/padrejoaozinho/files/2010/04/capa.jpg" alt="...">
	      <div class="caption">
	        <h3>Nome do livro</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Reservar</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-md-2">
	    <div class="thumbnail">
	      <img src="http://blog.cancaonova.com/padrejoaozinho/files/2010/04/capa.jpg" alt="...">
	      <div class="caption">
	        <h3>Nome do livro</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Reservar</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-md-2">
	    <div class="thumbnail">
	      <img src="http://blog.cancaonova.com/padrejoaozinho/files/2010/04/capa.jpg" alt="...">
	      <div class="caption">
	        <h3>Nome do livro</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Reservar</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-md-2">
	    <div class="thumbnail">
	      <img src="http://blog.cancaonova.com/padrejoaozinho/files/2010/04/capa.jpg" alt="...">
	      <div class="caption">
	        <h3>Nome do livro</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Reservar</a></p>
	      </div>
	    </div>
	  </div>
</div>
</div>
</body>
</html>