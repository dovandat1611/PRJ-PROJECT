<%-- 
    Document   : ListOrder
    Created on : Feb 23, 2023, 4:47:28 PM
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
        <title>List Order</title>
        <link rel="stylesheet" type="text/css" href="css/list.css">
    </head>
    <body>
        <%
            Vector<Bill> vector = (Vector<Bill>)request.getAttribute("data");
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


        <form class="search-form" action="BillController" method="post">
            <input type="hidden" name="service" value="searchBill">
            <input class="search-field" type="text" name="id" placeholder="Search...">
            <button class="search-button" type="submit">Search</button>
        </form>

        <table border="1">
            <caption><%=title%></caption>
            <tr>
                <th>Bill Id</th>
                <th>Order Id</th>
                <th>User Id</th>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Image</th>
                <th>List Price</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <%for (Bill temp : vector) {%>
            <tr>
                <td><%= temp.getBill_id()%> </td>
                <td><%= temp.getOrder_id()%> </td>
                <td><%= temp.getUser_id()%> </td>
                <td><%=temp.getProduct_id()%> </td>
                <td><%=temp.getProduct_name()%> </td>
                <td><img src="<%=temp.getImage()%>" alt="<%=temp.getImage()%>"/></td> 
                <td><%= temp.getList_price()%> </td>
                <td><%= temp.getQuantity()%> </td>
                <td><%= temp.getStatus()%> </td>
                <td><a href="BillController?service=updateBill&id=<%=temp.getBill_id()%>">Update</a></td>
                <td><a href="BillController?service=deleteBill&id=<%=temp.getBill_id()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>     
    </body>
</html>
