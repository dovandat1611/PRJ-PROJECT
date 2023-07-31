/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOBill;
import dao.DAOOrder;
import dao.DAOUser;
import entity.Bill;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;
import entity.User;
import jakarta.servlet.RequestDispatcher;
import java.sql.Date;

/**
 *
 * @author Lenovo
 */
public class UserBillController extends HttpServlet {

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
        HttpSession session = request.getSession();
        Enumeration<String> em = session.getAttributeNames();
        DAOUser dao = new DAOUser();
        DAOBill daoBill = new DAOBill();
        DAOOrder daoOrder = new DAOOrder();
        int userid = 0;
        while (em.hasMoreElements()) {
            String id = em.nextElement();
            if (id.equals("username")) {
                String username = (String) session.getAttribute(id);
                Vector<User> vector = dao.getUser();
                for (User user : vector) {
                    if (user.getUsername().equalsIgnoreCase(username)) {
//                            request.setAttribute("id", user.getUser_id());
                        userid = user.getUser_id();
                    }
                }
            }
        }
        String userID = Integer.toString(userid);
        String service = request.getParameter("service");
        //excetion = NULL
        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {
            String status = "";
            Vector<Order> order = daoOrder.searchOrderUserID(userID);
            RequestDispatcher dispath = request.getRequestDispatcher("/jspUser/DisplayOrder.jsp");
            request.setAttribute("data", order);
            request.setAttribute("userid", userID);
            request.setAttribute("status", status);
            dispath.forward(request, response);
        }

        if (service.equals("Billdetail")) {
            String userId = request.getParameter("userid");
            String orderId = request.getParameter("orderid");
            String status = "";
            Vector<Bill> bill = daoBill.searchBillUserID(userId, orderId);
            RequestDispatcher dispath = request.getRequestDispatcher("/jspUser/DisplayBill.jsp");
            request.setAttribute("data", bill);
            request.setAttribute("userid", userID);
            request.setAttribute("status", status);
            dispath.forward(request, response);
        }

        if (service.equals("displayOrderStatus")) {
            String status = request.getParameter("status");
            Vector<Order> vector = daoOrder.getOrder("select * from orders "
                    + "where status Like '" + status + "' and user_id = " + userID + "");
            //select JSP
            RequestDispatcher dispath = request.getRequestDispatcher("/jspUser/DisplayOrder.jsp");
            //set object parameter for JSP 
            request.setAttribute("data", vector);
            request.setAttribute("userid", userID);
            request.setAttribute("status", status);
            // Dispatcher to JSP 
            dispath.forward(request, response);
        }

        if (service.equals("updateOrder")) {
            String status = "";
            String submit = request.getParameter("submit");
            if (submit == null) {
                int orderid = Integer.parseInt(request.getParameter("orderid"));
                Vector<Order> vector = daoOrder.getOrder("select * from orders where "
                        + " order_id = " + orderid);
                request.setAttribute("data", vector);
                request.setAttribute("status", status);
                request.getRequestDispatcher("/jspUser/UpdateOrder.jsp").forward(request, response);
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
                daoOrder.updateOrder(order);
                response.sendRedirect("UserBillController");
            }
        }

        if (service.equals("deleteOrder")){
            String status = "";
            int order_id = Integer.parseInt(request.getParameter("orderid"));
            int n1 = daoOrder.removeOrderBill(order_id);
            int n = daoOrder.removeOrder(order_id);
            request.setAttribute("status", status);
            response.sendRedirect("UserBillController");
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
