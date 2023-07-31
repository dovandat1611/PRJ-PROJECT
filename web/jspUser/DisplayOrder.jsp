<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ListOrder
    Created on : Feb 23, 2023, 4:47:28 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOOrder"%>
<%@page import="entity.Order"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.DAOUser"%>
<%@page import="entity.User"%>
<%@page import="java.util.Vector"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Order</title>
        <link rel="stylesheet" type="text/css" href="css/list.css">
        <style>
            .statusorder {
                margin-bottom: 20px;
                margin-top: 20px;
                display: flex;
                justify-content: space-evenly;
            }
            .infor {
                background-color: #f2f2f2;
                padding: 10px;
                border: 1px solid #ccc;
                margin-bottom: 20px;
            }

            /* Style for the first <p> element */
            .infor p:first-child {
                font-weight: bold;
                font-size: 20px;
            }

            /* Style for the second <p> element */
            .infor p:last-child {
                margin-top: 10px;
                font-style: italic;
                color: #999;
            }
        </style>
    </head>
    <body>
        <%
            Vector<Order> vector = (Vector<Order>)request.getAttribute("data");
            String userID = (String)request.getAttribute("userid");
            String status = (String)request.getAttribute("status");
            int w=0;
            int p=0;
            int d=0;
            DAOOrder daoOrder = new DAOOrder();
            Vector<Order> order = daoOrder.searchOrderUserID(userID);
            for (Order od : order) 
                {
                    if(od.getStatus().equals("Wait")){
                      w++;
                    }else if(od.getStatus().equals("Process")){
                       p ++;
                    }else{
                      d ++;
                    }
                }
        %> 

        <%   
                Enumeration<String> em = session.getAttributeNames();             
                while (em.hasMoreElements()) {
                String id = em.nextElement().toString();
                String usename = session.getAttribute(id).toString();
                DAOUser dao = new DAOUser();
                Vector<User> users = dao.getUser();
                for (User temp : users) {%>
        <%          if (usename.equals(temp.getUsername())){                
                    
        %>

        <div class="infor">
            <p> Welcome: <%=temp.getFirst_name()+" "+temp.getLast_name()%></p>
            <p >Username: <%=usename%></p>
        </div>
        <%}%>
        <%}%>
        <%}%>


        <div class="header">
            <form action="MainUser">
                <button type="submit" class="btn-home">Home</button>
            </form>
            <div class="logout">
                <form action="LogoutController">
                    <button type="submit" class="logout-button">Logout</button>
                </form>
            </div>
        </div>

        <div class="statusorder">
            <div><a href="UserBillController?service=displayOrderStatus&status=Wait">Wait: <%=w%></a></div> 
            <div><a href="UserBillController?service=displayOrderStatus&status=Process">Process: <%=p%></a></div>
            <div><a href="UserBillController?service=displayOrderStatus&status=Done">Done: <%=d%></a></div>
        </div>

        <table border="1">
            <caption>List Order User</caption>
            <tr>
                <th>Name Receiver </th>
                <th>Phone Receiver</th>
                <th>Address Receiver</th>
                <th>Total Price</th>
                <th>Date</th>
                <th>Status</th>
                <th>Detail</th>
                    <c:if test="${status.equalsIgnoreCase('Wait')}">
                    <th>Update</th>
                    <th>Delete</th>
                    </c:if>
            </tr>

            <%for (Order temp : vector) {%>
            <tr>
                <td><%=temp.getName_receiver()%> </td>
                <td><%=temp.getPhone_receiver()%> </td>
                <td><%=temp.getAddress_receiver()%> </td>
                <td><%=temp.getTotal_price()%> </td>
                <td><%=temp.getDate()%> </td>
                <td><%=temp.getStatus()%> </td>
                <td><a href="UserBillController?service=Billdetail&userid=<%=temp.getUser_id()%>&orderid=<%=temp.getOrder_id()%>">Detail</a></td>
                <c:if test="${status.equalsIgnoreCase('Wait')}">
                    <td><a href="UserBillController?service=updateOrder&orderid=<%=temp.getOrder_id()%>">Update</a></td>
                    <td><a href="UserBillController?service=deleteOrder&orderid=<%=temp.getOrder_id()%>">Delete</a></td>
                </c:if>
            </tr>
            <%}%>
        </table>     
    </body>
</html>
