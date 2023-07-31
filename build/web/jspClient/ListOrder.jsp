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
        </style>
    </head>
    <body>
        <%
            Vector<Order> vector = (Vector<Order>)request.getAttribute("data");
            String title = (String)request.getAttribute("tableTitle");  
            int w=0;
            int p=0;
            int d=0;
            DAOOrder daoOrder = new DAOOrder();
            Vector<Order> vector1 = daoOrder.getOrder();
            for (Order temp : vector1) 
                {
                    if(temp.getStatus().equals("Wait")){
                      w++;
                    }else if(temp.getStatus().equals("Process")){
                       p ++;
                    }else{
                      d ++;
                    }
                }
        %>  


        <div class="header">
            <form action="MainAdmin">
                <button type="submit" class="btn-home">Home</button>
            </form>
            <div class="logout">
                <form action="LogoutController">
                    <button type="submit" class="logout-button">Logout</button>
                </form>
            </div>
        </div>

        <div>
            <form class="search-form" action="OrderController" method="post">
                <input type="hidden" name="service" value="searchOrder">
                <input class="search-field" type="text" name="order_id" placeholder="Search...">
                <button class="search-button" type="submit">Search</button>
            </form>
        </div>
        <div class="statusorder">
            <div><a href="MainAdmin?service=displayOrderStatus&status=Wait">Wait: <%=w%></a></div> 
            <div><a href="MainAdmin?service=displayOrderStatus&status=Process">Process: <%=p%></a></div>
            <div><a href="MainAdmin?service=displayOrderStatus&status=Done">Done: <%=d%></a></div>
        </div>
        <table border="1">
            <caption><%=title%></caption>
            <!--            <p><a class="add" href="jspClient/AddOrder.jsp">Add Order</a></p>-->
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
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
                    <c:if test="${status.equalsIgnoreCase('Process')}">
                    <th>Update</th>
                    </c:if>
            </tr>

            <%for (Order temp : vector) {%>
            <tr>
                <td><%= temp.getOrder_id()%> </td>
                <td><%= temp.getUser_id()%> </td>
                <td><%= temp.getName_receiver()%> </td>
                <td><%=temp.getPhone_receiver()%> </td>
                <td><%=temp.getAddress_receiver()%> </td>
                <td><%= temp.getTotal_price()%> </td>
                <td><%= temp.getDate()%> </td>
                <td><%= temp.getStatus()%> </td>
                <td><a href="BillController?service=Billdetail&id=<%=temp.getOrder_id()%>">Detail</a></td>
                <c:if test="${status.equalsIgnoreCase('Wait')}">
                    <td> 
                        <form method="post" action="OrderController"> 
                            <input type="hidden" name="service" value="updateStatus">
                            <input  type="hidden" name="order_id" id="order_id" value="<%=temp.getOrder_id()%>"> 
                            <label  for="statuss">Status: </label> 
                            <Select class="input" name="statuss" id="statuss"> 
                                <option selected value="Wait"><%= temp.getStatus()%></option>
                                <option value="Process">Process</option> 
                            </Select> 
                            <input type="submit" value="Update">
                        </form> 
                    </td>
                    <td><a href="OrderController?service=deleteOrder&id=<%=temp.getOrder_id()%>">Delete</a></td>
                </c:if>
                <c:if test="${status.equalsIgnoreCase('Process')}">
                    <td> 
                        <form method="post" action="OrderController"> 
                            <input type="hidden" name="service" value="updateStatus">
                            <input  type="hidden" name="order_id" id="order_id" value="<%=temp.getOrder_id()%>"> 
                            <label  for="statuss">Status: </label> 
                            <Select class="input" name="statuss" id="statuss"> 
                                <option  value="Wait">Wait</option>
                                <option selected value="Process">Process</option> 
                                <option value="Done">Done</option>
                            </Select> 
                            <input type="submit" value="Update">
                        </form> 
                    </td>
                </c:if>
            </tr>
            <%}%>
        </table>     
    </body>
</html>
