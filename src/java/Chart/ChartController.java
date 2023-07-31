/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Chart;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "ChartController", urlPatterns = {"/ChartController"})
public class ChartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DAOChart dao = new DAOChart();

        String service = request.getParameter("service");
        if (service == null) {
            service = "displayAll";
        }

        if (service.equals("displayAll")) {
            ArrayList<ChartTotalMoney> t1 = dao.getChartTotalMoney("01");
            ArrayList<ChartTotalMoney> t2 = dao.getChartTotalMoney("02");
            ArrayList<ChartTotalMoney> t3 = dao.getChartTotalMoney("03");
            ArrayList<ChartTotalMoney> t4 = dao.getChartTotalMoney("04");
            ArrayList<ChartTotalMoney> t5 = dao.getChartTotalMoney("05");
            ArrayList<ChartTotalMoney> t6 = dao.getChartTotalMoney("06");
            ArrayList<ChartTotalMoney> t7 = dao.getChartTotalMoney("07");
            ArrayList<ChartTotalMoney> t8 = dao.getChartTotalMoney("08");
            ArrayList<ChartTotalMoney> t9 = dao.getChartTotalMoney("09");
            ArrayList<ChartTotalMoney> t10 = dao.getChartTotalMoney("10");
            ArrayList<ChartTotalMoney> t11 = dao.getChartTotalMoney("11");
            ArrayList<ChartTotalMoney> t12 = dao.getChartTotalMoney("12");
            RequestDispatcher dispath
                    = request.getRequestDispatcher("/jspChart/chartLine.jsp");
            request.setAttribute("t1", t1);
            request.setAttribute("t2", t2);
            request.setAttribute("t3", t3);
            request.setAttribute("t4", t4);
            request.setAttribute("t5", t5);
            request.setAttribute("t6", t6);
            request.setAttribute("t7", t7);
            request.setAttribute("t8", t8);
            request.setAttribute("t9", t9);
            request.setAttribute("t10", t10);
            request.setAttribute("t11", t11);
            request.setAttribute("t12", t12);
            dispath.forward(request, response);
        }

        if (service.equals("displayChartBuy")) {
            ArrayList<ChartBuy> t1 = dao.getChartBuy("01");
            ArrayList<ChartBuy> t2 = dao.getChartBuy("02");
            ArrayList<ChartBuy> t3 = dao.getChartBuy("03");
            ArrayList<ChartBuy> t4 = dao.getChartBuy("04");
            ArrayList<ChartBuy> t5 = dao.getChartBuy("05");
            ArrayList<ChartBuy> t6 = dao.getChartBuy("06");
            ArrayList<ChartBuy> t7 = dao.getChartBuy("07");
            ArrayList<ChartBuy> t8 = dao.getChartBuy("08");
            ArrayList<ChartBuy> t9 = dao.getChartBuy("09");
            ArrayList<ChartBuy> t10 = dao.getChartBuy("10");
            ArrayList<ChartBuy> t11 = dao.getChartBuy("11");
            ArrayList<ChartBuy> t12 = dao.getChartBuy("12");
            RequestDispatcher dispath
                    = request.getRequestDispatcher("/jspChart/chartBar.jsp");
            request.setAttribute("t1", t1);
            request.setAttribute("t2", t2);
            request.setAttribute("t3", t3);
            request.setAttribute("t4", t4);
            request.setAttribute("t5", t5);
            request.setAttribute("t6", t6);
            request.setAttribute("t7", t7);
            request.setAttribute("t8", t8);
            request.setAttribute("t9", t9);
            request.setAttribute("t10", t10);
            request.setAttribute("t11", t11);
            request.setAttribute("t12", t12);
            dispath.forward(request, response);
        }

        if (service.equals("displayCategory")) {
            ArrayList<chartCategory> Garment = dao.getchartCategory("Garment");
            ArrayList<chartCategory> Accessories = dao.getchartCategory("Accessories");
            ArrayList<chartCategory> Technology = dao.getchartCategory("Technology");
            RequestDispatcher dispath
                    = request.getRequestDispatcher("/jspChart/chartRadar.jsp");
            request.setAttribute("Garment", Garment);
            request.setAttribute("Accessories", Accessories);
            request.setAttribute("Technology", Technology);
            dispath.forward(request, response);
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
