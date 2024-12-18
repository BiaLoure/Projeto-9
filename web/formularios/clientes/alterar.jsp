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
                <h1>Adicionar Cliente</h1>
            </div>
        </div>


        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <form method="post" action="${cp}/processaClientes" class="mb-4">
                    
                    <input type="hidden" name="acao" value="alterar"/>
                    <input name="id" type="hidden" value="${requestScope.cliente.id}"/>

                    
                    <div class="form-group">
                        <label for="nome">Nome</label>
                            <input name="nome"
                                   type="text"
                                   class="form-control"
                                   size="20"
                                   maxlength="100"
                                   value='${requestScope.cliente.nome}'
                                   required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="nome">Sobrenome</label>
                           <input name="sobrenome"
                                    type="text"
                                    class="form-control"
                                    size="20"
                                    maxlength="45"
                                    value='${requestScope.cliente.sobrenome}'
                                    required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="dataNascimento">Data Nascimento</label>
                           <input name="dataNascimento"
                                    type="date"
                                    class="form-control"
                                    size="8"
                                    placeholder="dd/mm/aaaa"
                                    value='${requestScope.cliente.dataNascimento}'
                                    required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="cpf">CPF</label>
                            <input name="cpf"
                                    type="text"
                                    class="form-control"
                                    size="13"
                                    pattern="\d{3}.\d{3}.\d{3}-\d{2}"
                                    placeholder="999.999.999-99"
                                    value='${requestScope.cliente.cpf}'
                                    required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                           <input name="email"
                                    type="email"
                                    class="form-control"
                                    size="20"
                                    maxlength="60"
                                    value='${requestScope.cliente.email}'
                                    required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Logradouro</label>
                           <input name="logradouro"
                                    type="text"
                                    class="form-control"
                                    size="25"
                                    maxlength="50"
                                    value='${requestScope.cliente.logradouro}'
                                    required/>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="numero">Numero</label>
                            <input name="numero"
                                    type="text"
                                    class="form-control"
                                    size="6"
                                    maxlength="6"
                                    value='${requestScope.cliente.numero}'
                                    required/>
                           
                    </div>
                    
                    <div class="form-group">
                        <label for="bairro">Bairro</label>
                        <input name="bairro"
                                type="text"
                                class="form-control"
                                size="15"
                                maxlength="30"
                                value='${requestScope.cliente.bairro}'
                                required/>
                           
                    </div>
                    
                    <div class="form-group">
                        <label for="cep">CEP</label>
                           <input name="cep"
                                  type="text"
                                  class="form-control"
                                  size="7"
                                  pattern="\d{5}-\d{3}"
                                  placeholder="99999-999"
                                  value='${requestScope.cliente.cep}'
                                  required/>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="idCidade">Cidade</label>
                        
                         <jsp:useBean 
                            id="servicos" 
                            scope="page" 
                            class="locacaomidias.servicos.CidadeServices"/>

                         <select class='form-control' name="idCidade" required>
                            <c:forEach items="${servicos.todos}" var="cidade">
                              <c:choose>
                                <c:when test="${requestScope.cliente.cidade.id eq cidade.id}">
                                  <option value="${cidade.id}" selected>
                                    ${cidade.nome}
                                  </option>
                                </c:when>
                                <c:otherwise>
                                  <option value="${cidade.id}">
                                    ${cidade.nome}
                                  </option>
                                </c:otherwise>
                              </c:choose>
                            </c:forEach>
                          </select>
                    
                    </div>
                    

                    
                    <div class="d-flex justify-content-between mt-5">
                        <a href="${cp}/formularios/clientes/listagem.jsp" class="btn btn-secondary">Voltar</a>
                        <button type="submit" class="btn btn-primary">Alterar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>