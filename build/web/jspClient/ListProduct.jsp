<%-- 
    Document   : ListProduct
    Created on : Feb 23, 2023, 4:47:48 PM
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
        <title>List Product</title>
        <link rel="stylesheet" type="text/css" href="css/list.css">
        <style>
            .search-form {
                display: flex;  /* Cho phép các phần tử trong form được hiển thị trên cùng một hàng */
                justify-content: center; /* Canh giữa phần tử form */
                margin-top: 20px;
            }

            label {
                font-size: 16px;
                font-weight: bold;
            }

            select {
                font-size: 16px;
                margin-left: 10px;
            }

            input[type="submit"] {
                background-color: #008CBA;
                border: none;
                color: #fff;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                cursor: pointer;
                margin-left: 10px;
            }

            input[type="submit"]:hover {
                background-color: #006E9F;
            }
        </style>
    </head>
    <body>
        <%
           Vector<Product> vector = (Vector<Product>)request.getAttribute("data");
           String title = (String)request.getAttribute("tableTitle");
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
            <div>
                <form class="search-form" action="ProductController" method="post">
                    <input type="hidden" name="service" value="searchProductASCorDESC">
                    <label for="price-search">Sort for Price:</label>
                    <select id="price-search" name="id">
                        <option value="ASC" ${ASCorDESC.equalsIgnoreCase('ASC')?"selected":""}>Ascending</option>
                        <option value="DESC" ${ASCorDESC.equalsIgnoreCase('DESC')?"selected":""}>Descending</option>
                    </select>
                    <input type="submit" value="Search">
                </form>
            </div>
            <div>
                <form class="search-form" action="ProductController" method="post">
                    <input type="hidden" name="service" value="searchProduct">
                    <input class="search-field" type="text" name="product_name" placeholder="Search...">
                    <button class="search-button" type="submit">Search</button>
                </form>
            </div>
            <div>
                <form class="search-form" action="ProductController" method="post">
                    <input type="hidden" name="service" value="searchProductPrice">
                    <input class="search-field" type="text" name="min" placeholder="Min...">
                    <input class="search-field" type="text" name="max" placeholder="Max...">
                    <button class="search-button" type="submit">Search For Price</button>
                </form>
            </div>
        </div>
        <table border="1">
            <caption><%=title%></caption>
            <p><a class="add" href="jspClient/AddProduct.jsp">Add Product</a></p>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Image</th>
                <th>List Price</th>
                <th>Discount</th>
                <th>Category Name</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <%for (Product temp : vector) {%>
            <tr>
                <td><%=temp.getProduct_id()%> </td>
                <td><%=temp.getProduct_name()%> </td>
                <td><%=temp.getDescription()%> </td>
                <td><img src="<%=temp.getImage()%>" alt="<%=temp.getImage()%>"/></td> 
                <td><%=temp.getList_price()%> </td>
                <td><%=temp.getDiscount()%> </td>
                <td><%=temp.getCategory_name()%> </td>
                <td><a href="ProductController?service=updateProduct&id=<%=temp.getProduct_id()%>">Update</a></td>
                <td><a href="ProductController?service=deleteProduct&id=<%=temp.getProduct_id()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
