
<%@ page contentType="text/html; charset=UTF-8" %>
<style>
  body {
    padding-top: 70px; /* Altura de la barra de navegación */
  }
</style>

 

  <nav class="navbar navbar-expand-lg bg-dark mb-5 fixed-top" data-bs-theme="dark">
    <div class="container-fluid">
      
     
     
      
        <div class="navbar-nav me-auto">
            <a class="navbar-brand" href="index.jsp">Inicio</a>
            <a class="navbar-brand" href="nuevo.jsp">Nuevo</a>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/ListadoArticuloController">Listado</a>
          </div>

        <form class="d-flex" 
        role="search" 
        action="<%=request.getContextPath()%>/BuscadorController"
        method="GET">
      <input name="clave" 
        id="clave"
        class="form-control me-2" 
        type="search" 
        placeholder="Search" 
        aria-label="Search">
      <button class="btn btn-outline-success" 
        type="submit">
            Buscar
      </button>

    </form>
      </div>
  </nav>