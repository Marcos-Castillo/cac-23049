//paquete: ar/com/codo
package ar.com.codoacodo;

import java.io.IOException;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ar.com.codoacodo.dao.impl.DAO;
import ar.com.codoacodo.dao.impl.MySQLDAOImpl;
import ar.com.codoacodo.oop.Articulo;
import java.util.logging.Level;
import java.util.logging.Logger;

//App.java = Clase java
@WebServlet("/AltaArticuloController")
public class AltaArticuloController extends HttpServlet {

    /**
     *
     * @param req
     * @param resp
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)   {
        //CREATE CONTROLLER 
        System.out.println("//AltaArticuloController");
        //tendria que tener los parametros del front (<form>)
        String titulo = req.getParameter("nombre");
        double precio = Double.parseDouble(req.getParameter("precio"));
        String autor  = req.getParameter("autor");
        String codigo  = req.getParameter("codigo");
       // String isbn  = "123465465456";
        LocalDateTime fechaCreacion = LocalDateTime.now();
        
        Articulo nuevo = new Articulo(titulo, codigo, autor, precio, false, codigo,fechaCreacion);
        
        //Interface nombre  = new ClaseQueImplementaLaIntarface();
        DAO dao = new MySQLDAOImpl();
        
        //puedo usar lo metodos que tiene DAO, sin saber quien cumple el contrato
        try {
            dao.create(nuevo);
            //redirect
            //getServletContext().getRequestDispatcher("/ListadoArticuloController").forward(req, resp);//POST ListadoArticuloController
            resp.sendRedirect(req.getContextPath() + "/ListadoArticuloController");
        } catch (Exception e) {
            try {
                //redirect
                getServletContext().getRequestDispatcher("/nuevo.jsp").forward(req, resp);
            } catch (ServletException | IOException ex) {
                Logger.getLogger(AltaArticuloController.class.getName()).log(Level.SEVERE, null, ex);
            }
            e.printStackTrace();
        } //try/catch/finally

    }
}
