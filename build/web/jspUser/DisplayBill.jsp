<%-- 
    Document   : ListBill
    Created on : Mar 1, 2023, 11:19:49 PM
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
        <link rel="stylesheet" type="text/css" href="css/list.css">
    </head>
    <body>
        <%
           Vector<Bill> vector = (Vector<Bill>)request.getAttribute("data");         
        %>  

        <div class="header">
            <form action="MainUser">
                <button type="submit" class="btn-home">Home</button>
            </form>
            <div class="logout">
                <form action="LogoutController">
                    <button type="submit" class="logout-button">Logout</button>
                </form>
            </div>
        </div>

        <table border="1">
            <caption>Detail Order</caption>
            <tr>
                <th>Product Name</th>
                <th>Image</th>
                <th>List Price</th>
                <th>Quantity</th>
            </tr>
            <% for (Bill temp : vector) {%>
            <tr>
                <td><%=temp.getProduct_name()%></td>
                <td><img src="<%=temp.getImage()%>" alt="<%=temp.getImage()%>"/></td> 
                <td><%=temp.getList_price()%> </td>
                <td><%=temp.getQuantity()%> </td>
            </tr>
            <%}%>
        </table>        
    </body>
</html>
