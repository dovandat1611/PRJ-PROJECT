/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOAdmin;
import entity.Admin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

/**
 *
 * @author Lenovo
 */
public class AdminController extends HttpServlet {

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

        DAOAdmin dao = new DAOAdmin();

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            // get service
            String service = request.getParameter("service");
            //excetion = NULL
            if (service == null) {
                service = "displayAll";
            }

            if (service.equals("displayAll")) {
                Vector<Admin> vector = dao.getAdmin();
                String title = "List of Admin";
                //select JSP
                RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListAdmin.jsp");

                //set object parameter for JSP 
                request.setAttribute("data", vector);
                request.setAttribute("tableTitle", title);

                // Dispatcher to JSP 
                dispath.forward(request, response);

            }

            if (service.equals("updateAdmin")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int admin_id = Integer.parseInt(request.getParameter("id"));
                    Vector<Admin> vector = dao.getAdmin("select * from admin where "
                            + " admin_id = " + admin_id);
                    request.setAttribute("data", vector);

                    dispath(request, response, "/jspClient/UpdateAdmin.jsp");

                } else {
                    int admin_id = Integer.parseInt(request.getParameter("admin_id"));
                    String first_name = request.getParameter("first_name");
                    String last_name = request.getParameter("last_name");
                    String phone = request.getParameter("phone");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    Admin admin = new Admin(admin_id, first_name,
                            last_name, phone, username, password);

                    dao.updateAdmin(admin);

                    response.sendRedirect("AdminController");
                }
            }

            if (service.equals("insertAdmin")) {
                // tao doi tham so de nhap vao
                int admin_id = Integer.parseInt(request.getParameter("admin_id"));
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");
                String phone = request.getParameter("phone");
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                Admin admin = new Admin(admin_id, first_name,
                        last_name, phone, username, password);

                dao.addAdmin(admin);

                response.sendRedirect("AdminController");

            }

            if (service.equals("deleteAdmin")) {
                int admin_id = Integer.parseInt(request.getParameter("id"));
                int n = dao.removeAdmin(admin_id);
                response.sendRedirect("AdminController");
            }

            if (service.equals("searchAdmin")) {
                String admin_name = request.getParameter("admin_name");
                if (admin_name.isEmpty()) {
                    response.sendRedirect("AdminController");
                } else {
                    Vector<Admin> admin = dao.searchAdmin(admin_name);
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListAdmin.jsp");
                    String title = "List of Admin";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", admin);
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
