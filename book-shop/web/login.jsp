<%-- 
    Document   : login
    Created on : May 29, 2025, 10:28:07 PM
    Author     : trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO" %>
<%@page import="utils.AuthUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(AuthUtils.isLoggedIn(request)){
                response.sendRedirect("index.jsp");
            }else{

                Object objMS = request.getAttribute("message");
                String msg = (objMS==null)?"":(objMS+"");
            %>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login"/>
                UserID : <input type="text" name="strUserID" /> <br/> 
                Password : <input type="password" name="strPassword" /> </br>
                <input type="submit" value="Login"/>
            </form>
            <span style="color: red"><%=msg%></span>

        <%}%>
    </body>
</html>