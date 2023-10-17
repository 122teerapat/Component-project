<%-- 
    Document   : AddToShoppingCart
    Created on : Oct 9, 2023, 1:16:01 PM
    Author     : jjsoc
--%>

<%@page import="model.ShoppingcartTable"%>
<%@page import="model.Shoppingcart"%>
<%@page import="model.ProductsTable"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
    </head>
    <jsp:useBean id="cart" class="model.Shoppingcart" scope="request"/>
    <%
                       
            List<Shoppingcart> cartList = ShoppingcartTable.findAllCart();
            Iterator<Shoppingcart> itr = cartList.iterator();
            Integer cartId = (Integer) request.getAttribute("cartId");
            int total = 0;
            
     %>
    <body>
        <form name="index" action="ShowConfirmation.jsp" method="POST">
            <center>
            <h1>DVD Catalog</h1>
        <table border="1">
            <tr>
                <th>DVD Names</th>
                <th>Rating</th>
                <th>Year</th>
                <th>Price/Unit</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            <%
                while(itr.hasNext()) {
                    cart = itr.next();
                        
                    if(cart.getShoppingcartPK().getCartId() == cartId){
                    total += cart.getProducts().getPrice() * cart.getQuantity();    
            %>
            <tr>
                <td> <%= cart.getProducts().getMovie() %></td>
                <td><%= cart.getProducts().getRating() %></td>
                <td><%= cart.getProducts().getYearcreate() %></td>
                <td><%= cart.getProducts().getPrice() %></td>
                <td><%= cart.getQuantity() %></td>
                 <td><%= cart.getProducts().getPrice() * cart.getQuantity() %></td>
            </tr>
            
            <%
                    }
                }    
            %>
             <tr>
            <td colspan="5" >Total</td>
            <td ><%= total %></td>
             <input type="hidden" name="total" value="<%= total %>">
         
            </tr>
        </table>
        
         <td><input type='submit' name='Submit' value='Check out'></td>
        
         <br>
         

        </form>
        
    </body>
</html>
