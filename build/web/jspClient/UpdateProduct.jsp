<%-- 
    Document   : UpdateProduct
    Created on : Feb 23, 2023, 5:30:58 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOProduct"%>
<%@page import="entity.Product"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <link rel="stylesheet" type="text/css" href="css/update.css">
    </head>
    <body>

        <%
           Vector<Product> vector = (Vector<Product>)request.getAttribute("data");
           Product product = vector.get(0);
        %>

        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="ProductController" method="post">
                        <input type="hidden" name="service" value="updateProduct">
                        <span class="login-form-title">
                            Update Product
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="product_id">ID: </label>
                                <input  class="input" type="number" name="product_id" id="product_id" value="<%=product.getProduct_id()%>"readonly>
                            </div>

                            <div class="wrap-input">
                                <label for="product_name">Product Name: </label>
                                <input class="input" type="text" name="product_name" id="product_name" value="<%=product.getProduct_name()%>">
                            </div>
                            <div class="wrap-input">
                                <label for="description">Description: </label></td>
                                <input class="input" type="text" name="description" id="description" value="<%=product.getDescription()%>">
                            </div>
                            <div class="wrap-input">
                                <label for="image">Image: </label></td>
                                <input class="input" type="text" name="image" id="image" value="<%=product.getImage()%>">
                            </div>

                            <div class="wrap-input">
                                <label for="list_price">List Price: </label>
                                <input class="input" type="number" name="list_price" id="list_price" value="<%=product.getList_price()%>">
                            </div>

                            <div class="wrap-input">
                                <label for="discount">Discount: </label>
                                <input class="input" type="number" name="discount" id="discount" value="<%=product.getDiscount()%>">
                            </div>

                            <div class="wrap-input">
                                <label for="category_name">Category Name: </label>
                                <input class="input" type="text" name="category_name" id="category_name" value="<%=product.getCategory_name()%>">
                            </div>


                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Update Poduct </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
