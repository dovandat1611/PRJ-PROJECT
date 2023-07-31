<%-- 
    Document   : AddBill
    Created on : Mar 1, 2023, 11:04:11 PM
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
        <link rel="stylesheet" type="text/css" href="../css/add.css">
    </head>
    <body>        
        <%  
            int n = 0;
            DAOBill dao = new DAOBill();
            Vector<Bill> vector = dao.getBill();
            for (Bill temp : vector) 
                {
                    n++;
                }   
        %>

        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="../BillController" method="post" >
                        <input type="hidden" name="service" value="insertBill">
                        <span class="login-form-title">
                            Add Bill
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="bill_id">ID: </label>
                                <input class="input" type="number" name="bill_id" id="bill_id" value="<%=(n+1)%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="order_id">Customer ID: </label>
                                <input class="input" type="number" name="order_id" id="order_id">
                            </div>

                            <div class="wrap-input">
                                <label for="user_id">Customer ID: </label>
                                <input class="input" type="number" name="user_id" id="user_id">
                            </div>

                            <div class="wrap-input">
                                <label for="product_id">Product ID: </label>
                                <input class="input" type="number" name="product_id" id="product_id">
                            </div>
                            <div class="wrap-input">
                                <label for="product_name">Product Name: </label></td>
                                <input class="input" type="text" name="product_name" id="product_name">
                            </div>
                            <div class="wrap-input">
                                <label for="image">Images: </label>
                                <input class="input" type="text" name="image" id="image">
                            </div>

                            <div class="wrap-input">
                                <label for="list_price">List Price: </label>
                                <input class="input" type="number" name="list_price" id="list_price">
                            </div>

                            <div class="wrap-input">
                                <label for="quantity">Quantity: </label>
                                <input class="input" type="number" name="quantity" id="quantity">
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
                                    <button class="login-form-btn" type="submit" name = "submit"> Add Bill </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
