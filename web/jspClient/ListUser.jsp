<%-- 
    Document   : ListUser
    Created on : Feb 23, 2023, 4:48:04 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOUser"%>
<%@page import="entity.User"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List User</title>
        <link rel="stylesheet" type="text/css" href="css/list.css">
    </head>
    <body>
        <%
           Vector<User> vector = (Vector<User>)request.getAttribute("data");
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
        <form class="search-form" action="UserController" method="post">
            <input type="hidden" name="service" value="searchUser">
            <input class="search-field" type="text" name="user_name" placeholder="Search...">
            <button class="search-button" type="submit">Search</button>
        </form>

        <table border="1">
            <caption><%=title%></caption>
<!--            <p><a class="add" href="jspClient/AddUser.jsp">Add User</a></p>-->
            <tr>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Username</th>
                <th>Password</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <%for (User temp : vector) {%>
            <tr>
                <td><%= temp.getUser_id()%> </td>
                <td><%= temp.getFirst_name()%> </td>
                <td><%= temp.getLast_name()%> </td>
                <td><%=temp.getPhone()%> </td>
                <td><%=temp.getAddress()%> </td>
                <td><%=temp.getUsername()%> </td>
                <td><%= temp.getPassword()%> </td>
                <td><a href="UserController?service=updateUser&id=<%=temp.getUser_id()%>">Update</a></td>
                <td><a href="UserController?service=deleteUser&id=<%=temp.getUser_id()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
