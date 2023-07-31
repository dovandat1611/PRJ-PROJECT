<%-- 
    Document   : ListAdmin
    Created on : Feb 23, 2023, 4:47:18 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOAdmin"%>
<%@page import="entity.Admin"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Admin</title>
        <link rel="stylesheet" type="text/css" href="css/list.css">
    </head>
    <body>
        <%
          Vector<Admin> vector = (Vector<Admin>)request.getAttribute("data");
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

      
        <form class="search-form" action="AdminController" method="post">
            <input type="hidden" name="service" value="searchAdmin">
            <input class="search-field" type="text" name="admin_name" placeholder="Search...">
            <button class="search-button" type="submit">Search</button>
        </form>

        <table border="1">
            <caption><%=title%></caption>
            <p><a class="add" href="jspClient/AddAdmin.jsp">Add Admin</a></p>
            <tr>
                <th>Admin ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone</th>
                <th>Username</th>
                <th>Password</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <%for (Admin temp : vector) {%>
            <tr>
                <td><%= temp.getAdmin_id()%> </td>
                <td><%= temp.getFirst_name()%> </td>
                <td><%= temp.getLast_name()%> </td>
                <td><%=temp.getPhone()%> </td>
                <td><%=temp.getUsername()%> </td>
                <td><%= temp.getPassword()%> </td>
                <td><a href="AdminController?service=updateAdmin&id=<%=temp.getAdmin_id()%>">Update</a></td>
                <td><a href="AdminController?service=deleteAdmin&id=<%=temp.getAdmin_id()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>        
    </body>
</html>
