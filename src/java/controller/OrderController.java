/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOOrder;
import entity.Order;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.Vector;

/**
 *
 * @author Lenovo
 */
public class OrderController extends HttpServlet {

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

        DAOOrder dao = new DAOOrder();

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String service = request.getParameter("service");
            //excetion = NULL
            if (service == null) {
                service = "displayAll";
            }

            if (service.equals("displayAll")) {
                Vector<Order> vector = dao.getOrder();
                String title = "List of Order";
                //select JSP
                RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListOrder.jsp");
                //set object parameter for JSP 
                request.setAttribute("data", vector);
                request.setAttribute("tableTitle", title);
                // Dispatcher to JSP 
                dispath.forward(request, response);

            }

            if (service.equals("updateOrder")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    String status = request.getParameter("status");
                    int order_id = Integer.parseInt(request.getParameter("id"));
                    Vector<Order> vector = dao.getOrder("select * from orders where "
                            + " order_id = " + order_id);
                    request.setAttribute("data", vector);
                    request.setAttribute("status", status);
                    dispath(request, response, "/jspClient/UpdateOrder.jsp");
                } else {
                    int order_id = Integer.parseInt(request.getParameter("order_id"));
                    int user_id = Integer.parseInt(request.getParameter("user_id"));
                    String name_receiver = request.getParameter("name_receiver");
                    String phone_receiver = request.getParameter("phone_receiver");
                    String address_receiver = request.getParameter("address_receiver");
                    double total_price = Double.parseDouble(request.getParameter("total_price"));
                    Date date = Date.valueOf(request.getParameter("date"));
                    String statuss = request.getParameter("statuss");
                    Order order = new Order(order_id, user_id, name_receiver, phone_receiver,
                            address_receiver, total_price, date, statuss);

                    dao.updateOrder(order);
                    response.sendRedirect("OrderController");
                }
            }
            
            if (service.equals("updateStatus")) {            
                    int order_id = Integer.parseInt(request.getParameter("order_id"));
                    String statuss = request.getParameter("statuss");
                    dao.updateOrderStatus(order_id, statuss);
                    response.sendRedirect("OrderController");
            }

            if (service.equals("insertOrder")) {

                int order_id = Integer.parseInt(request.getParameter("order_id"));
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                String name_receiver = request.getParameter("name_receiver");
                String phone_receiver = request.getParameter("phone_receiver");
                String address_receiver = request.getParameter("address_receiver");
                double total_price = Double.parseDouble(request.getParameter("total_price"));
                Date date = Date.valueOf(request.getParameter("date"));
                String status = request.getParameter("status");
                Order order = new Order(order_id, user_id, name_receiver, phone_receiver,
                        address_receiver, total_price, date, status);

                dao.addOrder(order);

                response.sendRedirect("CheckoutCart");

            }

            if (service.equals("deleteOrder")) {              
                int orderbill_id = Integer.parseInt(request.getParameter("id"));
                int order_id = Integer.parseInt(request.getParameter("id"));
                int n1 = dao.removeOrderBill(order_id);
                int n = dao.removeOrder(order_id);               
                response.sendRedirect("OrderController");
            }

            if (service.equals("searchOrder")) {
                String id = request.getParameter("order_id");
                if (id.isEmpty()) {
                    response.sendRedirect("OrderController");
                } else {
                    Vector<Order> order = dao.searchOrder(id);
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListOrder.jsp");
                    String title = "List of Order";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", order);
                    dispath.forward(request, response);
                }
            }
//            if (service.equals("displayOrderStatus")) {
//                String status = request.getParameter("status");
//                Vector<Order> vector = dao.getOrder("select * from orders "
//                        + "where status Like '" + status + "'");
//                String title = "List of Order";
//                //select JSP
//                RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListOrder.jsp");
//                //set object parameter for JSP 
//                request.setAttribute("data", vector);
//                request.setAttribute("tableTitle", title);
//                // Dispatcher to JSP 
//                dispath.forward(request, response);
//            }
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
