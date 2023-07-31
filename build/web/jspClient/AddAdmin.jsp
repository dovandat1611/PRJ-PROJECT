<%-- 
    Document   : AddAdmin
    Created on : Feb 23, 2023, 3:41:34 PM
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
        <title>Add Admin</title>
        <link rel="stylesheet" type="text/css" href="../css/add.css">
    </head>
    <body>
        <%                  
        int n = 0;
        DAOAdmin dao = new DAOAdmin();
        Vector<Admin> vector = dao.getAdmin();
        for (Admin temp : vector) 
            {
                n++;
            }
        %>

        <div class="limiter">
            <div class="container-login">
                <div class="wrap-login">
                    <form class="login-form validate-form" action="../AdminController" method="post" >
                        <input type="hidden" name="service" value="insertAdmin">
                        <span class="login-form-title">
                            Add Admin
                        </span>
                        <table>
                            <div class="wrap-input">
                                <label for="admin_id">ID: </label>
                                <input class="input" type="number" name="admin_id" id="admin_id" value="<%=(n+1)%>"readonly>
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
                                <label for="phone">Phone: </label></td>
                                <input class="input" type="text" name="phone" id="phone">
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
                                    <button class="login-form-btn" type="submit" name = "submit"> Add Admin </button>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
