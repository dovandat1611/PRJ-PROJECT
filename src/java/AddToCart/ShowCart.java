/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AddToCart;

import dao.DAOBill;
import dao.DAOOrder;
import dao.DAOProduct;
import entity.Bill;
import entity.Order;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "ShowCart", urlPatterns = {"/ShowCart"})
public class ShowCart extends HttpServlet {

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
            String cssPath = request.getContextPath() + "/css/cart.css";
            out.println("<html><head><title>My Webpage</title>");
            out.println("<link rel='stylesheet' type='text/css' href='" + cssPath + "'>");
            out.println("</head>");
            out.print("<body>\n"
                    + "        <h1>Shopping Cart Details</h1>\n"
                    + "        <table width=100% border=1px>\n"
                    + "            <tr>\n"
                    + "                <th>Product ID</th>\n"
                    + "                <th>Product Name</th>\n"
                    + "                <th>Images</th>\n"
                    + "                <th>Price</th>\n"
                    + "                <th>Quantity</th>\n"
                    + "            </tr>");
            ArrayList<Double> total_price = new ArrayList<Double>();
            HttpSession session = request.getSession();
            Enumeration<String> em = session.getAttributeNames();
            while (em.hasMoreElements()) {
                String id = em.nextElement().toString();
                if (!id.equals("usename")) {
                    String count = session.getAttribute(id).toString();
                    Vector<Product> vector = dao.searchProductId(id);
                    int quantity = Integer.parseInt(count);
                    int n = 0;
                    int idpro = Integer.parseInt(id);
                    int order=0;
                    DAOOrder daoOrder = new DAOOrder();
                    Vector<Order> order_id = daoOrder.getOrder();
                    for (Order temp : order_id) {
                        order++;
                    }
                    DAOBill daob = new DAOBill();
                    Vector<Bill> vector1 = daob.getBill();
                    for (Bill temp1 : vector1) {
                        n++;
                    }
                    ArrayList<Bill> arbill = new ArrayList<Bill>();
                    out.println("<tr>");
                    out.println("<td>" + id + "</td>");
                    for (Product temp : vector) {
                        out.println("<td>" + temp.getProduct_name() + "</td>");
                        out.println("<td><img width=20% src=\"" + temp.getImage() + "\" alt=\"" + temp.getImage() + "\"/></td>");
                        out.println("<td>" + ((double) (Math.ceil((temp.getList_price() * (1 - temp.getDiscount())) * 100) / 100)) * quantity + "</td>");
                        Bill bill = new Bill(n, order, idpro, idpro, temp.getProduct_name(),
                                temp.getImage(), (((double) (Math.ceil((temp.getList_price() * (1 - temp.getDiscount())) * 100) / 100)) * quantity), quantity, "Wait");
                        arbill.add(bill);
                        double price = (((double) (Math.ceil((temp.getList_price() * (1 - temp.getDiscount())) * 100) / 100)) * quantity);
                        System.out.println(arbill.get(0).getList_price());
                        total_price.add(price);
                    }
                    double allprice = 0;
                    for (int i = 0; i < total_price.size(); i++) {
                        allprice += (double) total_price.get(i);
                    }
                    out.println("<td>" + count + "</td>");
                    out.println("</tr>");
                }
            }
            out.print("</table>\n");
            out.print("        <div class=\"footer\">\n"
                    + "            <form action=\"MainUser\">\n"
                    + "                <button type=\"submit\" class=\"btn-home\">Home</button>\n"
                    + "            </form>\n"
                    + "            <div class=\"buy\">\n"
                    + "                <form action=\"./jspAddToCart/ShowCart.jsp\">\n"
                    + "                    <button type=\"submit\" class=\"cart-button\">Buy All</button>\n"
                    + "                </form>\n"
                    + "            </div>\n"
                    + "            <div class=\"logout\">\n"
                    + "                <form action=\"LogoutController\">\n"
                    + "                    <button type=\"submit\" class=\"logout-button\">Check out</button>\n"
                    + "                </form>\n"
                    + "            </div>\n"
                    + "        </div>");
            out.print("</body>\n"
                    + "</html>");

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
