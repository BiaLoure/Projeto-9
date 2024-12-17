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
                <h1>Alterar Midia</h1>
            </div>
        </div>


        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <form method="post" action="${cp}/processaMidias" class="mb-4">
                    
                    <input type="hidden" name="acao" value="alterar"/>
                    <input name="id" type="hidden" value="${requestScope.midia.id}"/>

                    
                    <div class="form-group">
                        <label for="descricao">Titulo</label>
                            <input name="titulo"
                                   type="text"
                                   class="form-control"
                                   size="20"
                                   maxlength="100"
                                   value="${requestScope.midia.titulo}"
                                   required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Ano Lançamento</label>
                            <input name="anoLancamento"
                                   type="text"
                                   class="form-control"
                                   size="20"
                                   maxlength="100"
                                   value="${requestScope.midia.anoLancamento}"
                                   required/>    
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Codigo de Barras</label>
                            <input name="codigoBarras"
                                   type="text"
                                   class="form-control"                                   
                                   size="20"
                                   maxlength="13"
                                   value="${requestScope.midia.codigoBarras}"
                                   required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Duração</label>
                            <input name="duracaoEmMinutos"
                                    type="number"
                                    class="form-control"
                                    size="8"
                                    step="1"
                                    min="1"
                                    value="${requestScope.midia.duracaoMinutos}"
                                    required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Ator Principal</label>
                        
                        <jsp:useBean 
                            id="servicosAtor" 
                            scope="page" 
                            class="locacaomidias.servicos.AtorServices"/>

                        <select name="idAtorPrincipal" class="form-control" required>
                            <c:forEach items="${servicosAtor.todos}" var="atorPrincipal">
                                <c:choose>
                                    <c:when test="${requestScope.midia.atorPrincipal.id eq atorPrincipal.id}">
                                        <option value="${atorPrincipal.id}" selected>
                                          ${atorPrincipal.nome} ${atorPrincipal.sobrenome}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${atorPrincipal.id}">
                                          ${atorPrincipal.nome} ${atorPrincipal.sobrenome}
                                        </option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </select>
                        
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Ator Secundario</label>
                        
                        <select name="idAtorCoadjuvante" class="form-control" required>
                            <c:forEach items="${servicosAtor.todos}" var="atorCoadjuvante">
                                <c:choose>
                                    <c:when test="${requestScope.midia.atorCoadjuvante.id eq atorCoadjuvante.id}">
                                        <option value="${atorCoadjuvante.id}" selected>
                                          ${atorCoadjuvante.nome} ${atorCoadjuvante.sobrenome}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${atorCoadjuvante.id}">
                                          ${atorCoadjuvante.nome} ${atorCoadjuvante.sobrenome}
                                        </option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </select>
                        
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Genero</label>
                        
                        <jsp:useBean 
                            id="servicosGenero" 
                            scope="page" 
                            class="locacaomidias.servicos.GeneroServices"/>

                        <select name="idGenero" class="form-control" required>
                            <c:forEach items="${servicosGenero.todos}" var="genero">
                                  <c:choose>
                                      <c:when test="${requestScope.midia.genero.id eq genero.id}">
                                          <option value="${genero.id}" selected>
                                            ${genero.descricao}
                                          </option>
                                      </c:when>
                                      <c:otherwise>
                                          <option value="${genero.id}">
                                            ${genero.descricao}
                                          </option>
                                      </c:otherwise>
                                  </c:choose>

                            </c:forEach>
                        </select>
                    
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Classificação Etária</label>
                        
                        <jsp:useBean 
                            id="servicosClassificacaoEtaria" 
                            scope="page" 
                            class="locacaomidias.servicos.ClassificacaoEtariaServices"/>

                        <select name="idClassificacaoEtaria" class="form-control" required>
                            <c:forEach items="${servicosClassificacaoEtaria.todos}" var="CE">
                                <c:choose>
                                    <c:when test="${requestScope.midia.classificacaoEtaria.id eq CE.id}">
                                        <option value="${CE.id}" selected>
                                          ${CE.descricao}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${CE.id}">
                                          ${CE.descricao}
                                        </option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </select>

                        
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Tipo</label>
                        
                        <jsp:useBean 
                            id="servicosTipo" 
                            scope="page" 
                            class="locacaomidias.servicos.TipoServices"/>

                        <select name="idTipo" class="form-control" required>
                            <c:forEach items="${servicosTipo.todos}" var="tipo">
                                <c:choose>
                                    <c:when test="${requestScope.midia.tipo.id eq tipo.id}">
                                        <option value="${tipo.id}" selected>
                                          ${tipo.descricao}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${tipo.id}">
                                          ${tipo.descricao}
                                        </option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </select>
                        
                    </div>
                    
                    <div class="form-group">
                        <label for="descricao">Classificação Interna</label>
                        
                         <jsp:useBean 
                            id="servicosClassificacaoInterna" 
                            scope="page" 
                            class="locacaomidias.servicos.ClassificacaoInternaServices"/>

                        <select name="idClassificacaoInterna" class="form-control" required>
                            <c:forEach items="${servicosClassificacaoInterna.todos}" var="CI">
                                <c:choose>
                                    <c:when test="${requestScope.midia.classificacaoInterna.id eq CI.id}">
                                        <option value="${CI.id}" selected>
                                          ${CI.descricao}
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${CI.id}">
                                          ${CI.descricao}
                                        </option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </select>
                    
                    </div>
                    

                    
                    <div class="d-flex justify-content-between mt-5">
                        <a href="${cp}/formularios/midias/listagem.jsp" class="btn btn-secondary">Voltar</a>
                        <button type="submit" class="btn btn-primary">Alterar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>