<%-- 
    Document   : AddOrderProduct
    Created on : Feb 23, 2023, 3:42:02 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOOrderProduct,dao.DAOProduct,dao.DAOOrder"%>
<%@page import="entity.OrderProduct,entity.Product,entity.Order"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Order Product</title>
        <link rel="stylesheet" type="text/css" href="../css/add.css">
    </head>
    <body>

        <%  
            DAOOrderProduct daoOrderProduct = new DAOOrderProduct();
            DAOOrder daoOrder = new DAOOrder();
            DAOProduct daoProduct = new DAOProduct();
        %>
        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="../OrderProductController" method="post" >
                        <input type="hidden" name="service" value="insertOrderProduct">
                        <span class="login-form-title">
                            Add Order Product
                        </span>
                        <table>
                            <div class="wrap-input">
                                 <label  for="order_id">Order ID: </label>
                                
                                    <Select class="input" name="order_id" id="order_id">
                                        <% Vector<Order> vector1 = daoOrder.getOrder(); %>
                                        <% for (Order temp : vector1) { %>
                                        <option value="<%=temp.getOrder_id()%>"><%=temp.getOrder_id()%></option>
                                        <%}%>
                                    </Select>
                               
                            </div>


                            <div class="wrap-input">
                                 <label for="product_id">Product Name: </label>
                                
                                    <Select class="input" name="product_id" id="product_id">
                                        <% Vector<Product> vector2 = daoProduct.getProduct(); %>
                                        <% for (Product temp : vector2) { %>
                                        <option value="<%=temp.getProduct_id()%>"><%=temp.getProduct_name()%></option>
                                        <%}%>
                                    </Select>
                               
                            </div>


                            <div class="wrap-input">
                                 <label for="quantity">Quantity: </label>
                                 <input class="input" type="number" name="quantity" id="quantity">
                            </div>

                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Add Order Product </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
