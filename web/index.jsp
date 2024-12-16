<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${cp}/css/style-index.css">
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



      <div class="container mt-5" >

        <!-- row 1 -->

        <div class="row " style="text-align: center;">
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/para-alugar.png" alt=""></div>
                <h2>Locações (implementar)</h2>
                <p></p>
                <a href="${cp}/formularios/locacoes/listagem.jsp">Listar</a>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/claquete.png" alt=""></div>
                <h2>Midias (implementar) </h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/filme.png" alt=""></div>
                <h2>Exemplares (implementar) </h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
          </div>
        

        <!-- row 2 -->

        <div class="row mt-5" style="text-align: center;">
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/ator.png" alt=""></div>
                <h2>Ator (implementar)</h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/exame.png" alt=""></div>
                <h2>Tipos</h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/tira-de-filme.png" alt=""></div>
                <h2>Gêneros</h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
          </div>
          

          <!-- row 3 -->


          <div class="row mt-5" style="text-align: center;">
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/plus-18-movie.png" alt=""></div>
                <h2>Classificações Etárias</h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/desconto.png" alt=""></div>
                <h2>Classificações Internas</h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/cliente.png" alt=""></div>
                <h2>Clientes</h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
          </div>

          <!-- row 4 -->

          <div class="row mt-5" style="text-align: center; display: flex; justify-content: center;">
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/endereco-residencial.png" alt=""></div>
                <h2>Cidades</h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="content content-1">
                <div class="imagem"><img src="images/estados-unidos.png" alt=""></div>
                <h2>Estados</h2>
                <p></p>
                <a href="#">Listar</a>
              </div>
            </div>
            
          </div>

      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
    </body>
</html>
