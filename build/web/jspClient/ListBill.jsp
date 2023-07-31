<%-- 
    Document   : ListBill
    Created on : Mar 1, 2023, 11:19:49 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOBill"%>
<%@page import="entity.Bill"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/list.css">
    </head>
    <body>
        <%
          ResultSet rs=(ResultSet)request.getAttribute("data");
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
<!--            <p><a class="add" href="jspClient/AddBill.jsp">Add Bill</a></p>-->
            <tr>

                <th>Order Id</th>
                <th>Name Receiver </th>
                <th>Date</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>View</th>
            </tr>

            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%> </td>
                <td><a href="BillController?service=Billdetail&id=<%=rs.getString(1)%>">Detail</a></td>
            </tr>
            <%}%>
        </table>        
    </body>
</html>
