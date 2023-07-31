<%-- 
    Document   : indexUser
    Created on : Feb 23, 2023, 9:18:13 PM
    Author     : Lenovo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOUser"%>
<%@page import="entity.User"%>
<%@page import="java.util.Vector"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="./css/cssUser/indexUser.css">
    </head>
    <body>


        <%      
                Enumeration<String> em = session.getAttributeNames();
                int numberproduct=0;
                while (em.hasMoreElements()) {          
                String id = em.nextElement().toString();
                if (!id.equals("username")) {
                    numberproduct++;
                }
                String usename = session.getAttribute(id).toString();
                DAOUser dao = new DAOUser();
                Vector<User> vector = dao.getUser();
                for (User temp : vector) {%>
        <%          if (usename.equals(temp.getUsername())){                
                    
        %>

        <div class="infor">
            <p> Welcome: <%=temp.getFirst_name()+" "+temp.getLast_name()%></p>
            <p >Username: <%=usename%></p>
        </div>
        <%}%>
        <%}%>
        <%}%>

        <div class="menuuser">
            <div class="header">
                <form action="MainUser">
                    <button type="submit" class="btn-home">Home</button>
                </form>

                <div class="cart">
                    <form action="UserBillController">
                        <button type="submit" class="cart-button">Ordered</button>
                    </form>
                </div>

                <div class="cart">
                    <form action="./jspAddToCart/ShowCart.jsp">
                        <button type="submit" class="cart-button">Cart: <%=numberproduct%></button>
                    </form>
                </div>
                <div class="logout">
                    <form action="LogoutController">
                        <button type="submit" class="logout-button">Logout</button>
                    </form>
                </div>
            </div>

            <h1>MENU</h1>
            <div>
                <div>
                    <form class="search-form" action="MainUser" method="post">
                        <input type="hidden" name="service" value="searchProductASCorDESC">
                        <label for="price-search">Sort for Price:</label>
                        <select id="price-search" name="id">
                            <option  value="ASC" ${ASCorDESC.equalsIgnoreCase('ASC')?"selected":""} >Ascending</option>
                            <option value="DESC" ${ASCorDESC.equalsIgnoreCase('DESC')?"selected":""}>Descending </option>
                        </select>
                        <input type="submit" value="Search">
                    </form>
                </div>

                <div>
                    <form class="search-form" action="MainUser" method="post">
                        <input type="hidden" name="service" value="searchProduct">
                        <input class="search-field" type="text" name="product_name" placeholder="Search...">
                        <button class="search-button" type="submit">Search</button>
                    </form>
                </div>

                <div>
                    <form class="search-form" action="MainUser" method="post">
                        <input type="hidden" name="service" value="searchProductPrice">
                        <input class="search-field" type="text" name="min" placeholder="Min...">
                        <input class="search-field" type="text" name="max" placeholder="Max...">
                        <button class="search-button" type="submit">Search For Price</button>
                    </form>
                </div>

            </div>    
            <div class="menucatetory"><jsp:include page="MenuUser.jsp"></jsp:include></div>
            </div>
            
            <h1>CONTENT</h1>
            
            <div><jsp:include page="ListProductUser.jsp"></jsp:include></div>
        <script src="js/menuUser.js"></script>   
    </body>
</html>
