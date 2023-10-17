<%-- 
    Document   : index
    Created on : Oct 9, 2023, 2:28:22 PM
    Author     : jjsoc
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.ProductsTable"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="pd" class="model.Products" scope="request"/>
    <%
                       
            List<Products> pdList = ProductsTable.findAllProducts();
            Iterator<Products> itr = pdList.iterator();
            
     %>
    <body>
        <form name="index" action="indexController" method="POST">
            <center>
            <h1>DVD Catalog</h1>
        <table border="1">
            <tr>
                <th>DVD Names</th>
                <th>Rate</th>
                <th>Year</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <%
                while(itr.hasNext()) {
                    pd = itr.next();
            %>
            <tr>
                <td> <input type='checkbox' name='selectedMovies' value="<%= Integer.toString(pd.getId()) %>"/> <%= pd.getMovie() %> </td>
                <td><%= pd.getRating() %></td>
                <td><%= pd.getYearcreate() %></td>
                <td><%= pd.getPrice() %></td>
                <td><input type='text' name='quantity' value='0' size='5'/></td>
            </tr>

            <%
                    }
            %>
        </table>

        <td><input type='submit' name='Submit' value='Add To Cart'></td>
        </form>
    </body>
</html>
