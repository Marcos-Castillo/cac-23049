<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="ar.com.codoacodo.*" %>
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
    <style>
        label{
            color: rgb(200, 200, 200);
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-8 mx-auto">
                <section>
                    <div class="card border-dark mb-3">
                        <div class="card-header">
                            <h5 class="card-title">Alta Articulo</h5>
                        </div>
                        <div class="card-body text-dark">
                          
                          <p class="card-text">
                            <form method="post" action="<%=request.getContextPath()%>/AltaArticuloController">
                                <div class="mb-3">
                                 <label for="exampleFormControlInput1" 
                                     class="form-label"
                                      >Nombre</label>
                                 <input name="nombre" 
                                     type="text" 
                                     class="form-control" 
                                     id="exampleFormControlInput1"
                                     placeholder="Nombre"
                                     maxlength="50"
                                      required oninput="habilitarBoton()">
                             </div>
                             <div class="mb-3">
                                 <label for="exampleFormControlTextarea1" 
                                     class="form-label">Precio
                                 </label>
                                 <input name="precio" 
                                     type="number" 
                                     class="form-control" 
                                     id="exampleFormControlTextarea1"
                                     required oninput="habilitarBoton()">
                             </div>
                             <div class="mb-3">
                                 <label for="exampleFormControlTextarea1" 
                                     class="form-label"
                                     >Imágen
                                 </label>
                                 <input name="imagen" 
                                     type="file" 
                                     class="form-control" 
                                     id="exampleFormControlTextarea1"
                                     required oninput="habilitarBoton()">
                             </div>
                             <div class="mb-3">
                                 <label for="exampleFormControlTextarea1" 
                                     class="form-label">Código
                                 </label>
                                 <input name="codigo" 
                                     type="text" 
                                     class="form-control" 
                                     id="exampleFormControlTextarea1" 
                                     maxlength="7"
                                     required oninput="habilitarBoton()">
                             </div>
                             <div class="mb-3">
                                 <label for="autor" 
                                     class="form-label">Autor
                                 </label>
                                 <input name="autor" 
                                     type="text" 
                                     class="form-control" 
                                     id="autor" 
                                     maxlength="50"
                                     required oninput="habilitarBoton()">
                             </div>
                          
                             <button  class="btn btn-primary" id="miBoton" disabled>Dar de alta </button>
                         </form>

                          </p>
                        </div>
                      </div>
                    
                    
                </section>
            </div>
        </div>
        <script>
             function habilitarBoton() {
      var inputs = document.getElementsByTagName('input');
      var boton = document.getElementById('miBoton');
      var completos = true;

      for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].hasAttribute('required') && !inputs[i].value) {
          completos = false;
          inputs[i].classList.remove('was-validated');
          inputs[i].classList.add('needs-validation');
        } else {
          inputs[i].classList.remove('needs-validation');
          inputs[i].classList.add('was-validated');
        }
      }

      boton.disabled = !completos;
    }
          </script>
</body>

</html>