<%-- 
    Document   : ListProductUser
    Created on : Feb 23, 2023, 9:45:19 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOProduct"%>
<%@page import="entity.Product"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
         <link rel="stylesheet" type="text/css" href="./css/cssUser/ListProductUser.css">
    </head>
    <body>
        <%
                Vector<Product> vector = (Vector<Product>)request.getAttribute("data");
                String title = (String)request.getAttribute("tableTitle");          
        %>  



        <div class="accessories"> 
            <div class="accessories__list">
                <%for (Product temp : vector) {%>   
                
                <div class="accessories__list__item">
                    <div class="accessories__list__item__info">
                        
                        <img name="images" src="<%= temp.getImage()%>" alt="<%= temp.getImage()%>"/>
                        <h4 name="product_name"><%=temp.getProduct_name()%></h4>
                        <p> <del>Price: $<%=temp.getList_price()%></del></p>
                        <p name="price">Price: $<%=(double) (Math.ceil((temp.getList_price()*(1-temp.getDiscount())) * 100) / 100)%></p>
                        <div name="addtocart">
                           <a style="color: white;" onclick="AddToCart()" href="CartController?id=<%=temp.getProduct_id()%>">
                               Add To Cart
                           </a>   
                        </div>
                    </div>
                </div>       
                <%}%>
            </div>
        </div>  
    </body>
</html>
