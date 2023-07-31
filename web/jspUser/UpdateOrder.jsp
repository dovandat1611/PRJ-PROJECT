<%-- 
    Document   : UpdateOrder
    Created on : Feb 23, 2023, 5:30:35 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOOrder,dao.DAOUser"%>
<%@page import="entity.Order,entity.User"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order</title>
        <link rel="stylesheet" type="text/css" href="./css/update.css">
    </head>
    <body>
        <%
                Vector<Order> vector = (Vector<Order>)request.getAttribute("data");
                Order order = vector.get(0);
                DAOUser daoUser = new DAOUser(); 
        %>
        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="UserBillController" method="post" >
                        <input type="hidden" name="service" value="updateOrder">
                        <span class="login-form-title">
                            Update Order
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="order_id">ID: </label>
                                <input class="input" type="number" name="order_id" id="order_id" value="<%=order.getOrder_id()%>"readonly>
                            </div>
                            <div class="wrap-input">
                                <label for="user_id">Customer Name: </label>
                                <Select class="input" name="user_id" id="user_id" display="none">
                                    <% Vector<User> vector1 = daoUser.getUser(); %>
                                    <% for (User temp : vector1) { %>
                                    <option value="<%=temp.getUser_id()%>" <%=(temp.getUser_id()== order.getUser_id()? "selected" : "")%>><%= temp.getFirst_name() + " " + temp.getLast_name()%> </option>
                                    <%}%>
                                </Select>
                            </div>
                            <div class="wrap-input">
                                <label for="name_receiver">Name Receiver: </label>
                                <input class="input" type="text" name="name_receiver" id="name_receiver" value="<%=order.getName_receiver()%>">
                            </div>
                            <div class="wrap-input">
                                <label for="phone_receiver">Phone Receiver: </label>
                                <input class="input" type="text" name="phone_receiver" id="phone_receiver" value="<%=order.getPhone_receiver()%>">
                            </div>
                            <div class="wrap-input">
                                <label for="address_receiver">Address Receiver: </label>
                                <input class="input" type="text" name="address_receiver" id="address_receiver" value="<%=order.getAddress_receiver()%>">
                            </div>

                            <div class="wrap-input">
                                <label for="total_price">Total Price: </label>
                                <input class="input" type="double" name="total_price" id="total_price" value="<%=order.getTotal_price()%>" readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="date">Date: </label>
                                <input class="input" type="text" name="date" id="date" value="<%=order.getDate()%>" readonly>
                            </div>

                            <div display="none" class="wrap-input">
                                <label for="statuss">Status: </label>
                                <input class="input" type="text" name="statuss" id="statuss" value="<%=order.getStatus()%>" readonly>
                            </div>

                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Update Order </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
