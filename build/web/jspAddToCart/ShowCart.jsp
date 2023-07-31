<%-- 
    Document   : ShowCart
    Created on : Feb 28, 2023, 10:32:41 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOProduct"%>
<%@page import="entity.Product"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.DAOBill"%>
<%@page import="entity.Bill"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" type="text/css" href="../css/cart.css">
    </head>
    <body>
        <div class="header">
            <div><h1>Shopping Cart Details</h1></div>
            <div class="home">
                <form action="../MainUser">
                    <button type="submit" class="btn-home">Home</button>
                </form>
            </div>  
        </div>

        <div>   
            <form action="../UpdateSession" method="post">     
                <table width=100%>
                    <tr class="menu">
                        <th>Product Name</th>
                        <th>Images</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Delete</th>
                    </tr>
                    <% 
                    ArrayList<Double> total_price = new ArrayList<Double>();    
                    DAOProduct dao = new DAOProduct();    
                    Enumeration<String> em = session.getAttributeNames();
                    while (em.hasMoreElements()) {
                        String id = em.nextElement();
                        if(!id.equals("username")){%>
                    <% String count = session.getAttribute(id).toString();
                     Vector<Product> vector = dao.searchProductId(id);
                     Product product = vector.get(0);
                     int quantity = Integer.parseInt(count);          
                     int idpro = Integer.parseInt(id);
                    %>
                    <tr>  
                        <input type="hidden" name="id" value="<%=id%>">
                        <%for (Product temp : vector) {%>
                        <td><%=temp.getProduct_name()%></td>
                        <td class="img"><img src="../<%=temp.getImage()%>" alt="../<%=temp.getImage()%>"/></td>
                        <td>$<%=((double) (Math.ceil((temp.getList_price() * (1 - temp.getDiscount())) * 100) / 100)) * quantity%></td>     
                        <%double price = (((double) (Math.ceil((temp.getList_price() * (1 - temp.getDiscount())) * 100) / 100)) * quantity);
                        total_price.add(price);
                        %>
                        <%}%>
                        <td>
                            <input type="number" name="quantitychanges" value="<%=quantity%>">
                        </td>
                        <td><a href="../DeleteCart?id=<%=idpro%>">Delete</a></td>
                    </tr>
                    <%}%>
                    <%}%>
                </table>
                <button type="submit" class="cart-button">Update Bill</button>
            </form>
        </div>      
        <div class="footer">
            <div class="logout">
                <form action="../CheckoutCart" method="post">
                    <button type="submit" class="logout-button">Delete Cart</button>
                </form>
            </div>
            <div>
                <%  
                    double allprice = 0;
                    for (int i = 0; i < total_price.size(); i++) {
                        allprice += (double)total_price.get(i);
                    }
                %>
                
                <p >Total price: $<%= allprice %> </p>
                <form action="../BillController" method="post"> 
                    <input type="hidden" name="service" value="addAutoBill">
                    <button onclick="Carted()" type="submit" class="cart-button">Buy All</button>
                </form>
            </div>
        </div>
        <script src="../js/cart.js"></script>  
    </body>
</html>