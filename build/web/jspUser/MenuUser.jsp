<%-- 
    Document   : MenuUser
    Created on : Feb 23, 2023, 9:17:15 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu User</title>
        <link rel="stylesheet" type="text/css" href="./css/cssUser/MenuUser.css">
    </head>
    <body>
        <% ResultSet rs=(ResultSet)request.getAttribute("data1");
        %>
        <ul>
            <% while(rs.next()) {%>
            <li><a href="MainUser?service=displayProductdetail&cname=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></li>
                <% } %>
        </ul>
    </body>
</body>
</html>
