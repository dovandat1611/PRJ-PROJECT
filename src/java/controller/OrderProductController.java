/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOOrderProduct;
import entity.OrderProduct;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;

/**
 *
 * @author Lenovo
 */
public class OrderProductController extends HttpServlet {

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

        DAOOrderProduct dao = new DAOOrderProduct();

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String service = request.getParameter("service");
            //excetion = NULL
            if (service == null) {
                service = "displayAll";
            }

            if (service.equals("displayAll")) {
                Vector<OrderProduct> vector = dao.getOrderProduct();
                String title = "List of Order Product";
                //select JSP
                RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListOrderProduct.jsp");

                //set object parameter for JSP 
                request.setAttribute("data", vector);
                request.setAttribute("tableTitle", title);

                // Dispatcher to JSP 
                dispath.forward(request, response);

            }

            if (service.equals("updateOrderProduct")) {

                String submit = request.getParameter("submit");
                if (submit == null) {
                    int order_id = Integer.parseInt(request.getParameter("order_id"));
                    int product_id = Integer.parseInt(request.getParameter("product_id"));
                    Vector<OrderProduct> vector = dao.getOrderProduct("select * from order_product where "
                            + " order_id = " + order_id + " and product_id = " + product_id);
                    request.setAttribute("data", vector);
                    dispath(request, response, "/jspClient/UpdateOrderProduct.jsp");

                } else {
                    int order_id = Integer.parseInt(request.getParameter("order_id"));
                    int product_id = Integer.parseInt(request.getParameter("product_id"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    OrderProduct op = new OrderProduct(order_id, product_id, quantity);

                    dao.updateOrderProduct(op);

                    response.sendRedirect("OrderProductController");
                }
            }

            if (service.equals("insertOrderProduct")) {

                int order_id = Integer.parseInt(request.getParameter("order_id"));
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                OrderProduct op = new OrderProduct(order_id, product_id, quantity);

                dao.addOrderProduct(op);

                response.sendRedirect("OrderProductController");

            }

            if (service.equals("deleteOrderProduct")) {
                int order_id = Integer.parseInt(request.getParameter("order_id"));
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                int n = dao.removeOrderProduct(order_id, product_id);
                response.sendRedirect("OrderProductController");
            }

            if (service.equals("searchOrderProduct")) {
                String quantity = request.getParameter("quantity");
                if (quantity.isEmpty()) {
                    response.sendRedirect("OrderProductController");
                } else {
                    Vector<OrderProduct> op = dao.searchOrderProduct(quantity);
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListOrderProduct.jsp");
                    String title = "List of Order Product";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", op);
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
