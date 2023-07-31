<%-- 
    Document   : MenuAdmin
    Created on : Feb 23, 2023, 5:53:14 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="./css/menuAdmin.css">
    </head>
    <body>
        <div class ="caption">
            <h1>MENU</h1>
        </div>

        <div class="menu">
            <p><a href="MainAdmin?service=displayAdmin">Admin</a></p>
            <p><a href="MainAdmin?service=displayUser">User</a></p>
            <p><a href="ChartController">Chart</a></p>
            <p><a href="MainAdmin?service=displayProduct">Product</a></p>
            <p><a href="MainAdmin?service=displayOrder">Bill</a></p>
<!--            <p><a href="MainAdmin?service=displayBill">Bill</a></p>-->
            <p><a href="MainAdmin?service=displayDetailForBill">Bill Detail</a></p>
            
<!--            <p><a href="MainAdmin?service=displayOrderProduct">Order Product</a></p>-->
        </div>
    </body>
</html>
