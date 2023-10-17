/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Shoppingcart;
import model.ShoppingcartPK;
import model.ShoppingcartTable;
import java.util.UUID;

/**
 *
 * @author jjsoc
 */
public class indexController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String[] products = request.getParameterValues("selectedMovies");
        String[] quantity = request.getParameterValues("quantity");
        Shoppingcart cart;
        
        if(products != null){
            int cartId = ShoppingcartTable.GenerateId();
            request.setAttribute("cartId", cartId);
            for(int i = 0; i < products.length ; i++){           
                if (products[i] != null) {
                    int movieId = Integer.parseInt(products[i]);
                    cart = new Shoppingcart(cartId, movieId);
                    cart.setQuantity(Integer.parseInt(quantity[Integer.valueOf(products[i])-1]));
                
                    int rowInserted = ShoppingcartTable.insertCart(cart);
                    request.setAttribute("rowInserted", rowInserted);
                    }
                }
            }
            else {
                
            }
      

        request.getRequestDispatcher("CheckShoppingCart.jsp").forward(request, response);
        
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
