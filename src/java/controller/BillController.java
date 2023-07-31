/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOBill;
import dao.DAOOrder;
import dao.DAOProduct;
import dao.DAOUser;
import entity.Bill;
import entity.Order;
import entity.Product;
import entity.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

/**
 *
 * @author Lenovo
 */
public class BillController extends HttpServlet {

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
        
        DAOBill dao = new DAOBill();
        DAOProduct daopro = new DAOProduct();
        DAOUser daouser = new DAOUser();
        DAOOrder daoOrder = new DAOOrder();
        
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String service = request.getParameter("service");
            //excetion = NULL
            if (service == null) {
                service = "displayAll";
            }
            
            if (service.equals("displayAll")) {
                ResultSet rs = dao.getData("select o.order_id,o.name_receiver,o.date,o.total_price,o.status from bill b join orders o\n"
                        + "on b.order_id  = o.order_id\n"
                        + "group by o.order_id,o.name_receiver,o.date,o.total_price,o.status");
                String title = "List of Bill";
                //select JSP
                RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListBill.jsp");
                //set object parameter for JSP 
                request.setAttribute("data", rs);
                request.setAttribute("tableTitle", title);

                // Dispatcher to JSP 
                dispath.forward(request, response);
            }
            
            if (service.equals("Billdetail")) {
                String order_id = request.getParameter("id");
                ResultSet rs = dao.getData("select b.bill_id,b.user_id,b.product_id,b.product_name,b.image,b.list_price,b.quantity,b.status from bill b join orders o\n"
                        + "on b.order_id  = o.order_id \n"
                        + "where b.order_id = " + order_id);
                String title = "List of Bill Detail";
                //select JSP
                RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListBillDetail.jsp");
                //set object parameter for JSP 
                request.setAttribute("tableTitle", title);
                request.setAttribute("data", rs);
                // Dispatcher to JSP 
                dispath.forward(request, response);
            }
            
            if (service.equals("updateBill")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int bill_id = Integer.parseInt(request.getParameter("id"));
                    Vector<Bill> vector = dao.getBill("select * from bill where "
                            + " bill_id = " + bill_id);
                    request.setAttribute("data", vector);
                    dispath(request, response, "/jspClient/UpdateBill.jsp");
                    
                } else {
                    
                    int bill_id = Integer.parseInt(request.getParameter("bill_id"));
                    int order_id = Integer.parseInt(request.getParameter("order_id"));
                    int user_id = Integer.parseInt(request.getParameter("user_id"));
                    int product_id = Integer.parseInt(request.getParameter("product_id"));
                    String product_name = request.getParameter("product_name");
                    String image = request.getParameter("image");
                    double list_price = Double.parseDouble(request.getParameter("list_price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    String status = request.getParameter("status");
                    System.out.println(bill_id);
                    Bill bill = new Bill(bill_id, order_id, user_id, product_id,
                            product_name, image, list_price, quantity, status);
                    
                    dao.updateBill(bill);
                    
                    response.sendRedirect("BillController");
                }
            }
            
            if (service.equals("insertBill")) {
                
                int bill_id = Integer.parseInt(request.getParameter("bill_id"));
                int order_id = Integer.parseInt(request.getParameter("order_id"));
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                String product_name = request.getParameter("product_name");
                String image = request.getParameter("image");
                double list_price = Double.parseDouble(request.getParameter("list_price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String status = request.getParameter("status");
                
                Bill bill = new Bill(bill_id, order_id, user_id, product_id,
                        product_name, image, list_price, quantity, status);
                
                dao.addBill(bill);
                response.sendRedirect("BillController");
            }
            
            if (service.equals("deleteBill")) {
                int bill_id = Integer.parseInt(request.getParameter("id"));
                int n = dao.removeBill(bill_id);
                response.sendRedirect("BillController");
            }
            
            if (service.equals("searchBill")) {
                String id = request.getParameter("id");
                if (id.isEmpty()) {
                    response.sendRedirect("BillController");
                } else {
                    Vector<Bill> bill = dao.searchBill(id);
                    RequestDispatcher dispath = request.getRequestDispatcher("/jspClient/ListBill.jsp");
                    String title = "List of Bill";
                    request.setAttribute("tableTitle", title);
                    request.setAttribute("data", bill);
                    dispath.forward(request, response);
                }
            }
            
            if (service.equals("addAutoBill")) {
                // lay set order_id
                int order_id = 0;
                Vector<Order> order = daoOrder.getOrder();
                for (Order temp : order) {
                    order_id++;
                }
                
                int useridforaddorder = 0;

                // set all thuoc tinh
                ArrayList<Double> total_price = new ArrayList<Double>();
                ArrayList<Bill> arbill = new ArrayList<Bill>();
                HttpSession session = request.getSession();
                Enumeration<String> em = session.getAttributeNames();
                while (em.hasMoreElements()) {
                    String id = em.nextElement();
                    if (!id.equals("username")) {
                        String count = session.getAttribute(id).toString();
                        Vector<Product> vector = daopro.searchProductId(id);
                        int quantity = Integer.parseInt(count);
                        int idpro = Integer.parseInt(id);
                        for (Product temp : vector) {
                            Bill bill = new Bill(0, order_id + 1, 0, idpro, temp.getProduct_name(),
                                    temp.getImage(), (((double) (Math.ceil((temp.getList_price() * (1 - temp.getDiscount())) * 100) / 100)) * quantity), quantity, "Wait");
                            arbill.add(bill);
                            double price = (((double) (Math.ceil((temp.getList_price() * (1 - temp.getDiscount())) * 100) / 100)) * quantity);
                            total_price.add(price);
                        }
                    } else {
                        String usename = session.getAttribute(id).toString();
                        Vector<User> vector = daouser.getUser();
                        for (User user : vector) {
                            if (usename.equals(user.getUsername())) {
                                for (Bill temp : arbill) {
                                    // lay user_id
                                    useridforaddorder = user.getUser_id();
                                    temp.setUser_id(user.getUser_id());
                                }
                            }
                        }
                    }
                }
                int n = 0;
                DAOBill daob = new DAOBill();
                Vector<Bill> vector1 = daob.getBill();
                for (Bill temp1 : vector1) {
                    n++;
                }
                for (Bill temp : arbill) {
                    n = n + 1;
                    temp.setBill_id(n);
                }
                for (Bill temp : arbill) {
                    dao.addBill(temp);
                }
                
                double allprice = 0;
                for (int i = 0; i < total_price.size(); i++) {
                    allprice += (double) total_price.get(i);
                }
                // cho database ten va id nguoi dung 
                RequestDispatcher dispath
                        = request.getRequestDispatcher("./jspClient/AddOrder.jsp");
                request.setAttribute("user_id", useridforaddorder);
                request.setAttribute("allprice", allprice);
                dispath.forward(request, response);
            }
        }
    }
    
    void dispath(HttpServletRequest request, HttpServletResponse response,
            String url) throws ServletException, IOException {
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
