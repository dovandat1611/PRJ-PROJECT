<%-- 
    Document   : UpdateOrderProduct
    Created on : Feb 23, 2023, 5:30:48 PM
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
        <title>Update Order Product</title>
         <link rel="stylesheet" type="text/css" href="./css/update.css">
    </head>
    <body>
        <%
            Vector<OrderProduct> vector = (Vector<OrderProduct>)request.getAttribute("data");
            OrderProduct op = vector.get(0);
            DAOOrder daoOrder = new DAOOrder();
            DAOProduct daoProduct = new DAOProduct();
        %>                
        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="../OrderProductController" method="post" >
                        <input type="hidden" name="service" value="updateOrderProduct">
                        <span class="login-form-title">
                            Update Order Product
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label  for="order_id">Order ID: </label>

                                <Select class="input" name="order_id" id="order_id">
                                    <% Vector<Order> vector1 = daoOrder.getOrder(); %>
                                    <% for (Order temp : vector1) { %>
                                    <option value="<%=temp.getOrder_id()%>" <%=(temp.getOrder_id()== op.getOrder_id()? "selected" : "")%>><%=temp.getOrder_id()%></option>
                                    <%}%>
                                </Select>

                            </div>


                            <div class="wrap-input">
                                <label for="product_id">Product Name: </label>

                                <Select class="input" name="product_id" id="product_id">
                                    <% Vector<Product> vector2 = daoProduct.getProduct(); %>
                                    <% for (Product temp : vector2) { %>
                                    <option value="<%=temp.getProduct_id()%>" <%=(temp.getProduct_id()== op.getProduct_id()? "selected" : "")%>><%=temp.getProduct_name()%></option>
                                    <%}%>
                                </Select>

                            </div>


                            <div class="wrap-input">
                                <label for="quantity">Quantity: </label>
                                <input class="input" type="number" name="quantity" id="quantity" value="<%=op.getQuantity()%>">
                            </div>

                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Update Order Product </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>            

    </body>
</html>
