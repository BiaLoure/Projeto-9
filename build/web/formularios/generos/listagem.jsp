<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaGeneros?acao=preparar"/>
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

    <!-- listagem -->

    <div class="container border my-4 shadow p-4 bg-light mb-4">

            
        <div class="row">
            <div class="col-12 text-center mb-4">
                <h1>Gêneros</h1>
            </div>
        </div>


        <div class="row mb-4">

            <div class="col-sm-9 d-flex justify-content-center align-items-center">
                <div class="container">
                    <table class="table table-striped table-bordered text-center">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Descricao</th>
                                <th>Alterar</th>
                                <th>Excluir</th>
                            </tr>
                        </thead>
    
                        <tbody>
                            <jsp:useBean
                            id="servicos"
                            scope="page"
                            class="locacaomidias.servicos.GeneroServices"/>
                         <c:forEach items="${servicos.todos}" var="genero">
                                <tr>
                                    <td>${genero.id}</td>
                                    <td>${genero.descricao}</td>
                                    <td>
                                        <a href="${cp}/${prefixo}Alteracao&id=${genero.id}">
                                            <img src="${cp}/images/alterar.png" style="height: 20px; width: 20px">
                                        </a>
                                    </td>
                                    <td>
                                        <a href="${cp}/${prefixo}Alteracao&id=${genero.id}">
                                            <img src="${cp}/images/excluir.png" style="height: 20px; width: 20px">
                                        </a>
                                    </td>
                                </tr>
                                </c:forEach>
                        </tbody>
                    </table>
                             
                </div>

            </div>

            <div class="col-sm-3 d-flex justify-content-center align-items-center" style="text-align: center;">
                <div class="content content-1">
                    <div class="imagem"><img src="${cp}/images/adicionar.png" alt=""></div>
                    <h2>Adicionar</h2>
                    <p></p>
                    <a href="${cp}/formularios/generos/novo.jsp">Adicionar</a>
                  </div>

            </div>


        </div>
    </div>
    
</body>
</html>
