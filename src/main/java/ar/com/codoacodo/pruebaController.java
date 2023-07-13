//paquete: ar/com/codo
package ar.com.codoacodo;

import java.io.IOException;

import ar.com.codoacodo.dao.impl.DAO;
import ar.com.codoacodo.dao.impl.MySQLDAOImpl;
import java.util.ArrayList;
import ar.com.codoacodo.oop.Articulo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//App.java = Clase java
@WebServlet("/pruebaController")
public class pruebaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
              
      System.out.println("paso por controler");
        

        
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
