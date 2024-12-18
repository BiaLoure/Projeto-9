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
    
    <style>
        
        .form-group{
            margin-top: 10px
        }
    </style>
    
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
                  <a class="nav-link" href="${cp}/formularios/midias/listagem.jsp">Midias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/exemplares/listagem.jsp">Exemplares</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/ator/listagem.jsp">Ator</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/tipos/listagem.jsp">Tipos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/generos/listagem.jsp">Gêneros</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/classificacoesEtarias/listagem.jsp">Classificações Etárias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/classificacoesInternas/listagem.jsp">Classificações Internas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/clientes/listagem.jsp">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/cidades/listagem.jsp">Cidades</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${cp}/formularios/estados/listagem.jsp">Estados</a>
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
                <h1>Excluir Cidade</h1>
            </div>
        </div>


        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <form method="post" action="${cp}/processaCidades" class="mb-4">
                    
                    <input type="hidden" name="acao" value="excluir"/>
                    <input name="id" type="hidden" value="${requestScope.cidade.id}"/>

                    
                    <div class="form-group">
                        <label for="descricao">Descricao</label>
                            <input class="form-control" value="${requestScope.cidade.nome}" disabled>
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Descricao</label>
                            <input class="form-control" value="${requestScope.cidade.estado.sigla}" disabled>
                    </div>
                    
                    

                    
                    <div class="d-flex justify-content-between mt-5">
                        <a href="${cp}/formularios/cidades/listagem.jsp" class="btn btn-secondary">Voltar</a>
                        <button type="submit" class="btn btn-primary">Excluir</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>