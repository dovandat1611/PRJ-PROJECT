/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOUser;
import entity.User;
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
public class UserController extends HttpServlet {

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

        DAOUser dao = new DAOUser();

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String service = request.getParameter("service");
            //excetion = NULL
            if (service == null) {
                service = "displayAll";
            }

            if (service.equals("displayAll")) {
                Vector<User> vector = dao.getUser();
                String title = "List of User";
                //select JSP
                RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListUser.jsp");

                //set object parameter for JSP 
                request.setAttribute("data", vector);
                request.setAttribute("tableTitle", title);

                // Dispatcher to JSP 
                dispath.forward(request, response);

            }

            if (service.equals("updateUser")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int user_id = Integer.parseInt(request.getParameter("id"));
                    Vector<User> vector = dao.getUser("select * from users where "
                            + " user_id = " + user_id);
                    request.setAttribute("data", vector);
                    dispath(request, response, "/jspClient/UpdateUser.jsp");
                } else {

                    int user_id = Integer.parseInt(request.getParameter("user_id"));
                    String first_name = request.getParameter("first_name");
                    String last_name = request.getParameter("last_name");
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    User user = new User(user_id, first_name, last_name, phone,
                            address, username, password);

                    dao.updateUser(user);
                    response.sendRedirect("UserController");
                }
            }

            if (service.equals("insertUser")) {
                // tao doi tham so de nhap vao
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                User user = new User(user_id, first_name, last_name, phone,
                        address, username, password);

                dao.addUser(user);
                request.getSession().setAttribute("username", username);
                response.sendRedirect("MainUser");

            }

            if (service.equals("deleteUser")) {
                int user_id = Integer.parseInt(request.getParameter("id"));
                int n = dao.removeUser(user_id);
                response.sendRedirect("UserController");
            }

            if (service.equals("searchUser")) {
                String user_name = request.getParameter("user_name");
                if (user_name.isEmpty()) {
                    response.sendRedirect("UserController");
                } else {
                    Vector<User> user = dao.searchUser(user_name);
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListUser.jsp");
                    String title = "List of User";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", user);
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
