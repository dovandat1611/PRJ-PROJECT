<%-- 
    Document   : ListOrderProduct
    Created on : Feb 23, 2023, 4:47:39 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOOrderProduct"%>
<%@page import="entity.OrderProduct"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Order Product</title>
        <link rel="stylesheet" type="text/css" href="css/list.css">
    </head>
    <body>

        <%
          Vector<OrderProduct> vector = (Vector<OrderProduct>)request.getAttribute("data");
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


        <form class="search-form" action="OrderProductController" method="post">
            <input type="hidden" name="service" value="searchOrderProduct">
            <input class="search-field" type="text" name="quantity" placeholder="Search...">
            <button class="search-button" type="submit">Search</button>
        </form>

        <table border="1">
            <caption><%=title%></caption>
            <p><a class="add" href="jspClient/AddOrderProduct.jsp">Add Order Product</a></p>
            <tr>
                <th>Order ID</th>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <%for (OrderProduct temp : vector) {%>
            <tr>
                <td><%= temp.getOrder_id()%> </td>
                <td><%= temp.getProduct_id()%> </td>
                <td><%= temp.getQuantity()%> </td>

                <td><a href="OrderProductController?service=updateOrderProduct&order_id=<%=temp.getOrder_id()%>&product_id=<%=temp.getProduct_id()%>">Update</a></td>
                <td><a href="OrderProductController?service=deleteOrderProduct&order_id=<%=temp.getOrder_id()%>&product_id=<%=temp.getProduct_id()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>       
    </body>
</html>
