<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page import="java.util.Hashtable" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<%
    Hashtable tarefas;
        //tarefas.put(1, "exemplo");
        //tarefas.put(2, "teste");


        if(session.getAttribute("tarefas") instanceof Hashtable) {
            tarefas = (Hashtable) session.getAttribute("tarefas");
        } else {
            tarefas = new Hashtable<Integer, String>();
        }
        
        if(request.getMethod().equals("POST")){
            tarefas.put(tarefas.size() + 1, request.getParameter("tarefa"));
        } else if (request.getParameter("action") != null) {
            tarefas.remove(Integer.parseInt(request.getParameter("id")));
        }

        session.setAttribute("tarefas", tarefas);

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Bem Vindo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
    <body>
        <form action="index.jsp" method="post">
            <input class="form-control" type="text" name="tarefa">
            <button class="btn btn-primary" type="submit">Salvar</button>
        </form>
        <hr>
        <ul>
            <c:forEach var="t" items="${tarefas}">
                <a href="index.jsp?action=delete&id=${t.key}"></a>
                <li>${t.value}</li>
            </c:forEach>
        </ul>
    </body>
</html>