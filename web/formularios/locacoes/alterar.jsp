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
                <h1>Alterar Locação</h1>
            </div>
        </div>


        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                 <form method="post" action="${cp}/processaLocacao" class="mb-4">
                    
                    <input name="acao" type="hidden" value="alterar"/>
                    <input type="hidden" name="idLocacao" value="${requestScope.locacao.idLocacao}"/>

                    
                    <div class="form-group">
                        <label for="dataInicio">Data Inicio: </label>
                        <input type="date" class="form-control" name="dataInicio" placeholder="Digite a data de inicio" value="${requestScope.locacao.dataInicio}">
                    </div>
                    
                    <div class="form-group">
                        <label for="dataFim">Data Fim: </label>
                        <input type="date" class="form-control" name="dataFim" placeholder="Digite a data do fim" value="${requestScope.locacao.dataFim}">
                    </div>
                    
                    <div class="form-group">
                        <label for="cancelada">Cancelada: </label>
                        
                        <select class="form-select" aria-label="Default select example" name="cancelada">
                            <option value="false" ${!requestScope.locacao.cancelada ? 'selected' : ''}>Não</option>
                            <option value="true" ${requestScope.locacao.cancelada ? 'selected' : ''}>Sim</option>
                        </select>
                        
                    </div>
                    
                    <jsp:useBean
                        id="clienteServicos"
                        scope="page"
                        class="locacaomidias.servicos.ClienteServices"
                    />
                    
                    <div class="form-group">
                        <label for="clienteSelecionado">Cliente</label>
                        
                        <select class="form-select" aria-label="Default select example" name="clienteSelecionado">
                            <c:forEach items="${clienteServicos.todos}" var="cliente">
                                <option value="${cliente.id}" ${cliente.id == requestScope.locacao.cliente.id ? 'selected' : ''}>
                                    ${cliente.nome} ${cliente.sobrenome}
                                </option>
                            </c:forEach> 
                          </select>
                    </div>
                    
                    <div class="d-flex justify-content-between">
                        <a href="${cp}/formularios/locacoes/listagem.jsp" class="btn btn-secondary mt-4">Voltar</a>
                        <button type="submit" class="btn btn-primary mt-4">Alterar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>