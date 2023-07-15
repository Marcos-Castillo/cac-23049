package ar.com.codoacodo;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ar.com.codoacodo.dao.impl.DAO;
import ar.com.codoacodo.dao.impl.MySQLDAOImpl;
import ar.com.codoacodo.oop.Articulo;

@WebServlet("/EditarController")
public class EditarController extends HttpServlet {
    

    // esto lo maneja el servidor (Tomcat)
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");

        DAO dao = new MySQLDAOImpl();

        try {
            // success
            Articulo producto = dao.getById(Long.parseLong(id));

            req.setAttribute("producto", producto);
        } catch (Exception e) {
            // error
            req.setAttribute("error", "No se ha eliminado el articulo");
            getServletContext().getRequestDispatcher("/ListadoArticuloController").forward(req, resp);// GET
        }

        // redirect
        getServletContext().getRequestDispatcher("/editar.jsp").forward(req, resp);// GET
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // tendria que tener los parametros del front (<form>)
        String titulo = req.getParameter("nombre");
        double precio = Double.parseDouble(req.getParameter("precio"));
        String autor = req.getParameter("autor");
        String imagen = req.getParameter("imagen");
        String codigo = req.getParameter("codigo");
        Long id = Long.parseLong(req.getParameter("id"));
        LocalDateTime fechaCreacion = LocalDateTime.now();

        Articulo modificado = new Articulo(id, titulo, imagen, autor, precio, true, codigo, fechaCreacion);


        // Interface nombre = new ClaseQueImplementaLaIntarface();
        DAO dao = new MySQLDAOImpl();

        // puedo usar lo metodos que tiene DAO, sin saber quien cumple el contrato
        try {
            dao.update(modificado);
            // redirect
            // getServletContext().getRequestDispatcher("/ListadoArticuloController").forward(req,
            // resp);//POST ListadoArticuloController
            resp.sendRedirect(req.getContextPath() + "/ListadoArticuloController");
        } catch (Exception e) {
            try {
                // redirect
                getServletContext().getRequestDispatcher("/editar.jsp").forward(req, resp);
            } catch (ServletException | IOException ex) {
                Logger.getLogger(EditarController.class.getName()).log(Level.SEVERE, null, ex);
            }
            e.printStackTrace();
        } // try/catch/finally

    }
}