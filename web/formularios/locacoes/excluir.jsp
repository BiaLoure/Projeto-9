<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${cp}/css/style-forms.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    
</head>
<body>

     <!--  inicio navbar -->

     <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <a class="navbar-brand" href="${cp}/index.jsp">Locadora</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="${cp}/formularios/locacoes/listagem.jsp">Locações</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="">Midias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Exemplares</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Ator</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Tipos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Gêneros</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Classificações Etárias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Classificações Internas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cidades</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Estados</a>
                </li>
                
            </ul>
          </div>
        </div>
      </nav>

      
    <!--  fim navbar -->

      <!-- Formulario-->
      <div class="container border my-4 shadow p-4 bg-light">

            
        <div class="row">
            <div class="col-12 text-center mb-4">
                <h1>Excluir Locação</h1>
            </div>
        </div>


        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <form method="post" action="${cp}/processaGenero" class="mb-4">
                    
                    
                    <input name="acao" type="hidden" value="excluir"/>
                    <input name="id" type="hidden" value="${requestScope.genero.id}"/>
                    
                    <input type="hidden" name="acao" value="inserir"/>

                    
                    <div class="form-group">
                        <label for="descricao">Descricacao</label>
                        <input type="text" class="form-control" name="descricao" placeholder="Digite a descricao" value="${requestScope.genero.descricao}" required disabled>
                    </div>

                   

                    
                    <div class="d-flex justify-content-between">
                        <a href="${cp}/formularios/locacoes/listagem.jsp" class="btn btn-secondary">Voltar</a>
                        <button type="submit" class="btn btn-primary" value="excluir">Excluir</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    
</body>
</html>