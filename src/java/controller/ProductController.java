/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOProduct;
import entity.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Lenovo
 */
public class ProductController extends HttpServlet {

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

        DAOProduct dao = new DAOProduct();

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String service = request.getParameter("service");
            //excetion = NULL
            if (service == null) {
                service = "displayAll";
            }

            if (service.equals("displayAll")) {
                Vector<Product> vector = dao.getProduct();
                String title = "List of Product";
                //select JSP
                RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListProduct.jsp");

                //set object parameter for JSP 
                request.setAttribute("data", vector);
                request.setAttribute("tableTitle", title);

                // Dispatcher to JSP 
                dispath.forward(request, response);

            }

            if (service.equals("updateProduct")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int product_id = Integer.parseInt(request.getParameter("id"));
                    Vector<Product> vector = dao.getProduct("select * from products where "
                            + " product_id = " + product_id);
                    request.setAttribute("data", vector);
                    dispath(request, response, "/jspClient/UpdateProduct.jsp");

                } else {

                    int product_id = Integer.parseInt(request.getParameter("product_id"));
                    String product_name = request.getParameter("product_name");
                    String description = request.getParameter("description");
                    String image = request.getParameter("image");
                    double list_price = Double.parseDouble(request.getParameter("list_price"));
                    double discount = Double.parseDouble(request.getParameter("discount"));
                    String category_name = request.getParameter("category_name");

                    Product product = new Product(product_id, product_name,
                            description, image, list_price, discount, category_name);

                    dao.updateProduct(product);

                    response.sendRedirect("ProductController");
                }
            }

            if (service.equals("insertProduct")) {

                int product_id = Integer.parseInt(request.getParameter("product_id"));
                String product_name = request.getParameter("product_name");
                String description = request.getParameter("description");
                String image = request.getParameter("image");
                double list_price = Double.parseDouble(request.getParameter("list_price"));
                double discount = Double.parseDouble(request.getParameter("discount"));
                String category_name = request.getParameter("category_name");

                Product product = new Product(product_id, product_name,
                        description, image, list_price, discount, category_name);

                dao.addProduct(product);

                response.sendRedirect("ProductController");

            }

            if (service.equals("deleteProduct")) {
                int product_id = Integer.parseInt(request.getParameter("id"));
                int n = dao.removeProduct(product_id);
                response.sendRedirect("ProductController");
            }

            if (service.equals("searchProduct")) {
                String productname = request.getParameter("product_name");
                if (productname.isEmpty()) {
                    response.sendRedirect("ProductController");
                } else {
                    Vector<Product> product = dao.searchProduct(productname);
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListProduct.jsp");
                    String title = "List of Product";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", product);
                    dispath.forward(request, response);
                }
            }
            if (service.equals("searchProductPrice")) {
                String min = request.getParameter("min");
                String max = request.getParameter("max");
                if (min.isEmpty() || max.isEmpty()) {
                    response.sendRedirect("OrderController");
                } else {
                    Vector<Product> product = dao.searchProductPrice(min, max);
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListProduct.jsp");
                    String title = "List of Product";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", product);
                    dispath.forward(request, response);
                }
            }

            if (service.equals("searchProductASCorDESC")) {
                String id = request.getParameter("id");
                if (id.equals("ASC")) {
                    Vector<Product> product = dao.searchProductPriceASC();
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListProduct.jsp");
                    String title = "List of Product";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", product);
                    request.setAttribute("ASCorDESC", id);
                    dispath.forward(request, response);
                } else {
                    Vector<Product> product = dao.searchProductPriceDESC();
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListProduct.jsp");
                    String title = "List of Product";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", product);
                    request.setAttribute("ASCorDESC", id);
                    dispath.forward(request, response);
                }
            }
        }
    }

    void dispath(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        RequestDispatcher disp = request.getRequestDispatcher(url);
        disp.forward(request, response);
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
