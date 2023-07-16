<%@ page import="java.util.ArrayList" %>
<%@ page import="ar.com.codoacodo.oop.Articulo" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CaC23049</title>
    <link href="https://bootswatch.com/5/solar/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
  <jsp:include page="navbar.jsp"/>
    <% 
     /*codigo java*/
     ArrayList<Articulo> listado = (ArrayList<Articulo>)request.getAttribute("listado"); //esto es un array
    %>
    <!-- aca van los mensajes-->
    <%
      String error = (String)request.getAttribute("error");
      String success = (String)request.getAttribute("success");
    %>
    <%
      if(error!=null) {
    %>
    <div class="alert alert-danger" role="alert">
      <%=error%>
    </div>
    <%
      }
    %>
    <%
      if(success != null) {
    %>
    <div class="alert alert-success" role="alert">
      <%=success%>
    </div>
    <%
    }
    %>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <section >
                    <h1>Listado de Articulos</h1>
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">Título</th>
                            <th scope="col">Código</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Acciones</th>
                          </tr>
                        </thead>
                        <tbody>
                            <% 
                            for(Articulo unarticulo : listado) {
                            %>
                                <tr>
                                    <th scope="row"><%=unarticulo.getId()%></th>
                                    <td><%=unarticulo.getTitulo()%></td>
                                    <td><%=unarticulo.getCodigo()%></td>
                                    <td><%=unarticulo.getPrecio()%></td>
                                    <td><%=unarticulo.getFechaCreacion()%></td>
                                    <td>
                                        <a href="<%=request.getContextPath()%>/DeleteController?id=<%=unarticulo.getId()%>" class="btn btn-warning" tabindex="-1" role="button" aria-disabled="true">
                                          <i class="fa-regular fa-trash-can"></i>
                                        </a>
                                        <a href="<%=request.getContextPath()%>/EditarController?id=<%=unarticulo.getId()%>" 
                                            class="btn btn-success" tabindex="-1" role="button" aria-disabled="true">
                                            <i class="fa-regular fa-pen-to-square"></i>
                                      </a>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                      </table>
                </section>
            </div>
        </div>
</body>

</html>