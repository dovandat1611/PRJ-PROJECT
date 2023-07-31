<%-- 
    Document   : UpdateBill
    Created on : Mar 1, 2023, 11:15:19 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOBill"%>
<%@page import="entity.Bill"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="./css/update.css">
    </head>
    <body>

        <%
                Vector<Bill> vector = (Vector<Bill>)request.getAttribute("data");
                Bill bill = vector.get(0);
        %>             
        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="BillController" method="post" >
                        <input type="hidden" name="service" value="updateBill">
                        <span class="login-form-title">
                            Update Bill
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="bill_id">ID: </label>
                                <input class="input" type="number" name="bill_id" id="bill_id" value="<%=bill.getBill_id()%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="order_id">Order ID: </label>
                                <input class="input" type="number" name="order_id" id="order_id" value="<%=bill.getOrder_id()%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="user_id">Customer ID: </label>
                                <input class="input" type="number" name="user_id" id="user_id" value="<%=bill.getUser_id()%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="product_id">Product ID: </label>
                                <input class="input" type="number" name="product_id" id="product_id" value="<%=bill.getProduct_id()%>"readonly>
                            </div>
                            <div class="wrap-input">
                                <label for="product_name">Product Name: </label></td>
                                <input class="input" type="text" name="product_name" id="product_name" value="<%=bill.getProduct_name()%>"readonly>
                            </div>
                            <div class="wrap-input">
                                <label for="image">Images: </label>
                                <input class="input" type="text" name="image" id="image" value="<%=bill.getImage()%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="list_price">List Price: </label>
                                <input class="input" type="number" name="list_price" id="list_price" value="<%=bill.getList_price()%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="quantity">Quantity: </label>
                                <input class="input" type="number" name="quantity" id="quantity" value="<%=bill.getQuantity()%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label  for="status">Status: </label>

                                <Select class="input" name="status" id="status">                        
                                    <option value="Wait">Wait</option>
                                    <option value="Process">Process</option> 
                                    <option value="Done">Done</option>
                                </Select>

                            </div>

                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Update Bill </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
