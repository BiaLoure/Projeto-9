<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <head>
        <title>Excluir Ator</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${cp}/css/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">

    </head>
    <body>
        <div class="navbar-listagem">
            <div class="navbar">
                <img src="${cp}/css/imagens/Logo.svg" alt="logo" class="logo" >
                <h1 class="home" href="${cp}/index.jsp">Cineloc</h1>
                <div class="links">
                    <a href="${cp}/index.jsp">Início</a>
                    <a href="${cp}/formularios/DVD/listagem.jsp">Nossos Filmes</a>
                    <a href="${cp}/formularios/ator/listagem.jsp">Atores</a>
                    <a href="${cp}/formularios/genero/listagem.jsp">Gêneros</a>
                    <a href="${cp}/formularios/classificacao/listagem.jsp">Classificação Etária</a>
                </div>
            </div>
        </div>
        <h2>Excluir Ator</h2>
                
        <form method="post" action="${cp}/processaAtor">
            <input name="acao" type="hidden" value="excluir"/>
            <input name="id" type="hidden" value="${requestScope.ator.id}"/>

            <table>
                <tr>
                    <td class="alinharDireita">Nome:</td>
                    <td>${requestScope.ator.nome}</td>
                </tr>
                <tr>
                    <td class="alinharDireita">Sobrenome:</td>
                    <td>${requestScope.ator.sobrenome}</td>
                </tr>
                <tr>
                    <td class="alinharDireita">Data de Estreia:</td>
                    <td>${requestScope.ator.dataEstreia}</td>
                </tr>
                <tr>
                    <td>
                        <a class="voltar" href="${cp}/formularios/ator/listagem.jsp">Voltar</a>
                    </td>
                    <td class="alinharDireita">
                        <input class="salvar" type="submit" value="Excluir"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
