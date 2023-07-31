<%-- 
    Document   : Login
    Created on : Feb 23, 2023, 8:40:32 PM
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
        <title>Log In</title>
        <link rel="stylesheet" type="text/css" href="css/login.css">  
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="./UserController" method="post">
                    <input type="hidden" name="service" value="insertUser">

                    <%   
                
                    int n = 0;
                    DAOUser dao = new DAOUser();
                    Vector<User> vector = dao.getUser();
                    for (User temp : vector) 
                        {
                            n++;
                        }
                    %>
                    <h1 class="createaccount">Create Account</h1>
                    <table>
                        <tr class="customerID">
                            <td> <label for="user_id">ID: </label></td>
                            <td> <input type="number" name="user_id" id="user_id" value="<%=(n+1)%>"readonly></td>
                        </tr>
                        <tr>
                            <td> <label for="first_name">First Name: </label></td>
                            <td> <input type="text" name="first_name" id="first_name"></td>
                        </tr>
                        <tr>
                            <td> <label for="last_name">Last Name: </label></td>
                            <td> <input type="text" name="last_name" id="last_name"></td>
                        </tr>
                        <tr>
                            <td> <label for="phone">Phone: </label></td>
                            <td> <input type="text" name="phone" id="phone"></td>
                        </tr>

                        <tr>
                            <td> <label for="address">Address: </label></td>
                            <td> <input type="text" name="address" id="address"></td>
                        </tr>


                        <tr>
                            <td> <label for="username">Username: </label></td>
                            <td> <input type="text" name="username" id="username"></td>
                        </tr>

                        <tr>
                            <td> <label for="password">Password: </label></td>
                            <td> <input type="password" name="password" id="password"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td> <input type="submit" value="Sign Up" name = "submit"></td>
                        </tr>

                    </table>
                </form>
            </div>



            <div class="form-container sign-in-container">
                <form action="LoginController" method="POST">

                    <h1>Sign in</h1>


                    <tr>
                        <td> <label class="youare">You are?</label></td>
                        <td>
                            <Select name="selectlogin" > 
                                <option value="1">User</option> 
                                <option value="2">Admin</option>                         
                            </Select>
                        </td>
                    </tr>

                    <input type="text" placeholder="User Name" name="username"/>
                    <input type="password" placeholder="Password" name="password" />


                    <button>Sign In</button>

                    <a href="#">Forgot your password?</a>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/login.js"></script>   
    </body>
</html>
