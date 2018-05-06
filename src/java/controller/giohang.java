/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dbHelpers.products_query;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.customer;
import model.product;

/**
 *
 * @author Lãng
 */
@WebServlet(name = "giohang", urlPatterns = {"/giohang"})
public class giohang extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet giohang</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet giohang at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        doPost(request, response);
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

        HttpSession ss = request.getSession();
        String command = request.getParameter("command");
        int id = 0;
        int quanlity = 1;
        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
        }
        Cart cart = (Cart) ss.getAttribute("cart");
        products_query pq = new products_query();
        if (request.getParameter("quanlity") != null) {
            quanlity = Integer.parseInt(request.getParameter("quanlity"));
        }
        try {
            product pd = pq.doc_sp_masp(id);
            switch (command) {
                case "them":
                    if (cart.getCartitem().containsKey(id)) {
                        cart.themitem(id, new Item(pd, cart.getCartitem().get(id).getQuanlity() + quanlity - 1));
                    } else {
                        cart.themitem(id, new Item(pd, quanlity));
                    }
                    break;
                case "themsl":
                    if (cart.getCartitem().containsKey(id)) {
                        cart.themitem(id, new Item(pd, cart.getCartitem().get(id).getQuanlity()));
                    } else {
                        cart.themitem(id, new Item(pd, 1));
                    }
                    ss.setAttribute("cart", cart);
                    response.getWriter().write(String.valueOf(cart.tinhtongtien()));
                    return;
                case "botsl":
                    if (cart.getCartitem().containsKey(id)) {
                        if (cart.getCartitem().get(id).getQuanlity() > 1) {
                            cart.xoaitem(id, new Item(pd, cart.getCartitem().get(id).getQuanlity()));
                        }
                    } else {
                        cart.xoaitem(id, new Item(pd, 1));
                    }
                    ss.setAttribute("cart", cart);
                    response.getWriter().write(String.valueOf(cart.tinhtongtien()));
                    return;
                case "xoacart":
                    cart.xoacart();
                    break;
                case "dathang":
                    customer cust = (customer) ss.getAttribute("account");
                    pq.dathang(cust, cart);
                    cart.xoacart();
                    String url = "index.jsp";
                    RequestDispatcher dis = request.getRequestDispatcher(url);
                    dis.forward(request, response);
                    return;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        ss.setAttribute("cart", cart);
        response.getWriter().write(String.valueOf(cart.demitem()));
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
