<%-- 
    Document   : AddUser
    Created on : Feb 23, 2023, 3:41:25 PM
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
        <title>Add User</title>
        <link rel="stylesheet" type="text/css" href="../css/add.css">
    </head>
    <body>
        <%   
                
                int n = 0;
                DAOUser dao = new DAOUser();
                Vector<User> vector = dao.getUser();
                for (User temp : vector) 
                    {
                        n++;
                    }
        %>
        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form action="../UserController" method="post">
                        <input type="hidden" name="service" value="insertUser">
                        <span class="login-form-title">
                            Add User
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="user_id">ID: </label>
                                <input class="input" type="number" name="user_id" id="user_id" value="<%=(n+1)%>"readonly>
                            </div>
                            <div class="wrap-input">
                                <label for="first_name">First Name: </label>
                                <input class="input" type="text" name="first_name" id="first_name">
                            </div>
                            <div class="wrap-input">
                                <label for="last_name">Last Name: </label>
                                <input class="input" type="text" name="last_name" id="last_name">
                            </div>
                            <div class="wrap-input">
                                <label for="phone">Phone: </label>
                                <input class="input" type="text" name="phone" id="phone">
                            </div>

                            <div class="wrap-input">
                                <label for="address">Address: </label>
                                <input class="input" type="text" name="address" id="address">
                            </div>


                            <div class="wrap-input">
                                <label for="username">Username: </label>
                                <input class="input" type="text" name="username" id="username">
                            </div>

                            <div class="wrap-input">
                                <label for="password">Password: </label>
                                <input class="input" type="text" name="password" id="password">
                            </div>

                            <div class="container-login-form-btn">
                                <div class="wrap-login-form-btn">
                                    <button class="login-form-btn" type="submit" name = "submit"> Add User </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
