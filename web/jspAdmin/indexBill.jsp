<%-- 
    Document   : indexBill
    Created on : Mar 1, 2023, 11:31:38 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOAdmin"%>
<%@page import="entity.Admin"%>
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
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="./css/indexjspAdmin.css">
    </head>
    <body>
        <%   
Enumeration<String> em = session.getAttributeNames();
                
while (em.hasMoreElements()) {
String id = em.nextElement().toString();
String usename = session.getAttribute(id).toString();
DAOAdmin dao = new DAOAdmin();
Vector<Admin> vector = dao.getAdmin();
for (Admin temp : vector) {%>
        <%          if (usename.equals(temp.getUsername())){                
                    
        %>
        <div class="infor">
            <p> Welcome: <%=temp.getFirst_name()+" "+temp.getLast_name()%></p>
            <p >Username: <%=usename%></p>
        </div>
        <%}%>
        <%}%>
        <%}%>

        <div class="menuadmin"><jsp:include page="MenuAdmin.jsp"></jsp:include></div>
        <div><jsp:include page="/jspClient/ListBill.jsp"></jsp:include></div>
    </body>
</html>
