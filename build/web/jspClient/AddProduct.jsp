<%-- 
    Document   : AddProduct
    Created on : Feb 23, 2023, 3:41:52 PM
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
        <title>Add Product</title>
        <link rel="stylesheet" type="text/css" href="../css/add.css">
    </head>
    <body>
        <%  
            int n = 0;
            DAOProduct dao = new DAOProduct();
            Vector<Product> vector = dao.getProduct();
            for (Product temp : vector) 
                {
                    n++;
                }
        %>
        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="../ProductController" method="post">
                        <input type="hidden" name="service" value="insertProduct">
                        <span class="login-form-title">
                            Add Product
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="product_id">ID: </label>
                                <input class="input" type="number" name="product_id" id="product_id" value="<%=(n+1)%>"readonly>
                            </div>
                            <div class="wrap-input">
                                <label for="product_name">Product Name: </label>
                                <input class="input" type="text" name="product_name" id="product_name">
                            </div>
                            <div class="wrap-input">
                                <label for="description">Description: </label>
                                <input class="input" type="text" name="description" id="description">
                            </div>
                            <div class="wrap-input">
                                <label for="image">Image: </label></td>
                                <input class="input" type="text" name="image" id="image">
                            </div>

                            <div class="wrap-input">
                                <label for="list_price">List Price: </label></td>
                                <input class="input" type="number" name="list_price" id="list_price">
                            </div>

                            <div class="wrap-input">
                                <label for="discount">Discount: </label>
                                <input class="input" type="double" name="discount" id="discount">
                            </div>

                            <div class="wrap-input">
                                <label for="category_name">Category Name: </label>
                                <input class="input" type="text" name="category_name" id="category_name">
                            </div>


                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Add Poduct </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
