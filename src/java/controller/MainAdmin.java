/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOAdmin;
import dao.DAOBill;
import dao.DAOOrder;
import dao.DAOOrderProduct;
import dao.DAOProduct;
import dao.DAOUser;
import entity.Admin;
import entity.Bill;
import entity.Order;
import entity.OrderProduct;
import entity.Product;
import entity.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author Lenovo
 */
public class MainAdmin extends HttpServlet {

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

        DAOAdmin daoAdmin = new DAOAdmin();
        DAOUser daoUser = new DAOUser();
        DAOOrder daoOrder = new DAOOrder();
        DAOProduct daoProduct = new DAOProduct();
        DAOOrderProduct daoOP = new DAOOrderProduct();
        DAOBill daoBill = new DAOBill();
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String service = request.getParameter("service");
            if (service == null) {
                service = "displayAll";
            }
            if (service.equals("displayAll")) {
                Vector<Product> product = daoProduct.getProduct();
                String title = "List of Products";
                //select JSP
                RequestDispatcher dispath
                        = request.getRequestDispatcher("/jspAdmin/indexProduct.jsp");
                //set object paramter for JSP
                request.setAttribute("data", product);
                request.setAttribute("tableTitle", title);
                //Dispatcher to JSP
                dispath.forward(request, response);
            }
            if (service.equals("displayAdmin")) {
                Vector<Admin> admin = daoAdmin.getAdmin();
                String title = "List of Admin";
                //select JSP
                RequestDispatcher dispath
                        = request.getRequestDispatcher("/jspAdmin/indexAdmin.jsp");
                //set object paramter for JSP
                request.setAttribute("data", admin);
                request.setAttribute("tableTitle", title);
                //Dispatcher to JSP
                dispath.forward(request, response);

            }
            if (service.equals("displayUser")) {
                Vector<User> user = daoUser.getUser();
                String title = "List of User";
                //select JSP
                RequestDispatcher dispath
                        = request.getRequestDispatcher("/jspAdmin/indexUser.jsp");
                //set object paramter for JSP
                request.setAttribute("data", user);
                request.setAttribute("tableTitle", title);
                //Dispatcher to JSP
                dispath.forward(request, response);
            }

            if (service.equals("displayProduct")) {
                Vector<Product> product = daoProduct.getProduct();
                String title = "List of Products";
                //select JSP
                RequestDispatcher dispath
                        = request.getRequestDispatcher("/jspAdmin/indexProduct.jsp");
                //set object paramter for JSP
                request.setAttribute("data", product);
                request.setAttribute("tableTitle", title);
                //Dispatcher to JSP
                dispath.forward(request, response);
            }

            if (service.equals("displayOrder")) {
                Vector<Order> order = daoOrder.getOrder();
                String title = "List of Order";
                //select JSP
                RequestDispatcher dispath
                        = request.getRequestDispatcher("/jspAdmin/indexOrder.jsp");
                //set object paramter for JSP
                request.setAttribute("data", order);
                request.setAttribute("tableTitle", title);
                //Dispatcher to JSP
                dispath.forward(request, response);
            }

            if (service.equals("displayOrderProduct")) {
                Vector<OrderProduct> op = daoOP.getOrderProduct();
                String title = "List of OrderProduct";
                //select JSP
                RequestDispatcher dispath
                        = request.getRequestDispatcher("/jspAdmin/indexOrderProduct.jsp");
                //set object paramter for JSP
                request.setAttribute("data", op);
                request.setAttribute("tableTitle", title);
                //Dispatcher to JSP
                dispath.forward(request, response);
            }

            if (service.equals("displayBill")) {
                ResultSet rs = daoBill.getData("select o.order_id,o.name_receiver,o.date,o.total_price,o.status from bill b join orders o\n"
                        + "on b.order_id  = o.order_id\n"
                        + "group by o.order_id,o.name_receiver,o.date,o.total_price,o.status");
                String title = "List of Bill";
                //select JSP
                RequestDispatcher dispath
                        = request.getRequestDispatcher("/jspAdmin/indexBill.jsp");
                //set object paramter for JSP
                request.setAttribute("data", rs);
                request.setAttribute("tableTitle", title);
                //Dispatcher to JSP
                dispath.forward(request, response);
            }

            if (service.equals("displayDetailForBill")) {
                Vector<Bill> bill = daoBill.getBill();
                String title = "List of Bill Detail";
                //select JSP
                RequestDispatcher dispath
                        = request.getRequestDispatcher("/jspAdmin/indexDetailForBill.jsp");
                //set object paramter for JSP
                request.setAttribute("data", bill);
                request.setAttribute("tableTitle", title);
                //Dispatcher to JSP
                dispath.forward(request, response);
            }

            if (service.equals("displayOrderStatus")) {                
                String status = request.getParameter("status");
                Vector<Order> vector = daoOrder.getOrder("select * from orders "
                        + "where status Like '" + status + "'");
                String title = "List of Order";
                //select JSP
                RequestDispatcher dispath = request.getRequestDispatcher("/jspAdmin/indexOrder.jsp");
                //set object parameter for JSP 
                request.setAttribute("data", vector);
                request.setAttribute("tableTitle", title);
                request.setAttribute("status", status);
                // Dispatcher to JSP 
                dispath.forward(request, response);
            }

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
