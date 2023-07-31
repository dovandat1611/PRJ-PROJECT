<%-- 
    Document   : AddOrder
    Created on : Feb 23, 2023, 3:41:44 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOOrder,dao.DAOUser"%>
<%@page import="entity.Order,entity.User"%>
<%@page import="java.util.Vector"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Order</title>
        <link rel="stylesheet" type="text/css" href="./css/add.css">
    </head>
    <body>        
        <%  
            int n = 0;
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
            String formattedDate = currentDate.format(formatter);
            DAOOrder daoOrder = new DAOOrder();
            DAOUser daoUser = new DAOUser();  
            Vector<Order> vector = daoOrder.getOrder();
            for (Order temp : vector) 
                {
                    n++;
                }
            int user_id = (int)request.getAttribute("user_id");    
            double allprice = (double)request.getAttribute("allprice");    
        %>


        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="OrderController" method="post" >
                        <input type="hidden" name="service" value="insertOrder">
                        <span class="login-form-title">
                            Add Order
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="order_id">ID: </label>
                                <input class="input" type="number" name="order_id" id="order_id" value="<%=(n+1)%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="user_id">Customer Name: </label>
                                <Select class="input" name="user_id" id="user_id">
                                    <% Vector<User> vector1 = daoUser.getUser(); %>
                                    <% for (User temp : vector1) { %>
                                    <option value="<%=temp.getUser_id()%>" <%=(temp.getUser_id() == user_id? "selected" : "")%>><%= temp.getFirst_name() + " " + temp.getLast_name()%></option>
                                    <%}%>
                                </Select>
                            </div>

                            <div class="wrap-input">
                                <label for="name_receiver">Name Receiver: </label>
                                <input class="input" type="text" name="name_receiver" id="name_receiver">
                            </div>
                            <div class="wrap-input">
                                <label for="phone_receiver">Phone Receiver: </label>
                                <input class="input" type="text" name="phone_receiver" id="phone_receiver">
                            </div>
                            <div class="wrap-input">
                                <label for="address_receiver">Address Receiver: </label>
                                <input class="input" type="text" name="address_receiver" id="address_receiver">
                            </div>

                            <div class="wrap-input">
                                <label for="total_price">Total Price: </label>
                                <input class="input" type="double" name="total_price" id="total_price" value="<%=allprice%>"readonly>
                            </div>

                            <input class="input" type="hidden" name="date" id="date" value="<%=formattedDate%>">


                            <input class="input" type="hidden" name="status" id="status" value="Wait">

                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Add Order </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
