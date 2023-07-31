<%-- 
    Document   : UpdateAdmin
    Created on : Feb 23, 2023, 5:30:25 PM
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
        <title>Update Admin</title>
        <link rel="stylesheet" type="text/css" href="css/update.css">
    </head>
    <body>
        <%
            Vector<Admin> vector = (Vector<Admin>)request.getAttribute("data");
            Admin admin = vector.get(0);
        %>

        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="./AdminController" method="post">
                        <input type="hidden" name="service" value="updateAdmin">
                        <span class="login-form-title">
                            Update Admin
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="first_name">ID: </label>
                                <input class="input" type="number" name="admin_id" id="admin_id" value="<%=admin.getAdmin_id()%>"readonly>
                            </div>
                            <div class="wrap-input">
                                <label for="first_name">First Name: </label>
                                <input class="input" type="text" name="first_name" id="first_name" value="<%=admin.getFirst_name()%>">

                            </div>
                            <div class="wrap-input">
                                <label for="last_name">Last Name: </label>
                                <input class="input" type="text" name="last_name" id="last_name" value="<%=admin.getLast_name()%>">

                            </div>
                            <div class="wrap-input">
                                <label for="phone">Phone: </label>
                                <input class="input" type="text" name="phone" id="phone" value="<%=admin.getPhone()%>">

                            </div>

                            <div class="wrap-input">
                                <label for="username">Username: </label>
                                <input class="input" type="text" name="username" id="username" value="<%=admin.getUsername()%>">

                            </div>

                            <div class="wrap-input">
                                <label  for="password">Password: </label>
                                <input class="input" type="text" name="password" id="password" value="<%=admin.getPassword()%>">

                            </div>
   
                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Update Admin </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
