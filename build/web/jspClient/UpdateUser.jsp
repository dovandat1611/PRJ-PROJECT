<%-- 
    Document   : UpdateUser
    Created on : Feb 23, 2023, 5:31:25 PM
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
        <title>Update User</title>
        <link rel="stylesheet" type="text/css" href="css/update.css">
    </head>
    <body>
        <%
            Vector<User> vector = (Vector<User>)request.getAttribute("data");
            User user = vector.get(0);
        %>
        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="UserController" method="post">
                        <input type="hidden" name="service" value="updateUser">
                        <span class="login-form-title">
                            Update User
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="user_id">ID: </label>
                                <input  class="input" type="number" name="user_id" id="user_id" value="<%=user.getUser_id()%>"readonly>
                            </div>
                            <div class="wrap-input">
                                <label for="first_name">First Name: </label>
                                <input  class="input" type="text" name="first_name" id="first_name" value="<%=user.getFirst_name()%>">
                            </div>
                            <div class="wrap-input">
                                <label for="last_name">Last Name: </label>
                                <input  class="input" type="text" name="last_name" id="last_name" value="<%=user.getLast_name()%>">
                            </div>
                            <div class="wrap-input">
                                <label for="phone">Phone: </label>
                                <input  class="input" type="text" name="phone" id="phone" value="<%=user.getPhone()%>">
                            </div>

                            <div class="wrap-input">
                                <label for="address">Address: </label>
                                <input  class="input" type="text" name="address" id="address" value="<%=user.getAddress()%>">
                            </div>


                            <div class="wrap-input">
                                <label for="username">Username: </label>
                                <input  class="input" type="text" name="username" id="username" value="<%=user.getUsername()%>">
                            </div>

                            <div class="wrap-input">
                                <label for="password">Password: </label>
                                <input  class="input" type="text" name="password" id="password" value="<%=user.getPassword()%>">
                            </div>

                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Update User </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
