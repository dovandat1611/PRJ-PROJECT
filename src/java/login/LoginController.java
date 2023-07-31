/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package login;

import dao.DAOAdmin;
import dao.DAOUser;
import entity.Admin;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class LoginController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jspLogin/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String login = request.getParameter("selectlogin");

        if (login.equalsIgnoreCase("1")) {
            DAOUser dao = new DAOUser();
            User user = dao.loginUser(username, password);
            if (user == null) {
                request.getRequestDispatcher("ErrorPage.html").forward(request, response);
            } else {
                Object name = (Object)(user.getFirst_name() + " " + user.getLast_name());
                
                HttpSession session = request.getSession(true);
                request.getSession().setAttribute("username", username);
                response.sendRedirect("MainUser");
            }
        } else {
            DAOAdmin dao = new DAOAdmin();
            Admin admin = dao.loginAdmin(username, password);
            if (admin == null) {
                request.getRequestDispatcher("ErrorPage.html").forward(request, response);
            } else {
                request.getSession().setAttribute("username", username);
                response.sendRedirect("MainAdmin");
//                request.getRequestDispatcher("/jspAdmin/MenuAdmin.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
