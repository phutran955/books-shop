<%-- 
    Document   : topContent
    Created on : Jun 22, 2025, 1:05:57 PM
    Author     : trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.AuthUtils" %>
<%@page import="model.UserDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="top-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="welcome-message">
                    <h3>
                        Greetings, 
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                ${sessionScope.user.fullName}
                            </c:when>
                            <c:otherwise>Guest</c:otherwise>
                        </c:choose>.
                    </h3>
                </div>
            </div>
            <div class="col-md-6">
                <div class="right-element">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <a href="user-account.jsp" class="user-account for-buy">
                                <i class="icon icon-user"></i><span>${sessionScope.user.fullName}</span>
                            </a>
                            <a href="MainController?action=logout" class="logout for-buy">
                                <i class="icon icon-exit"></i><span>Logout</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="login.jsp" class="user-account for-buy">
                                <i class="icon icon-user"></i><span>Login</span>
                            </a>
                        </c:otherwise>
                    </c:choose>

                    <a href="#" class="cart for-buy"><i class="icon icon-clipboard"></i><span>Cart:(0 $)</span></a>

                    <div class="action-menu">
                        <div class="search-bar">
                            <a href="#" class="search-button search-toggle" data-selector="#header-wrap">
                                <i class="icon icon-search"></i>
                            </a>
                            <form role="search" method="get" class="search-box">
                                <input class="search-field text search-input" placeholder="Search" type="search">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

