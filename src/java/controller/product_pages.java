/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dbHelpers.products_query;
import model.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.groupproduct;

/**
 *
 * @author Lãng
 */
@WebServlet(name = "product_pages", urlPatterns = {"/product_pages"})
public class product_pages extends HttpServlet {

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
            out.println("<title>Servlet products</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet products at " + request.getContextPath() + "</h1>");
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
        try {
            //model
            products_query pq = new products_query();
            groupproduct gp = new groupproduct();
            ArrayList<product> arr = new ArrayList<>();
            int pages;
            int count = 0;
            int groupid = 0;
            int money = 0;
            int vt;
            int limit;
            if (request.getParameter("pages") != null) {
                pages = Integer.parseInt(request.getParameter("pages"));
            } else {
                pages = 1;
            }
            if (request.getParameter("group") != null) {
                groupid = Integer.parseInt(request.getParameter("group"));
                count = pq.doc_soluongsptheonhom(groupid);
                if (count <= 9) {
                    vt = 0;
                    limit = count;
                } else {
                    vt = (pages - 1) * 9;
                    limit = 9;
                }
                arr = pq.doc_sptheonhomsp_phantrang(groupid, vt, limit);
                gp = pq.doc_nhomsp_id(groupid);
                request.setAttribute("nhom", gp);
                request.setAttribute("group", groupid);
            } else if (request.getParameter("money") != null) {
                money = Integer.parseInt(request.getParameter("money"));
                int tu = 0;
                int den = 0;
                switch (money) {
                    case 0:
                        tu = -1;
                        den = 100000;
                        break;
                    case 100:
                        tu = 100000;
                        den = 200000;
                        break;
                    case 200:
                        tu = 200000;
                        den = 500000;
                        break;
                    case 500:
                        tu = 500000;
                        den = 1000000;
                        break;
                    case 1000:
                        tu = 1000000;
                        den = -1;
                }
                count = pq.doc_soluongsptheogia(tu, den);
                if (count <= 9) {
                    vt = 0;
                    limit = count;
                } else {
                    vt = (pages - 1) * 9;
                    limit = 9;
                }
                arr = pq.doc_sptheogia_phantrang(tu, den, vt, limit);
                request.setAttribute("money", money);
            }
            else if (request.getParameter("Search")!=null) {
                String st = request.getParameter("Search");
                count = pq.tim_soluongsptheoten(st);
                if (count <= 9) {
                    vt = 0;
                    limit = count;
                } else {
                    vt = (pages - 1) * 9;
                    limit = 9;
                }
                arr = pq.tim_sptheotenphantrang(st, vt, limit);
                request.setAttribute("Search", st);
            }
            else {
                count = pq.doc_soluongsp();
                if (count <= 9) {
                    vt = 0;
                    limit = count;
                } else {
                    vt = (pages - 1) * 9;
                    limit = 9;
                }
                arr = pq.doc_sp_phantrang(vt, limit);
            }

            ArrayList<groupproduct> nhomsp = pq.doc_nhomsp();

            String view = "views/products/v_products.jsp";
            request.setAttribute("view", view);
            request.setAttribute("list", arr);
            request.setAttribute("count", count);
            request.setAttribute("nhomsp", nhomsp);
            request.setAttribute("pages", pages);
            String url = "/products.jsp";
            RequestDispatcher dis = request.getRequestDispatcher(url);
            dis.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(product_pages.class.getName()).log(Level.SEVERE, null, ex);
        }
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
